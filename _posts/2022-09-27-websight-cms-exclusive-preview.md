---
layout: single
permalink: /blog/2022/09/27/websight-cms-exclusive-preview
title:  "WebSight CMS Exclusive Preview"
date:   2022-09-27 00:00:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - websight-cms
  - docker
  - docker-compose
  ---

## Introduction

It is always a pleasure to be part of something new and upcoming. So when I was invited to be part of an exclusive preview of a soon-to-be-released open source [WebSight CMS](https://www.websight.io/), I could not resist.

![success](/assets/images/websight/Login.png)

I've been keeping an eye on new entrants to the Sling bases CMS for over a decade, and finally, [WebSight CMS](https://www.websight.io/) has entered the space and bringing new capabilities to the table. Big shout out to the WebSight team and [Michał Cukierman](https://www.linkedin.com/in/michalcukierman/) for working on this for several years and bringing an open-source offering to the community. You can check out the GitHub repo for the community version at  [https://github.com/websight-io/starter](https://github.com/websight-io/starter).

{% include image-gallery.html folder="/assets/images/websight/spaces" %}

## Capabilities

These days the standard capabilities of CMS platforms are almost all but become feature complete. But there is still room for the cleanliness of experience and simplicity to be attained for the average author. This is where WebSight is making its play. Instead of going out and trying to reinvent how a great Enterprise CMS platform should not be built, it leverages the proven pattern that allows the team at WebSight to focus on Author experience and enterprise features that make a difference. 

WebSight CMS has hit the ground running by leveraging the same stack as Adobe AEM, Apache Sling CMS and Peregrine CMS, to name a few. Leveraging technology is one thing, but WebSigh CMS's team has the contenders covered in terms of author user experience.

![success](/assets/images/websight/page-editor/Page-Editor.png)

WebSigh CMS covers the following pillars Sling CMS users expect:
Spaces - for managing sites
Pages - author site hierarchy and edit pages
Assets - manage assets

{% include image-gallery.html folder="/assets/images/websight/pages-and-assets" %}

Additionally, there are several administrative functions that allow management of Content, Users and Groups, and other admin tools that allow performing administrative tasks to meet many needs:
Packages - manage packages (Package manager for AEM users)
Resource Browser (CRX/DE for AEM users)
User Management
Groovy Console - great OOTB addition allowing you to do just about anything in the backend.
Swagger Browser - amazing to see this as OOTB as it greatly streamlines any UI extension development, where you need to guess and reverse engineer this in other platforms.

{% include image-gallery.html folder="/assets/images/websight/admin" %}

## Undercovers

Undercovers WebSight CMS runs on Apache Sling stack but uses Mongo OOTB and a welcome NGINX replacement for Apache/Dispatcher combo. It's fantastic to see a native docker setup; docker has been a must for any project for the last ten years, and it's a great step towards adoption as it removes all barriers to getting started.

{% include image-gallery.html folder="/assets/images/websight/undercovers" %}

## Page Authoring

As a deep AEM user, I deeply respect the inspiration from Adobe AEM experience with the number of authoring features that are a must for my authoring needs. 

{% include image-gallery.html folder="/assets/images/websight/page-editor" %}

In addition to inspiration, the team behind WebSight has added subtle improvements to the authoring experience. A nice touch to add grouping to the list of components breaks up what is usually a monotone list. Separating the components list into Layout and Components (I would have called this Content) is a great separation of concern and provides additional grouping for authoring logic.

![success](/assets/images/websight/page-editor/Page-Editor-Content-Tree.png)

## Wishlist

What's missing in the open source preview version as of my review, and I am sure it will make it here eventually? This is more of a wishlist that would further round out the feature set:

- Asset metadata - the ability to add metadata for Assets and author metadata dialog; developing this will enable this feature to be used in content fragments experiences as well.
- Content Fragments - this would provide a consistent way of managing data and could allow pages to be driven through content fragments. I have implemented this on AEM.
- ClientLibs - it's a very, very underrated and underutilised capability, and it provides actual modularity that is yet to be attained in the FED world.

These and everything else can be built on this already great package.

## Conclusion

WebSight CMS is a great new entrant with many opportunities; it's great to see how Sling CMS can be leveraged for a great effect! So feel free to drop a star on their repos [WebSight CMS](https://www.websight.io/) and shout it out on your favourite socials. Until next time!
