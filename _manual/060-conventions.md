---
title: "Conventions"
permalink: /manual/conventions/
author: yaw@aem.design
editor: max@aem.design
comments: true
redirect_from:
  - /manual/process/
categories:
  - info
tags:
  - docs
---

{% include toc_sticky.html %}

## Philosophy for Conventions
but I was hoping for something that described the philosophy and conventions (E.G. The component naming structure, usage of tags and variants, how it designed to empower frontend developers rather than require specialised AEM developers)

Emhasis on Content - ensure that as much structure that required is converted into content so that its changable post deployment. This is following [Davids #1 Rule](/archive/davids-model#rule-1-data-first-structure-later-maybe).
Abstract AEM Knoweldge - generalise and abstract AEM specific knowledge into patterns that other developers can use without immidiatly needing to understand underlying principles.  
Component Grouping and Naming - components should be names in the relation to their content and AEM purpouse, and not in relation to their end usage
Component Variants - ability to represent different structures of component content

## Component Grouping

All components used by authors without exception must be located in their designated component group folders, this is identified in the respective Component Spec.

```
components
    layout (component group)
        article
```

## Component Structure

All component must follow consistent patterns that help everyone to understand consistency across components. Following is the conventions that are used for components

| Node                  | Purpouse                                                                                | Usercase  | Extension |
|-----------------------|-----------------------------------------------------------------------------------------|-----------|-----------|
| _cq_design_dalog      | Authoring dialog that will be used to configure component                               | mandatory | xml       |
| _cq_design            | Primary Authoring fo interacting with component properties                              | mandatory | xml       |
| .content.xml          | component authoring metadata                                                            | mandatory | xml       |
| _cq_editConfig.xml    | component authoring configuration for Editor UI                                         | mandatory | xml       |
| README.md             | readme describing the component which is viewed in the Components Experience in AEM     | mandatory | md        |
| variant.default.<EXT> | default template for display                                                            | mandatory | jsp,html  |
| component.<EXT>       | default boostrap of component                                                           | mandatory | jsp,html  |
| badge.default.<EXT>   | default badge to be used by other components for representing current component content | optional  | jsp,html  |

## Component Client Libs Namespace Convention

Components that have specific clientlibs should have following client libs assigned if they will be loaded by clientlibs in template footer and headers.

Paths of component namespace should be following the location of the component path eg <tenant>.components.<group>.<subfolder>.<component name> with <subfolder> repeating for each subfolder leading up to component folder.

| Namespace                            | Purpose                                                                                                      |
|--------------------------------------|--------------------------------------------------------------------------------------------------------------|
| <tenant>.components.author           | specifies that this component library should be loaded into global authoring clientlibs                      |
| <tenant>.components.publish          | specifies that this component library should be loaded into global publish clientlibs                        |
| <tenant>.components.<component name> | specific group for the component to be used for specific usage such as component loading its own client libs |


## Component Versioning
Initialy when component is written its acceptable to have the component code to be located under its folder path.

```
components
    layout
        article
            <component structure>
```

Where possible initial component structure should be located in the v1 subfolder, this will also ensure that evolution of component will require marginaly less effort.

```
components
    layout
        article ( sling:resourceSuperType → v1/article )
            v1
                <component structure>
```

As component is evolves into a versions a subfolders under the component path should be used to separate component code and component path should be pointed to the specific version all existing references of component should be using. 

```
components
    layout
        article ( sling:resourceSuperType → v2/article )
            v1
                article
            v2
                article
```

This will ensure that all existing pages will continue working as expected.


## Component Client Libs Modules
Component generic client libs should to be located in the component folder

```
components
    layout
        article
            clientlibs (version agnostic client libs)
                css/
                js/
                css.txt
                js.txt
            v1
                article 
                clientlibs (version specific client libs) 
                <component structure>
            v2
                article
                clientlibs (version specific client libs) 
                <component structure>
```

## JSP Component Template

For ease of understanding component code following sections should be used as reference

| LABEL                          | Description                     |
|--------------------------------|---------------------------------|
| *** COMPONENT DEPENDECIES ***  | used for describing dependecies |
| *** COMPONENT DECLARATIONS *** |                                 |
| *** COMPONENT LOGIC ***        |                                 |
| *** COMPONENT TEMPLATING ***   |                                 |

Following is a sample for component bootrstap, please remove annotations when using as template.

```jsp
*** COMPONENT DEPENDECIES ***
<%@ page import="com.google.common.base.Throwables" %>
<%@ include file="/apps/aemdesign/global/global.jsp" %>
<%@ include file="/apps/aemdesign/global/images.jsp" %>
<%@ include file="/apps/aemdesign/global/components.jsp" %>
<%
*** COMPONENT DECLARATIONS ***
 
    final String DEFAULT_ARIA_ROLE = "article";
 
    // {
    //   1 required - property name,
    //   2 required - default value,
    //   3 optional - name of component attribute to add value into
    //   4 optional - canonical name of class for handling multivalues, String or Tag
    // }
    Object[][] componentFields = {
        {FIELD_ARIA_ROLE,DEFAULT_ARIA_ROLE, DEFAULT_ARIA_ROLE_ATTRIBUTE},
        {FIELD_VARIANT, DEFAULT_VARIANT},
    };
 
    ComponentProperties componentProperties = getComponentProperties(
            pageContext,
            componentFields,
            DEFAULT_FIELDS_STYLE,
            DEFAULT_FIELDS_ACCESSIBILITY);
 
*** COMPONENT LOGIC ***
    componentProperties.put(DEFAULT_BACKGROUND_IMAGE_NODE_NAME,getBackgroundImageRenditions(pageContext));
 
%>
*** COMPONENT TEMPLATING ***
<c:set var="componentProperties" value="<%= componentProperties %>"/>
<%@ include file="/apps/aemdesign/global/component-background.jsp" %>
<c:choose>
    <c:when test="${componentProperties.variant eq DEFAULT_VARIANT}">
        <%@ include file="variant.default.jsp" %>
    </c:when>
    <c:otherwise>
        <%@ include file="variant.default.jsp" %>
    </c:otherwise>
</c:choose>
<%@include file="/apps/aemdesign/global/component-badge.jsp" %>

```

## HTL Component Template

Following is a sample for component bootrstap

```html
<sly data-sly-use.component="design.aem.models.v2.layout.Article"
     data-sly-use.variant="${component.componentProperties.variantTemplate}"
     data-sly-use.background="aemdesign/global/templates/component-background.html"
     data-sly-use.info="aemdesign/global/templates/component-info.html">
 
    <!--/* print component background */-->
    <sly data-sly-call="${background.variant @ componentId=component.componentProperties.componentId, assets=component.componentProperties.bgimage.componentBackgroundAssets}"></sly>
 
    <!--/* print component variant */-->
    <sly data-sly-call="${variant.variant @ componentProperties=component.componentProperties}"></sly>
 
    <!--/* print component info in edit mode */-->
    <sly data-sly-call="${info.variant @ componentProperties=component.componentProperties, component=component}"></sly>
 
</sly>
```

## HTL Component WCMUsePojo Class

Following is a reference for component Class that will be backing each HTL component


```java
package design.aem.models.v2.details;
 
import com.adobe.cq.sightly.WCMUsePojo;
import design.aem.components.ComponentProperties;
import design.aem.utils.components.TagUtil;
import com.day.cq.i18n.I18n;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
public class PageDetails extends WCMUsePojo {
 
    private static final Logger LOGGER = LoggerFactory.getLogger(PageDetails.class);
 
    private ComponentProperties componentProperties = null;
    public ComponentProperties getComponentProperties() {
        return this.componentProperties;
    }
     
    @Override
    public void activate() throws Exception {
         
        com.day.cq.i18n.I18n _i18n = new I18n(getRequest());
 
        //COMPONENT STYLES
        // {
        //   1 required - property name,
        //   2 required - default value,
        //   3 optional - name of component attribute to add value into
        //   4 optional - canonical name of class for handling multivalues, String or Tag
        // }
        Object[][] componentFields = {
            {FIELD_VARIANT, DEFAULT_VARIANT},
        };
        componentProperties = ComponentsUtil.getComponentProperties(
            this,
            componentFields,
            DEFAULT_FIELDS_STYLE,
            DEFAULT_FIELDS_ACCESSIBILITY,
            DEFAULT_FIELDS_ANALYTICS
        );
         
    }
}

```


## ClientLibs Convention - JavaScript 

When writing component specific API code in Java script pelase ensure you encapsulating namespacing that does not direclty depend on external dependecies.

JavaScript for all Component JavaScript code must be divided into:

# functions.js - component functions API, has all of the required static utility functions that will be used by component behaviours. These should only be functions and should not be binding to elements of the page on load events.
# behaviour.js - component binding API, has all of the load events and binding to HTML, uses functions to help with structure and reusable config as required. This should be the main file that demonstrates how component is being boudn to the code.

JS modules should be located as following

```
components
    layout
        article
            clientlibs (version agnostic client libs)
                css/
                js/
                    functions.js
                    behaviour.js
                css.txt
                js.txt
```

Following is an example of a function used for component.

```javascript
//search - functions
window.AEMDESIGN = window.AEMDESIGN || {"jQuery":{}};
window.AEMDESIGN.components = AEMDESIGN.components || {};
window.AEMDESIGN.components.search = AEMDESIGN.components.search || {};
 
(function ($, _, ko, log, utils, ns, window, undefined) { //NOSONAR convention for wrapping all modules
 
    "use strict";
    var _version = "0.1";
 
    ns.version = function () {
        return _version;
    };
 
    ns.init = function($el) {
        //INIT CODE
    };
 
})(AEMDESIGN.jQuery,_,ko, AEMDESIGN.log, AEMDESIGN.utils, AEMDESIGN.components.search, this);
```

Following is an example of a behaviours used for component.

```javascript
//search - behaviour
window.AEMDESIGN = window.AEMDESIGN || {"jQuery":{}};
window.AEMDESIGN.components = AEMDESIGN.components || {};
window.AEMDESIGN.components.search = AEMDESIGN.components.search || {};
 
(function ($, _, ko, utils, log, search, window, undefined) { //NOSONAR convention for wrapping all modules
 
    $(document).ready(function () {
 
        $("[data-modules*='search']").each(function() {
 
            var base = $(this);
 
            search.init(base);
 
 
        });
 
 
    });
 
})(AEMDESIGN.jQuery, _, ko, AEMDESIGN.utils, AEMDESIGN.log, AEMDESIGN.components.search, this); //pass in additional dependencies
```

## ClientLibs Convention - CSS

When writing CSS ensure that component Styles are added under component namespace. Here is an example

```javascript
[component] .<component name> {
}
```

# Dialog Conventions

Common Tabs for all component - use shared dialogs

```html
<styleTab
    jcr:primaryType="nt:unstructured"
    jcr:title="Style"
    path="/apps/aemdesign/global/dialog/touch/style/content/items/styleTab"
    resourceType="granite/ui/components/foundation/section"
    sling:resourceType="granite/ui/components/coral/foundation/include"/>
```

Use Tags as source for your Dropdowns - will ensure that content can be updated later

```html
<cancelinheritparent
    jcr:primaryType="nt:unstructured"
    sling:resourceType="granite/ui/components/coral/foundation/form/select"
    fieldLabel="Cancel Inherit Parent"
    name="./cancelInheritParent"
    emptyOption="{Boolean}true"
    value="">
    <datasource
        jcr:primaryType="nt:unstructured"
        sling:resourceType="aemdesign/components/coral/datasources/tags"
        variant="valuelist"
        path="/content/cq:tags/${(empty tenant.id and empty tenantId) ? 'aemdesign' : (empty tenant.id ? tenantId : tenant.id )}/component-dialog/common/true-false"/>
</cancelinheritparent>
```

Don’t use Checkbox fields in dialogs - use Dropdowns so that its clear what if use has made a selection and what defauls are

```html
<cancelinheritparent
    jcr:primaryType="nt:unstructured"
    sling:resourceType="granite/ui/components/coral/foundation/form/select"
    fieldLabel="Cancel Inherit Parent"
    name="./cancelInheritParent"
    emptyOption="{Boolean}true"
    value="">
...
</cancelinheritparent>
```

Common Component Field Spec - define component fields in an array to use with component helper function ComponentsUtil.getComponentProperties

```java
Object[][] componentFields = {
    {"author", pageAuthorFullName},
    {"authorUrl", pageAuthorEmail},
    {FIELD_VARIANT, DEFAULT_VARIANT}
};
```

Common Component Field Load - this will collect and construct all fields with defaults and select Design/Policy config as defaults

```java
componentProperties = ComponentsUtil.getComponentProperties(
    this,
    componentFields,
    DEFAULT_FIELDS_STYLE,
    DEFAULT_FIELDS_ACCESSIBILITY);
```

Common Component Field Presets - use globaly defined fields spect to collect content from shared tabls in dialog
> For Styles Tabs and Common Fields

```java
//COMPONENT STYLES
// {
//   1 required - property name,
//   2 required - default value,
//   3 optional - name of component attribute to add value into
//   4 optional - canonical name of class for handling multivalues, String or Tag
// }
public static final Object[][] DEFAULT_FIELDS_STYLE = {
    {FIELD_STYLE_COMPONENT_ID, "", "id"},
    {FIELD_STYLE_COMPONENT_THEME, new String[]{}, "class", Tag.class.getCanonicalName()},
    {FIELD_STYLE_COMPONENT_MODIFIERS, new String[]{}, "class", Tag.class.getCanonicalName()},
    {FIELD_STYLE_COMPONENT_MODULES, new String[]{}, "data-modules", Tag.class.getCanonicalName()},
    {FIELD_STYLE_COMPONENT_CHEVRON, new String[]{}, "class", Tag.class.getCanonicalName()},
    {FIELD_STYLE_COMPONENT_ICON, new String[]{}, "class", Tag.class.getCanonicalName()},
    {FIELD_STYLE_COMPONENT_POSITIONX, "", "x"},
    {FIELD_STYLE_COMPONENT_POSITIONY, "", "y"},
    {FIELD_STYLE_COMPONENT_WIDTH, "", "width"},
    {FIELD_STYLE_COMPONENT_HEIGHT, "", "height"},
    {FIELD_STYLE_COMPONENT_SITETHEMECATEGORY, ""},
    {FIELD_STYLE_COMPONENT_SITETHEMECOLOR, ""},
    {FIELD_STYLE_COMPONENT_SITETITLECOLOR, ""},
    {FIELD_STYLE_COMPONENT_BOOLEANATTR, new String[]{}, " ", Tag.class.getCanonicalName()}, //#3" " =do not store content in data attributes
    {FIELD_STYLE_COMPONENT_ANIMATION_ENABLED, false},
    {FIELD_STYLE_COMPONENT_ANIMATION_NAME, StringUtils.EMPTY, "data-aos"},
    {FIELD_STYLE_COMPONENT_ANIMATION_ONCE, StringUtils.EMPTY, "data-aos-once"},
    {FIELD_STYLE_COMPONENT_ANIMATION_EASING, StringUtils.EMPTY, "data-aos-easing"},
    {FIELD_STYLE_COMPONENT_ANIMATION_DELAY, StringUtils.EMPTY, "data-aos-delay"},
    {FIELD_STYLE_COMPONENT_ANIMATION_DURATION, StringUtils.EMPTY, "data-aos-duration"},
};
```


## Dialog Layout

Consistent dialog patern allow ease of understanding and experience of developing, using and training components to Authors.

![Dialog Layout](/assets/images/diagrams/dialog-convention.png)

## Component Artifacts Alignment

All components must have matching artifact in related artifacts. This is to ensure consistency and completness of component delivery.

![Component Artifacts Alignment](/assets/images/diagrams/folder-naming.png)
