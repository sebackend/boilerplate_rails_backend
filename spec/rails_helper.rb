# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

# Import helpers
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/factories"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # start by truncating all the tables but then use the faster transaction strategy the rest of the time.
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  # start the transaction strategy as examples are run
  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  rescue NoMethodError => e
    # Database cleaner tiene un bug que levanta falsos positivos con este mensaje:
    next if e.message == "undefined method `rollback' for nil:NilClass"

    raise e
  end

  # Para añadir un Middleware de Devise a los tests
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Warden::Test::Helpers, type: :request
  # Para incluir los métodos de factoryBot
  config.include FactoryBot::Syntax::Methods

  config.include Request::AuthHelpers, type: :request
  config.include Request::JsonHelpers, type: :request
end
