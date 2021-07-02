# frozen_string_literal: true

require_relative "lib/jekyll-google_search_console_verification_file/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-google_search_console_verification_file"
  spec.version       = Jekyll::GoogleSearchConsoleVerificationFile::VERSION
  spec.authors       = ["Erik Westrup"]
  spec.email         = ["erik.westrup@gmail.com"]

  spec.summary       = "Generate a Google Search Console verification file from your _config.yml e.g. google47733b3288357e4.html to the root of your Jekyll site."
  spec.description   = "This is a very simple plugin that will generate a Google Search Console (GSC from here) verification file to your _site/ directory in a Jekyll project. This file is used by GSC to verify that you own the site and looks for example like https://erikw.me/googlef47733b3288357e4.html."
  spec.homepage      = "https://github.com/erikw/jekyll-google_search_console_verification_file/tree/dev"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7", "< 4"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/erikw/jekyll-google_search_console_verification_file/tree/dev"
  spec.metadata["changelog_uri"] = "https://github.com/erikw/jekyll-google_search_console_verification_file/blob/dev/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", ">= 3.7", "< 5.0"
  spec.add_development_dependency "appraisal"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "travis", "~> 1.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.18"
  spec.add_development_dependency "rubocop-rake", "~> 0.6"
  spec.add_development_dependency "rubocop-rspec", "~> 2.4"
  spec.add_development_dependency "simplecov", "~> 0.21"
end
