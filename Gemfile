# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'annotate',           '3.1.1'
gem 'awesome_print',      '1.9.2'
gem 'bootsnap',           '>= 1.4.4', require: false
gem 'cancancan', '3.3.0'
gem 'devise',             '4.8.1'
gem 'devise-jwt',         '0.9.0'
gem 'dotenv-rails',       '2.7.6'
gem 'jsonapi-serializer', '2.2.0'
gem 'pg',                 '~> 1.1'
gem 'puma',               '~> 5.0'
gem 'rack-cors',          '1.1.1'
gem 'rails',              '6.1.4.4'
gem 'faker',              '2.19.0'

group :development, :test do
  gem 'pry-byebug',         '3.9.0'
  gem 'rubocop',            '1.23.0'
  gem 'rubocop-rspec',      '2.6.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'database_cleaner',   '2.0.1'
  gem 'factory_bot_rails',  '6.2.0'
  gem 'rspec-rails',        '5.0.2'
  gem 'shoulda-matchers',   '5.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
