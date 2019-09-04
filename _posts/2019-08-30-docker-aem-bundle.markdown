---
layout: single
permalink: /blog/2019/08/30/docker-aem-bundle
title:  "Docker AEM Bundle"
date:   2019-08-30 23:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - docker
  - automation
---

Building on the previous work [Docker Containers Everywhere](/blog/2019/07/01/docker-containers-everywhere) we have added a new AEM 6.5 Bundle image.

This image has the following packages that are installed on first start-up. 

| File | Notes  |
| ---  | ---    |
| AEM-6.5.1.0-6.5.1.zip | sp 1 |
| AEM-Forms-6.5.1.0-LX-6.0.88.zip | aem forms |
| aem-compat-cq65-to-cq64-0.18.zip | aem forms backwards compatibility |
| com.adobe.acs.bundles.twitter4j-content-1.0.0.zip | acs twitter |
| acs-aem-commons-content-4.3.0.zip | acs commons |
| core.wcm.components.all-2.5.0.zip | adobe corecomponents |
| accesscontroltool-package-2.3.2.zip | netcentric acl tools |
| accesscontroltool-oakindex-package-2.3.2.zip | netcentric acl tools |
| vanityurls-components-1.0.2.zip | vanity url servlet |
| aemdesign-aem-core-deploy-2.0.424.zip | aem design core |

To start local demo AEM 6.5 instance on port 4502 with Bundled Packages run the following

```bash
docker run --name author \
-e "TZ=Australia/Sydney" \
-e "AEM_RUNMODE=-Dsling.run.modes=author,crx3,crx3tar,dev" \
-e "AEM_JVM_OPTS=-server -Xms248m -Xmx1524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n" \
-p4502:8080 -d \
-p30303:58242 -d \
aemdesign/aem:6.5.0-bundle 
```

You will need a license to active the instance once it ready.

Please checkout the docker hub [aemdesign/aem](https://hub.docker.com/r/aemdesign/aem) for further details.

If you would like to contribute or fork the code you can get it on github [https://github.com/aem-design/aem](https://github.com/aem-design/aem).

