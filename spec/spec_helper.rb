require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
  add_filter "/vendor/"

  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Mailers", "app/mailers"
  add_group "Helpers", "app/helpers"
  add_group "Presenters", "app/presenters"
  add_group "Uploaders", "app/uploaders"
  add_group "Configs", "config"
  # add_group "Views", "app/views"
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'rubygems'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'factory_girl_rails'

# DBC
require 'database_cleaner'
  
Capybara.run_server = true #Whether start server when testing
# Capybara.app_host = 'http://localhost:3000'
Capybara.server_port = 8200
Capybara.default_wait_time = 5
Capybara.default_driver = :selenium

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
    # Use color in STDOUT
    config.color_enabled = true

    # Use color not only in STDOUT but also in pagers and files
    config.tty = true

    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    #config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false #true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = true

    config.include Capybara::DSL, :type => :request
    config.include FactoryGirl::Syntax::Methods
    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

end
