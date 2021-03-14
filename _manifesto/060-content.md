---
title: "Content Modeling"
permalink: /manifesto/content/
excerpt: "Content Modeling has to be a first and foremost activity of any Feature/Capability planning"
modified: 2016-11-03T10:01:43-04:00
author: max@aem.design
redirect_from:
  - /manifesto/project/
---

{% include toc_sticky.html %}

Organisations that dedicate resources on planning and designing Content Management Practices within the core business at some point implement a Content Management System that support the Business Processes of managing content. So it is important to keep in mind that Business Process which is part of Business Architecture comes first and foremost, their implementation in a computer system such as a CMS comes second.

Please consider that information in this document is based on capabilities that are present in the AEM platform. This is done for a reason to simplify the understanding of the concepts, as each Capability and Functions with the Platform can be explored to derive exact business process that it's meant to support. During the process of exploration the business practitioners are able to build an understanding of Context of all features and how the apply to their business.

This document covers concepts in AEM that relate to Content Modeling and Information Management. AEM is Content Driven, which means that all activities within AEM revolve around content in its repository. This means that Content Modeling has to be a first and foremost activity of any Feature/Capability planning, as it will enable understanding of the content at the lowest level where it exist, and then enables planning of other higher level features that streamline and guide workflow for that content.

## Content Types

To be able to effectively plan content needs for a CMS it's important to segregate content into its high level Primary and Secondary content types. These content types should be used to describe business requirements and functions that needed by customers. Doing this from beginning enables a more specific context for Business and Technical analysis, as you are able understand impact on the content and derive any required updates to the Authoring experiences that link to those content types.

Primary content types are exposed to Authors and they are managed either directly or with help of additional experiences:

* **Pages** - a container for Authored content, **_NOTE:_** this is different from ALL other traditional CMS platforms as pages are actually hierarchical and do not have fixed structure
* **Assets** - assets and metadata including tags that is used in pages and products
* **Tags** - metadata tags used to enrich content
* **PIM** - products catalog


Primary content types are aimed at being Authored once into AEM and reused for multiple purposes. Reuse can be in a form of linking content types together such as adding a Tag to an Asset, or displaying an Asset on a Web Page. That ability of content Reuse comes from AEM Platform Components, that are added to enable different required perspectives.

Secondary content types that also equally important but vary in exposure Authors:

* **User** - metadata for a user, synchronisable with external systems
* **Designs** - UX static content and Template Component configurations
* **Cloud Configuration** - cloud services configurations
* **Workflows** - workflow designer

These content types are aimed at managed by specific group of Authors that have a deeper knowledge into the content and the integration nature of these types.

### Content Experiences

Each of the content types in AEM has a predefined experiences, these experiences are represented in Capabilities and Functions of the platform. Its important to understand and leverage existing capabilities as much as possible. 

![Content Experiences](/assets/images/manifesto/content-experiences.png)

These capabilities and function support a wide range of functions and customisations, additional customisation can be applied as a last resort.

1. Pages
    1. Multi-Site Manager (MSM)
    2. Social
    3. Apps
    4. Experience Fragments
2. Assets
    1. Assets - Digital Asset Management (DAM)
    2. Content Fragments - Reusable asset content
3. Tags
    1. Tag Management
4. Commerce
    1. Product Information Management (PIM)
5. Screens
    1. Screens Management
6. Forms
    1. Forms Management

AEM as a repository can be used to store any form of Content Type. Planning for these Content Types outside of AEM is critical for that contents proper usage and lifetime. It's important that content types are thought though from business usage and function perspective before touching AEM. Translation of Content Types into AEM will enable proper implementation and allow understanding of features and components of AEM platform that will support that Content Type.

## Primary Content

This section covers the primary content which is stored in AEM repository.

### Pages

AEM Sites provides all the necessary tools to content authors to create "Pages" that are targeted to be consumed by the end-users through a web browser. Fundamentally the act of authoring simply creates content structures that translate into visual designs developed by developers. Majority of the time a WYSIWYG approach is used to facilitate an inplace authoring workflow that enables a more realistic representation of target state to the Authors.

![image alt text](/assets/images/manifesto/content-sites-editor.png)

#### How to start authoring content early?

Content authoring for AEM can start early, and you can start doing this in a document even outside of AEM, then once templates are ready, you can move this content into pages. Better approach is to leverage Content Fragments, which would allow creating content in AEM and then add them into pages for presentation. This process is great for articles, news and general pages that do not have a high degree of metadata that you might not have explored yet.

To save rework, you want to start content authoring after you have discussed Unique Experiences and have understood their content requirements.

### Assets

