---
layout: single
permalink: /blog/2019/06/05/open-source-is-for-feedback
title:  "Open source is for feedback"
date:   2019-06-05 22:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - update
---

Open source is at the core of AEM.

Supporting community is core principle of AEM.Design. AEM Design has always been about providing principled design patterns for AEM, that work in practice.
Our components are tested though practice and implemented so that you can use them the way you want.
We aim at developing component that are free of noise and deliver exactly what you are looking for clean, lean HTML footprint that speaks content and does not get on the way.   

We strongly believe that open source provides most transparent way of giving feedback about our work.
We believe that having a common goal for creating and spreading good practices on making your AEM experience awesome.
We do open source to encourage sharing of great things that can be done in AEM.

Here is the list of all components that we currently have in the framework. [Gitlab Wiki](https://gitlab.com/aem.design/aemdesign-aem-core/wikis/home)

| Type                | Group          | Sub Category        | Name                     | Purpouse             | Usage        | Description                                                                                 |
|---------------------|----------------|---------------------|--------------------------|----------------------|--------------|---------------------------------------------------------------------------------------------|
| Component           | Cloud Services |                     | Rest                     | Cloud Config Dialog  | Mature       | Used as Dialogs for Cloud Config                                                            |
| Component           | Cloud Services |                     | Salesforce API           | Cloud Config Dialog  | Mature       | Used as Dialogs for Cloud Config                                                            |
| Component           | Common         |                     | Redirection Notification | Authoring Helper     | Basic        | Show message in page to author that the page is being redirected to another page            |
| Component           | Common         |                     | Static Include           | Content Embed        | Mature       | Allows including static content into page                                                   |
| Component           | Common         |                     | Timing                   | Component Debug      |              | Creates a debug graph of component rendering speed                                          |
| Component           | Content        |                     | Download                 | Assets on Page       | Basic        | Allow adding or uploading Asset to pages for download                                       |
| Component           | Content        |                     | Embed Source             | Content Embed        | Basic        | Allows embeding of raw content into a page                                                  |
| Component           | Content        |                     | External                 | Content Reuse        | Basic        | Allow adding external content via iFrame or SSI                                             |
| Component           | Content        |                     | Link                     | Content              | Basic        | Allows creating Call to action in containers                                                |
| Component           | Content        |                     | Reference                | Content Reuse        | Basic        | Allows reusing parts of pages in another page                                               |
| Component           | Content        |                     | Table                    | Content              | Basic        | Allows authoring tables                                                                     |
| Component           | Content        |                     | Text                     | Content              | Basic        | Allows adding Text to pages                                                                 |
| Component           | Content        |                     | Tooltip                  | Content Presentation | Mature       | Allows creating Tooltips for other elements                                                 |
| Component           | Content        |                     | Page Author              | Content Presentation | Basic        | Used to output Page information in comples page banners                                     |
| Component           | Content        |                     | Page Date                | Content Presentation | Basic        | Used to output Page information in comples page banners                                     |
| Component           | Content        |                     | Page Description         | Content Presentation | Basic        | Used to output Page information in comples page banners                                     |
| Component           | Content        |                     | Page Tags                | Content Presentation | Basic        | Used to output Page information in comples page banners                                     |
| Component           | Content        |                     | Page Title               | Content Presentation | Basic        | Used to output Page information in comples page banners                                     |
| Component           | Details        |                     | Contact                  | Metadata             | Mature       | Allows storing and presenting Contact infrmation                                            |
| Component           | Details        |                     | Event                    | Metadata             | Mature       | Allows storing and presenting Event infrmation                                              |
| Component           | Details        |                     | Location                 | Metadata             | Mature       | Allows storing and presenting Location infrmation                                           |
| Component           | Details        |                     | News                     | Metadata             | Intermediate | Allows storing and presenting News infrmation                                               |
| Component           | Details        |                     | Page                     | Metadata             | Basic        | Allows storing and presenting Page infrmation                                               |
| Component           | Layout         |                     | Article                  | Layout Container     | Basic        | Creates article container                                                                   |
| Component           | Layout         |                     | Aside                    | Layout Container     | Basic        | Creates aside container                                                                     |
| Component           | Layout         |                     | Breadcrumb               | Layout               | Basic        | Creates a list of pages from given parent to current page, hides hidden pages               |
| Component           | Layout         |                     | Columns                  | Layout Container     | Basic        | Allows creating authorable columns                                                          |
| Component           | Layout         |                     | Content Block            | Layout Container     | Basic        | Allows creating sections on a page                                                          |
| Component           | Layout         |                     | Content Block Lock       | Layout Container     | Mature       | Allows creating lockable sections                                                           |
| Component           | Layout         |                     | Content Block Menu       | Layout               | Basic        | Creates a menu of all Content Blocks on a page                                              |
| Component           | Layout         |                     | Content Tabs             | Layout               | Intermediate | Creates Tabs from select pages contents                                                     |
| Component           | Layout         |                     | Footer                   | Layout Container     | Basic        | Creates footer container                                                                    |
| Component           | Layout         |                     | Header                   | Layout Container     | Basic        | Creates header container                                                                    |
| Component           | Layout         |                     | Navbar                   | Layout Container     | Basic        | Creates navbar container                                                                    |
| Component           | Layout         |                     | Container                | Layout Container     | Basic        | Used to embed into components as a container                                                |
| Component           | Lists          |                     | Asset                    | Asset List           | Mature       | Shows list of assets on page as a gallery                                                   |
| Component           | Lists          |                     | Contact                  | Page List            | Intermediate | Creates a list using Contact Details                                                        |
| Component           | Lists          |                     | Event                    | Page List            | Intermediate | Creates a list using Event Details                                                          |
| Component           | Lists          |                     | Langnav                  | Navigation           | Mature       | Shows a links to other languages of current page                                            |
| Component           | Lists          |                     | List                     | Page List            | Basic        | Base list for all lists                                                                     |
| Component           | Lists          |                     | List Nav                 | Navigation           | Mature       | Allow showing navigation Previous and Next articles on a Page part of a collection of pages |
| Component           | Lists          |                     | Location                 | Page List            | Intermediate | Creates a list using Location Details                                                       |
| Component           | Lists          |                     | News                     | Page List            | Intermediate | Creates a list using News Details                                                           |
| Component           | Lists          |                     | Page                     | Page List            | Basic        | Creates a list using Page Details                                                           |
| Component           | Lists          |                     | Search                   | Search               | Basic        | Allow showing Search Results on a page                                                      |
| Component           | Lists          |                     | Tag                      | Tag Lists            | Intermediate | Allows creating filter lists using Tags to filter lists in a page                           |
| Component           | Lists          |                     | Nav                      | Navigation           | Basic        | Creates navigation list for menus                                                           |
| Component           | Media          |                     | Audio                    | Assets on Page       | Mature       | Allows adding Audio from DAM to a Page                                                      |
| Component           | Media          |                     | Image                    | Assets on Page       | Basic        | Allows adding Image from DAM to a Page                                                      |
| Component           | Media          |                     | Video                    | Assets on Page       | Basic        | Allows adding Video from DAM to a Page                                                      |
| Component           | Analytics      |                     | DataLayer                | Analytics            | Basic        | Embeded into templates to create Data Layer javascript parameters for Analaytics            |
| Template            | Template       |                     | Base                     | Templates            | Basic        | Base template for all pages                                                                 |
| Template            | Template       | Cloud Config        | AddThis                  | Templates            | Intermediate | Could config template                                                                       |
| Template            | Template       | Cloud Config        | Google Analytics         | Templates            | Mature       | Could config template                                                                       |
| Template            | Template       | Cloud Config        | Google Map               | Templates            | Mature       | Could config template                                                                       |
| Template            | Template       | Column              | One                      | Templates            | Basic        | One column page layout                                                                      |
| Template            | Template       | Column              | Three                    | Templates            | Basic        | Two column page layout                                                                      |
| Template            | Template       | Column              | Two                      | Templates            | Basic        | Three column page layout                                                                    |
| Template            | Template       | Common              | Design Importer          | Templates            | Mature       | Allows importing of Whole Pages into page using a ZIP                                       |
| Template            | Template       | Experience Fragment | Base                     | Templates            | Basic        | Base template for Experience Fragments includes project ClientLibs                          |
| Component           | Widgets        | AddThis             | Sharebutton              | Social               | Basic        | Allow adding social share menu                                                              |
| Component           | Widgets        |                     | Online Media             | Social               | Basic        | Allow adding iFrames of widgets to external social media content                            |
| Component           | Widgets        |                     | Search                   | Search               | Basic        | Allow ability to add Search box to pages                                                    |
| Component           | Workflow       |                     | Process Payload          | Workflow Steps       | Basic        | Gathers information from Payload                                                            |
| Component           | Workflow       |                     | Project Task Manager     | Workflow Steps       | Mature       | Performs actions on tasks in AEM Project                                                    |
| Component           | Workflow       |                     | Project Update           | Workflow Steps       | Mature       | Updates AEM Project info                                                                    |
| Component           | Workflow       |                     | Rest                     | Workflow Steps       | Basic        | Used to trigger REST endpoint in workflows                                                  |
| Component           | Workflow       |                     | Salesforce API           | Workflow Steps       | Intermediate | Used to trigger Salesforce endpoints in workflows                                           |
| Component           | Workflow       |                     | Send Email               | Workflow Steps       | Basic        | Allow sending email to recipients in a workflow                                             |
| Authoring Component | Coral          | Common/Form         | Tag Field                | Authoring Dialogs    | Basic        | Based on OOTB tags wudget with Tenant support                                               |
| Authoring Component | Coral          | Datasources         | Forms                    | Authoring Dialogs    | Basic        | Creates a datasource for Autocomplete in Basic Form component                               |
| Authoring Component | Coral          | Datasources         | Tags                     | Authoring Dialogs    | Basic        | Used with Tag Field to present tenant content                                               |
| Authoring Component | Coral          | Foundation          | Accordion                | Authoring Dialogs    | Basic        | Based on OOTB component allowing hiding of Tabs in Coral Dialogs                            |
| Authoring Component | Coral          | Widgets/Form        | Asset Options            | Authoring Dialogs    | Basic        | Allow selecting Asset Rendtions per Media Query                                             |
 