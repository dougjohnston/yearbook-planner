source 'https://rubygems.org'

# Framework
gem 'rails'#, '3.2.11'
gem 'mysql2'

# Not needed after an upgrade to Rails 4.x
gem 'strong_parameters'

# Authentication & Authorization
gem 'devise'
#gem 'cancan'

# Models
gem 'ranked-model'

# Views
gem 'jquery-rails'
gem 'active_link_to'

# JavaScript / Backbone

# FOR ASSETS
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

# FOR DEVELOPMENT
group :development do
  gem 'puma' # faster dev server
  gem 'better_errors' # prettier and more functional error pages
  gem 'binding_of_caller' # support for better_errors
  gem 'quiet_assets' # stop the torrent of asset log entries
end

# FOR DEVELOPMENT AND TEST
group :development, :test do
  gem 'minitest-rails'
  gem 'jasmine'
end

# FOR TESTING
group :test do
  gem 'turn'

  # Support libraries
  gem "minitest-rails-capybara"
  gem 'factory_girl_rails'
  gem 'mocha', :require => false

  # Autotest w/ Guard
  gem 'guard'
  gem 'guard-minitest'
  gem 'rb-fsevent', '~> 0.9.1'

  # Test notifications
  gem 'minitest-growl'
end


# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
