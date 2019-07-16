---
layout: single
permalink: /blog/2019/07/01/docker-containers-everywhere
title:  "Docker Containers Everywhere"
date:   2019-07-01 23:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - docker
  - dispatcher
---

Docker is your best friend when it comes to AEM! Yes there are so many countless ways of running AEM instances.
But AEM will always be better with Docker. 
AEM in docker allows you to run multiple instances of AEM at a drop of a hat. 
No need to copy files around or look for Jar's.

If you want to quickly start a local demo AEM 6.5 instance on port ``4502`` with debug port ``30303`` all you have to do is run this command using [aemdesign/aem](https://hub.docker.com/r/aemdesign/aem) image

```bash
docker run --name author \
-e "TZ=Australia/Sydney" \
-e "AEM_RUNMODE=-Dsling.run.modes=author,crx3,crx3tar,dev" \
-e "AEM_JVM_OPTS=-server -Xms248m -Xmx1524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n" \
-p4502:8080 -d \
-p30303:58242 -d \
aemdesign/aem
``` 
- *Don't forget to have your AEM License key handy you gona need it for the AEM license page, and*
- *Don't forget the debug port you can use it in your IntelliJ Ultimate, you can read more about this here [Run/Debug Configuration: JSR45 Compatible Server](https://www.jetbrains.com/help/idea/run-debug-configuration-jsr45-compatible-server.html)*

Then you decide that you want to compare latest AEM to AEM 6.4 with a tweak to port ``4512`` and image tag ``aemdesign/aem:6.4.0`` you are instantly in business

```bash
docker run --name author64 \
-e "TZ=Australia/Sydney" \
-e "AEM_RUNMODE=-Dsling.run.modes=author,crx3,crx3tar,dev" \
-e "AEM_JVM_OPTS=-server -Xms248m -Xmx1524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n" \
-p4512:8080 -d \
-p30313:58242 -d \
aemdesign/aem:6.4.0
```  

Then if you decide to run AEM 6.5 publish instance, same command with minor update to ``AEM_RUNMODE`` to ``publish`` using same [aemdesign/aem](https://hub.docker.com/r/aemdesign/aem) image and you have a clean publish starting up

```bash
docker run --name publish \
-e "TZ=Australia/Sydney" \
-e "AEM_RUNMODE=-Dsling.run.modes=publish,crx3,crx3tar,dev" \
-e "AEM_JVM_OPTS=-server -Xms248m -Xmx1524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n" \
-p4503:8080 -d \
-p40404:58242 -d \
aemdesign/aem
```  

Wait there is more, if you like the sound and simplicity of AEM containers you gona love the [aemdesign/dispatcher](https://hub.docker.com/r/aemdesign/dispatcher) container!

Setting up Dispatcher is hard! 
For one you have to know apache which is about 20 years old. 
Then you need to know Dispatcher... which is also a tricky as it docs.. oh the docs.. you gona love trolling though them all to create your ultimate dispatcher config!

OR you run this to start your publish dispatcher pointing to your publish docker

```bash
docker run --name publish-dispatcher \
-e APACHE_MODULES="/dispatcher/httpd/modules" \
-e APACHE_SSL_SUBJ="/C=AU/ST=VIC/L=Melbourne/O=AEM.Design/CN=dispatcher" \
-e APACHE_RUN_USER="apache" \
-e APACHE_RUN_GROUP="apache" \
-e APACHE_RUN_USERID=1100 \
-e APACHE_RUN_GROUPID=1100 \
-e APACHE_LOGLEVEL="debug" \
-e APACHE_VERSION="2.4" \
-e DISPATCHER_VERSION="4.3.2" \
-e DISPATCHER_LOGLEVEL=1 \
-e DISPATCHER_CONFIG="author" \
-e DISPATCHER_NAME="dispatcher" \
-e DISPATCHER_PROPOGATESYNDPOST=0 \
-e DISPATCHER_SERVESTALEONERROR=1 \
-e DISPATCHER_STATLEVEL=3 \
-e DISPATCHER_CACHEAUTHORIZED=0 \
-e DISPATCHER_SESSIONMANAGEMENT=0 \
-e RENDERER_HOST="$(route -n get 0.0.0.0 2>/dev/null | awk '/interface: / {print $2}' | xargs ifconfig  | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | head -1)" \
-e RENDERER_PORT=4503 \
-e RENDERER_TIMEOUT=10000 \
-e RENDERER_RESOLVE=1 \
-p 8080:8080 \
-p 8433:8433 -d \
aemdesign/dispatcher
```  

- *Yes RENDERER_HOST does run an intimidating bash command to establish your local IP address* 😎😻

You don't need to access dispatcher container files to check the logs as they are all being redirected to container log, like all good container should! 
In JSON format native to all your log monitoring tool! 😎😻
You can monitor logs with docker logs command

```bash
docker logs -tf publish-dispatcher --since=2019-07-16
```

This command will tail the error log from the container for you to see. 
Change the parameter ``since`` to the date from wich you want to view the log from, log will get long, but that what log shipping is for 😎😻 

Hope this will help you with your AEM Docker journey!

Have a look at our other handy docker containers at [https://hub.docker.com/u/aemdesign](https://hub.docker.com/u/aemdesign) 