source :rubygems

gem 'rails', '3.2.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
group :production do
  gem 'pg'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'compass-rails'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'twitter'
gem 'auto_html', git: 'git://github.com/jbhannah/auto_html.git'

gem 'rails_admin', git: 'git://github.com/sferik/rails_admin.git'
gem 'devise'
gem 'cancan'
gem 'settingslogic'
gem 'kaminari'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'
gem 'thin'

# Deploy with Capistrano
group :development do
  gem 'capistrano'
  gem 'rvm-capistrano'
end

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem 'rspec-rails', '~> 2.8'
  gem 'factory_girl_rails'
end
