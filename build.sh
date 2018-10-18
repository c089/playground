#!/bin/sh
set -e

cd ruby
bundle exec rspec *_spec.rb
bundle exec cucumber
