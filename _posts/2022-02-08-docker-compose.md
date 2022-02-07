---
layout: single
permalink: /blog/2022/02/08/docker-compose-and-deploy-stacks🍔😘
title:  "Docker Compose and Deploy Stacks 🍔😘"
excerpt: "How to use docker compose like a pro!"
date:   2022-02-08 00:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - docker
  - automation
  - docker-compose
redirect_from:
  - /blog/2022/02/08/docker-compose-and-deploy-stacks
header:
    overlay_image: /assets/images/docker/docker-compose-stack.png
---

Following up on the articles [AEM and Docker](/blog/2019/09/04/aem-and-docker), [Docker Containers Everywhere](/blog/2019/07/01/docker-containers-everywhere) and [Docker AEM Bundle](/blog/2019/08/30/docker-aem-bundle), lets pull all that knowledge together and talk about how to deploy AEM stacks to developers using Docker Compose. There are many ways to bring a stack to developers machines, but the simplest way is to use Docker Compose.

Additionally, when using Docker Compose, you will understand whether your deployment architecture is complex and which parts are critical; this will provide you with some feedback to clean things up.

## Docker Compose Experience

Docker Compose requires you to have one `docker-compose.yml` file in your project root. This file is a YAML file that describes the deployment of your stack. In simple scenarios, you can just have one file, and it will be enough; for most scenarios having a structure set up for growth is going to be beneficial long term. When a developer clones your repo all they need to do is to run `docker compose up`, and the stack will be deployed. Once it's running, they open their browser and go to `http://localhost`, and they will land on stack console:

![Traefik Stack Console](/assets/images/docker/traefik-stack-console.png)

This simple console can be updated in any way required to convey context and provide any relevant information and links to developers working on the project. This is a straightforward way to surface a lot of documentation in a usable manner.

## Docker Compose Stack Details

Let's take a deeper look at the details; here is an example of a simple deployment you can see the source here [docker-compose.yml](https://github.com/aem-design/aemdesign-aem-support/blob/master/docker-compose.yml). This docker compose file has the following services:

* nginx - developer console, provides a developer-friendly console to visualise all of their services and provide shortcuts to all relevant consoles.
* createcert - a service that creates a self-signed certificate for the AEM instance.
* createcertpkcs12 - a service that creates a self-signed certificate that can be installed into the browser.
* traefik - a service that provides a reverse proxy to the AEM instance.
* seleniumhub - a service that provides a hub for selenium.
* selenium-node-chrome - a service that provides a selenium node for chrome.
* author - a primary author service.
* author-deploy-core - a service that deploys the AEM core to author instance.
* author-deploy-support - a service that deploys the AEM support to author instance.
* publish - a publish instance service.
* publish-deploy-core - a service that deploys the AEM core to publish instance.
* publish-deploy-support - a service that deploys the AEM support to publish instance.
* dispatcher - a dispatcher service.
* testing - this is meant to run when there is a aemdesign-parent repo, so when you are developing locally.
* automationtest - this meant to run in aemdesign-aem-support repo pipeline.
* automationtestprep - this meant to run in aemdesign-aem-support repo pipeline, will download the latest core and install local support packages.
* testingcheck - a service that check if test automation is working.

These services can be activated all at once or individually, you can run `docker compose up traekfik nginx` to get only the developer console on `http://localhost`. Some of the services have dependencies on others, so you can see the order in which they are activated. Some services are optional and can be activated when required using profile activation `docker compose up -p dodeploy author-deploy-core`.

This example I've provided uses the older `2.4` version of docker compose that supports the `EXTENDS` keyword:

```yaml
extends:
  file: ./docker/aem/docker-compose.yml
  service: author-deploy-support
```

This `EXTENDS` keyword allows you to pull together predefined docker compose files from a better-organised structure. 

Having a well-organised docker folder with a subfolder for all services will ensure that you can have a single file that can be used to deploy all of your services. This also allows you to have all of the relevant per service configurations isolated and not mixed in the same file. Here is an example structure of a docker folder, [source is here](https://github.com/aem-design/aemdesign-aem-support/tree/master/docker):

```bash
docker
├── aem
│   └── docker-compose.yml
├── common
│   ├── config-tz.yml
├── nginx
│   └── docker-compose.yml
├── selenium
│   └── docker-compose.yml
├── testing
│   ├── docker-compose.yml
└── traefik
    └── docker-compose.yml
```

If you check out the [github link](https://github.com/aem-design/aemdesign-aem-support/tree/master/docker) you will find a number of relevant config files in each service folder. Furthermore, as you add new services, it will be easy to follow this pattern to keep things neat and tidy.

In later versions of docker compose, see [compose-file-v3](https://docs.docker.com/compose/compose-file/compose-file-v3/), you can't use `EXTENDS` keyword and you need to pass all of the required service `docker-compose.yml` files when running `docker compose up` command. This can be simply abstracted into a start script here is an example of how to do it [start.ps1](https://github.com/wildone/synology-docker/blob/main/start.ps1). This is a PowerShell script that will run `docker compose up` command for all services activated from `start-services.conf` file. In addition, that script leverages `.env` file to keep all of your environment variables in one place for easy maintenance, see example [.env](https://github.com/wildone/synology-docker/blob/main/.env) file. You can read more about [environment files](https://github.com/wildone/synology-docker/blob/main/.env) on official docs.

### Thank you

I hope you will find using docker compose will being a smile to your face {insert home alone 2 smile}. As always if you have any questions or comments, feel free to contact me. I will be happy to help.

Let me know what you think and don't forget to tell your friends.
