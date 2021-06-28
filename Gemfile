# frozen_string_literal: true

source "https://rubygems.org"

# Include dependencies from the .gemspec
gemspec

# Development dependencies
# Should rather be here than in the .gemspec
# Reference: https://github.com/rubygems/bundler/pull/7222
# However there's an argument for using gemspec too: https://bundler.io/guides/creating_gem.html#testing-our-gem
gem "rake", "~> 13.0"
gem "rspec", "~> 3.0"
gem "rubocop", "1.12"	# Support for ruby 2.4 was dropped after v1.12.
gem 'rubocop-rake', "~> 0.6.0", require: false
gem 'rubocop-rspec', "~> 2.4.0", require: false
