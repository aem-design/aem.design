# aem.design
AEM.Design blog

[![build_status](https://github.com/aem-design/aem.design/workflows/ci/badge.svg)](https://github.com/aem-design/aem.design/actions?workflow=ci)
[![github license](https://img.shields.io/github/license/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
[![github issues](https://img.shields.io/github/issues/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
[![github last commit](https://img.shields.io/github/last-commit/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
[![github repo size](https://img.shields.io/github/repo-size/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
![statuscake](https://app.statuscake.com/button/index.php?Track=sKW7chwd8h&Days=7&Design=3 "statuscake")
[![Visit AEM.Design](https://img.shields.io/badge/visit-aem.design-brightgreen)](https://aem.design/)
[![Gitter](https://img.shields.io/gitter/room/aem-design/Lobby)](https://gitter.im/aem-design/Lobby)
[![Keybase](https://img.shields.io/keybase/pgp/aemdesign?color=orange&label=PGP&logo=keybase&logoColor=orange)](https://keybase.io/aemdesign)


## Updating this Repo

You can update this repo using your favorite IDE or use a web based editor

* [Prose.io - AEM.Design](http://prose.io/#aem-design/aem.design/tree/master)

## Markdown Cheatsheet

When creating pages in this repo use the markdown syntax, you can find syntax here:

* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

## Icons

Icons can be selected form here [Fontawesome](http://fontawesome.io/icons/)


## Getting Started

* ensure you have Git LFS installed

* run server while editing

```bash
./serve.sh
```

## Convert images to WebP

If you want to convert your images to webp follow this and commit outputs:

* run container using `start.ps1`
* change to `source` dir
* run `./webp.py <asset path>`

### On Windows

On windows, for best results use docker for everything.

```powershell
#POWERSHELL
docker run -it --rm -p 4000:4000 -p 35729:35729 -v ${pwd}:/build/source:rw aemdesign/centos-java-buildpack bash --login

cd source/
rvm install "ruby-2.6.3"
gem install jekyll bundler jemoji nokogiri -n /usr/local/bin
bundle install
bundle exec jekyll serve --host 0.0.0.0 --livereload

```

# Google Ads

Config is located in `_data/advertising.yml` html should not need to be changed and located in `_includes/adds/adsense.html`

# Project Structure Description

Following is the description of important sections in the project. 

* `assets` - folder for all assets that appear on the site
* `_archive` - pages that have been referenced and migrated from the internet to ensure they keep existing 
* `_posts` - location for all Blog posts, add your markdown here and create a subfolder in `assests` for all your images etc
* `_manual` - folder for the Manual section of the site 
* `_manifesto` - folder for the Manifesto section of the site
* `_layouts` - templates for pages
* `_docs` - general info pages
* `_pages` - admin pages for site
* `_data` - data config for page modules
* `_config.yml` - primary config for whole site

Additional Notes

* all items with `_` (underscore) are essentially hidden.
* to add new sections and items to navigation `_config.yml` and `_data/navigation.yml` should be updated
