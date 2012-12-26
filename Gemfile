source 'https://rubygems.org'

# Framework
gem 'rails', '3.2.9'
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

# Asset gems
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'minitest-rails'
  gem 'turn'

  # Autotest w/ Guard
  gem 'guard'
  gem 'guard-minitest'
  gem 'rb-fsevent', '~> 0.9.1'

  # Test notifications
  gem 'growl'

  # Autotest & Spork
  #gem 'spork'
  #gem 'autotest-standalone' # The file '.autotest' makes sure the tests are run via test server (spork).
  #gem 'autotest-rails-pure' # -pure gives us autotest without ZenTest gem.
  #gem 'autotest-growl'      # growl notifications, complains a little bit if growl isn't installed
  #gem 'autotest-fsevent'
  #gem 'spork-minitest'
end

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
