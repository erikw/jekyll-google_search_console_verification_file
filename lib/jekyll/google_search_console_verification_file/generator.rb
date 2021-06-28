# frozen_string_literal: true

# TODO should require here, or in spec/spec_helper.rb ?
#require "jekyll"

module Jekyll
  module GoogleSearchConsoleVerificationFile
    class Generator < Jekyll::Generator
      safe true
      priority :lowest

      # Plugin entry point.
      def generate(site)
        @site = site
        a_verification_file_exist? ? puts(file_exist_warn_msg) : @site.pages << verification_file
      end

      private

      # Configuration keys in _config.yml
      CONF_NS = 'google_search_console'
      CONF_CODE = 'verification_file_code'

      # Get the verification code from _config.yml
      def code
        argMsg = "[#{class_name}] #{CONF_NS}.#{CONF_CODE} must be set in _config.html"
        raise ArgumentError,  argMsg unless @site.config[CONF_NS]&.[](CONF_CODE)
        @site.config[CONF_NS][CONF_CODE]
      end

      # Base name of current class.
      def class_name
        self.class.name.split('::').last
      end

      # Warning message if a verification file already exist in the source tree.
      def file_exist_warn_msg
        "[#{class_name}] Warning: found Google Search Console verification file in source tree; not generating one..."
      end

      # Check if a GSC verification file already exist in the source that will be put in the root of the generated site.
      def a_verification_file_exist?
        @site.static_files.any? { |p| p.url =~ /\/google.+\.html?/ }
      end

      # Get path of the template file.
      def source_path(file = "google_search_console_verification_file/template.html")
        File.expand_path "../#{file}", __dir__
      end

      # Path of the output file.
      def destination_path
        "google#{code}.html"
      end

      # Construct a file object from a template with content that can be added to generated pages
      def verification_file
        page = PageWithoutAFile.new(@site, __dir__, "", destination_path)
        page.content = File.read(source_path)
        page.data["layout"] = nil
        page
      end
    end
  end
end
