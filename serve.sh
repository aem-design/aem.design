#!/usr/bin/env bash

rm -rf ./_site
bundle exec jekyll serve
#bundle exec jekyll serve --ssl-key .ssl/domain-key.txt  --ssl-cert .ssl/domain-crt.txt