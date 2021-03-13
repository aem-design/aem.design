---
title: "Component Modeling"
permalink: /manifesto/components/
excerpt: "Author focused component modeling will crucial process of establishing comprehensive language that will accelerate your delivery"
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

Planning and designing your functionality around Authoring component will ensure that you are not stuck in the tech debt remediation spiral that would lead to replatforming. Chances are you are replatfrom from another technical platform and change of perspective need to happen to ensure you can leverage AEM capabilities.

In AEM components should be understood from followgin perspectives:

* Authored Content - content that is input into component using component Dialog, default content added for a component in a template to enable default state as component is placed on a page, and component static values that ensure component operation without Authors input.
* Component Experience - how components content is used to create desired experience on pages and how component content is used in other components
* Component Data - how component data is contributing to overal data footprint of CMS, this follows [Rule #1: Data First, Structure Later. Maybe.](/archive/davids-model#rule-1-data-first-structure-later-maybe)
* Supporting Experiences

## Dialogs

Primary method of input of content into components is by interacting with component dialogs. Component dialogs are designed to prompt user for content.

#### Page Properties

![image alt text](/assets/images/manifesto/content-sites-page-dialog-metadata.png)

### Design Dialogs

For component to show in the Side Kick on a particular template they are first required to be added to the design of the template. This is done through design mode and required components are selected to be available to authors. Special Authoring privileges can be assigned to prevent unauthorised modification of Designs.

Design dialogs allow you to specify default values for components when they are dropped on a page. This helps to provide default options that help authors.

![image alt text](/assets/images/manifesto/content-sites-page-dialog-design.png)

## Supporting Experiences

Number of component supporting experiences provide patterns that are key to leveraging AEM capabilities and makeing authoring experience content driven.

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

* [MSM Best Practices](https://docs.adobe.com/content/help/en/experience-manager-65/administering/introduction/msm-best-practices.html)
* [Translation Best Practices](https://docs.adobe.com/content/help/en/experience-manager-65/administering/introduction/tc-bp.html)

