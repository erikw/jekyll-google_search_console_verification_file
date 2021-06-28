# frozen_string_literal: true

require "jekyll" # TODO why require this here like jekyll-maps, instead of inside verifcation_file_generator.rb directly like in jekyll-feed?
require "jekyll/google_search_console_verification_file"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
