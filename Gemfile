source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# gem 'mini_racer', platforms: :ruby

gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '~> 4.8'

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'byebug', platform: :mri
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'guard-rspec'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'faker'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'web-console', '>= 3.3.0'
  gem 'letter_opener'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'rack-mini-profiler', require: false
end

group :test do
  gem 'rails-controller-testing'
  gem 'timecop'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'rspec-retry'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
