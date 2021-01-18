---
layout: single
permalink: /blog/2021/01/18/creating-custom-workflow-step
title:  "Creating Custom Workflow Step"
date:   2021-01-18 00:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - structure
  - bugs-maybe
---

When writing custom workflow services, you may find yourself not seeing your service being recognised by the Process Step.
You will first encounter this when you don't see your service appear in the process list on the dialog.
And once you verify the data source that feeds that dropdown at [http://localhost:4502/libs/cq/workflow/content/console/process.json](http://localhost:4502/libs/cq/workflow/content/console/process.json) you will wonder why.
You may also see errors like this `Could not find service for service reference {YOUR WORKFLOW STEP CLASS PATH} with label {no label}` that could just tell you your class is missing property `process.label`.

Now that you know, you add this property to your class and your class appear in the list, here is an example of how to add it:

```java
@Component(
    immediate = true,
    service = WorkflowProcess.class,
    property = { "process.label=Content Fragment Page Generator" }
    )
```

Also while debugging this, you may find some other errors polluting your docker logs.

```
The activate method has thrown an exception (java.lang.IllegalStateException: org.apache.sling.api.resource.LoginException: Cannot derive user name for bundle com.adobe.acs.acs-aem-commons-bundle [553] and sub service workflowpackagemanager-service
```

To fix this, all you need to do is add missing service mapping mentioned in the message.
You should be able to replicate this by restarting your missing component at eg [http://localhost:4502/system/console/components/design.aem.workflow.process.ContentFragmentPageGenerator](http://localhost:4502/system/console/components/design.aem.workflow.process.ContentFragmentPageGenerator).
In example above missing use name is `workflowpackagemanager-service` and bundle is `com.adobe.acs.acs-aem-commons-bundle`.
To add this missing entry do this:

* open [http://localhost:4502/system/console/configMgr/](http://localhost:4502/system/console/configMgr/)
* search for `com.adobe.acs.acs-aem-commons-bundle` look for mapping in `Apache Sling Service User Mapper Service Amendment`
* add or update blank entry with `com.adobe.acs.acs-aem-commons-bundle:workflowpackagemanager-service=workflow-process-service`

Hopefully, after this, your custom workflow step will work, if you are stuck, look at some examples in [aemdesign-aem-services/../workflow/process](https://github.com/aem-design/aemdesign-aem-core/tree/develop/aemdesign-aem-services/src/main/java/design/aem/workflow/process).

Don't forget to tell your friends.
