---
layout: single
permalink: /blog/2020/01/12/aem-framework-for-multi-tenant-environments
title:  "AEM Framework for Multi-Tenant Environments."
excerpt: "Notes to get you started creating a Multi-Tenant Environments on AEM"
date:   2020-01-12 00:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - docker
  - knowledge
  - sharing
  - multi-tenant
  - framework
header:
    overlay_image: /assets/images/site-logo.png
---

Introduction
===

AEM.Design is about identifying best practices and patterns that should be embedded and used a starting point for creating solutions for AEM. Our approach is to combine these best practices and patterns into the open-source framework that can accelerate projects and provide a pathway for sharing knowledge with the community in a consumable production-ready framework. A lot of articles detail individual knowledge fragments that at times useful on their own but do not provide a clear direction for end-use. We have tried to create a consolidated reference end-to-end approach with AEM.design framework and tools.

This initiative aims at collating best practices and patterns that are proven to be useful on projects. It aims to leverage best practices not only from AEM knowledge base but also leverage best of the best from Front End, Automation Testing, DevOps and another related enablement tech. The aim of this initiative to provide a framework that can fit into existing solution practices without mandating a particular process.

All of the code is located in GitHub, Docker Hub, SonarCloud and published to Maven central.

Best place to start with this framework is to try out the Docker Bundle that has the framework and demo of all of the components. You can find how to get started here: https://aem.design/blog/2019/08/30/docker-aem-bundle

Our archetype project is aimed to generate a new tenant project that has all of the components required to run the AEM implementation project. It including automation tests, site showcase, frontend code implementation and component overrides tailored to you tenant name and project.

If you have any questions on particular issues you can raise issues in GitHub for repos there are a few of them.

Creating and managing an environment for Multi-Tenants requires considerable upfront planning. Starting AEM project is easy, and you can feel a great sense of velocity early on. Although your initial velocity will make you feel comfortable, this might not last and avoid future pitfalls is hard once you have released to production. To avoid pitfalls of the future means that you will need to be aware of some of the pitfalls you might encounter upfront, and this is very hard to convey and predict.

To protect projects from encountering technical pitfalls in the future, it's recommended to follow several product best practices. A sheer number of best practices and patterns is overwhelming, and it's tough for new entrants to appreciate all of the suggested practices. We found that establishing a set of goals and principles early on helps to provide a project with a pathway to success.

Technical patterns are easily avoided by leveraging frameworks that seek to embed knowledge into a useful framework. Providing input into business processes is a more complicated endeavour due to the way the project can be executed. From our experience, teams need to aim to establish a common design language which is used to communicate requirements and create an efficient delivery process that builds trust in the tools being used. This requires having open dialogue at the start of the project to ensure everyone is on the same page and are willing to commit to trusting automation process.

Following sections outline some of the elements of knowledge that should be kept in mind when establishing a project for a single site or multi-tenant sites.

Business approach
===

Be very transparent with the whole team, and every person needs to understand that they will all be required to login into AEM and use it, PMs and steak holders included, after all, it's their future digital platform. Everyone must learn the basic terminology of AEM and Design Language that will be used to describe requirements, this avoids confusion for everyone, and everyone should be encouraging peers to use correct language.

1. Select primary Business Analyst to run project knowledge transfer, this will be your primary conduit
2. The project team focus is primarily on Authoring Experience, as this what will enable authors to create the visual experiences they want
3. Create a common Design Language to ensure designers and BA's lead the conversation of explaining how designs are authored in AEM, not in some other external concepts
4. Establish a religious training for all end-users of AEM
5. Create a showcase of you chosen components and walk everyone (including stakeholders) thought it, showcase must be used for functional tests, so it's not a throwaway
6. Establish a common knowledge repository for sharing knowledge while AEM project is running, use Confluence as it's most accessible, do not treat this knowledge base as a dumping ground of notes, treat it like a knowledge book for the future. This space is for people to see what you have built not read endless meeting notes, all admin related content should not be primary focus for the space
7. Establish a author training site that will be updated by Authors and BAs, this should be like any other tenant
8. Delay all modification to core Authoring Experience, use YAGNI banner especially if everyone is new to AEM
9. Component that appears in multiples experiences(pages) and show same data structure but different visual presentation are variant of same component.
10. Focus on identifying Unique Experiences and Unique components Variants that make up those Unique Experiences.
11. Ensure analytics is discussed as Definition of Ready for each component.
12. Focus on content taxonomies to ensure content structure can scale from the start in DAM, Content Fragments, Experience Fragments, Tags, Forms and Site Pages. Each site should be in its own tenant folder with additional contextual segmentation that   should apply for each type of content.
13. Site Content must always be in Region/Language structure with primary Country and Language as default, essentially your site must be multi languish compatible from the start.
14. Do not let Information Architecture dictate site Content Architecture
15. All legacy SEO ideas and practices (anything that does not talk about microdata in page and components) could be tested using Functional Automation Tests using the Build in AEM Hobes framework. Doing this will allows authors to test their content when they create it. If it can't be automatically tested, it's not a requirement; it's 2020 excuses don't apply so to drop that requirement if it can't be tested.
16. Acceptance Criteria and Acceptance tests must be part of Definition of Ready for DEV
17. Automation testing is not optional, and it's the only way to verify Definition of Ready.

