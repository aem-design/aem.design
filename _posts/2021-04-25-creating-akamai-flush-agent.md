---
layout: single
permalink: /blog/2021/04/25/creating-akamai-flush-agent
title:  "AEM Akamai Cache flush Agent 😍"
excerpt: "Why should we bother DevOps to clear Akamai Cache when you can do it yourself using flush agent"
date:   2021-04-25 00:00:00:00 +1000
author: mailtoragavan.be@gmail.com
editor: max@aem.design
categories:
- blog
tags:
- devops
- aem
- akamai
- knowledge
- sharing
---

## Introduction

After the first hit to the page in aem and HTML response received for first time from publish instance will get cached on Akamai level.

Subsequent request to the same page will be served from the cached content in Akamai rather than hitting dispatcher / publisher. 

Anytime did you struggled to get the latest HTML from publisher instead of Akamai cache? 

***Well we did!!!***

## What we have done

We have worked on AEM replication agent for flushing Akamai cache whenever page gets published. 

So, after author change a page content and publish it our Akamai cache flush agent configured on publisher environment will pick that page and request to akamai for clearing cache. 
So that user of that page will get the latest content instead of cached old content from Akamai.

It is all automated, we don't need to clear the Akamai cache when new product goes live to prod. 

We don't ask DevOps to clear Akamai cache so customers will see latest page. Lets save their 1-2 min(s) time whenever new product launch.

## Where you can find the code

[Akamai Cache Flush Agent](https://github.com/aem-design/aemdesign-aem-core/tree/master/aemdesign-aem-common/src/main/content/jcr_root/apps/aemdesign/components/replication/akamai)

[Akamai Transport Handler](https://github.com/aem-design/aemdesign-aem-core/blob/master/aemdesign-aem-services/src/main/java/design/aem/transport/AkamaiTransportHandler.java)

## What are all details do you need to setup flush agent 

1.  akamaiDomain
2.  akamaiBaseUrl 
3.  akamaiPurgeUrlPath
4.  clientToken
5.  clientAccessToken
6.  clientSecret

If you think you don't know these info's or not sure from where you can get it? Ask devOps these information and say I got your back if you provide me these info 😍

## How we are managing the secrets

After getting the above information from you, we are encrypting keys using AEM's crypto support and storing it on AEM so you are safe with your secrets.
While we use it for making the POST call from Transport Handler we will decrypt the keys and use it. 

Also while making a POST call to Akamai servers we are using HMAC_SHA_256 to protect the data.

Make sure you are configuring the Akamai cache flush agent on each environment separately

## How to configure Akamai flush agent on your AEM author / publish instance

By Assuming you have installed aem design code into your local AEM.

## When to setup on author and when to setup on publish

Setup Akamai flush agent on AEM author instance only if you have akamai setup on author level as well. Mostly we will have Akamai setup for publish env.

Always setup Akamai flush agent on publish level so as soon as the page reaches publish instance our Akamai flush agent will go ahead and clear Akamai Cache.


## How to setup Akamai flush agent

Go to [miscadmin](http://localhost:4502/miscadmin) and open replication/agents.author for author instance & replication/agents.publish for publish instance

here I'm showing example of setting flush agent in author level same time you can set it in publisher as well.

![miscadmin](/assets/images/akamai-flush-agent/akamai-replication-miscadmin.png)

Click new from tool bar and you will see the Create Page dialog.
   
![create new agent](/assets/images/akamai-flush-agent/akamai-create-agent.png)

Select "Akamai Publishing Replication" and give your replication agent a name & title.
Click on create and open the newly created agent on the list. (it will be the last entry on the list)
Click on Edit and provide the information required and click on Ok.

![settings tab](/assets/images/akamai-flush-agent/akamai-settings-tab.png)

![config_tab](/assets/images/akamai-flush-agent/akamai-config-tab.png)

You should be able to see the Akamai Flush Agent is On (green) and it will look for any replication events.
   
![success](/assets/images/akamai-flush-agent/akamai-enabled-agent.png)

Click on Test Connection link and make sure you have all the correct configurations.
You should see "Replication test succeeded"


## Conclusion

This component will save our time whenever we need to update the content in AEM pages. 

Make sure you have set up the dispatcher flush agent as well so we can avoid content served from Dispatcher cache.

Feel free to reach out to us if you have any questions and don't forget to tell your friends.

### Thank you
