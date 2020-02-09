---
layout: single
permalink: /blog/2020/02/01/aem-saas-hands-on😍🚀🔭
title:  "AEM SaaS Hands On 😍🚀🔭"
excerpt: "This is the End Game and Adobe has it, a non definitive perspective!"
date:   2020-02-01 00:37:00:00 +1100
author: max@aem.design
editor: saket.mishra.kr@gmail.com
categories:
  - blog
tags:
  - devops
  - aem
  - saas
  - knowledge
  - sharing
  - handson
redirect_from:
  - /blog/2020/02/01/aem-saas-hands-on
header:
    overlay_image: /assets/images/adobe-aec/AdobeExperienceCloud.jpg
---

{% include toc %}

Introduction
===

If [Github Actions](/blog/2019/10/20/enter-the-github-actions) was entry into End Game, latest Adobe AEM SaaS offering is the outcome of an End Game in another dimension, where Adobe is the clear victor! This stealthy engineering masterpiece is a true example of how great experience can provide so much, that words can't describe the feeling.

Adobes new offering it's a true testament to engineering and a huge demonstration to all vendors in this space, on how to do things that make a difference. Not often you get a hands with a piece of SaaS software where you open the console and see something that takes your breath away. Your world is turned and you whisper to your self this can't be true, it can't be that easy.

***Well folk, it is!***

Latest offering from Adobe demonstrates their commitment on Experiences and not only for End Users but also for Developers. 

This new offering is the Kubernetes powered, container infused, sling application building behemoth, breathing CI/CD life into your projects with ease!

You can find plenty post and materials about tech behind the platform, but this post is about the Experience! We want to see show off the new Cloud Manager experience. This post should provide you with inspiration to jump onto the CI/CD experience that Adobe have gifted upon us! 

So without any further ado lets jump straight to it.

AEM SaaS Author Hand On
===

To start playing with your Cloud Manager experience you will need to access it thought your Adobe Experience portal, this will be provided for you by Adobe but for now you can follow our blog to get the insight and prepare you to roll-out your first project. 

First off you need to login to Adobe Experience Platform, this will allows you not only to login into AEC but also provides SSO for all AEM instances! Which is amazing and so on SSO trend of 2020! Login screen is similar to the all of the login screens Adobe has been slowly introducing in last few years. 

![Adobe SSO Login Page](/assets/images/adobe-aec/1-login.png)

You can still use shared local admin accounts(you get one you share with Adobe) but its not something you should do in AEC and at all, for many painful reasons. 

Once you have logged in you will be redirected to the AEC dashboard.  

![AEM Adobe Experience Cloud Dashboard](/assets/images/adobe-aec/2-adobe-experience-cloud-overview.png)

When you click the Experience Manager icon you should see Cloud Manager card with Launch link.

![AEM Adobe Experience Cloud Manager Launch](/assets/images/adobe-aec/2-adobe-experience-cloud-ams-cloudmanager.png)

Clicking Launch on Cloud Manager card will lead you at AEC Program Overview page.

![AEC - Cloud Manager - Program Overview ](/assets/images/adobe-aec/4-aec-program-console.png)

This console is your command center for your environments and associated pipelines. From here you can control your environments, download logs, create and action pipelines. From now on this is the engine of your project!

![AEC - Cloud Manager - Environments](/assets/images/adobe-aec/5-aec-program-console-manage.png)

First thing you will notice is the large banner across the top, this is you production status panel, it will report to you how your Production pipeline is going.

Just under that you will see two sections Environments and Pipelines. 

Environments
---

Environments section allow you to check status of your environments, update and create new environments, download environment logs, access new environments, all of the features readily available and tucked away in the ellipsis (```...```) revealing a simple menu with only but primary experiences you are looking for. Additionally when you click the Details button in this section you will be taken to a details screen that will show you 

![AEC - Cloud Manager - Environments Details](/assets/images/adobe-aec/4-aec-program-console-environments-details.png)

