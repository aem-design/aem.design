#!/usr/bin/env bash

cd /build/source


PORT=$(cat dev.port)
PORT_LIVERELOAD=$(cat dev-livereload.port)

yum install -y libwebp libwebp-tools

rvm install ruby --latest
gem install i18n jekyll bundler jemoji nokogiri -n /usr/local/bin

bundle install
bundle exec jekyll serve --host 0.0.0.0 --port "${PORT}" --livereload --livereload_port "${PORT_LIVERELOAD}" --force_polling --future
