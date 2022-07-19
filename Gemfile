source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 6.0"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.3", ">= 4.3.3"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "sassc", "~> 2.4"
gem "jbuilder", "~> 2.5"
gem "bcrypt", "~> 3.1.7"
gem "jquery-rails", "~> 4.3", ">= 4.3.1"
gem "semantic-ui-sass", "~> 2.4", ">= 2.4.4.0"
gem "font-awesome-sass", "~> 5.0.13"
gem "simple_form", "~> 5.0", ">= 5.0.1"
gem "devise", ">= 4.6.0"
gem "pundit", "~> 1.1"
gem "net-smtp", "~> 0.3.1"
gem "bootsnap", ">= 1.1.0", require: false
gem "standard", group: [:development, :test]

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 5.1", ">= 5.1.2"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15", "< 4.0"
  gem "capybara-screenshot"
  gem "selenium-webdriver"
  gem "factory_bot_rails"
  gem "webdrivers", "~> 5.0", require: false
  gem "simplecov", "0.17.1", require: false
  gem "simplecov-console", require: false
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
