source 'http://rubygems.org'

gem 'rails', '3.1.0.rc8'

# The Asset Pipeline
gem 'tilt', '~> 1.3.3'
gem 'sass-rails', '~> 3.1.0.rc.7'
gem 'haml-rails', '~> 0.3'
gem 'coffee-script', '~> 2.1'
gem 'jquery-rails', '~> 1.0'
gem 'uglifier', '~> 1.0'

# Database
gem 'sqlite3-ruby', :require => 'sqlite3' # will later only be for dev and test

# Authentification
gem 'devise', '~> 1.4.8'

# Other
gem 'rdiscount' # Markdown

group :development, :test do
  gem 'yard'

  gem 'capybara', '~> 1.1.1' # Better Matchers for the View Specs
  gem 'capybara_minitest_spec', '~> 0.2.1'
  gem 'fabrication', '~> 1.2.0'
  gem 'database_cleaner', '0.6.7'

  gem 'spork', '> 0.9.0.rc'
  gem 'spork-testunit', '0.0.5'

  # Beware of the guard army!
  gem 'guard', '~> 0.8.4'
  gem 'growl'
  gem 'rb-fsevent'
  gem 'guard-bundler', '~> 0.1.3'
  gem 'guard-livereload', '~> 0.3.1'
  gem 'guard-pow', '~> 0.2.1'
  gem 'guard-yard', '~> 1.0.0'
  gem 'guard-minitest', '~> 0.4.0'
  gem 'guard-spork', '~> 0.3.1'

  # 'hpricot' and 'ruby_parser' are needed to create views with devise.
  # We only need this while developing.
  gem 'hpricot', '~> 0.8'
  gem 'ruby_parser', '~> 2.3'
end

# currently not in use:

# gem 'will_paginate'
# gem 'cancan'
# gem 'syntax' # Highlighting in TextMate's RSpec Output
# gem 'factory_girl_rails'
# gem 'mocha'
# gem 'formtastic', '~> 1.1.0'
# gem 'ZenTest', '~> 4.4.2'