Available Configuration is tied to your account and point allocated for environments. You will only be able to have environments that have been assigned to you by Adobe. Spinning up and tearing down of the environments is as simple as clicking a submenu item on the environment.


Pipeline
---

Pipeline section allow you to create, update and run pipelines and this is broken down into Production and Non-Production. Manage Git button shows you a dialog that points you to the Adobe Git repo you will need to use when committing code.  

Although environments will be your initial focus it will very quickly switch to the Pipelines which you will spend most of your time watching. 😍

So lets deep dive on the pipeline and what we can decipher from its logs.

AEM SaaS Pipelines Breakdown
===

Adobe pipeline offer is simple, it provides a dream pipeline process where you start with Adobe hosted Git Repo and fork into Quality or Deploy pipeline process.

This is a simple methodology and it seem to work as it save a bunch of time on a project. All the team need to do is just get their code into the repo and everything is done for them, that has not existed with this ease until now.

![AEM Saas Program Console](/assets/images/adobe-aec/7-aec-program-non-prod-pipeline-execution-complete.png)

As you can tell from the image the pipeline is divided into following stages

* Validation - initial verify of you repo?
* Build & Unit Testing - maven build and test
* Code Scanning - SonarQube evaluation
* Build Images - Docker and Sling app build process
* Deploy to Dev - Docker release and package install

This is similar process for PROD but with extra testing and approval steps.

As you can see the Non-Prod Deploy pipeline breakdown is simple so now lets look what is happening under covers, lets talk about notable things that can be observed from the logs.

Validation
---
No logs available for this but "Your Pipeline has been verified against a set of sanity checks." could mean a lot of things, but it runs very fast so guessing its aim is just to check you have a git repo with valid pom.xml that could be compiled, that could be a good start.

This step takes about 5min to run from our tests.

Build & Unit Testing
---

In "build_maven_build.log" you can see ```[BUILD] Running maven build command(s)``` line and judging by what happens after that simple ```mvn package``` command is used as it compiles, tests and packages all modules in you project.

This step runs for about 5min and it would depend on your package and test content. Its not clear from the logs if the artifacts are cached at this step or after code scan.

Code Scanning
---

This is where magic is starting to come into play. First of you get a nice review summary screen that shows you what the damage of your latest code cram, and its cool way of summarising underlying tools!

![AEM Saas Pipleine CodeScan Result](/assets/images/adobe-aec/7-aec-program-non-prod-pipeline-execution-complete-codescan.png)

In addition to this you get to see a CSV that shows you things that you need to fix.

