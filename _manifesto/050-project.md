---
title: "Project Guide"
permalink: /manifesto/project/
excerpt: "It's important that documentation is seen as a journey not a deliverable"
modified: 2016-11-03T10:01:43-04:00
author: max@aem.design
redirect_from:
  - /manifesto/delivery/
---

{% include toc_sticky.html %}

## Project Documentation

Important principle on project is to understand why you are creating content, primary driver for creating must be for reuse by someone else on the project. It's important that documentation is seen as a journey not a deliverable. Everyone should be using documentation as a way of sharing knowledge with another person on the project. The documentation that is written without an audience on a project is wasted.

This is a sample TOC that can be used as a starting point for projects, you may not require all of the sections but at some point in your project question and need for information will arise and will require a placeholder to communication knowledge to the team.

1. Project Library
    1. Management Design
        1. Knowledge Management
            1. Project FAQ - Getting started with documentation
            2. Keyword Index - auto generated from page Tags
            3. Comments
            4. Recent Activity
        2. Deliverables - list of all deliverables
        3. Roles - team, support, ops
        4. Guidelines
            1. Task Management - Jira usage, stories, tests, bugs
            2. Knowledge Management - Confluence usage, specs, review
            3. Page Specification - Template Description
            4. Component Specification - Template Description
                1. User Story
                2. Acceptance Criteria
                3. Behaviour Driven Testing
        5. Meeting Notes
            1. Meetings
            2. Retrospectives
            3. Discovery Sessions
        6. Reporting
            1. Status Reports
            2. Reporting Documents - list of pages tagged for reporting
            3. Automated Test Result Reports
        7. Steakholder Registry
    2. Experience Design
        1. Unique Experiences
            1. Unique Experience Specification
        2. Component Catalog
            1. Component Group
                1. Component Specification
        3. Content Hierarchy
        4. Dialogs - Shared Dialogs
        5. Frameworks - Design Frameworks listing
        6. Authoring Helpers
            1. Scaffolding - Forms that will be used by Authors
            2. Blueprints - Site templates
            3. Dashboards - Updates to Dashboards
            4. Reports
            5. Authoring UI Updates
        7. Styles - General Styles applied to all components
        8. Tag Namespaces - Tagging for Content
        9. Dictionaries - Labels for component
        10. Templates - Available Templates
        11. Workflows - Workflows to be built
        12. Error Pages - Error pages that will appear
        13. Translations - Translations to be used
        14. Selectors - Selectors available
        15. Services - Services available
        16. Accessibility
        17. Browsers and Devices
    3. Platform Design
        1. Architecture
            1. Solution Description - provides a overview of whole solution
            2. Logical Architecture
            3. Physical Architecture
            4. Service Architecture - service, data, interfaces
                1. Service Catalog
            5. Delivery Architecture - ci/cd cycles
            6. Content Architecture
            7. Information Architecture
            8. Testing Architecture
            9. Development Architecture
                1. Developer Setup
            10. Integration Architecture
            11. Quality Architecture
            12. Security Architecture
            13. Analytics Architecture
            14. Business Architecture
    4. Operations Design
        1. Content Migration
        2. Integrations Services
        3. Service Licensing
        4. Environment Config - service addresses
        5. Training Manual
        6. Vendor List
        7. Error Register
        8. Environments
        9. Groups and Permissions
        10. Workflows

This is not a prescriptive TOC and things should be added and removed as required.

## Component Specification

Content specification is the single document which is used to describe the component to be build and all of the relevant information needed. From this document a developer can determine if the component can be built. The whole team spends their effort to ensure this document is in an acceptable state so that developers can carry out their work using this document as a guide.

The document covers these main areas

| Management                                                                        | Authoring                                                     | Design                  |
|-----------------------------------------------------------------------------------|---------------------------------------------------------------|-------------------------|
| User Stories Component Summary Component Hierarchy Acceptance Criteria Test Cases | Authoring Dialogs - Design - Content Related - Tags - Dialogs | Variants Badges Theme   |
| Input From BA, PO, TS, DEV, DES                                                   | Input From BA, DEV                                            | Input From BA, DEV, DES |


## Project Archetype

