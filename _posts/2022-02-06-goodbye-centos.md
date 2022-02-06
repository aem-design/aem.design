---
layout: single
permalink: /blog/2022/02/06/goodbye-centos
title:  "Goodbye Centos"
excerpt: "You were great while the free ride lasted!"
date:   2022-02-06 00:00:00:00 +1000
author: max@aem.design
categories:
- blog
tags:
- centos
header:
    overlay_image: /assets/images/goodbye/goodbye-centos.png
---

Centos is no more! You already know that. The founder of Kurtzer, who started Centos more than 16 years ago, was shocked just as much. Centos was a great gap filler between Fedora and RHEL. You had the best of both worlds, but you could use it for development and then roll your apps straight to RHEL if you need enterprise support.

What does this mean for AEM? Well, it means all of the containers essentially will need to be updated to use something else. You can't use Centos, so the next best thing would be ... Debian. Yes, Ubuntu is a good contender, but you won't be able to run AEM Forms on it; tldr, Ubuntu does not have 32bit support.

Old containers will keep working, but slowly, all new updates would need to be rolled on the new Debian images that are available right now. Go ahead check them to see what you think. You can also check out the [AEM.Design Docker Hub](https://hub.docker.com/u/aemdesign/) for the latest images.

Here, for example, the latest AEM 6.5 with SP 11:

{% include code-copy.html %}
```powershell
docker run --name author6511 -e "TZ=Australia/Sydney" -e "AEM_RUNMODE=-Dsling.run.modes=author,crx3,crx3tar,forms,localdev" -e "AEM_JVM_OPTS=-server -Xms248m -Xmx1524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n -XX:+UseParallelGC --add-opens=java.desktop/com.sun.imageio.plugins.jpeg=ALL-UNNAMED --add-opens=java.base/sun.net.www.protocol.jrt=ALL-UNNAMED --add-opens=java.naming/javax.naming.spi=ALL-UNNAMED --add-opens=java.xml/com.sun.org.apache.xerces.internal.dom=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.loader=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED -Dnashorn.args=--no-deprecation-warning" -p4502:8080 -p30303:58242 -d aemdesign/aem:6.5.11.0-jdk11
```

And as an extra bonus, if you prefer to use this on your M1 Mac, here is the same command again with the ARM suffix in the tag:

{% include code-copy.html %}
```powershell
docker run --name author6511 -e "TZ=Australia/Sydney" -e "AEM_RUNMODE=-Dsling.run.modes=author,crx3,crx3tar,forms,localdev" -e "AEM_JVM_OPTS=-server -Xms248m -Xmx1524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n -XX:+UseParallelGC --add-opens=java.desktop/com.sun.imageio.plugins.jpeg=ALL-UNNAMED --add-opens=java.base/sun.net.www.protocol.jrt=ALL-UNNAMED --add-opens=java.naming/javax.naming.spi=ALL-UNNAMED --add-opens=java.xml/com.sun.org.apache.xerces.internal.dom=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.loader=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED -Dnashorn.args=--no-deprecation-warning" -p4502:8080 -p30303:58242 -d aemdesign/aem:6.5.11.0-jdk11-arm
```

### Thank you

I hope you will find the new ARM images useful. If you have any questions or comments, feel free to contact me. I will be happy to help.

Let me know what you think and don't forget to tell your friends.
