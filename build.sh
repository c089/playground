#!/bin/sh
set -e

cd ruby
gem install --user-install bundler
bundle install
bundle exec rspec *_spec.rb
bundle exec cucumber
