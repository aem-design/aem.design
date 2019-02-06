---
title: "Manual"
permalink: /manual/process/
excerpt: "AEM.Design Framework Manual"
author: yaw@aem.design
comments: true
redirect_from:
  - /manual/osenv/
categories:
  - info
tags:
  - docs
---

{% include toc %}

# Processes

## Git Flow

The project source code is managed with Git Flow as the release management strategy. In Git Flow, there are three main branches:

1. */develop*

2. */master*

3. */release/[build_number]*

The develop branch contains features that will be deployed in the **next release** and the master branch contains code **currently deployed** in production. These two branches are always active whereas the*/release/[build_number] *is the **current release **and is in a perpetual cycle of create, merge and delete. The branch */release/[build_number]* contains code that is due to be deployed in the current release. It is always branched from */develop* and there will only be one */release/[build_number] *at any given time.

### Versioning

The versioning of the branches should be as follows; suppose there has been at least one production release and the next release is in development. Then,

1. the version in */master *is **N**

2. */release/[build_version]* is the current release which is **N + 1**

3. */develop *is the next release which is **N + 2**

Developers are encouraged to create feature branches instead of working directly on these three main branches.

Further information on Git Flow can be found here:

[https://www.atlassian.com/git/tutorials/comparing-workflows#!workflow-gitflow](https://www.atlassian.com/git/tutorials/comparing-workflows#!workflow-gitflow)

[http://nvie.com/posts/a-successful-git-branching-model/](http://nvie.com/posts/a-successful-git-branching-model/)

## Testing Environments

The below are our environments:

* develop

* system integration testing

* user acceptance testing

* training

* staging

* production

The purpose of the develop environment is to integrate feature branches into the */develop *branch for testing. The activity level in the environment should be dynamic which reflects developers committing code. Business analysts and testers may also access this environment; albeit in a preview capacity.

System integration testing environment is used to test the current release. The environment marks the beginning of the collaboration between developers and testers. At this stage, the features should be nearing completion.

User Acceptance Testing (UAT) validates that the current release is functionally correct before it can be deployed into Production. UAT represent the */release/[build_number] *branch.

Building packages from the source code for production involves building the code from the tag created during UAT. The packages are built and installed using the Jenkins production deploy job.

Staging is used before the final deployment.