Technology Approach
===

For single and Multi-Tenant Projects consider that each site is a "tenant" not a sling workspace tenant but more of a virtual tenant used to segregate content from each site. This addition provides a method for security policies to be applied as users create content, as well as provide a clean separation of content and application code is required, especially as you are working of a single component codebase.

1. Create a showcase with your chosen components which are maintained Developers throughout development and Testers when helping to test
2. Focus on Functional Automation Testing for all components with Authoring (does dialog work), Publishing (does it interact in publish) and Screenshot (does it look right) perspectives. Automation test suit is for the team not for selected few it does not have to be pretty is need to be quick to adopt and allow testing other web services, Selenium still works.
3. Leverage Docker containers to ensure you are running consistent versions of services across all environments and especially Developers desktops, see Operations/Docker project
4. Run AEM with Segment and Datastore separates from the start
5. Leverage external ESB tool for API dev, eg ApacheNifi, try not to write API's in AEM, external API tools can template/translate requests into direct Sling API request.
6. Offload processing to Kubernetes container farm to leverage containers.
7. Use overlays for each component per each site, as you will be using multiple framework eventually, this will allow you so substitute/update components in the future.
8. Segregate content of each "tenant" into individual sites; this pattern also applies to a number of locations where content is created by authors
9. Ensure Pipelines for build and deploy are established as soon as git and repos are created.
10. Ensure dispatchers and present for Author and Publish instances
11. Ensure that Frontend code is package as a stand-alone package and Page Client Libs are used to include in Templates, see Support/Compose module.
12. Leverage VLT tool to export and backup content from prod and import into Development environments as required, packages don't work for large content farms
13. Leverage Ansible to persists logic for environment configuration, see Operations/Deploy and Operations/Ansible-Roles project.
14. Ensure dispatcher config is in code and in a Docker container, see Docker-Dispatcher repo
15. Do not allow manual modification of services/servers via console etc follow Configuration as Code for all infrastructure and services, especially servers, preferably run Centos Atomic edition which will force Docker usage, see Operations/VM project for how to generate Centos Atomic VMs appliances.
16. Leverage Content Fragments for structured content, use templated component to present that content.
17. Leverage Experience Fragments for building reusable Page Sections.
18. Do not build footer and header as massive components, instead create experience fragments and add them to Site Root page and inherit it thought the tree.
19. Ensure Analytics content can be updated by authors
20. Use Data Layer spec to output analytics content in page header
21. Use Data Layer spec to manage all fields that will be output by components and use for analytics
22. Do not implement any components that use any inline javascript for Analytics, no matter what.
23. Ensure each component has a unique ID attribute
24. Ensure each component you output is easily distinguishable from other stuff AEM adds, AEM.Design uses Boolean attribute "component"
25. Use lists for re-using content for presentation, look at Generic Details and List components for reference, they provide dynamic field specific templating and expose of component content without dumping all of the content on the page. Hiding 48 out of 50 fields of a component content is poor design, output only content you need, see Component Variant and List Badge patterns.
26. Separate config into a separate package and use run-modes
27. Separate authoring experience updates into a separate package
28. Use ACS Commons tools and check them before you build new components.
29. When using components from frameworks consider the impact on authoring experience, different frameworks have different authoring possibilities, with some making Authoring very Front End heavy without enabling Authors.

This is a non-exhaustive list, but it should be a good start starting point.

As always, we welcome contributions this list, let us know by leaving a comment or better yet raise an issue in the repo.

Share this on your favourite network if you find this useful.
