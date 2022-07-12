#!/bin/sh

bundle install >/dev/null
bundle exec rubocop --color -a --force-exclusion --config .rubocop.yml "$@"
