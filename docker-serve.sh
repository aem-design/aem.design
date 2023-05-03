#!/usr/bin/env bash

cd /build

source .bashrc

cd /build/source

apt-get update -y

echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

apt-get install locales
locale-gen en_US.UTF-8

# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

if [[ "${PORT}" == "" ]]; then
  PORT=$(cat dev.port)
fi

if [[ "${PORT_LIVERELOAD}" == "" ]]; then
  PORT_LIVERELOAD=$(cat dev-livereload.port)
fi

# install ruby-devel
apt-get install -y ruby-dev

gem install sass-embedded -v 1.62.1
gem install i18n jekyll bundler jemoji nokogiri -n /usr/local/bin

bundle install
bundle exec jekyll serve --trace --host 0.0.0.0 --port "${PORT}" --livereload --livereload_port "${PORT_LIVERELOAD}" --force_polling --future --incremental
