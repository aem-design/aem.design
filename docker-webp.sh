#!/usr/bin/env bash

cd /build

source .bashrc

cd /build/source

export LANG=en_US.UTF-8

find /build/source/assets/images/background/ -exec ./webp.py {} \;
