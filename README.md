# aem.design
AEM.Design blog

[![build_status](https://github.com/aem-design/aem.design/workflows/ci/badge.svg)](https://github.com/aem-design/aem.design/actions?workflow=ci)
[![github license](https://img.shields.io/github/license/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
[![github issues](https://img.shields.io/github/issues/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
[![github last commit](https://img.shields.io/github/last-commit/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
[![github repo size](https://img.shields.io/github/repo-size/aem-design/aem.design)](https://github.com/aem-design/aem.design) 
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

### On Windows

On windows, for best results use docker for everything.

```powershell
#POWERSHELL
Set-Variable -name PROJECT_PATH -value $pwd
docker run -it --rm -p 4000:4000 -p 35729:35729 -v ${PROJECT_PATH}:/build/source aemdesign/centos-java-buildpack bash --login

sed -i 's/\.nvm/\/build\/\.nvm/' .bashrc
source .bashrc

rvm use 2.6.3
cd source/
./install.sh
jekyll serve --host 0.0.0.0
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
