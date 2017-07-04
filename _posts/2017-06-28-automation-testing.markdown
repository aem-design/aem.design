---
layout: single
permalink: /blog/2017/06/28/automation-testing
title:  "Automation Testing and Human Reporting"
date:   2017-06-28 21:25:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - testing
  - update
---

Automation Testing is the validation of your DevOps operations.

Without Automated Testing DevOps efforts can’t be verified. When writing automated pipelines some form of verification always takes place to verify service, api and general availability of targets before tasks are executed.

However a more systemic and pragmatic approach is required for verifying if your System works as you expect post Deployment pipeline.

It's 2017 and testing tools have come a very long way, you can do so much these days with free tools it's inexcusable not to use one or a combination of available frameworks.

Over last few days we have been refactoring our Test Suite to add some needed design to the reports. And after several late nights I am happy with the results.

We believe that Automation Testing has to be at the heart of you project. And what a better way to show off your Testing efforts by parading a nice-looking report!

![Automation Testing Report](/assets/images/automation-testing/phantomjs-reports.png)

And as you discover the wonderful world of Automation Test Reports, you realise that it has a much bigger business benefit then just a nod from UAT guy. You can and should use reports to your advantage and create test for everything you and your users use.

Another amazing feature that will save you lot and lot of time is to setup your report to test all common Breakpoints that your users would experience.

Here is an example of AEM Assets screen tested in Touch UI:

![AEM Touch UI Assets XS PhantomJS](/assets/images/automation-testing/phantomjs-assets.png)

This is tested with Phantom JS so a few rendering issues do appear.

Here is AEM Project in XS view port:

![AEM Touch UI Project XS PhantomJS](/assets/images/automation-testing/phantomjs-projects.png)

Although majority of users not going to use these view ports the Multi-Viewport testing still should be carried out for all test as it does not create any overhead to testing effort.

Here is a few more examples of a login page, first in XS view port:
![AEM Touch UI Login XS PhantomJS](/assets/images/automation-testing/phantomjs-login-xs.png)

and in MD viewport:

![AEM Touch UI Login MD PhantomJS](/assets/images/automation-testing/phantomjs-login-md.png)

Another very simple yet powerful feature used in automation testing is screenshot diff.

The process is very simple you create a master image of your expected outcome for a particular screen and you call that a reference master that corresponds to a particular test case. Then whenever you run same test case you take another screenshot and compare it with the reference master.

![AEM Touch UI Diff MD PhantomJS](/assets/images/automation-testing/phantomjs-diff-md.png)

Usually if a difference is within 10% then the test considered as ok, but you can go lower if you want pixel perfect output.

We hope this will inspire you to try this yourself!

If you want to try this at home take a look Geb framework, it will save you a lot of time and together with Behaviour Driven Development practice you will always find time to test your experiences!

As always let us know what you think.
