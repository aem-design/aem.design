---
title: "Project Guide"
permalink: /manifesto/project/
excerpt: "It's important that documentation is seen as a journey not a deliverable"
modified: 2016-11-03T10:01:43-04:00
author: max@aem.design
redirect_from:
  - /manifesto/delivery/
---

{% include toc %}

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

            5. Task Management - Jira usage, stories, tests, bugs

            6. Knowledge Management - Confluence usage, specs, review

            7. Page Specification - Template Description

            8. Component Specification - Template Description

                1. User Story

                2. Acceptance Criteria

                3. Behaviour Driven Testing

        5. Meeting Notes

            9. Meetings

            10. Retrospectives

            11. Discovery Sessions

        6. Reporting

            12. Status Reports

            13. Reporting Documents - list of pages tagged for reporting

            14. Automated Test Result Reports

    2. Component Design

        7. Project Artifacts - project repos

        8. Style Guide - Style to Component Mapping

        9. Unique Pages

            15. Page Specification

        10. Component Catalog

            16. Component Group

                4. Component Specification

        11. Content Hierarchy

        12. Dialogs - Shared Dialogs

        13. Frameworks - Design Frameworks listing

        14. Scaffolding - Forms that will be used by Authors

        15. Blueprints - Site templates

        16. Styles - General Styles applied to all components

        17. Tag Namespaces - Tagging for Content

        18. Dictionaries - Labels for component

        19. Templates - Available Templates

        20. Workflows - Workflows to be built

        21. Error Pages - Error pages that will appear

        22. Translations - Translations to be used

        23. Selectors - Selectors available

        24. Services - Services available

        25. Dashboards - Updates to Dashboards

    3. Platform Design

        26. Architecture

            17. Logical Architecture

            18. Physical Architecture

            19. Service Architecture - service, data, interfaces

            20. Delivery Architecture - ci/cd cycles

            21. Content Architecture

            22. Information Architecture

            23. Testing Architecture

        27. Config

            24. Development Config

            25. Workstation Config

            26. Tools

    4. Operations Design

        28. Content Migration

        29. Integrations Services

        30. Service Licensing

        31. Environment Config - service addresses

## Component Specification

Content specification is the single document which is used to describe the component to be build and all of the relevant information needed. From this document a developer can determine if the component can be built. The whole team spends their effort to ensure this document is in an acceptable state so that developers can carry out their work using this document as a guide.

The document covers these main areas

<table>
  <tr>
    <td>Management</td>
    <td>Authoring</td>
    <td>Design</td>
  </tr>
  <tr>
    <td>User Stories
Component Summary
Component Hierarchy
Acceptance Criteria
Test Cases

</td>
    <td>Authoring Dialogs
- Design
- Content
Related
- Tags
- Dialogs

</td>
    <td>Variants
Badges
Theme

</td>
  </tr>
  <tr>
    <td>Input From
BA, PO, TS, DEV, DES</td>
    <td>Input From
BA, DEV </td>
    <td>Input From
BA, DEV, DES</td>
  </tr>
</table>


## Project Artifacts

When starting an AEM project it’s important to get the initial project artifacts created early, as refactoring of code later will be complicated and time consuming. Creating Project artifacts early puts in place placeholders for content as the team progresses through the project.

* Parent - parent repo used to contain all of the repo and build sequences, project primarily used to managing builds and scripting

    * Component Suite - repo from common component that will be build in the first phase

        * Services - repo for all Services that will be built

        * Content - repo that contains initial site content

        * Author - repo that contains all of the updates to the Authoring interface in AEM

        * Config - repo that contains all of the configuration setting

        * API - repo containing all of the API related services

    * Showcase Suite - repo for Static content used by the Testing Framework and for demonstration of components for use stories

    * Testing Suite - repo that contains the Load Testing

    * Prototype - repo for UI prototype

    * Deploy Suite - contains all of the Ansible deploy scripts

        * AEM - repo that contains all the AEM program itself and its initial configuration

        * VM - repo that contains all of configs for building VM Templates

        * Docker - contains all of the Docker configs

        * Jenkins - containing all of the Jenins configurations

        * Security - contains all of the Security, CIS VM hardening playbooks

    * Training Suite - repo containing the Training site

### Naming Convention

Sample project hierarchy naming convention

* {project}-aem-parent

    * {project}-aem

    * {project}-aem-author

    * {project}-aem-common

    * {project}-aem-services

    * {project}-aem-content

    * {project}-aem-showcase

    * {project}-aem-training

    * {project}-testing

    * {project}-prototype

    * {project}-deploy

    * {project}-docker

    * {project}-jenkins

    * {project}-security

    * {project}-vm

## Project Archetype

Recommended practice to build AEM projects is to use Apache Maven tool. To make it easier to create new project Adobe maintains a Maven Archetype that consist of basic project and content structure as well as has the required project dependencies. More information on how to use the maven archetype when creating new project can be found here [AEM6 Archetype](http://docs.adobe.com/docs/en/aem/6-0/develop/dev-tools/ht-projects-maven.html) more [AEM5 Archetype](http://docs.adobe.com/docs/en/cq/current/developing/developmenttools/how-to-build-aem-projects-using-apache-maven.html).

At the high level an AEM project consist of Bundle and Content packages.  Bundle package contains all the code that is required for the Application, it should contain any services, servlets and helper functions. Content package contains the configuration content, all the component configuration and code as well as Designs content. Its a best practice to divide projects into multiple project as soon as first release occurs. This help with maintenance, bug fixing and dependency management. It also creates a practice of ensuring that component and code does not become tightly coupled.

## Project Concept to Creation

### Knowledge Flow Map

The diagram below illustrates how a business concept flows through the necessary parties to get to the desired end state, which is a functional component that can be tested (and passed) on a showcase site, so that the business owner can utilize it in the organization's production environment.

![image alt text](/assets/images/manifesto/project-knowledge-flow.png)

### Evolution of Artifacts

All artifacts on a project evolve over time and give input in other artifacts.

![image alt text](/assets/images/manifesto/project-artifact-flow.png)

## Development Flow

This is a high level flow for development cycles

![image alt text](/assets/images/manifesto/project-development-flow.png)

* **Build Deploy Test**: Developers work on local environment which is a replicate of target production, using same codebase as build server and performs all Build, Deploy and Test functions on local instances of AEM

* **Maven Dependency Resolution**: Local Developers build environment uses centralised Maven repository to resolve dependencies in Build cycle

* **Commit**: Developers code is commit code to Code repository

* **Tracing**: Code is linked to Stories by Story ID added to each commit

* **Trigger**: Each commit triggers a Build Test Deploy cycle on the Automation server

* **Build Tracking**: Build tracking is reported into Jira

* **Build Artifact Storage**: Build Artifacts are stored in Jira to be used in Depoy cycles

* **Build Test**: Automated testing of Code is performed after Build an before Deploy cycle

* **Build Analysts**: Automated Code Quality review is performed after Build an before Deploy cycle

* **Deploy**: Deploy cycle is triggered automatically and manually to a defined environment