| File Location                           | Line Number | Issue                                                                                                                                                                                                                                                       | Type | Severity | Effort | Rule                                       | Tags |
|-----------------------------------------|-------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|----------|--------|--------------------------------------------|------|
| design.aem:aemdesign-aem-common:2.0.618 | 0           | Node /apps/aemdesign/install is an OSGi config or install path which contains non-OSGi-related children that will not be visible to non-administrative users.                                                                                               | Bug  | Major    |        | ConfigAndInstallShouldOnlyContainOsgiNodes | aem  |
| design.aem:aemdesign-aem-common:2.0.618 | 0           | Node /apps/aemdesign/components/template/cloudconfig/addthisconnect/config is an OSGi config or install path which contains non-OSGi-related children that will not be visible to non-administrative users.                                                 | Bug  | Major    |        | ConfigAndInstallShouldOnlyContainOsgiNodes | aem  |
| design.aem:aemdesign-aem-common:2.0.618 | 0           | Node /apps/aemdesign/components/lists/searchlist/v2/searchlist/cq:dialog/content/items/layoutTab/items/column/items/config is an OSGi config or install path which contains non-OSGi-related children that will not be visible to non-administrative users. | Bug  | Major    |        | ConfigAndInstallShouldOnlyContainOsgiNodes | aem  |
| design.aem:aemdesign-aem-common:2.0.618 | 0           | Node /apps/aemdesign/global/dialog/touch/badge/content/items/badgeConfigTab/items/column/items/config is an OSGi config or install path which contains non-OSGi-related children that will not be visible to non-administrative users.                      | Bug  | Major    |        | ConfigAndInstallShouldOnlyContainOsgiNodes | aem  |
| design.aem:aemdesign-aem-common:2.0.618 | 0           | Node /apps/aemdesign/components/template/cloudconfig/googleanalytics/config is an OSGi config or install path which contains non-OSGi-related children that will not be visible to non-administrative users.                                                | Bug  | Major    |        | ConfigAndInstallShouldOnlyContainOsgiNodes | aem  |
| design.aem:aemdesign-aem-common:2.0.618 | 0           | Node /apps/aemdesign/components/media/image/v2/image/cq:editConfig/cq:inplaceEditing/config is an OSGi config or install path which contains non-OSGi-related children that will not be visible to non-administrative users.                                | Bug  | Major    |        | ConfigAndInstallShouldOnlyContainOsgiNodes | aem  |
| design.aem:aemdesign-aem-common:2.0.618 | 0           | Node /apps/aemdesign/components/template/cloudconfig/googlemap/config is an OSGi config or install path which contains non-OSGi-related children that will not be visible to non-administrative users.                                                      | Bug  | Major    |        | ConfigAndInstallShouldOnlyContainOsgiNodes | aem  |

*PS. this is the complete list of issues that we got for first deploy of AEM.Design to Adobe SaaS offering.* 

Just looking at this the reported Severity seems to be very opinionated and super conservative. Having a readme file in your ```/apps/aemdesign/install``` folder does not make it a Major defect, but this it probably just splitting hairs at this point and removing that file is trivial.

Errors such as ```/apps/aemdesign/components/template/cloudconfig/addthisconnect/config is an OSGi config or install path which contains non-OSGi-related children that will not be visible to non-administrative users.``` seem to fail the blank ```config``` node name rule and yes this is Major once again.
 
These trivial issues will get some great solution in time as this is a great process to put in place for all AEM project from the start. Many AEM project will benefit from establishing initial baseline and would provide a clear for quality path.

This step takes about 5min to run, this would depend on amount of code you throw at it.

Build Images
---

This phase is responsible for generating two brand new Docker images that has all of you new code embedded into it. First image will contain all of your project contents and second image will be a final merged version of your project with latest AEM base image. 
 
Essentially process builds a custom CRX-Quickstart with your features(converted packages) embedded into it from the start, this does mean that you will not be able to download or delete the packages using CRX/DE and with added benefit of separating these code package from actual content in your repository.

![AEM Saas CRX/DE Packages](/assets/images/adobe-aec/11-aem-saas-crxde-packages.png)

