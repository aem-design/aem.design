#!/usr/bin/env bash

cd /build/source

yum install -y libwebp libwebp-tools

rvm install ruby --latest
rvm use ruby --install --default
gem install i18n jekyll bundler jemoji nokogiri -n /usr/local/bin

bundle install
bundle exec jekyll serve --host 0.0.0.0 --port 8100 --livereload --force_polling
