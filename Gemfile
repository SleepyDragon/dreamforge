source 'http://rubygems.org'

gem 'rails', '3.0.1'
gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'haml' # HAML & SASS
gem 'jquery-rails', '>= 0.2.6'
gem 'formtastic', '~> 1.1.0'
gem 'devise'
gem 'cancan'
gem 'rdiscount' # Markdown
gem 'will_paginate', '~> 3.0.pre2'

group :development, :test do
  gem 'yard'
  gem 'rspec', '~> 2.5.0'
  gem 'rspec-rails', '~> 2.5.0'
  gem 'webrat' # Better Matchers for the View Specs
  gem 'syntax' # Highlighting in TextMate's RSpec Output
  gem "ZenTest", "~> 4.4.2"
  gem "autotest-rails", "~> 4.1.0"
  gem "autotest-fsevent" # Instead of polling your files all the time, wait for push notifications
  gem "autotest-growl" # autotests sends growl notifications 
  gem 'spork', '~> 0.9.0.rc' # make specs faster

  # 'hpricot' and 'ruby_parser' are needed to create views with devise.
  # We only need this while developing.
  gem 'hpricot'
  gem 'ruby_parser'
end
