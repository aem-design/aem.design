---
title: "Content Modeling"
permalink: /manifesto/content/
excerpt: "Content Modeling has to be a first and foremost activity of any Feature/Capability planning"
modified: 2016-11-03T10:01:43-04:00
redirect_from:
  - /manifesto/project/
---

{% include toc %}

Organisations that dedicate resources on planning and designing Content Management Practices within the core business at some point implement a Content Management System that support the Business Processes of managing content. So it is important to keep in mind that Business Process which is part of Business Architecture comes first and foremost, their implementation in a computer system such as a CMS comes second.

Please consider that information in this document is based on capabilities that are present in the AEM platform. This is done for a reason to simplify the understanding of the concepts, as each Capability and Functions with the Platform can be explored to derive exact business process that it's meant to support. During the process of exploration the business practitioners are able to build an understanding of Context of all features and how the apply to their business.

This document covers concepts in AEM that relate to Content Modeling and Information Management. AEM is Content Driven, which means that all activities within AEM revolve around content in its repository. This means that Content Modeling has to be a first and foremost activity of any Feature/Capability planning, as it will enable understanding of the content at the lowest level where it exist, and then enables planning of other higher level features that streamline and guide workflow for that content.

## Content Types

To be able to effectively plan content needs for a CMS it's important to segregate content into its high level Primary and Secondary content types. These content types should be used to describe business requirements and functions that needed by customers. Doing this from beginning enables a more specific context for Business and Technical analysis, as you are able understand impact on the content and derive any required updates to the Authoring experiences that link to those content types.

Primary content types are exposed to Authors and they are managed either directly or with help of additional experiences:

●      **Pages** - a container for Authored content, **_NOTE:_*** this is different from ALL other traditional CMS platforms*

●      **Assets** - assets and metadata including tags that is used in pages and products

●      **Tags** - metadata tags used to enrich content

●      **PIM** - products catalog



Primary content types are aimed at being Authored once into AEM and reused for multiple purposes. Reuse can be in a form of linking content types together such as adding a Tag to an Asset, or displaying an Asset on a Web Page. That ability of content Reuse comes from AEM Platform Components, that are added to enable different required perspectives.



Secondary content types that also equally important but vary in exposure Authors:

●      **User** - metadata for a user, synchronisable with external systems

●      **Designs** - UX static content and Template Component configurations

●      **Cloud Configuration** - cloud services configurations

●      **Workflows** - workflow designer



These content types are aimed at managed by Specific group of Authors that have a deeper knowledge into the content and the integration nature of these types.

### Content Experiences

Each of the content types in AEM has a predefined experiences, these experiences are represented in Capabilities and Functions of the platform. Its important to understand and leverage existing capabilities as much as possible. These capabilities and function support a wide range of functions and customisations, additional customisation can be applied as a last resort.

1. Pages

    1. Multi-Site Manager (MSM)

    2. Social

    3. Apps

2. Assets

    4. Assets - Digital Asset Management (DAM)

    5. Publications

    6. Content Fragments - Reusable asset content

3. Tags

    7. Tag Management

4. Commerce

    8. Product Information Management (PIM)

5. Screens

    9. Screens Management

6. Forms

    10. Forms Management

AEM as a repository can be used to store any form of Content Type. Planning for these Content Types outside of AEM is critical for that contents proper usage and lifetime. It's important that content types are thought though from business usage and function perspective before touching AEM. Translation of Content Types into AEM will enable proper implementation and allow understanding of features and components of AEM platform that will support that Content Type.

## Primary Content

This section covers the primary content which is stored in AEM repository.

### Pages

AEM Sites provides all the necessary tools to content authors to create "Pages" that are targeted to be consumed by the end-users through a web browser. Fundamentally the act of authoring simply creates content structures that translate into visual designs developed by developers. Majority of the time a WYSIWYG approach is used to facilitate an inplace authoring workflow that enables a more realistic representation of target state to the Authors.

![image alt text](/assets/images/manifesto/content-sites-editor.png)

### Assets

Digital Asset Management refers largely at a practice of managing Assets. As a whole it's a combination of management practices and metadata content that is associated with an Asset. In AEM Images and Videos are the primary Assets in addition to other

![image alt text](/assets/images/manifesto/content-assets-list.png)

### Tags

Tags are a quick and easy method of classifying content within a website. They can be thought of as keywords or labels (metadata) that allow content to be more quickly found as the result of a search. OOTB in AEM tags can be added to Pages, Assets, User Generated content and in addition to this they feature in OOTB components to allow search and filtering of content for presentation.


