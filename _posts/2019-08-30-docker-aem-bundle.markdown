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
| aemdesign-aem-core-deploy-{LATEST}.zip | aem design core |
| aemdesign-aem-support-deploy-{LATEST}.zip | aem design showcase content |

Packages that have `{LATEST}` mean that when the container is built it will pull the latest version available in git repository. 

### Running AEM in Docker

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

Starting local publish instance is a matter of updating a run mode to `publish` and updating ports for accessing the service and you should get the following

```bash
docker run --name publish \
-e "TZ=Australia/Sydney" \
-e "AEM_RUNMODE=-Dsling.run.modes=publish,crx3,crx3tar,dev" \
-e "AEM_JVM_OPTS=-server -Xms248m -Xmx1524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n" \
-p4503:8080 -d \
-p30304:58242 -d \
aemdesign/aem:6.5.0-bundle 
```

If you would like to start AEM Bundle version on different port to say run it along existing aem instance all you need to do is change name of your container and its ports like this:

```bash
docker run --name author65bundle \
-e "TZ=Australia/Sydney" \
-e "AEM_RUNMODE=-Dsling.run.modes=author,crx3,crx3tar,dev" \
-e "AEM_JVM_OPTS=-server -Xms248m -Xmx1524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n" \
-p4565:8080 -d \
-p30365:58242 -d \
aemdesign/aem:6.5.0-bundle 
```

To start local demo AEM 6.4 instance on port 4502 with Bundled Packages run the following

```bash
docker run --name author64 \
-e "TZ=Australia/Sydney" \
-e "AEM_RUNMODE=-Dsling.run.modes=author,crx3,crx3tar,dev" \
-e "AEM_JVM_OPTS=-server -Xms248m -Xmx1524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n" \
-p4502:8080 -d \
-p30303:58242 -d \
aemdesign/aem:6.4.0-bundle 
```


### License

You will need a license to active the instance once it ready as it will prompt you to input your details on License splash screen before you can continue:

![AEM License Page](/assets/images/license/license-page.png)

Confirmation screen will show you what version of AEM you are running. 

![AEM License Page](/assets/images/license/license-confirm.png)

Additionally once you login you can visit the [Product Info](http://localhost:4502/system/console/productinfo) console to see AEM version. Your version number will be made up of major AEM version and Service Pack Version. For example if you choose AEM 6.5 with Service Pack 1 its version will be `6.5.1.0`.

### Packages 

You will notice that your bundle container will come with latest SP installed and other packages. Each bundle image tag has a corresponding branch in github you can check the [.travis.yml](https://github.com/aem-design/aem/blob/6.5.0-bundle/.travis.yml) file to see which packages are pre-installed.

### Thank you

Please checkout the docker hub [aemdesign/aem](https://hub.docker.com/r/aemdesign/aem) for further details.

If you would like to contribute or fork the code you can get it on github [https://github.com/aem-design/aem](https://github.com/aem-design/aem).

Bundle version comes with following [AEM.Design](https://github.com/aem-design) projects:
- [aemdesign-aem-core](https://github.com/aem-design/aemdesign-aem-core) that contains all of the components code 
- [aemdesign-aem-support](https://github.com/aem-design/aemdesign-aem-support) that contains all of the supporting content, front-end code and component showcase.


