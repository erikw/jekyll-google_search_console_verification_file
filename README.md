# Jekyll Google Search Console Verification File Generator Plugin - UNRELEASED
[![Build Status](https://travis-ci.com/erikw/jekyll-google_search_console_verification_file.svg?branch=main)](https://travis-ci.com/erikw/jekyll-google_search_console_verification_file)
[![Maintainability](https://api.codeclimate.com/v1/badges/59050f3f66ed1f1ee32e/maintainability)](https://codeclimate.com/github/erikw/jekyll-google_search_console_verification_file/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/59050f3f66ed1f1ee32e/test_coverage)](https://codeclimate.com/github/erikw/jekyll-google_search_console_verification_file/test_coverage)


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
   - Simply with `$ bundle add jekyll-google-search-console-verification-file` when standing in the Jekyll project
   - Or manually by adding to `Gemfile`
   ```ruby
     gem 'jekyll-google-search-console-verification-file'
   ```
   and then running `$ bundle install`.
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
1. Now just build your site and verify that the verification file now exist!
   ```bash
   $ bundle exec jekyll build
   $ ls _site/ | grep "google.*\.html"
   google47733b3288357e4.html
   ```

# Development
The structure of this plugin was inspired by [https://ayastreb.me/writing-a-jekyll-plugin/](https://ayastreb.me/writing-a-jekyll-plugin/), the plugin jekyll-sitemap and the [Bundler Gem tutorial](https://bundler.io/guides/creating_gem.html).

After checking out the repo;
1. Install correct ruby version: `$ rvm install 3.0.0 && rvm use 3.0.0`
1. run `bin/setup` to install dependencies
1. run `bin/test` to run the tests
1.  You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Local development
Following the setup at [how-to-specify-local-ruby-gems-in-your-gemfile](https://rossta.net/blog/how-to-specify-local-ruby-gems-in-your-gemfile.html), these are the steps needed to build a jekyll site with a local clone of this plugin for local testing.

1. Clone this repo to your machine, say at `~/src/jekyll-google_search_console_verification_file`
1. In your Jekyll project's `Gemfile`:
   - Remove the `gem 'jekyll-google_search_console_verification_file'` part
   - Add instead `gem 'jekyll-google_search_console_verification_file', github: 'erikw/jekyll-google_search_console_verification_file', branch: 'main'`
1. Configure bundler to use a local path for this gem in this project:
   - `$ bundle config --local local.jekyll-google_search_console_verification_file ~/src/jekyll-google_search_console_verification_file`
1. Update the project: `$ bundle install`
1. Now the project will build with the local clone of this plugin when issuing e.g. `bundle exec jekyll build`
1. When you're done:
  - Remove the local override with: `$ bundle config --delete local.jekyll-google_search_console_verification_file`
  - Optionally restore the original gem include in `Gemfile` or keep building from a branch in the github repo.

## Releasing
TODO start with base at https://ayastreb.me/writing-a-jekyll-plugin/ put document exact commands for each step to use.
TODO Create GitHub Releases, as that way I can get download stats? https://www.toolsqa.com/git/github-releases/ rubygems list download stats already though

# Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/erikw/jekyll-google_search_console_verification_file.

# License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
