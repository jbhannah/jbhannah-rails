require "bundler/capistrano"

$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.3@jbhannah'        # Or whatever env you want it to run in.

set :user, "jbhannah"
set :domain, "lugia.jbhannah.net"

default_run_options[:pty] = true

set :application, "jbhannah"
set :repository,  "git://github.com/jbhannah/jbhannah.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

# if you"re still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,"tmp","restart.txt")}"
#   end
# end
namespace :deploy do
  task :start do
    run "cd #{current_path}; bundle exec thin start -C config/thin.yml"
  end

  task :stop do
    run "cd #{current_path}; bundle exec thin stop -C config/thin.yml"
  end

  task :restart do
    run "cd #{current_path}; bundle exec thin restart -C config/thin.yml"
  end
end

namespace :nginx do
  task :symlink do
    run "cd /etc/nginx/sites-enabled; #{try_sudo} rm -f jbhannah; #{try_sudo} ln -s #{File.join(current_path, "config", "nginx.conf")} jbhannah"
  end

  task :reload do
    run "#{try_sudo} service nginx reload"
  end
end

after 'deploy:update_code', 'nginx:symlink'
after 'nginx:symlink', 'nginx:reload'
