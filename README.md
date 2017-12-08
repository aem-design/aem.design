# aem.design
AEM.Design blog

[ ![Codeship Status for aem-design/aem.design](https://app.codeship.com/projects/9248b2c0-c41b-0134-b8f0-621863df2064/status?branch=master)](https://app.codeship.com/projects/197854)

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