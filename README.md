# Jekyll Google Search Console Verification File Generator Plugin
TODO add build status badge and gem versions badge like https://github.com/ayastreb/jekyll-maps

This is a very simple plugin that will generate a Google Search Console (GSC from here) [verification file](https://support.google.com/webmasters/answer/9008080?hl=en) to your `_site/` directory in a Jekyll project. This file is used by GSC to verify that you own the site and looks for example like my [googlef47733b3288357e4.html](https://erikw.me/googlef47733b3288357e4.html).

## Why?
Why use this plugin?

### Tl;DR
* Don't stuff bloating `<meta>` tag to all your HTML pages; use simple file in the site's root
* Generate what can be generated; keep your source tree clean!


### !TL;DidRead
There are multiple ways to [verify](https://support.google.com/webmasters/answer/9008080?hl=en) the ownership of your site. The two simpler ways, both suitable for Github Pages owners, are to add an `<meta> tag to your pages` or upload a special unique file to the root of the site. For adding the meta tag, there are excellent plugins making this very easy for example [jekyll-seo-tag](http://jekyll.github.io/jekyll-seo-tag/usage/). If you want to the meta tag, I recommend this plugin.

However if you feel that it's bloated to add this `<meta>` tag to the header all you pages, keeping file size and page load speed in mind, you may one to go for the file based verification method instead.

So with the file based method, why not just add the file you downloaded from GSC to your source directory and let Jekyll put it in `_site/` on generation? As we're using a SSG (Static Site Generator), we should generate everything we can. It's verdantly nice to keep the source tree clean and make everything that can be a configuration that generates what is needed.

Thus, this plugin exist to solve this problem. Give the plugin the unique code GSC provided you and it will generate the file for you in `_site/`!

Note that if you do place a verification file in the root of the source tree, this will override the generation by this plugin.

# Installation
1. Add this gem to your Jekyll site's Gemfile
   ```ruby
   group :jekyll_plugins do
     gem 'jekyll-google-search-console-verification-file' TODO version
   end
   ```
   and run `$ bundle install`.
1. In your site's `_config.yml`, enable the plugin:
   ```yml
   plugins:
     - jekyll-google-search-console-verification-file
   ```
1. Get the GSC unique code for you website.
   1. Register your website at [Google Search Console](https://search.google.com/search-console?resource_id=https://erikw.me/)
   1. From the main dashboard of your site at GSC: _Settings > Ownership Verification > HTML File_ and download the unique file
   1. Instead of putting this file in our jekyll site, just copy the unique code from the HTML file name e.g. from `googlef47733b3288357e4.html` copy `f47733b3288357e4`.
1. In your site's `_config.yml`, configure this plugin with the code from the previous step:
   ```yml
   google_search_console:
     verification_file_code: 47733b3288357e4
   ```
1. Just build your site and verify that the verification file now exist!
   ```bash
   $ bundle exec jekyll build
   $ ls _site/ | grep "google.*\.html"
   google47733b3288357e4.html
   ```

## Development
The structure of this plugin was inspired by [https://ayastreb.me/writing-a-jekyll-plugin/](https://ayastreb.me/writing-a-jekyll-plugin/), the plugin jekyll-sitemap and the [Bundler Gem tutorial](https://bundler.io/guides/creating_gem.html).

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/erikw/jekyll-google_search_console_verification_file.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
