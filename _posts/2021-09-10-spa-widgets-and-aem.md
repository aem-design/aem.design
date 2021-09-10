---
layout: single
permalink: /blog/2021/09/10/spa-headless-widgets-and-aem
title:  "SPA, Headless, Widgets and AEM?"
excerpt: "When to use these and what they achieve?"
date:   2021-09-10 00:00:00:00 +1000
author: max@aem.design
categories:
- blog
tags:
- aem
- spa
- headless
- widgets
- knowledge
- patterns
---

There are many ways to build the web; most of the ways can be implemented in AEM, which one works best is going to depend on your authors. What the authors are willing to author, how involved do they get with content, and how involved do they want to get with crafting experiences? Once you answer, these questions the solution will pop out. The following should provide an overview of available options and arm you with information to make a choice.

## SPA, Headless add Widgets patterns in AEM

Before we starte here is a context of each term

SPA - single page application an alternative to a multi-page website.
SPA Editor - AEM native editor for SPA's
Headless - a pattern where you leverage API or GrapgQL to get data from server
Widget - a component of a web page with clientside experience, it has basic HTML, and javascript turns into the interactive experience when loaded.

Now we can extrapolate these in relation to AEM. Here is a summary of patterns of implementing single-page and multi-page experience in AEM. In a lot of AEM implementations, you will find that all of these methods would have been utilised over time.

SPA - is a standalone application hosted externally to AEM, managed by developers, potential config by authors through content; can be headless.
SPA in a Page - provides a method of host SPA application in a page, giving the ability to place SPA's in different parts of the site; developer-focused, SPA has a dedicated component with possible authoring inputs; can be headless.
SPA Editor - native ability to create SPA's in AEM, allow full authoring of application; native components; can be headless.
Page - a native way to create multi-page experiences, allow full authoring of pages, full content reuse and ability to use any components needed; a primary way of creating content for the web.
Widgets in Page - small targeted components that are added to pages to create experiences; provides a way to create rich experiences that could be hard to author; can be headless.

Here is this information in a table.

|                	|          	|  Hosting 	|          	| Page Experience 	|            	|   Focus   	|           	| Content Usage 	|      	|      	|        	|
|----------------	|:--------:	|:--------:	|:--------:	|:---------------:	|:----------:	|:---------:	|:---------:	|:-------------:	|:----:	|:----:	|:------:	|
| Pattern        	| Headless 	| External 	| Internal 	| Single Page     	| Multi-Page 	| Authoring 	| Developer 	| API           	| Page 	| Tags 	| Assets 	|
| SPA            	|     x    	|     x    	|          	|        x        	|            	|           	|     x     	|       x       	|      	|      	|        	|
| SPA in Page    	|     x    	|     x    	|          	|        x        	|            	|           	|     x     	|       x       	|      	|      	|        	|
| SPA Editor     	|     x    	|          	|     x    	|        x        	|            	|     x     	|           	|       x       	|   x  	|   x  	|    x   	|
| Page           	|          	|          	|     x    	|                 	|      x     	|     x     	|           	|               	|   x  	|   x  	|    x   	|
| Widget in Page 	|     x    	|     x    	|     x    	|        x        	|      x     	|     x     	|           	|       x       	|   x  	|   x  	|    x   	|

Adding a Design Language System into the mix would also add another level of complexity as SPA, and native Web will have different Design Language primarily because native AEM components can have Styles applied to them by authors, and SPA would have a more focused and controlled set of settings. 

### Conclusion

Focussing on AEM Authoring experience will always be beneficial as it will allow more people to help to grow experience. Having more eyes and hands helping to build the experience is always a good thing. 

If you are must have a developer-centric experience and use AEM as a content repository, you can do it but you will be missing out on a lot of benefits that you would need to invent from sratch.

Using AEM SPA Editor will allow opening your experience building to authors so that they can help in any way they can. If you just have developers doing the authoring, then you will also missout on valuable input, and chances are you will rever to the vanila SPA pattern.

