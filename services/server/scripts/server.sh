#!/usr/bin/env bash

cd /build

source .bashrc

cd /build/source

export LANG=en_US.UTF-8

PORT=$(cat dev.port)
PORT_LIVERELOAD=$(cat dev-livereload.port)

yum install -y libwebp libwebp-tools

rvm install ruby --latest
rvm use --latest
gem install i18n jekyll bundler jemoji nokogiri -n /usr/local/bin

bundle install
bundle exec jekyll serve --trace --host 0.0.0.0 --port "${PORT}" --livereload --livereload_port "${PORT_LIVERELOAD}" --force_polling --future --incremental
