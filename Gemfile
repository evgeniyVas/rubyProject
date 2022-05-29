source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

gem 'devise', '~> 4.8'
gem 'pg', '~> 1.1'
gem 'rexml', '~> 3.2', '>= 3.2.5'
gem 'sidekiq', '~> 6.2', '>= 6.2.2'
gem 'sidekiq-cron', '~> 1.1'
gem 'slim-rails'

gem 'awesome_print'
gem 'factory_bot_rails', '~> 5.1.1'
gem 'faker'
gem 'faker-russian'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.0'
  gem 'rspec-retry'
  gem 'rspec-set'
  gem 'rubocop', '~> 1.25.0', require: false
  gem 'rubocop-rails', '~> 2.4.2', require: false
  gem 'rubocop-rspec', '~> 1.37.1', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
