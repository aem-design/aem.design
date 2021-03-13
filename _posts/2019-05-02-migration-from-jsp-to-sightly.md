---
layout: single
permalink: /blog/2019/04/04/migration-from-jsp-to-sightly
title:  "Migration from JSP to Sightly"
date:   2019-05-02 20:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - update
---

The time has come to migrate to Sightly. Primary drive is that Sling Models are great and Sightly now works (long story...). 
Secondary drive is that it provides absolute templating without opportunity to embed code with template code. 
Using JSP and JSTL work great, but it does not provide strict no "Code in Templates" governance.
So if you are not careful you could end up with code plaguing your template and that would break your conventions.
This has worked great over the years but as framework usage grows simpler oversight is required to ensure stability. 

On the Sightly side the conventions is simple, Model has your code and your template has just the presentation.
Sightly syntax docs are very easy to consume and anyone on this side of the keyboard can follow.
Having pure JSTL implementation for your templates provides less opportunities to pollute your templates.

How to migrate your existing component to Sightly is not apparently clear. 
Writing new component using Sightly in parallel with your existing component is not migration.
Moving existing JSP component logic into Models is not a copy paste exercise, unless you have a solid convention across all component like AEM.Design.
So the only sustainable option is to start a new project from scratch and use Sightly from the start.

Another way is to version your existing JSP components into V1 and create V2 for the Sighlty implementation.
This is the approach we followed, this allow you to substitute all existing components with new Sightly verisons without having to migrate content.  

Consider your existing component structure, when this component would be used in pages the reference to the component will be stored with each instance on component.

```
apps
    aemdesign
        component
            text
                text.jsp
                .content.xml
``` 

Using this structure will effectively hardcode ```aemdesign/component/content/text``` into your pages and experience fragments.
This creates a long term situation that when you want to update the component you need to update in place and in turn this updates all of the instances of your component everywhere it appears.
This is the best approach as it ensure that you continue to update your component code and update content with latest version without adding unnecessary path version numbering into content.
It best that versioning of component is kept to the component code and not hardcoded into content.

There could be rare scenarios when you may need to have a versioned path for a component but it would be hard to track of these paths over time.
Additional authors will be exposed to versioned components where they will need to decide which version they need to use for a particular design they are creating.
This would seem trivial but over time it will be affecting authoring experience due to number of component they need to understand to create designs.

Another approach elegant approach provides a simplified pattern to have versioning of component without exposing version to author and without hardcoding version into content.
This pattern allow you to have one component path with localised versions that are not exposed to authors. 


```
apps
    aemdesign
        component
            text [ sling:resourceSuperType==aemdesign/component/content/text/v1/text ]
                .content.xml
                v1
                    text
                        .content.xml [ componentGroup="hidden" ]
                        text.jsp
                v2
                    text
                        .content.xml [ componentGroup="hidden" ]
                        text.html
``` 

To implement this pattern you create a sub folder for each version of your component as child of component.
And point parent component path to the version you are currently want the authors to use.
This pattern allow you to leverage version toggling without exposing versioned component to authors.

Furthermore AEM.Design framework uses this pattern to expose component into tenant applications.
When you deploy AEM.Design core component you will have aemdesign application folder available to be used in a tenant component space.

```
apps
    aemdesign
        component
            text [ sling:resourceSuperType==aemdesign/component/content/text/v1/text ]
apps
    tenant
        component
            text [ sling:resourceSuperType==aemdesign/component/content/text ]
``` 

This pattern combined with [Variants and Badges](/manifesto/project/) provide number of benefits that  
- provide a way of component reuse across tenants without referencing core framework
- ensures that tenant specific component paths are used in tenant code
- allow customised metadata like title, description, category and readme's for components where required
- with use of badges and variants provides a way of extending component presentation without changing component core functionality

Considering the approach we took and the benefits that we have now attained make the migration successful!
Further demonstrating to us that our determined efforts with AEM.Design principles can scale from "old" tech to new.
And it is important to note that this was only possible due to the fact that we have had a strict component convention that allowed this process to occur.
If design pattern were not maintained the rewrite of all component would have been the costly option.
 