Going down the Widgets in a Page will give you the biggest impact as you can leverage all of the content authoring patterns and content services available in AEM. This will allow you to integrate widgets into existing pages, allow you to target them easily and importantly, all of this will be done by authors.

Obviously, all other patterns can be developed to the same level of maturity given appropriate time and effort.

## Background

Here is the background information on building blocks that are used in SPA patterns.

### Web Experiences

There are many ways to make great experiences for the web. In the end HTML and CSS is what all experiences are made of and its the details of how the developers choose to implement those experiences that varries. Traditional methods of we dev are either plain HTML pages or Single Page Application's (SPA's). 

Plain HTML approach means that you develop multi-page experiences where a user is navigating a network of related pages. It's a long term play, and you leverage a lot of technical and taxonomy tools to help you to play this out over a long period of time.

![Plain Web](/assets/diagrams/01-aem-spa-plain-web.png)

Single Page Applications or SPA's is another approach that focuses all of the experiences into one page. This means that user does not navigate pages as such, they are confined to one page, and they navigate experience as its laid-out by the SPA, SPA uses traditional API's or GraphQL to gather content it needs. 

![SPA API](/assets/diagrams/03-aem-spa-api-client-side.png)

### AEM native API's

AEM technical strength is in the flexibility of content, content architecture and ability to render content in place in different ways. You can store content in AEM in anyway you want, structure it to make logical sense and retrieve it either with native API, GraphQL or custom API you need. 

In AEM, you can store some content into a location `/content/page` then request its HTML representation `/content/page.html`, then request its XML representation `/content/page.xml`, then request its JSON representation `/content/page.tidy.5.json`, then request its Image representation `/content/page.thumbnail.png` and on and on. 

AEM has a method for adding these renderers (html, json, xml, thubnail.png) that enable you to read content from anywhere and how you want it, essentially allowing the whole content repository to act as an API source, and you can read different bits of different content is many ways depending on your need.

AEM has a number of content experiences Content Fragments and Models, Experience Fragments, Tags and Sling API that allow you to get content from AEM. Additionally, ACS has several services that further complement OOTB functionality.

### Aggregation API

When it comes to the traditional API approach, the aim it funnels all of the calls into one area, one "service" that handles a request for that content. You typically should have an API gateway to ensure you do not flood your backend service and you would have a number API returning either atomic data or aggregated set of data.  

![Aggregation Headless Client Side](/assets/diagrams/04-aem-spa-api-client-side-aggregation.png)

Aggregation of API's is a pattern for gathering data from different API's and presenting it in one package to the consumer. This pattern can be implemented both on the client and server-side. GraphQL essentially provides a server-side and client-side aggregation in one; you can get atomic data and aggregate as well with one API.

![Aggregation Headless Server Side](/assets/diagrams/05-aem-spa-api-server-side-aggregation.png)

GraphQL API approach allows you to get the same data as traditional API but potentially at the client-side. This obviously has a lot of perceived flexibility as the structure of API is moved up the stack and managed by the UI layer, and the same methods should be used to protect the backend.

### Headless AEM

Headless is a method of using AEM as a source of data, and the primary way of achieving this is by using API and GraphQL for getting data out of AEM. This pattern can be used in any SPA and Widget approach but does make AEM more developer-focused. 

![Headless](/assets/diagrams/06-aem-spa-headless.png)

#### Widgets in AEM

Widgets are a way of creating AEM authoring components that have rich client-side presentations. This pattern allows full authoring experiences and all of the API patterns to be used.

![Widgets](/assets/diagrams/02-aem-spa-api-widgets.png)

### Thank you

Please checkout the docker hub [aemdesign/aem](https://hub.docker.com/r/aemdesign/aem) for latest AEM SDK images.

If you would like to contribute or fork the code, you can get it on GitHub [https://github.com/aem-design](https://github.com/aem-design) and through Maven central.

Don't forget to tell your friends.