Recommended practice to build AEM projects is to use Apache Maven tool. To make it easier to create new project [AEM.Design Archetype](https://github.com/aem-design/aemdesign-archetype) can be used and it will create you project that is ready to be used by authors.

Running following command will generate a sample project 
```bash
mvn archetype:generate \
  -DarchetypeGroupId=design.aem \
  -DarchetypeArtifactId=aemdesign-archetype \
  -DarchetypeVersion=1.0.51 \
  -DgroupId=design.aem.projectx \
  -DgroupTitle="ProjectX" \
  -DartifactId=projectx \
  -DartifactTitle="ProjectX" \
  -DparentArtifactId=projectx-parent \
  -DparentArtifactName="ProjectX :: AEM :: parent" \
  -Dpackage=projectx \
  -DpackageGroup=projectx \
  -Dversion=0.1 \
  -DcomponentGroupTitle=MMAL \
  -DappsFolderName=projectx \
  -DcontentFolderName=projectx \
  -DconfFolderName=projectx \
  -DclientLibsFolderName=projectx \
  -DclassNamespace=design.aem.projectxm \
  -DappsParent=aemdesign

```

[AEM.Design Archetype](https://github.com/aem-design/aemdesign-archetype) has the following modules and contents

| Level 1 | Level 2               | Description                                                                          |
|---------|-----------------------|--------------------------------------------------------------------------------------|
| parent  |                       | parent for new projects                                                              |
|         | {tenant}-aem-author   | contains all of the update to OOTB AEM Functionality                                 |
|         | {tenant}-aem-common   | contains all of the components for project                                           |
|         | {tenant}-aem-config   | contains all of the config content for repo                                          |
|         | {tenant}-aem-content  | initial seed content to be added to clean AEM instance, used only in development     |
|         | {tenant}-aem-deploy   | project for deploying project as one package                                         |
|         | {tenant}-aem-compose  | standard project for developing DLS and customer facing components                   |
|         | {tenant}-aem-services | all of the service code, bundle deo, helpers etc, anything that needs unit testing   |
|         | {tenant}-aem-showcase | content used for demonstrating components during sprints                             |
|         | {tenant}-aem-training | content used for teaching Authors how to use components and build pages, see example |
|         | {tenant}-testing      | automated functional testing scripts                                                 |

At the high level an AEM project consist of Bundle and Content packages.  Bundle package contains all the code that is required for the Application, it should contain any services, servlets and helper functions. Content package contains the configuration content, all the component configuration and code as well as Designs content. Its a best practice to divide projects into multiple project as soon as first release occurs. This help with maintenance, bug fixing and dependency management. It also creates a practice of ensuring that component and code does not become tightly coupled.

## Project Concept to Creation

### Knowledge Flow Map

The diagram below illustrates how a business concept flows through the necessary parties to get to the desired end state, which is a functional component that can be tested (and passed) on a showcase site, so that the business owner can utilize it in the organization's production environment.

![image alt text](/assets/images/manifesto/project-knowledge-flow.png)

### Evolution of Artifacts

All artifacts on a project evolve over time and give input in other artifacts.

![image alt text](/assets/images/manifesto/project-artifact-flow.png)

Idea behind each artifact is to provide input into other artifacts and be useful for more than one purpose.

## Development Flow

This is a high level flow for development cycles

![image alt text](/assets/images/manifesto/project-development-flow.png)

* **Build Deploy Test**: Developers work on local environment which is a replicate of target production, using same codebase as build server and performs all Build, Deploy and Test functions on local instances of AEM using docker containers.

* **Dependency Resolution**: Local Developers build environment uses centralised Maven repository to resolve dependencies in Build cycle

* **Commit**: Developers code is commit code to Code repository

* **Tracing**: Code is linked to Stories by Story ID added to each commit

* **Trigger**: Each commit triggers a Build Test Deploy cycle on the Automation server

* **Build Tracking**: Build tracking is reported into Jira

* **Build Artifact Storage**: Build Artifacts are stored in Jira to be used in Depoy cycles

* **Build Test**: Automated testing of Code is performed after Build an before Deploy cycle

* **Build Analysts**: Automated Code Quality review is performed after Build an before Deploy cycle

* **Deploy**: Deploy cycle is triggered automatically and manually to a defined environment
