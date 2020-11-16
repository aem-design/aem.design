---
title: "Quick-Start Guide"
permalink: /quick-start-guide/
excerpt: "How to quickly install and setup Minimal Mistakes for use with GitHub Pages."
modified: 2016-11-03T10:01:43-04:00
---

Getting started with AEM is hard, from both business and technical perspective, here are some starting points.

{% include toc %}

## Learning AEM

Leaning AEM from scratch is a daunting task, as the platform is on one hand is mature and on the other hand is picking up pace of development of new features. This combined with rest of tech that needed around AEM to make thing work creates and ever ending and expanding domain for leaning.

There is an infinite ways of doing things in and with AEM, AEM.Design aims at creating reusable patterns tech that help to learn AEM and other tech that helps with your journey. 

Here are some helpful resource for you to ge started.

- [Manifesto]({{ "/manifesto/" }}) - light weight preparation of concepts
- [Manual]({{ "/manual/" }}) - AEM.Design documentation
- [Developing User Guide](https://helpx.adobe.com/experience-manager/6-5/sites/developing/user-guide.html) - there is a lot of info and its good a s reference. This blog tries to create more targeted approach to getting started.
- [Data Modeling - David Nuescheler's Model](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/model-data.html). #1 Rule must be your guiding start at all times when developing for AEM. You will find that its very easy to sway from this and you will see a lot of opportunities to break this and other rules. Be vigilant and stay alert.

## Understanding AEM

You need to understand that you need to change the way you think and adapt to AEM ways of doing thing both from approach and technology perspectives.

We urge you and your team to learn about AEM together, this will allow to establish a common understanding and nomenclature for use with AEM.

AEM has been developed over many years and has a history of concepts that have been developed to solve common problems that you already experiencing but most likely articulating and conceptualising from different perspective.

What you need to know before you start with AEM.

- From technology perspective its not like any other CMS platforms. Its best to start with an open mind.
- You need to learn and understand these rules [Data Modeling - David Nuescheler's Model](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/model-data.html). #1 Rule must be your guiding start at all times when developing for AEM. You will find that its very easy to sway from this and you will see a lot of opportunities to break this and other rules. Be vigilant and stay alert.
- Learn how content is manipulated in AEM [Manipulating Content using Sling](https://sling.apache.org/documentation/bundles/manipulating-content-the-slingpostservlet-servlets-post.html). At the core of AEM is Sling and it the technology that makes AEM Content Centric. Its responsible for content location and presentation.

- [Selectors](https://sling.apache.org/documentation/bundles/sling-query/selectors.html) - a way of passing information to URL without using query strings. 
- [Components](https://helpx.adobe.com/au/experience-manager/6-4/sites/developing/using/components-basics.html) - base building block of all pages and other content presentation.
- Working with repository
- [Content Packages](https://helpx.adobe.com/experience-manager/6-5/sites/administering/using/package-manager.html) - a way of adding/installing content into AEM using a Content Package ZIP file. You can also Uninstall Content Packages after you have installed. 
- [Run Modes](https://helpx.adobe.com/experience-manager/6-5/sites/deploying/using/configure-runmodes.html) - a way of separating your configurations of AEM using content.
- Learn the syntax of new templating language used for presentatio of content in AEM using [HTL Scripting Engine](https://sling.apache.org/documentation/bundles/scripting/scripting-htl.html). HTL Scripting Engine is new but very mature templating framework. Its build on top of JSTL and provides a number of helpful patterns for dealing with presentation of content.
- Learn [Concept of Authoring and Publishing](https://helpx.adobe.com/experience-manager/6-5/sites/authoring/using/author.html#main-pars_title)
- Learn how content is authored in AEM from example of existing projects [Working in AEM](https://www.sfu.ca/cms/howto.html). Content Authoring Experience is critical to working effectively in AEM, understanding impacts on Authoring though your work is critical to AEM development.
- Learn about [Dispatcher](https://docs.adobe.com/content/help/en/experience-manager-dispatcher/using/dispatcher.html) this is the most critical element of AEM architecture and it gives the sites ability to be cashed. Think of dispatcher as a static site generator but without the build process. Dispatcher caches each request content on disk first time and from then on forward servers those request from disk. Dispatcher grabs new version of content urls only after Publisher triggers an API to notify Dispatcher that particular URL has been updates. Dispatcher only gets new URL when they are requested, this saves a lot of resources.
- Learn about [OSGI](https://helpx.adobe.com/experience-manager/6-5/sites/deploying/using/configuring-osgi.html) engine of AEM services

## Developing in AEM

To get started with development on AEM you will need the following:

- [IntelliJ](https://www.jetbrains.com/idea/) - ultimate preferably so that you can do debugging or CE if you must
- Install [Docker Desktop](https://hub.docker.com/?overlay=onboarding) or install [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
- Get an instance of AEM using a docker container [Docker Bundle](/blog/2019/08/30/docker-aem-bundle)
- Clone and Deploy [aemdesign-aem-core](https://github.com/aem-design/aemdesign-aem-core) that contains all of the components code. To deploy project run `./deploy-local` in the project directory once you have cloned it.
- Clone and Deploy [aemdesign-aem-support](https://github.com/aem-design/aemdesign-aem-support) that contains all of the supporting content, front-end code and component showcase. To deploy project run `./deploy-local` in the project directory once you have cloned it.

## Trying out AEM.Design

The quickest way to test out AEM.Design components is to run an AEM docker container using this command:

```bash
docker run --name author \
-e "TZ=Australia/Sydney" \
-e "AEM_RUNMODE=-Dsling.run.modes=author,crx3,crx3tar,forms,localdev" \
-e "AEM_JVM_OPTS=-server -Xms248m -Xmx1524m -XX:MaxDirectMemorySize=256M -XX:+CMSClassUnloadingEnabled -Djava.awt.headless=true -Dorg.apache.felix.http.host=0.0.0.0 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=58242,suspend=n" \
-p4502:8080 \
-p30303:58242 -d \
aemdesign/aem:6.5.3.0-bundle-forms
```

This will start an Author instance that will be available on port 4502. You can read more about this at [Docker AEM Bundle](/blog/2019/08/30/docker-aem-bundle).

If you want to progress to checking out the code you can clone the [aemdesign-parent ](https://github.com/aem-design/aemdesign-parent) repo using following command:

```bash
git clone --recursive git@gitlab.com:aem.design/aemdesign-parent.git
```

This will clone all of the code and related projects and will allow you to contribute to AEM.Design.

If you want to leverage AEM.Design to speedup your project delivery, you can start by creating a tenant project base on [aemdesign-archetype](https://github.com/aem-design/aemdesign-archetype) using following command:

```bash
mvn archetype:generate \
-DarchetypeGroupId=design.aem \
-DarchetypeArtifactId=aemdesign-archetype \
-DarchetypeVersion=1.0.71 \
-DgroupId=au.com.projectx.aem \
-DgroupTitle="ProjectX AEM" \
-DartifactId=projectx \
-DartifactTitle="ProjectX AEM" \
-DparentArtifactId=projectx-parent \
-DparentArtifactName="ProjectX :: AEM :: parent" \
-Dpackage=projectx \
-DpackageGroup=projectx \
-Dversion=0.1 \
-DcomponentGroupTitle=ProjectX \
-DappsFolderName=projectx \
-DcontentFolderName=projectx \
-DconfFolderName=projectx \
-DclientLibsFolderName=projectx \
-DclassNamespace=au.com.projectx.aem \
-DappsParent=aemdesign
```

You can read more about the [available properties](https://github.com/aem-design/aemdesign-archetype#available-properties) to tailor them to your project. Using this archetype will ensure that you have a ready to go project with Component Placeholders, Automation Tests and Showcase Site. You can read more on the importance of these artifacts in [Knowledge Flow Map](/manifesto/project/#knowledge-flow-map) overview.
