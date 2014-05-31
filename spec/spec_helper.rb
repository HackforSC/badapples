ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

require 'rubygems'
require 'factory_girl'
require 'rspec/rails'
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # Default exclusions
  config.filter_run_excluding :debug => true

  # Mock Framework
  config.mock_with :rspec

  # Run each example within a transaction
  config.use_transactional_fixtures = false

  # The base class of anonymous controllers will be inferred (default in future rspec-rails)
  config.infer_base_class_for_anonymous_controllers = true

  # Run specs in random order to surface order dependencies.
  config.order = "random"

  config.before(:all) do
    FactoryGirl.reload
  end

  config.before(:each) do
    if example.metadata[:js]
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
    end
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:all) do
  end
end
