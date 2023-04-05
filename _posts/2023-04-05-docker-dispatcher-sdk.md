---
layout: single
permalink: /blog/2023/04/05/docker-dispatcher-sdk🔧💪😎👍
title:  "Docker Dispatcher SDK 🔧💪😎👍"
excerpt: "Test your AEM SaaS Dispatcher like a pro!"
date:   2023-04-05 00:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - docker
  - docker-compose
  - wsl
  - windows
redirect_from:
  - /blog/2023/04/05/docker-dispatcher-sdk
---

This article is a follow up to series of articles on docker [Docker Containers Everywhere](/blog/2019/07/01/docker-containers-everywhere) and [Docker Automation Testing](/blog/2019/07/05/docker-automation-testing).

Now that we have a solid foundation on how to build and test docker containers we can move on to the next step and that is to build a docker container that will allow us to test our AEM Dispatcher configuration.

## Dispatcher SDK

Dispatcher SDK is shipped by Adobe though [Adobe Experience Manager as a Cloud Service SDK](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/implementing/developing/dispatcher-sdk.html?lang=en#overview) and it is a docker container that allows you to test your dispatcher configuration.

The only non-starter with this container is that it is not available on docker hub and you need to build it yourself manually 👎💩.

Running a container to test your dispatcher configuration must be as simple as running following command:

```powershell
docker run -it --rm -v ${PWD}/dispatcher/src:/mnt/dev/src --name dispatcher -p 8080:80 -e AEM_PORT=4503 -e AEM_HOST=host.docker.internal aemdesign/dispatcher-sdk
```

or on Linux

```bash
docker run -it --rm -v `pwd`/dispatcher/src:/mnt/dev/src --name dispatcher -p 8080:80 -e AEM_PORT=4503 -e AEM_HOST=host.docker.internal aemdesign/dispatcher-sdk
```

This will map source from your dispatcher configuration to the container and start the container. Additionally it will expose port 8080 on your host machine and map it to port 80 on the container. Furthermore in the console output you will output of the validation of your dispatcher configuration. This is critical to make sure that your dispatcher configuration is valid and will work as expected once you push this to Adobe Cloud Manager. This dispatcher image has debug set to trace so you will see all the details of how your dispatcher rule apply.

You can checkout the source for this container here [aem-design/docker-dispatcher-sdk](https://github.com/aem-design/docker-dispatcher-sdk). Feel free to contribute to this project.

## Integrating with AEM

To integrate this with AEM you need to make sure that you have a dispatcher configuration that is valid and that you can run it locally. Once you have that you can use the following docker-compose file to start your AEM instance and the dispatcher SDK.

This is should be your typical AEM docker-compose file with the addition of the dispatcher SDK container. This allows your team to use same configuration for local development and testing. This will also allow testing of SSL configurations and other dispatcher configurations that are not possible to test locally universaly across all type of OS. This allows you to test same way on all OS's.

```yaml
version: "3.9"

services:

  author:
    image: aemdesign/aem:sdk-2023.3.11382
    hostname: author
    healthcheck:
      test: curl -u admin:admin --header Referer:localhost --silent --connect-timeout 5 --max-time 5 http://localhost:8080/system/console/bundles.json | grep -q \"state\":\"Installed\" && exit 1 || exit 0
      interval: 10s
      timeout: 10s
      retries: 20
      start_period: 1s
    ports:
      - 4502:8080
      - 30303:58242
    environment:
      - AEM_RUNMODE=-Dsling.run.modes=author,crx3,crx3tar,localdev,nosamplecontent
      - AEM_JVM_OPTS=-server -Xms248m -Xmx4524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:58242
    volumes:
      - author-data:/aem/crx-quickstart/repository
    labels:
      # note that you want this frontened to match the last. otherwise it will match login.${HOST_DOMAIN}"
      traefik.frontend.priority: 1
      traefik.enable: true
      traefik.http.routers.author.rule: "Host(`author.localhost`)"
      traefik.http.routers.author.entrypoints: web
      traefik.http.routers.author_https.rule: "Host(`author.localhost`)"
      traefik.http.routers.author_https.tls: true
      traefik.http.routers.author_https.entrypoints: websecure
      traefik.http.services.author.loadbalancer.passHostHeader: true
    networks:
      - author-network
      - publish-network
      - dispatcher-network
      - internal
      - default

  publish:
    image: aemdesign/aem:sdk-2023.3.11382
    hostname: publish
    healthcheck:
      test: curl -u admin:admin --header Referer:localhost --silent --connect-timeout 5 --max-time 5 http://localhost:8080/system/console/bundles.json | grep -q \"state\":\"Installed\" && exit 1 || exit 0
      interval: 10s
      timeout: 10s
      retries: 20
      start_period: 30s
    ports:
      - 4503:8080
      - 30304:58242
    environment:
      - AEM_RUNMODE=-Dsling.run.modes=publish,crx3,crx3tar,localdev,nosamplecontent
      - AEM_JVM_OPTS=-server -Xms248m -Xmx1524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:58242
    labels:
      # note that you want this frontend to match the last. otherwise, it will match login.${HOST_DOMAIN}"
      traefik.frontend.priority: 1
      traefik.enable: true
      traefik.http.routers.publish.rule: "Host(`publish.localhost`)"
      traefik.http.routers.publish.entrypoints: web
      traefik.http.routers.publish_https.rule: "Host(`publish.localhost`)"
      traefik.http.routers.publish_https.tls: true
      traefik.http.routers.publish_https.entrypoints: websecure
      traefik.http.services.publish.loadbalancer.passHostHeader: true
    volumes:
      - publish-data:/aem/crx-quickstart/repository
    networks:
      - publish-network
      - internal
      - default

  dispatcher:
    image: aemdesign/dispatcher-sdk
    hostname: dispatcher
    ports:
      - 8081:80
    environment:
      - AEM_PORT=4503
      - AEM_HOST=host.docker.internal
      - DISP_LOG_LEVEL=trace1 #debug
    labels:
      # note that you want this frontend to match the last. otherwise, it will match login.${HOST_DOMAIN}"
      traefik.frontend.priority: 1
      traefik.enable: true
      traefik.http.routers.dispatcher.rule: "Host(`dispatcher.localhost`)"
      traefik.http.routers.dispatcher.entrypoints: web
      traefik.http.routers.dispatcher_https.rule: "Host(`dispatcher.localhost`)"
      traefik.http.routers.dispatcher_https.tls: true
      traefik.http.routers.dispatcher_https.entrypoints: websecure
      traefik.http.services.dispatcher.loadbalancer.passHostHeader: true
    volumes:
      - ./dispatcher/src/:/mnt/dev/src/
    networks:
      - publish-network
      - dispatcher-network
      - internal
      - default

  # b -(https)-> t(cert) -(http)-> d -(http)-> p
  traefik:
    image: traefik
    environment:
      - TZ=Australia/Sydney
    security_opt:
      - no-new-privileges:true
    restart: "always"
    command:
      - "--log.level=ERROR"
      - "--accesslog=true"
      - "--api.insecure=true" # Don't do that in production!
      - "--api.dashboard=true" # Don't do that in production!
      - "--providers.docker=true"
      - "--providers.docker.exposedbydefault=false"
      - "--global.sendAnonymousUsage=true"


      # Entrypoints for HTTP, HTTPS, and NX (TCP + UDP)
      - "--entrypoints.web.address=:80"
      - "--entrypoints.websecure.address=:443"

      # Manual keys
      - "--providers.file.directory=/etc/traefik/dynamic_conf"
      - "--providers.file.watch=true"

    labels:
      traefik.frontend.priority: 1
      traefik.enable: true
      traefik.http.routers.dashboard.rule: "Host(`traefik.localhost`) && (PathPrefix(`/api`) || PathPrefix(`/dashboard`))"
      traefik.http.routers.dashboard.entrypoints: websecure
      traefik.http.routers.dashboard.tls: true
      traefik.http.routers.dashboard.service: api@internal

    ports:
      - "80:80"
      - "443:443"
      - "8080:8080"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      # Persist certificates, so we can restart as often as needed
      - ./services/traefik/certs:/letsencrypt
      - ./services/traefik/config/dynamic:/etc/traefik/dynamic_conf/conf.yml:ro

    depends_on:
      createcert:
        condition: service_completed_successfully

    networks:
      - author-network
      - publish-network
      - dispatcher-network
      - internal
      - default

  createcert:
    image: aemdesign/mkcert:latest
    environment:
      - TZ=Australia/Sydney
    command:
      - "test -f mkcert.key && exit 0; mkcert -install && mkcert -key-file mkcert.key -cert-file mkcert.pem -client author.localhost publish.localhost dispatcher.localhost localhost 127.0.0.1 ::1 aem-local.peppermoney.com.au && openssl pkcs12 -export -out mkcert.pfx -in mkcert.pem -inkey mkcert.key -certfile rootCA.pem -passout pass:123"
    volumes:
      - ./services/traefik/certs:/certs

networks:
  default:
  internal:
  author-network:
  publish-network:
  dispatcher-network:

volumes:
  author-data:
  publish-data:
  dispatcher-data:
```

This will create the following containers:

* author - author instance available on port 4502, <http://author.localhost> and <https://author.localhost>
* publish - publish instance available on port 4503, <http://publish.localhost> and <https://publish.localhost>
* dispatcher - dispatcher instance available on port 8081, <http://dispatcher.localhost> and <https://dispatcher.localhost>
* traefik - traefik dashboard available on port 8080 and <http://traefik.localhost:8080/dashboard/#/>
* createcert - creates the certificates for the traefik instance this provides all of the SSL certificates for the other containers

Hope this helps.

### Thank you

I hope you enjoyed this guide. If you have any questions or comments, feel free to contact me. I will be happy to help.

Let me know what you think and don't forget to tell your friends.
