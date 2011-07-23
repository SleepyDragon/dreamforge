source 'http://rubygems.org'

gem 'rails', '3.1.0.rc4'

# The assets:
gem 'sass-rails', '~> 3.1.0.rc'
gem 'haml-rails'
gem 'coffee-script'
gem 'jquery-rails'
gem 'uglifier'

gem 'sqlite3-ruby', :require => 'sqlite3' # database, will later only be for dev and test

gem 'devise' # Authentification

gem 'rdiscount' # Markdown

group :development, :test do
  gem 'yard'
  
  gem 'rspec', '~> 2.6.0'
  gem 'rspec-rails', '~> 2.6.0'
  
  gem 'webrat' # Better Matchers for the View Specs
  
  # Beware of the guard army!
  gem 'guard'
  gem 'rb-fsevent'
  gem 'growl'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-pow'
  gem 'guard-spork'
  gem 'guard-yard', '~> 1.0.0'
  # gem 'guard-minitest'
  
  # 'hpricot' and 'ruby_parser' are needed to create views with devise.
  # We only need this while developing.
  gem 'hpricot'
  gem 'ruby_parser'
end

# currently not in use:

# gem 'will_paginate', '~> 3.0.pre2' doesn't work in 3.1
# use gem 'kaminari' instead?

# gem 'cancan'
# gem 'syntax' # Highlighting in TextMate's RSpec Output
# gem 'factory_girl_rails'
# gem 'mocha'
# gem 'formtastic', '~> 1.1.0'
# gem 'ZenTest', '~> 4.4.2'