Digital Asset Management refers largely at a practice of managing Assets. As a whole it's a combination of management practices and metadata content that is associated with an Asset. In AEM Images and Videos are the primary Assets in addition to other

![image alt text](/assets/images/manifesto/content-assets-list.png)

### Tags

Tags are a quick and easy method of classifying content within a website. They can be thought of as keywords or labels (metadata) that allow content to be more quickly found as the result of a search. OOTB in AEM tags can be added to Pages, Assets, User Generated content and in addition to this they feature in OOTB components to allow search and filtering of content for presentation.


[Tags](http://docs.adobe.com/docs/en/cq/current/wcm/tag_admin.html) must be used to classify content within CMS. Tags structured in namespaces provide a flexible and extendable layer when designing[ metadata](http://docs.adobe.com/docs/en/aem/6-0/administer/content/assets/metadata.html) for assets and content. The OOB components associated with Tags provide simple and effective authoring experience and should be used to drive Authoring Experience where Lists and Arbitrary Structures are required on dialogs. Management of Tags in AEM allows ability for the Business users to extend their content experience without needing to update code.

 ![image alt text](/assets/images/manifesto/content-tags-list.png)

Tags can be thought of a structured classification hierarchies that can be added to content metadata. For example if a tag for a Country Location is added to a group of Assets/Pages then a Authors can easily locate All Assets/Pages that belong to that particular Location when building Galleries or when creating list of Pages. Tags can be used by authors without explicit design, but it's recommended to perform an explicit Planning and Strategy activity to understand the long term growth of tags and their use across the whole Content Model.


### Screens

Screens allow you to deploy content to your digital signage location in physical spaces, leveraging all of the content in AEM.

![image alt text](/assets/images/manifesto/content-screens-list.png)

### Forms

Forms allow you to use powerful form authoring experience to create forms that meet not only simple but also complex requirements. 

![image alt text](/assets/images/manifesto/content-forms-list.png)

## Secondary Content

This section covers Secondary content that is stored in the repository, secondary content types are not not limited to this content.

### User

User profiles are one of the components that enable OOTB personalisation for End-Users. Ability to synchronize users from external sources enables Personalisation components to adjust Targeting and Pages content as required. User metadata can be stored to enable personalized output of content to end users.

![image alt text](/assets/images/manifesto/content-user-editor.png)

### Cloud Services

Cloud services is configuration content that is created and update by the admin authors to enable integration with cloud services. Cloud Services configurations enable interaction with services without

![image alt text](/assets/images/manifesto/content-cloudconfig-list.png)

## Metadata Experience

Structured metadata management with tags enables usage of Tags in all parts of Authoring experience. When tags are created they can be used to tag all Assets and can be used to search for those Assets and Pages when required.

### Tags

Tag management and authoring interface support multi-lingual translation and can be further extended to support additional metadata as needed. An example extension data point that can be added is creating Reference fields for Tags to enable specifying relevant Reference content that describes or details this Tag, an example would be linking an Airport Code tag to an Airport Information Page that has additional information for any component that requires more information about Airport. In this scenario new Attribute is a generic in nature and can be used for all tags as needed.

![image alt text](/assets/images/manifesto/content-tags-localization.png)

### Page

Each page has several metadata attributes that support OOTB functions. Majority of metadata is optional and is used only when needed. Page metadata can be extended to support additional configuration and its recommended to inherit OOTB page management tools to ensure new functions become available after upgrades.

![image alt text](/assets/images/manifesto/content-sites-page-metadata.png)

### Asset

Assets have extensive metadata configuration options, majority of the image associate metadata can be derived from images if its provided initially part of the image Metadata. Asset processing tools would scan the image for this data and automatically add it to the Asset. Metadata profiles management tool for assets can be used to configure the Authoring interface and metadata requirements for each different Asset type.

![image alt text](/assets/images/manifesto/content-assets-asset-metadata.png)


### Components

Primary input of content into AEM is done through Component Dialogs. These dialogs are configurable by developers and can be extended to provide a very rich authoring functionality. Several OOTB functions exist to enable a more simplified interaction with these dialogs. Dialogs exist in two distinctly unique modes Instance and Design. Component Instance dialog allows entry of content into the component and storing it in a Page. Component Design dialog allows storing of content initial values in the Design of a site specified part for the Page or Inherited from parent Page.

![image alt text](/assets/images/manifesto/content-sites-component-dialog.png)

### Designs

Designs provide an ability to segregate Designs from Content. Component Design content is persisted into Design content structure for each site. Site Design folder is created initially and contains all of the Static Content that is used to present a site to End-User. In addition to this Site Design contains configuration of the Authoring interface. Such as availability of Component on Templates and Component default values.