The logs show standard Docker build process with bunch of parameters being passed to the Docker build process. Namely the build process relies on Packages that were build in previous steps these are passed as a URL list which are downloaded and converted to [Sling Features](https://github.com/apache/sling-org-apache-sling-feature) using tool similar to [sling-org-apache-sling-feature-cpconverter](https://github.com/apache/sling-org-apache-sling-feature-cpconverter).

The process also creates a list of packages that are have content to be installed into repository, this list is used in deploy step.

All the packages once converted get store into ```src/main/features/generated-author``` with relevant JSON files describing features in ```src/main/features/generated/001_sew-aem-common.json```. After this a maven build process is executed to compile your features into latest version (at the time of writing 6.6.0-V17414) of AEM Quickstart. Adobe has indicated that they are moving towards daily releases so this means that this process will pickup latest version of AEM when its available.

After this conversion and merger of AEM sling features, AEM image is started as container to initialise its segment store. Once the instance is initialise its stopped and Apache Jackrabbit Oak maintenance is executed, first checkpoint then compact. Once this is done both docker images are uploaded to Adobes Docker Image Repository. And this same process repeats for Publish images changing runmode=publish in the process.  At the end of this process which takes around 10-15 min to run you end up with Author and Publish images sizing at 4GB each.

Deploy to Dev
---

Deploy phase starts with downloading content packages that were isolated in previous phase. Followed by starting and waiting for Author instance, at which is tries to install downloaded packages into the instance, and stop the instance on completion. 

After this next process start the author and runs a bunch of bash scripts, that enable features, nodestore, blobstore, logging, set admin password validate and link license key. After this AEM is started once again and once ready is stopped and Oak Indexes are regenerated.

After this 10+ min step that instance is started again and marked as available for use, which is not recoded in logs and must be an extra step outside of the pipeline.

As you can see this is straight forward pipeline that just works. Lets discuss the obvious question that is at the top our mind right about now. Whats missing?

AEM SaaS Pipelines Whats missing
===

Well as this is hosted on AEM there will be a few CI/CD limitations. Limitations are good as they provide less distraction and an opportunity to improve. Here are the things that we find missing so far, they are not deal breakers but good to keep on the back of your mind. 

Git Peer Review Workflow
---

Adobe Git is only a url to which you push your code, these days all development should revolve around Pull Request Approval process. Covering benefits of this is not required as they are covered in great depth in many articles. 

To enable this process to happen on your projects you will need to use external Git repo and manage code reviews there before you publish this final code into Adobe Git.

This is a small inconvenience and its readily fixed seeing as all companies these days have a form of Git and in cases where that's not the case, Github, Bitbucket and Gitlab all support this process for free. Additionally these tools have built in pipeline tools that will help you to push code to Adobe Git.   

Automated Functional testing
---

Screenshot testing using Selenium or other testing tools is not in and you would need to cater for that your selves. Most obvious reason for this as there is no one way of doing this and everyone does what they need for their situation.   

Additionally current Deploy pipelines are fixed to a specific flow which you can not change. This means that in cases where you need to do automated functional testing you would need to do this using external pipeline.

Potentially you could just run your automation test tool of choice manually against a Dev instance in the Adobe environment. But in cases where you would like this to be automated you would have follow another approach.

One approach could be is to still have external Git repo and a pipeline that could build and test code and on success push it to Adobe Git for release to Dev cycle. This would be an ok mechanism as you could do this free on Github using containers see [Exhibit 1](https://aem-design.github.io/aemdesign-aem-support-output/) that runs in Github Actions pipeline. Plus you would get PR ability.

No Git LFS
---

If you are using git lfs you going to need to revert to plain git as there is not Git Lfs in Adobe's Git and you will end up publishing pointers to your images into AEM.

No Felix Console
---

There is not felix console, but there is a brand new custom Developers Console that provides very limited tools that you might use.  

![AEM New Developer Console](/assets/images/adobe-aec/12-developer-console-status.png) 

Standard Felix console does have a lot of features and some can cause a few issues so it's not surprise its not available and have been replaced with a tool that allows you download that for review.

Here are some of the available screens, Status screen will be your main goto console to download content of some frequently used Felix console. 

{% include image-gallery.html folder="/assets/images/adobe-aec/developerconsole" %}

Conclusion
===

As this is an Adobe's work in progress and the masterpiece is not finished yet, its expected that new features will be added as adoption grows.

It will not take you long to get used to all the options and you will soon longing for this simplicity in everything. Alternatives experiences to this are far more complicated and although they are fun to create they can divert your attention and that you need not to do any more!

From development perspective there are a lot of features that you will not see migrated which is a good thing, as Adobe's engineers have a good handle on what is used and its usefulness beyond just being there part of a legacy.

So we hope you have had just enough content to give you a quick overview and excite you to jump on board.

There is a whole array of documentation available at your favorite site in the [Experience Manager Cloud Manager Help](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/introduction-to-cloud-manager.html) section, explore the new capability that is at your disposal and review official docs if you get stuck.

As always if you want more drop us a line, checkout the code and submit some issues if you find any.