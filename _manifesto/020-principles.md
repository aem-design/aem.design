---
title: "Platform Principles"
permalink: /manifesto/principles/
excerpt: "Consider that when creating content structures you are creating them once and forever."
modified: 2016-11-03T10:01:43-04:00
author: max@aem.design
redirect_from:
  - /manifesto/introduction/
---

{% include toc_sticky.html %}

## Contentricity

[Davids Model - 7 Rules](/archive/davids-model) is reference to fundamental approach behind AEM(CQ) architecture. All of the technical frameworks that make up the platform are all targeted to support Content Centric approach of the CMS. This is different to other CMS platforms and something that must be learned and iterated to all involved.

Major benefit of Content Centric approach is that Governance of the CMS and its development is managed by Business. This is done by managing the experiences of the platform. The platform is a facilitator and development effort is used to enrich content presentation and not extending the platform capabilities.

## Authorability

All content in CMS should be authorable. Fundamental guide to business analysts working on new business features that when it comes to CMS it's important to build content perspective of the feature being developed. This enables an insight and a clear direction for the developers to ensure that components they develop can be configured by Authors. At the same time developers are ensuring that all the development work that they create enable feature customisations without their immediate involvement. This enables developers to building tools for the business authors to build the site. In other words develops build small puzzle pieces in a form of loosely coupled pluggable components so that an authors can mix and match components to create unlimited combinations of content presentations.

## Experiences

While projects concentrate on developing new feature components it's important to evaluate and plan other authoring experiences that are available in AEM platform.

Primary experiences that must be considered at all times (1) authoring experience, (2) channel experience and (3) delivery experience.

1. Author Experience - Business Authoring, Outports, Vendors etc

2. Channel Experience - Mobile, Digital Publishing, Web, Apps, API, other

3. Delivery Experience - Dev Cycle, DevOps

## Digital Channel Agility

Digital Agility is a measure of duration for delivering of change to channels. There are many ways of achieving this and every one does what is necessary to meet their needs. When implementing partners to encourage agility, measuring the cost efficiency of process can help to eliminate bottleneck and streamline the process. Concentrating on implementing patterns that provide transparency in delivery of outcomes and measurement/testing of outcomes in relation to initial agenda will be of most benefit.

### Continuous Delivery and Continuous Integration

This is not a new concept and means "assembly line" like process utilising autonomous build, test and deployment cycles which deliver software directly to production with minimum input from users.

### Test Driven Development

This is not a new concept and in relation to CMS means component level functional testing written by developer that enable measurement/testing of outputs by the development team. This also contributes to larger Testing Framework for the platform which is further used for Regression testing.

Practical Functional Testing that is reusable and can be managed by Business and can be used for more than one purpose.

### Behaviour Driven Development/Testing

This is not a new concept and in relation to CMS means component level definition of acceptance criteria and testing cases in a uniform manner, as it becomes the base for automated testing.

## Collaborative Development

Agile is a principal that applies to Software Development, it does not mean its a free for all. Free for all being, no documentation and no proper ceremony, if anything it means more of it and more often. Agile is collaborative, its a dialog within the business that involves everyone who is helping on the project. Its a mechanism of short bursts of efforts with quick feedback loop that enables assessment and in turn enables agility. Agile does not mean that there should be no planning and no documentation, it just means that planning and documentation should be done incrementally and without wasting effort. This means that if documentation is done as a prelude to moving to the next stage

## Content is Forever

*Consider that when creating content structures you are creating them once and forever*

*For example if you create a bookmark to an article, you expect that article to remain there for a long time. Changing content URL content creates a challenge, leaving content in the same place is easier and more sustainable.*



