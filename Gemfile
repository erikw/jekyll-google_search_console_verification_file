# frozen_string_literal: true

source "https://rubygems.org"
ruby "3.0.1"

# Include dependencies from the .gemspec
gemspec

# Development dependencies
# Should rather be here than in the .gemspec
# Reference: https://github.com/rubygems/bundler/pull/7222
# However there's an argument for using gemspec too: https://bundler.io/guides/creating_gem.html#testing-our-gem
group :development, :test do
  gem "rake", "~> 13.0"
end

group :test do
  gem "rspec", "~> 3.0"
  gem "rubocop", "~> 1.18"
  gem "rubocop-rake", "~> 0.6", require: false
  gem "rubocop-rspec", "~> 2.4", require: false
  gem "simplecov", "~> 0.21", require: false, group: :test
end
