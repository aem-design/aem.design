---
layout: single
permalink: /blog/2019/09/04/aem-and-docker😍😘
title:  "AEM and Docker 😍😘"
excerpt: "I thought AEM does not work in Docker?"
date:   2019-09-04 00:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - docker
  - automation
  - tini
redirect_from:
  - /blog/2019/09/04/aem-and-docker
header:
    overlay_image: /assets/images/site-logo.png
---

By now you would have seen previous posts [Docker Containers Everywhere](/blog/2019/07/01/docker-containers-everywhere) and [Docker AEM Bundle](/blog/2019/08/30/docker-aem-bundle). You might have tried out those images, if you have not, I encourage you to try them out, you will like it.

Now that you have tried those images out, one major question you may ask "is that for development only?".

You might even think/say "I thought AEM does not work in Docker"?!

And the answer to both of those questions is no. You should be using Docker in production, if you are not you are missing out.

Docker is awesome, period. It once and for all creates a method for establishing consistency with pure simplicity. One of Docker best practices is to have one process per container, many great reasons why but not going to go into them, which is what AEM and mainly java does not play along with easily and we will return to this in a moment.

As far as AEM is concerned the issues that you might experience running AEM in a container comes from underlying Java Forking. Googling this will give more technical details but at high level this means that Java main process creates new process that are not "children" on the main process.

So AEM runs on Java and it forks. In AEM most obvious things that trigger this are workflows that execute external processes, external services that AEM hosts like image service and repository services that handle all of the content wiring and reading, sounds important right. So if we can solve this forking thing then the issue will go away.

This manifest a problem of running AEM in a container creates following situation:

- you start a docker container
- docker container starts and binds to main java process
    - any of its subsequent children processes are not managed by container
- you try to stop the container docker will send a shutdown signal to container
    - that will pass that to the java process
        - that java process will then respect that signal and gracefully close things it controls
            - but will leave a bunch of processes orphaned 😞
    - docker container becomes unresponsive/hangs
- you try to `docker kill` the container and all its internal orphaned processes
    - one of which will be the repository so you will lose content 😱 no happy ending here

Ok so yeah not so cool!

But what is cool is a project tini by Thomas Orozco that provides [A tiny but valid `init` for containers](https://github.com/krallin/tini). This solves the forking issue once and for all.

Adding [tini](https://github.com/krallin/tini) as the entry point into your docker containers allows consistency in handling processes in that container.

This is how the implementation in a base container [centos-tini](https://github.com/aem-design/centos-tini) looks like.

```dockerfile
FROM       centos:latest

MAINTAINER devops <devops@aem.design>

LABEL   os="centos" \
        container.description="centos with tini" \
        version="0.18.0" \
        imagename="centos-tini"


ARG TINI_VERSION="v0.18.0"
ARG TINI_KEY="595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7"
ARG TINI_URL="https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static-amd64"

RUN curl -fsSL ${TINI_URL} -o /bin/tini && curl -fsSL ${TINI_URL}.asc -o /bin/tini.asc && gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys ${TINI_KEY} && gpg --verify /bin/tini.asc && chmod +x /bin/tini

ENTRYPOINT ["/bin/tini", "--"]
```

Very simple image with key line `ENTRYPOINT ["/bin/tini", "--"]` that ensures that all container commands will be handled by [tini](https://github.com/krallin/tini). So this means that anytime a process is spawned in the container it will be a child of [tini](https://github.com/krallin/tini). So when it comes to closing the container [tini](https://github.com/krallin/tini) will close all processes and thus you will have a graceful container stoppage.

Further reviewing the image for [aem](https://github.com/aem-design/aem) you will find similar `ENTRYPOINT ["/bin/tini", "--", "/aem/run-tini.sh"]` that uses an adopted script to run command `exec java $AEM_JVM_OPTS $AEM_RUNMODE -jar $AEM_JARFILE $AEM_START_OPTS` to stat the AEM java process. This ensure that the execute command is passed to [tini](https://github.com/krallin/tini) for handling.

You can also use the `CMD ["/dispatcher/start.sh"]` as used in [dispatcher](https://github.com/aem-design/dispatcher) image to the same effect. Docker appends the `CMD` statement to `ENTRYPOINT` command and as [dispatcher](https://github.com/aem-design/dispatcher) is based on [centos-tini](https://github.com/aem-design/centos-tini) its final command that will be executed will be `["/bin/tini", "--", "/dispatcher/start.sh"]`, once again letting tini manage processes.

Hopefully if you were scared of using java in docker containers after using [tini](https://github.com/krallin/tini) your fears will wash away with tears of happiness 😂

