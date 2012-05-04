require "bundler/capistrano"
require "auto_html/capistrano"

require "rvm/capistrano"
set :rvm_type, :system
set :rvm_ruby_string, '1.9.3@jbhannah'

set :user, "jbhannah"
set :domain, "lugia.jbhannah.net"

default_run_options[:pty] = true

set :application, "jbhannah"
set :repository,  "git://github.com/jbhannah/jbhannah.git"
set :branch,      "production"

set :scm, :git

server domain, :app, :web, :db, :primary => true

namespace :deploy do
  task :chown do
    run "#{try_sudo} chown -R #{user}:#{user} #{deploy_to}"
  end

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
    run "cd /etc/nginx/sites-enabled; #{try_sudo} rm -f #{application}; #{try_sudo} ln -s #{File.join(current_path, "config", "nginx.conf")} #{application}"
  end

  task :reload do
    run "#{try_sudo} service nginx reload"
  end
end

after 'deploy:setup', 'deploy:chown'
after 'deploy:setup', 'nginx:symlink'

after 'deploy:start', 'nginx:reload'
after 'deploy:restart', 'nginx:reload'
