---
layout: single
permalink: /blog/2021/04/25/creating-akamai-cache-flush-agent
title:  "AEM Akamai Cache flush Agent 😍"
excerpt: "Why should we bother DevOps to clear Akamai Cache when you can do it yourself using flush agent"
date:   2021-04-25 00:00:00:00 +1000
author: mailtoragavan.be@gmail.com
categories:
- blog
tags:
- devops
- aem
- akamai
- knowledge
- sharing
---

Introduction
===

After the first hit to the page in aem and HTML response received for first time from publish instance will get cached on Akamai level.

Subsequent request to the same page will be served from the cached content in Akamai rather than hitting dispatcher / publisher. 

Anytime did you struggled to get the latest HTML from publisher instead of Akamai cache? 

***Well we did!!!***

What we have done
===

We have worked on AEM replication agent for flushing Akamai cache whenever page gets published. 

So, after author change a page content and publish it our Akamai cache flush agent will pick that page and request to akamai for clearing cache. 
So that user of that page will get the latest content instead of cached old content from Akamai.

It is all automated, we don't need to clear the Akamai cache when new product goes live to prod. 

We don't ask DevOps to clear Akamai cache so customers will see latest page. Lets save their 1-2 mins time whenever new product launch.


What are all details do you need to setup flush agent 
===

            1.  akamaiDomain
            2.  akamaiBaseUrl 
            3.  akamaiPurgeUrlPath
            4.  clientToken
            5.  clientAccessToken
            6.  clientSecret

If you think you don't know these info's or not sure from where you can get it? Ask devOps these information and say I got your back if you provide me these info :)


How we are managing the secrets
===

After getting the information from you, we are encrypting data and storing it on AEM so you are safe with your secrets.

How to configure Akamai flush agent on your AEM Author instance
===

By Assuming you have installed aem design code into your local AEM.


1. Go to misc admin (http://localhost:4502/miscadmin) and open replication/agents.author

   ![MISCADMIN](/assets/images/replication/akamai/miscadmin.png)

2. Click new from tool bar and you will see the Create Page dialog.
   
   ![create new agent](/assets/images/replication/akamai/create_agent.png)

3. Select "Akamai Publishing Replication" and give your replication agent a name & title.
4. Click on create and open the newly created agent on the list. (it will be the last entry on the list)
5. Click on Edit and provide the information required and click on Ok.

   ![settings tab](/assets/images/replication/akamai/settings_tab.png)

   ![config_tab](/assets/images/replication/akamai/config_tab.png)

6. You should be able to see the Akamai Flush Agent is On (green) and it will look for any replication events.
   
   ![success](/assets/images/replication/akamai/enabled_agent.png)

7. Click on Test Connection link and make sure you have all the correct configurations.
8. You should see "Replication test succeeded"


Conclusion
===

This component will save our time whenever we need to update the content in AEM pages. 

Make sure you have set up the dispatcher flush agent as well so we can avoid content served from Dispatcher cache.

Feel free to reach out to us if you have any questions.