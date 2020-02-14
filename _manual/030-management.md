---
title: "Management"
permalink: /manual/management/
author: yaw@aem.design
editor: max@aem.design
comments: true
redirect_from:
  - /manual/devtools/
categories:
  - info
tags:
  - docs
---

{% include toc_sticky.html %}

## Jenkins

[http://192.168.27.2:8080/](http://192.168.27.2:8080/)

The Jenkins role is as an automation server for the AEM platform. It is primarily used to trigger Ansible playbooks and Maven builds. The jobs are configured to discourage automation logic in Jenkins and to encourage the development in the playbooks. This keeps the playbooks portable.

A well designed playbook should "run everywhere" without further intervention i.e. running a playbook on a developer machine should be the same as on Jenkins.

The following sections will detail the types of jobs configured in Jenkins, and its invocation of Playbooks and Maven commands.

### Operations

The Operations view is a collection of operational jobs. These are intended to run regularly, whether on a schedule or on an ad hoc basis, such as AEM maintenance tasks and server startups/shutdowns.

#### fstrim (*environment*)

Scheduled operational job to execute fstrim on mounted file systems managed by thin volumes provisioned by Convoy.

Runs the playbook [operation-volume-fstrim.yml](#heading=h.4v3bfwjhvfhq).

See the section [Thin Volume Management](#heading=h.5n7hg9acpsim) for background information.

#### Oak Compaction (*environment*)

An operational job to schedule revision cleanup on the repository.

Runs the playbook [operation-oak-compaction.yml](#heading=h.gkkdg7rqo2lx)

#### Shutdown (*environment*)

Operational job to gracefully stop running Docker containers and then stop the Docker service.

This job can be used in a backup process pipeline where the application state needs to be in a non-transactional state.

Runs the playbook [site.yml](#heading=h.4zutr2iwh80o) and limits tasks to the application group and tasks with tags docker-host-stop-containers and docker-host-stopped.

#### Startup (*environment*)

Operational job to start the Docker service and start the Docker containers.

Runs the playbook [site.yml](#heading=h.4zutr2iwh80o) and limits the tasks to the application group, and tasks with tags docker-host-start-containers and docker-host-started.

#### Teardown (*environment*)

An operational job to stop and remove all running Docker containers and their volumes. Additionally, will also remove all pulled Docker images from the local registry

Runs the playbook [site-aemdesign-teardown.yml](#heading=h.awaaqbaco9ov).

### Packages

The Packages view contains jobs that build from the Git Flow branches (*/develop*, */release/[build_version]*, */hotfix/[build_version]*) and tags, and installs content packages to the AEM servers.

All build artifacts are deployed and pushed to the [Nexus](#heading=h.dog4b9teckm3) repository,

#### aemdesign-aem build (*develop*)

The develop build job polls for changes in the Git repository and triggers a Maven build on the */develop* branch. The built AEM Content Packages are deployed to Nexus as Maven snapshot artefacts.

#### aemdesign-aem build (*release*)

The release build job triggers a Maven build from the */release/** branch on demand. The AEM Content Packages built are deployed to Nexus as Maven snapshot artefacts.

#### aemdesign-aem build (*final*)

The final build triggers a Maven build from */tag/[BUILD_TAG] *where BUILD_TAG is a build parameter. The AEM Content Packages produced are deployed to Nexus as Maven final artefacts.

#### aemdesign-aem deploy (*environment*)

Jobs suffixed with ‘deploy’ updates the AEM application and configuration by pulling the latest AEM snapshot content packages from Nexus and installs them on AEM on a per *environment *basis. The following projects are installed (in order of installation):

1. aemdesign-aem-common

2. aemdesign-aem-config

3. aemdesign-aem-content

### Playbooks

#### Site Playbook (develop|sit|staging|training|uat)

Jobs to provision the AEM Platform in each of the specified environments. They are configured to skip the Docker Image build as they are built separately.

### Playbooks Production

#### Startup (Production)

Job to gracefully start all stopped Docker containers in Production.

#### Shutdown (Production)

Job to gracefully stop all running Docker containers in Production.

#### Site Playbook (Production)

Job to provision the AEM Platform in Production. They are configured to skip the Docker Image build as they are built separately.

## Nexus

Maven Artefact and Docker Image repository of packages.

### Configuring Nexus

Consult the [online documentation](https://help.sonatype.com/) (NOTE:  https://help.sonatype.com/) for specific details on configuring Nexus. The AEM Platform has configured Nexus for the:

1. [Maven Repositories](https://help.sonatype.com/display/NXRM3/Maven+Repositories) (NOTE:  https://help.sonatype.com/display/NXRM3/Maven+Repositories)

2. [Docker Registries](https://help.sonatype.com/display/NXRM3/Private+Registry+for+Docker) (NOTE:  https://help.sonatype.com/display/NXRM3/Private+Registry+for+Docker)

### Maven Repositories

| Repository URL                  | Content                                     |
|---------------------------------|---------------------------------------------|
| http://192.168.27.2:8081/repository/maven-releases/ | internal repository for release artifacts |
| http://192.168.27.2:8081/repository/maven-snapshots/ | internal repository for snapshot artifacts |
| http://192.168.27.2:8081/repository/maven-repo/ | A proxy for:<br>Repository<br>Maven Central<br>Adobe Public Repository|
| http://192.168.27.2:8081/repository/maven-repo/ | A proxy for:<br>Maven Central<br>Adobe Public Repository<br>WCM IO Repository |


### Docker Registries


| Repository URL                  | Content                                     |
|---------------------------------|---------------------------------------------|
| http://192.168.27.2:5000 | private registry for Docker images |

