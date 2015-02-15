source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

gem 'bourbon'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass', '3.2.0.0'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  # NOTE: It is critical you put better_errors in the development section.
  # Do NOT run better_errors in production, or on Internet facing hosts.
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'sqlite3'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'spring'

  # With it, whenever you get NoMethodError or NameError, it'll automatically
  # look for what you really wanted to call and tell it to you.
  gem 'did_you_mean', '~> 0.9.6'
end

group :production do
  gem 'pg',             '0.18.1'
  gem 'rails_12factor', '0.0.2'
end