[Tags](http://docs.adobe.com/docs/en/cq/current/wcm/tag_admin.html) must be used to classify content within CMS. Tags structured in namespaces provide a flexible and extendable layer when designing[ metadata](http://docs.adobe.com/docs/en/aem/6-0/administer/content/assets/metadata.html) for assets and content. The OOB components associated with Tags provide simple and effective authoring experience and should be used to drive Authoring Experience where Lists and Arbitrary Structures are required on dialogs. Management of Tags in AEM allows ability for the Business users to extend their content experience without needing to update code.

 ![image alt text](/assets/images/manifesto/content-tags-list.png)

Tags can be thought of a structured classification hierarchies that can be added to content metadata. For example if a tag for a Country Location is added to a group of Assets/Pages then a Authors can easily locate All Assets/Pages that belong to that particular Location when building Galleries or when creating list of Pages. Tags can be used by authors without explicit design, but it's recommended to perform an explicit Planning and Strategy activity to understand the long term growth of tags and their use across the whole Content Model.

### Apps

![image alt text](/assets/images/manifesto/content-apps-list.png)

### Screens

![image alt text](/assets/images/manifesto/content-screens-list.png)

### Forms

![image alt text](/assets/images/manifesto/content-forms-list.png)


### Commerce - PIM

Commerce content can be synced from an external e-Commerce platform such as Hybris and enable its usage in the sites.

![image alt text](/assets/images/manifesto/content-commerce-list.png)

## Secondary Content

This section covers Secondary content that is stored in the repository, secondary content types are not not limited to this content.

### Dictionaries

In AEM, Dictionaries Capabilities provides Author and developers with set of functions that can be used to manage static labels and text in AEM UI and Custom Components. Primary function of dictionaries to enable Translations of Static Labels, which is done through a[ Dictionary Translator Tool](https://docs.adobe.com/docs/en/aem/6-1/develop/components/i18n/translator.html).

![image alt text](/assets/images/manifesto/content-dictionaries-editor.png)

### User

User profiles are one of the components that enable OOTB personalisation for End-Users. Ability to synchronize users from external sources enables Personalisation components to adjust Targeting and Pages content as required. User metadata can be stored to enable personalized output of content to end users.

![image alt text](/assets/images/manifesto/content-user-editor.png)



### Cloud Services

Cloud services is configuration content that is created and update by the admin authors to enable integration with cloud services. Cloud Services configurations enable interaction with services without

![image alt text](/assets/images/manifesto/content-cloudconfig-list.png)

## Multi Site Manager

### Sites

Sites is the primary containers of content, they allow creation of content structures so that they can be present to End-users and reused in other pages. All content created under sites is targeted to be consumed by end-user. Sites enable ability to create replicate content as reusable structure and facilitate Multi-lingual content structures that are managed through translation services or through manual language translations.

 ![image alt text](/assets/images/manifesto/content-sites-list.png)

### **Languages**

AEM is a Multi-Language aware CMS and has numerous tools that support Localisation of Language content for Sites. OOTB these tools are dependent on Site content to have particular structure for proper operation and as a best practice principles. Primary tools that are dependant on Locale are Blueprints and Language-Copy functions. Guiding principle of creating sites is that Root Level of the site has siblings of all the available Languages for the content of that site. Content is authored in one of the languages and Language-Copy tool is used to copy and initiate translation of that page into target Languages.



![image alt text](/assets/images/manifesto/content-localization-list.png)

### Micro-Sites - Communities

[AEM Communities](https://docs.adobe.com/docs/en/aem/6-1/develop/communities.html) simplifies the creation and customizaton of community features such as forums, blogs, Q&A, calendars, comments, reviews, voting, and ratings. AEM introduced a[ Social Component Framework (SCF)](https://docs.adobe.com/docs/en/aem/6-1/develop/communities/scf.html) that provided structure for creating pre built templates that in turn enable rapid development of themes and functionality for Community type sites.

![image alt text](/assets/images/manifesto/content-communities-list.png)

### Micro-Sites - Blog (Depreciated)

A Blog Experience sample site is provided part of the Sample content with AEM. This experience covers a creation of sample Blog listing, entry creation and blog help tools. This sample content can be used as a reference or adaptation into blog sites.

![image alt text](/assets/images/manifesto/content-sites-blog.png)

#### Blog Entry

Blog Experience is based on Blog Posting and Blog Entry experiences, whereby creation of Blog Entries creates a Data Segmented hierarchy of content which is then resurfaced by the Blog Listing page.

![image alt text](/assets/images/manifesto/content-sites-blog-entry.png)

### Blueprints

Ability to create sites from existing Site Structure Templates and provide an ability to link and keep in sync the target site content. In addition to this they provide an ability to chose Languages and Starting content that should be copied from the Template reference.

![image alt text](/assets/images/manifesto/content-sites-blueprint.png)

#### Blueprints Language Requirement

Unlike Language-Copy tools, Blueprints require to have a site structure to have a language subfolder to be one level under the site root. The Name on of the Language folder needs to be in the format of <language-code> or <language-code>_<country-code>, for example en, en_US, en_us, en_GB, en_gb



●      The supported language code is lower-case, two-letter code as defined by ISO-639-1

●      The supported country code is lower-case or upper-case, two-letter code as defined by ISO 3166

![image alt text](/assets/images/manifesto/content-sites-blueprint-languages.png)



Not having this pattern configuration on your site will not allow Blueprints to detect languages of your site.

### Scaffolds

[Scaffolding](http://dev.day.com/docs/en/cq/current/wcm/scaffolding.html) should be used to streamline authoring experience of particular pages. It should be used to create authoring experiences for creating and updating content. A scaffold is a dialog, that is made up of limited fields that are tailored for that particular authoring experience requirements.



Scaffold provide an ability to provide a Summary authoring experience without limiting locking the ability to customise page if required, as would be with having a Page template document that forces a particular page structure. Scaffolds are exposed to the authors either though editing tools or can be explicitly served through guided process.



#### New UI - Scaffold

![image alt text](/assets/images/manifesto/content-sites-scaffold.png)

#### New UI - Compatibility more for Scaffolds that have not been converted

![image alt text](/assets/images/manifesto/content-sites-scaffold-classic-compatibility.png)

#### Classic UI - Classic scaffolds can be access from the sidekick

![image alt text](/assets/images/manifesto/content-sites-scaffold-classic.png)

### Campaigns (Depreciated)

Existing Campaigns Management in AEM is being depreciated in favor of Adobe Campaign platform that has an extensive feature set and integration capabilities.

![image alt text](/assets/images/manifesto/content-campaigns.png)

Campaign management provides digital marketers the opportunity to deliver personalized content and so create dedicated experiences for visitors.

It allows you to orchestrate your marketing campaigns across the web, email and mobile services and so engage your visitors. You can create content, segment visitors, push and promote targeted content for specific user profiles and manage campaigns across multiple channels.

Overall Experiences that AEM Supports

* Brands - In CQ, brands are the top level unit and form a collection of Campaigns.

* Campaigns - A campaign is a collection of individual Experiences.

* Experiences - The focused content forms the various experiences, presented to the visitor at Touchpoints. There are several types of experience available:

* Teasers - Teaser Pages / Paragraphs are used to steer specific visitor Segments to content that is focused on their interests. Teaser pages present a range of options for the visitor to choose from, show only one teaser paragraph that is based on the specific visitor segment; for example, the teaser paragraph shown may be dependent on the age of the visitor. Typically a teaser page is a temporary action that will last for a specific period of time, until it is replaced by the next teaser page.

* Newsletters - E-mail Communications are used to engage users and encourage them to visit your web site. These usually take the form of a newsletter, sent to your Leads (which are usually grouped into Lists).

* Test&Target - This allows integration with Adobe's Test&Target which gives marketers a conversion website optimization tool with the necessary capabilities to continually make their online content and offers more relevant to their customers—yielding greater conversion. Test&Target provides an intuitive interface for designing and executing tests, creating audience segments and targeting content—all from a single application.

* Touchpoints - These are the points of contact between the visitor and your campaign. The touchpoints are connected to the experiences that you have created. For example, for teasers it is the content page where the teaser paragraph is located, for a newsletter it is the mailing list.

* Leads - The information that you have collected about your visitors and how to contact them forms the basis for your leads.

* Lists - Leads are usually grouped into lists so that you can take collective action on them.

* Segments - Site visitors have different interests and objectives when they come to a site. Analyzing this according to factors such as activity on the website, profile information registered and activity on other websites, helps you to define segments. Content can then be specifically targeted to the visitor's needs and interests according to the segment(s) they match.

### Email Authoring

Campaign authoring tools enable creation of Email templates and enable integration with External Mail services such as SIlverpop. Email can be authored in AEM and published into existing  EMail Campaign management platforms, in addition to this content from AEM can be reused by external tool directly from AEM, for example partial page content can be reuse from pages that use Components.

![image alt text](/assets/images/manifesto/content-campaigns-email-authoring.png)

### Design Importer

When using Landing pages in AEM a Design Importer mechanism can be used to import a design into the current page. Design Importer mechanism provides a structured way external designers can create Designs for landing pages that then can be imported into AEM.

![image alt text](/assets/images/manifesto/content-design-importer.png)

More Info :[ AEM Landing Pages](https://docs.adobe.com/docs/en/aem/6-1/author/personalization/campaigns/landingpages.html) and[ Extending and Configuring the Design Importer for Landing Pages](http://docs.adobe.com/docs/en/aem/6-1/administer/personalization/campaigns/extending-the-design-importer-for-landingpages.html)



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

## Components

### Interfaces

AEM comes with two primary interface types New UI and Classic UI. New UI refers to mobile friendly responsive UI Framework that is consistently used across all Adobe Marketing Cloud products.  Classic UI refers to the original AEM/CQ interface. Latest version of AEM have migrated majority of Classic UI feature into New UI and provide a much more comprehensive and simpler to use Authoring Experience to authors. Classic UI can still be accessed from New UI and still has several advanced features that required to be used by Advanced Authors.

#### New UI - Also know as Touch UI, Granite UI and Coral UI

![image alt text](/assets/images/manifesto/content-project-list.png)

#### Classic UI - Build with Sencha JS framework

![image alt text](/assets/images/manifesto/content-project-list-classic.png)

### Dialogs

As AEM has two distinct UI experiences, each Component and Interface has two individual interfaces. Classic dialogs can be migrated to New UI either through Conversion Tool or manually build to support only specific functions. Both interfaces have distinct features and behaviours, New UI has been developed with simplicity in mind.



Related:[ Dialog Conversion Tool](http://docs.adobe.com/docs/en/aem/6-1/develop/dev-tools/dialog-conversion.html)

#### New UI - Page Properties

![image alt text](/assets/images/manifesto/content-sites-page-dialog-metadata.png)

#### Classic UI - Page Properties

![image alt text](/assets/images/manifesto/content-sites-page-dialog-metadata-classic.png)

### Design Dialogs

For component to show in the Side Kick on a particular template they are first required to be added to the design of the template. This is done through design mode and required components are selected to be available to authors. Special Authoring privileges can be assigned to prevent unauthorised modification of Designs.

#### New UI - Design Dialog

![image alt text](/assets/images/manifesto/content-sites-page-dialog-design.png)

#### Classic UI - Design Dialog

![image alt text](/assets/images/manifesto/content-sites-page-dialog-design-classic.png)

### Translations

AEM supports both Manual and Automated translation of content. For checking and initiating translation a Language Copy function is used with a workflow if automation is required.

#### Language Copies

Language copies allow copying a particular version of a page from one Language into Another and provide assistance of starting a workflow for translation. As well as provide visual list of existing copies of selected page in different languages.

![image alt text](/assets/images/manifesto/content-sites-languagecopy.png)

#### Create Translation

When creating a translation of a page a workflow can be triggered to either notify another person to conduct a Manual translation or have an external Automated script to perform initial translation.

![image alt text](/assets/images/manifesto/content-sites-translations-create.png)

#### Translation Projects

New functionality in AEM enables better status reporting on translation progress for all pages. A translation project is created to which page all required translations are assigned, progress of all workflows per pages is reflected on dashboard.

![image alt text](/assets/images/manifesto/content-sites-translations-project.png)

#### Custom or Legacy

##### Human and Machine

AEM supports human and machine translation workflows. To automate translation workflows, you integrate translation service providers with AEM and create projects for translating content into multiple languages. These project provide you with a dashboard that allow you to keep track of the progress of translation.

* Human translation: Content is sent to your translation provider and translated by professional translators. When complete, the translated content is returned and imported into AEM. When your translation provider is integrated with AEM, content is automatically sent between AEM and the translation provider.

* Machine translation: The machine translation service immediately translates your content.

##### Human Translation

###### Side-By-Side

When AEM is exposed to Translation providers for Human Translation it Side-By-Side view of pages enables much better context sensitive translation, which increases quality of translation.

![image alt text](/assets/images/manifesto/content-sites-page-side-by-side.png)

### Content Best Practices

References

* [MSM Best Practices](https://docs.adobe.com/docs/en/aem/6-2/administer/sites/msm/msm-bp.html)

* [Translation Best Practices](https://docs.adobe.com/docs/en/aem/6-2/administer/sites/translation/tc-bp.html)


## Content Migration

*Content Migration all of the processes that take place outside of AEM to create a Content Package that is subsequently imported into AEM.*

Migration of content into AEM can be done in many ways. Some methods require more effort than other. The best effort is spent creating your site and not put too much development overhead on developing repeatable code for migration purpose as its a one off exercise. Simplest of all methods is a Content Transformation flow of Source Data to JCR Content hierarchy. Process of creating a transformation of Source Data to JCR Content hierarchy is straightforward, auditable and can be rolled back easily, as you are effectively installing content using normal content package. This process allows repeatability of whole process without very low overhead. Once the pattern for one content type is developed then all content can be migrated same way with little effort.

The overall data migration process is as follows:

![image alt text](/assets/images/manifesto/content-migration.png)

This process can be adjusted to suit your needs. The fundamental is to keep this simple and iterate through the process as quick as possible.

## Content Import

*Content Import all of the processes that take place to create a Content Package that is subsequently imported into AEM.*

It's important that all content that is imported into AEM can be rolled-back easily or can be overridden by authors if needed. Exceptions to this can fall into Commerce implementation and Cloud Asset services which become source of truth for content that is being imported. Fundamentally if content is imported from Origin System there should be a way to update and rollback by author and the importing process. When building AEM Hosted Service approach session blocking for content updates on large scale would create content consistence complications. Using same approach on dedicated services would create a redundant licensing. If these are not of concern then the Dedicated Server that imports and replicates content can be used ensuring that component that is imported does not replace any overridden content, this can be effectively done by writing components that update attributes as if it's a language translations. This means that attribute value that has not been translated to EN does not have an override specified by the user. For example if data imported it written to a field "text" for a particular component then the if a user has decided to override new attribute would be created “text.en” this will enable the processes that update the content to update from source system without worrying about overriding content in AEM.

## Content and SEO

How does content created during Authoring is Structured and Surfaced to ensure its SEO friendly? These day and age Google does a reasonable job of ensuring and filtering content from a page. But as always there are lots of ways this can be viewed. Measuring SEO has always been an interesting concept and concentrating on providing proper structured content will always work better now and in long term.

Primary guideline is to ensure that the meaning a URL conveys is represented in its content. This means that URL should as a whole be a summary of page content, for example one should expect that URL file name and title of the page should be similar. And for segmented content the date of article and its categorisation should also be derived from metadata visible on the page.

## Deployment Practices

To be able to support CI/CD practice automation should used to minimise deployment overheads and avoid conflicts. When segregating infrastructure and security, production artifacts and environments should be replicated to other environments so that its configurations can be tested throughout normal development cycles. Practices must be continually refactored to be simple and transparent so that they can be used without manual intervention. It's important to utilise same practices across all environments without exceptions, this ensures continuous improvement on practices as they are used by wider group of users.

![image alt text](/assets/images/manifesto/content-deployment-practice.png)

The whole environment should be able to be replicated in different configurations in a local environment. Using Docker and Ansible for streamlining the deployment architecture and inventory enable consistency of environment and enables persistence of operations functions.

General practice is to only allow System Console and Package Installation in Local Dev environment. This practice ensures that all efforts to update a node a persisted into Code and do not create conflict of the Node configuration state.

### Package Deployment and Replication

Packages should be used to deploy system content and for bulk content operations (backup, archive, migration etc). Replication should be used to replicate content by authors during normal operations.

It's important that package can be installed and uninstalled from a node. This is to ensure that update by the package can be rolled back in cases where testing has failed. Replicating packages from one node to another removes ability to Uninstall the package from the target node. Additionally replication of a package does not allow for additional processes to be carried out on the node during a deployment process.

### Deployment Cycle

Deployment cycle is deployment steps that run automatically triggered by Code updates by developers or triggered manually or automatically by other jobs. The cycle is divided into Build and Deploy Stages. Build stage is used to respond to Code updates and carry out subsequent build processes and artifact storage. Deploy Stage is used for Deploying a particular versioned artifact to an environment.

#### Build Stage

1. Commit - Developer commits code to Repository

2. Pull - Jenkins monitors updates and pulls code into workspace

3. Build - Jenkins build the code using a Docker Container

4. Store - on successful build artifact is stored in Nexus

#### Deploy Stage

5. Retrieve - Jenkins deploy job retrieves a package from Nexus into workspace

6. Deploy - Jenkins deploys package to target Node

7. Test - Jenkins runs Testing job for the target Node

8. Push - Push project version update to repo

9. Cache - Optional, if docker containers are updated then containers is cached in shared docker registry

![image alt text](/assets/images/manifesto/content-deployment-cycle.png)
