# Jekyll Google Search Console Verification File Generator Plugin [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=Generate%20a%20Google%20Search%20Console%20verification%20file%20for%20your%20Jekyll%20site%20with%20this%20plugin&url=https://github.com/erikw/jekyll-google_search_console_verification_file&via=erik_westrup&hashtags=jekyll,plugin)
[![Gem Version](https://badge.fury.io/rb/jekyll-google_search_console_verification_file.svg)](https://badge.fury.io/rb/jekyll-google_search_console_verification_file)
[![Gem Downloads](https://img.shields.io/gem/dt/jekyll-google_search_console_verification_file?label=gem%20downloads)](https://rubygems.org/gems/jekyll-google_search_console_verification_file)
[![Travis Build Status](https://img.shields.io/travis/com/erikw/jekyll-google_search_console_verification_file/main?logo=travis)](https://app.travis-ci.com/github/erikw/jekyll-google_search_console_verification_file)
[![Code Climate Maintainability](https://api.codeclimate.com/v1/badges/59050f3f66ed1f1ee32e/maintainability)](https://codeclimate.com/github/erikw/jekyll-google_search_console_verification_file/maintainability)
[![Code Climate Test Coverage](https://api.codeclimate.com/v1/badges/59050f3f66ed1f1ee32e/test_coverage)](https://codeclimate.com/github/erikw/jekyll-google_search_console_verification_file/test_coverage)
[![CodeQL](https://github.com/erikw/jekyll-google_search_console_verification_file/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/erikw/jekyll-google_search_console_verification_file/actions/workflows/codeql-analysis.yml)
[![SLOC](https://sloc.xyz/github/erikw/jekyll-google_search_console_verification_file?lower=true)](#)
[![Number of programming languages used](https://img.shields.io/github/languages/count/erikw/jekyll-google_search_console_verification_file)](#)
[![Top programming languages used](https://img.shields.io/github/languages/top/erikw/jekyll-google_search_console_verification_file)](#)
[![License](https://img.shields.io/github/license/erikw/jekyll-google_search_console_verification_file)](LICENSE.txt)
[![OSS Lifecycle](https://img.shields.io/osslifecycle/erikw/jekyll-google_search_console_verification_file)](https://github.com/Netflix/osstracker)

<p align="center">
    <!-- Ref: https://dev.to/azure/adding-a-github-codespace-button-to-your-readme-5f6l -->
    <a href="https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=381051146" title="Open in GitHub Codespaces" ><img alt="Open in GitHub Codespaces" src="https://github.com/codespaces/badge.svg"></a>
</p>

> [!TIP]
> :point_right: **Live demo**: https://erikw.github.io/jekyll-google_search_console_verification_file/


This is a very simple plugin that will generate a Google Search Console (GSC from here on) [verification file](https://support.google.com/webmasters/answer/9008080?hl=en) to your `_site/` directory in a Jekyll project. This file is used by GSC to verify that you own the site and looks for example like my [googlef47733b3288357e4.html](https://erikw.me/google47733b3288357e4.html).

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
1. Add this gem to your Jekyll site's Gemfile in the `:jekyll_plugins` group:
   * On CLI (in project root directory):
   ```shell
   bundle add --group jekyll_plugins jekyll-google_search_console_verification_file
   ```
   * Or manually:
   ```ruby
   group :jekyll_plugins do
     [...]
     gem 'jekyll-google_search_console_verification_file'
   end
   ```
1. Run `$ bundle install`.
1. In your site's `_config.yml`, enable the plugin:
   ```yml
   plugins:
     - jekyll-google_search_console_verification_file
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
   ```console
   $ bundle exec jekyll build
   $ ls _site/ | grep "google.*\.html"
   google47733b3288357e4.html
   ```

# Development
The structure of this plugin was inspired by [https://ayastreb.me/writing-a-jekyll-plugin/](https://ayastreb.me/writing-a-jekyll-plugin/), the plugin jekyll-sitemap and the [Bundler Gem tutorial](https://bundler.io/guides/creating_gem.html).

After checking out the repo;
1. Install [RVM](https://rvm.io/rvm/install) and install a supported ruby version (see .gemspec)
1. run `scripts/setup` to install dependencies
1. run `scripts/test` to run the tests
1.  You can also run `scripts/console` for an interactive prompt that will allow you to experiment.

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
Instructions for releasing on rubygems.org below. Optionally make a GitHub [release](https://github.com/erikw/jekyll-google_search_console_verification_file/releases) after this for the pushed git tag.

## [manual] Using bundler/gem_tasks rake tasks
Following instructions from [bundler.io](https://bundler.io/guides/creating_gem.html#releasing-the-gem):
```shell
vi -p lib/jekyll-google_search_console_verification_file/version.rb CHANGELOG.md
bundle exec rake build
ver=$(ruby -r jekyll-google_search_console_verification_file/version -e 'puts Jekyll::GoogleSearchConsoleVerificationFile::VERSION')

# Optional: test locally by including in another project
gem install pkg/jekyll-google_search_console_verification_file-$ver.gem

bundle exec rake release
```

## [recommended] Using gem-release gem extension
Using [gem-release](https://github.com/svenfuchs/gem-release):
```shell
vi CHANGELOG.md && git add CHANGELOG.md && git commit -m "Update CHANGELOG.md" && git push
gem signin
gem bump --version minor --tag --push --release --sign
```
For `--version`, use `major|minor|patch` as needed.

## Multi-versions
* For ruby, just use RVM to switch between supported ruby version specified in `.gemspec`.
* To run with different jekyll versions, [Appraisal](https://github.com/thoughtbot/appraisal) is used with [`Appraisals`](Appraisals) to generate different [`gemfiles/`](gemfiles/)
   - To use a specific Gemfile, run like
      ```shell
      BUNDLE_GEMFILE=gemfiles/jekyll_4.x.x.gemfile bundle exec rake spec
      bundle exec appraisal jekyll-4.x.x rake spec
      ```
   - To run `rake spec` for all gemfiles:
      ```shell
      bundle exec appraisal rake spec
      ```
   - To generate new/updated gemfiles from `Appraisals`
      ```shell
      bundle exec appraisal install
      bundle exec appraisal generate
      ```

## Travis
To use the [travis cli client](https://github.com/travis-ci/travis.rb) (installed from `Gemfile`):
1. Get a GitHub OAuth token by
   - going to [github.com/settings/tokens](https://github.com/settings/tokens)
   - create a new token named `travis-cli`
   - Set the scopes `repo`, `read:org`, `user:email` according to the [docs](https://docs.travis-ci.com/user/github-oauth-scopes).
1. Set travis.com as the default so we don't need to add `--pro` to most commands
   ```shell
   bundle exec travis endpoint --set-default --api-endpoint https://api.travis-ci.com/
   ```
1. Login with the cli client
   ```shell
   bundle exec travis login --github-token $GITHUB_TOKEN
   ```
1. Now the cli client can be used (might need `--pro` to use travis.com)
   ```shell
   bundle exec travis lint
   bundle exec travis accounts
   bundle exec travis status
   bundle exec travis branches
   bundle exec travis monitor
   ```

# Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/erikw/jekyll-google_search_console_verification_file.

# License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# More Jekyll
Check out my other Jekyll repositories [here](https://github.com/erikw?tab=repositories&q=jekyll-&type=&language=&sort=).
