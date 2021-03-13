---
layout: single
permalink: /blog/2019/10/01/trigger-travis-pipeline-from-another-pipeline👉📟🚀
title:  "Trigger Travis pipeline from another pipeline 👉📟🚀"
excerpt: "When you want to trigger travis pipeline from any other pipeline a docker app will come to the rescue"
date:   2019-09-19 00:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - docker
  - automation
  - travis
redirect_from:
  - /blog/2019/10/01/trigger-travis-pipeline-from-another-pipeline
header:
    overlay_image: /assets/images/travis/travis-and-github.png
---

Keeping with DevOps spirit mean that things on you project should be very modular, this then will mean that you will have a [lot of pipelines](https://travis-ci.org/aem-design). Eventually you will come to scenario that will require pipelines to start other pipelines.

In our scenario whenever pipeline for [aemdesign-aem-core](https://travis-ci.org/aem-design/aemdesign-aem-core) succeeds its artifacts should be used in creating a docker container pipeline [aem-design/aem](https://travis-ci.org/aem-design/aem).

Current Travis definition does not have OOTB option to do this. But fortunately travis comes with API that can be used to interrogate Travis config as well as [trigger builds with API V3](https://docs.travis-ci.com/user/triggering-builds/).

The process to trigger API is simple enough

1. Get a Travis API token from [Travis Profile page](https://travis-ci.com/profile), this is a manual step.
2. Send a POST request with specific headers to the API endpoint for your repo.

And that's it really, all you need to do now is do the POST somehow.

As you come to expect, to make this as simple as possible for reuse in pipelines or manual execution, abstracting the API into a handy docker [tavis-build-trigger](https://hub.docker.com/r/aemdesign/tavis-build-trigger) image is easier done that writing about it.

The approach for docker container is to leverage NodeJS to make the request to API, abstract any logic into a nice package that can be executed anywhere where docker is available.

NPM has a very handy [request](https://www.npmjs.com/package/request) module that makes accessing URI's as easy as using [curl](https://curl.haxx.se/).

Furthermore as the new [tavis-build-trigger](https://github.com/aem-design/travis-build-trigger) NodeJS app is a command line app, its mandatory to give optimal command line experience using [yargs](https://www.npmjs.com/package/yargs), after all, it's little details that count. [Yargs](https://www.npmjs.com/package/yargs) provides you with a very simple way of creating beautiful command line experiences without the arghh ( its a pirate-themed library).

When you execute the app though docker without any parameters

```bash
docker run --rm aemdesign/travis-trigger-build
```

You will be greeted with a nice command line helper menu in case you did not read the [README](https://github.com/aem-design/travis-build-trigger/blob/master/README.md) to get you going with command line options.

```bash
Usage: travis-trigger-build.js <command> [options]

Commands:
  travis-trigger-build.js start-branch-build                         Start repo build for a particular branch
  [github_repo,travis_token,github_user]                                                                            [aliases: sbb]

Options:
  --help, -h       show help                                                                                             [boolean]
  --version, -v    show version                                                                                          [boolean]
  --debug, -d      debug mode                                                                                            [boolean]
  --github_repo    repo name                                                                                            [required]
  --github_user    github user name where repo is located                                                               [required]
  --travis_token   travis access token                                                                                  [required]
  --github_branch  github branch to trigger build on                                                           [default: "master"]
  --travis_url     travis url to use to trigger jobs                                  [default: "https://api.travis-ci.org/repo/"]

Examples:
  node generator.js sbb --github_user=aem-design --github_repo=aem --github_token=<TOKEN>

Not enough non-option arguments: got 0, need at least 1
________________________________________________________________________________
```

This provides a lot convenience and adds polish to your project. Having this library in docker container gets you away from having unnecessary scripts in your pipelines.

As always checkout the code, fork, extend and contribute if you wish.
