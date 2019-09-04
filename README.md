# aem.design
AEM.Design blog

[![build_status](https://travis-ci.org/aem-design/aem.design.svg?branch=master)](https://travis-ci.org/aem-design/aem.design) 
[![github license](https://img.shields.io/github/license/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
[![github issues](https://img.shields.io/github/issues/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
[![github last commit](https://img.shields.io/github/last-commit/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
[![github repo size](https://img.shields.io/github/repo-size/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
[![docker stars](https://img.shields.io/docker/stars/aemdesign/aem.design)](https://hub.docker.com/r/aemdesign/aem.design) 
[![docker pulls](https://img.shields.io/docker/pulls/aemdesign/aem.design)](https://hub.docker.com/r/aemdesign/aem.design) 
[![github release](https://img.shields.io/github/release/aem-design/aem.design)](https://github.com/aem-design/centos-tini)
![statuscake](https://app.statuscake.com/button/index.php?Track=sKW7chwd8h&Days=7&Design=3 "statuscake")


## Updating this Repo

You can update this repo using your favorite IDE or use a web based editor

* [Prose.io - AEM.Design](http://prose.io/#aem-design/aem.design/tree/master)

## Markdown Cheatsheet

When creating pages in this repo use the markdown syntax, you can find syntax here:

* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

## Icons

Icons can be selected form here [Fontawesome](http://fontawesome.io/icons/)


## Getting Started

* setup ```ruby```

* install dependecies run

```bash
./install.sh
```

* run server while editing

```bash
./serve.sh
```

## CI Commands

Clone repo

```bash
git clone --branch "aem.design-manual" --depth 50 git@github.com:aem-design/aem.design.git ~/src/github.com/aem-design/aem.design
cd clone
```

Ruby setup commands on CI once repo

```bash
if [ "$CI_BRANCH" != "gh-pages" ]; then rvm use ruby-2.1.7 --install; fi
if [ "$CI_BRANCH" != "gh-pages" ]; then bundle install; fi
if [ "$CI_BRANCH" != "gh-pages" ]; then rake generate; fi
if [ "$CI_BRANCH" != "gh-pages" ]; then rake publish; fi
```