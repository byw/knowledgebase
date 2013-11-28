ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'database_cleaner'
require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :truncation

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end

class MiniTest::Spec

  after(:each) do
    DatabaseCleaner.clean
  end

end