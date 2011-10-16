require 'spork'

Spork.prefork do

  # Environment.
  ENV["RAILS_ENV"] = "test"
  require File.expand_path('../../config/environment', __FILE__)

  # MiniTest and Capybara.
  require 'minitest/autorun'
  require 'capybara/rails'

  # Require ruby files in support dir.
  Dir[File.expand_path('test/support/*.rb')].each { |file| require file }

  # Database cleaner.
  DatabaseCleaner.strategy = :truncation
  class MiniTest::Spec
    before :each do
      DatabaseCleaner.clean
    end
  end

  # If description name ends with 'integration', use this RequestSpec class.
  # It has all the integration test goodies.
  class RequestSpec < MiniTest::Spec
    include Rails.application.routes.url_helpers
    include Capybara::DSL
  end
  MiniTest::Spec.register_spec_type /integration$/i, RequestSpec
end

Spork.each_run do
  Rails.application.reload_routes!
end
