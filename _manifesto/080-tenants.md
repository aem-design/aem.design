---
title: "Tenant Content"
permalink: /manifesto/tenants/
excerpt: "Tenant approach must be used to ensure author can take advantage of AEM capabilities."
modified: 2016-11-03T10:01:43-04:00
author: max@aem.design
categories:
  - manifesto
tags:
  - guide
redirect_from:
  - /manifesto/project/
---

{% include toc_sticky.html %}

It's important when designing AEM implementation to plan and design all content and development to be tenant focused. Tenant focus in AEM allow understanding all of the needs to segregate and isolate content and experiences for a specific tenant. This means that from the start your content will be partitioned and enable future abilities to extend authoring experiences. Not doing this from the start will limit the opportunities for the platform to provide best experience.

## Sites

Sites is the primary containers of content, they allow creation of content structures so that they can be present to End-users and reused in other pages. All content created under sites is targeted to be consumed by end-user. Sites enable ability to create replicate content as reusable structure and facilitate Multi-lingual content structures that are managed through translation services or manual language translations.

![image alt text](/assets/images/manifesto/content-sites-list.png)

## **Languages**

AEM is a Multi-Language aware CMS and has numerous tools that support Localisation of Language content for Sites. OOTB these tools are dependent on Site content to have particular structure for proper operation and as a best practice principles. Primary tools that are dependant on Locale are Blueprints and Language-Copy functions. Guiding principle of creating sites is that Root Level of the site has siblings of all the available Languages for the content of that site. Content is authored in one of the languages and Language-Copy tool is used to copy and initiate translation of that page into target Languages.

![image alt text](/assets/images/manifesto/content-localization-list.png)

## Blueprints

Ability to create sites from existing Site Structure Templates and provide an ability to link and keep in sync the target site content. In addition to this they provide an ability to chose Languages and Starting content that should be copied from the Template reference.

![image alt text](/assets/images/manifesto/content-sites-blueprint.png)

### Blueprints Language Requirement

Unlike Language-Copy tools, Blueprints require to have a site structure to have a language subfolder to be one level under the site root. The Name on of the Language folder needs to be in the format of `<language-code>` or `<language-code>_<country-code>`, for example `en, en_US, en_us, en_GB, en_gb`

- The supported language code is lower-case, two-letter code as defined by ISO-639-1
- The supported country code is lower-case or upper-case, two-letter code as defined by ISO 3166

![image alt text](/assets/images/manifesto/content-sites-blueprint-languages.png)

Not having this pattern configuration on your site will not allow Blueprints to detect languages of your site.

## Design Importer

When using Landing pages in AEM a Design Importer mechanism can be used to import a design into the current page. Design Importer mechanism provides a structured way external designers can create Designs for landing pages that then can be imported into AEM.

![image alt text](/assets/images/manifesto/content-design-importer.png)

More Info :[ AEM Landing Pages](https://docs.adobe.com/docs/en/aem/6-3/author/personalization/campaigns/landingpages.html) and[ Extending and Configuring the Design Importer for Landing Pages](http://docs.adobe.com/docs/en/aem/6-3/administer/personalization/campaigns/extending-the-design-importer-for-landingpages.html)
