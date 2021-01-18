---
layout: single
permalink: /blog/2020/07/24/using-docker-to-build-code
title:  "Using Docker to Build Code"
date:   2020-07-24 23:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - docker
---

When you have been working for a long time on a codebase, you don't tend to test if your code can be compiled on other machines. Most of the time, it means that it won't. But when you have Docker on your side, your dispair would be a one short docker command line deep.

Using Docker to build your code is so easy even your friend will think you are cool when you tell them about it.  The most amazing thing that you don't even need to write any Docker images, there are so many ready-to-go buildpack containers out there you can easily pick up something that you need.

Here is an example of a container we use to do pipeline build and its very suitable for compiling your project on your local desktop. This container is a Centos 7 Jave Build Pack which means that it comes preconfigured with a majority of tools that are needed to compile our projects.

This container comes with Jave, NPM and RVM, and you can take a look at the contents of the [dockerfile](https://github.com/aem-design/docker-centos-java-buildpack/blob/master/Dockerfile).

In power Shell:

```powershell
docker run -it -v ${PWD}:/build/source -v ${HOME}/.m2:/build/.m2 --net=host aemdesign/centos-java-buildpack /bin/bash --login
```

In Bash:

```bash
docker run -it -v `pwd`:/build/source -v ${HOME}/.m2:/build/.m2 --net=host aemdesign/centos-java-buildpack /bin/bash --login
```

Let's break this command down.

* `-it` means run interactive terminal
* `-v ${PWD}:/build/source` map current path into container at path `/build/source`
  * in Powershell ${PWD} is same as `pwd` in bash
* `-v ${HOME}/.m2:/build/.m2` map your Maven cache folder into the container to reuse your already downloaded jars
* `--net=host` allow container to access your desktop localhost
* `amdesign/centos-java-buildpack` image to use
* `/bin/bash --login` run bash and perform login to ensure all of the start-up profile scripts are executed

All you need to do now is to run this command in the directory where you have your code and start compiling like a boss.

Don't forget to tell your friends.
