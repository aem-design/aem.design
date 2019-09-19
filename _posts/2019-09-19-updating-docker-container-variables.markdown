---
layout: single
permalink: /blog/2019/09/19/updating-existing-docker-container-variables💪😎👍
title:  "Updating Existing Docker Container Variables 💪😎👍"
excerpt: "If you have to update existing docker container properties you can do it here is how"
date:   2019-09-19 00:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - docker
  - automation
redirect_from:
  - /blog/2019/09/19/updating-existing-docker-container-variables
header:
    overlay_image: /assets/images/site-logo.png
---

Updating docker config of an existing container can be a daunting task. Usually its just easier to kill the container and start from scratch and this approach is preferred when it comes to docker principles.

As of current `19+` version of docker there isn't a way to do it via API, this mean that you need to manually change config of container in the docker engine running your container.

Flow on effect is that when you change this docker config you will need to restart docker engine, which is fine when you have only one container running but if you have lots this is out of the question.   

But lets say you have just started AEM instance not using the [AEM Bundle](/blog/2019/08/30/docker-aem-bundle) container, without mounting any volumes and you have spent last hour installing packages and doing thing to that container that you do not want to do again. And you got an urge to do some java code debugging on your new container and you just realised that you did not add the required debug JAVA_OPTS when you started the container:  

```bash
 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n
```

Starting from scratch will be good option by using the [AEM Bundle](/blog/2019/08/30/docker-aem-bundle) by all those changes you made will be lost. At this point in despair you forget what paths you updated and you decide to persevere with updating docker engine config. 

You can follow these steps to update your existing container config with java options that will allow you to debug your AEM instance in a container:

1. Stop your container

```bash
docker stop author
```

2. Edit config of your container

Running following command will load the docker config into VI and where you can proceed to update your container config:

```bash
docker run -it -v /var/lib/docker:/var/lib/docker alpine vi $(docker inspect --format='/var/lib/docker/containers/{{.Id}}/config.v2.json' author65bundle)
```

You will see config on one line, yes this is how it is and you need to thread carefully.

In our case you will need to scroll until you find  `AEM_JVM_OPTS` attribute scroll to the end its value and insert (press `i` to enter ) AEM Java Debug parameters:

```bash
 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n
```

Then press `ESC` key followed by `:qw` and press enter. 

You now have your config tweak inserted and you can proceed. 

3. Restart your docker

In worst case you can just reboot, in best case you can restart the service or use restart option of your Docker Desktop Menu:   

![Docker Desktop Menu](/assets/images/docker/docker-desktop-menu.png)

4. Check your settings tweaks have worked

After your docker engine is backup you can check if your tweaks have worked

```bash
docker inspect author
```

5. Start your container

```bash
docker start author
```

This process can be used to update other settings as you wish. 
