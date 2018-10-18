#!/bin/sh
set -e

PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
cd ruby
gem install --no-rdoc --no-ri --user-install bundler
bundle install
bundle exec rspec *_spec.rb
bundle exec cucumber --tags "not @ignore"
