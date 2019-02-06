---
title: "Manual"
permalink: /manual/devtools/
excerpt: "AEM.Design Framework Manual"
author: yaw@aem.design
comments: true
redirect_from:
  - /manual/projects/
categories:
  - info
tags:
  - docs
---

{% include toc %}

# Development Tools

## Git

The projects sources are managed with Git.

## Apache Maven

Maven manages the build lifecycle for the AEM content packages, service bundles and configurations, as well their dependencies. Maven 3.5.0 was used during the development of the project.

The content package projects uses ‘content-package-maven-plugin’ to create a CRX content package.

 The project was originally created using the ‘CQ Project Maven Archetype’ ([http://www.cqblueprints.com/setup/maven.html](http://www.cqblueprints.com/setup/maven.html)).

The AEM project contains 4 child modules:

1. aemdesign-aem-common

    1. Embeds aemdesign-aem-services under /apps/aemdesign/install

2. aemdesign-aem-services

3. aemdesign-aem-config

    2. Creates a configuration package per environment

4. aemdesign-aem-content

### Package Build

Maven commands when run in the aemdesign-aem project.

#### Local Development Build

```bash
mvn -PautoInstallPackage clean package
```


#### Local Development Service Module Build

```bash
mvn -pl services clean package
```


#### Local Development Common Module Build

```bash
mvn -pl common clean package
```


Note: this embeds the last built service module. To ensure the latest build, use -pl services,common in the command parameters and the order of the modules is important.

#### Local Development Config Module Build

```bash
mvn -pl config clean package
```


#### Local Development Content Module Build

```bash
mvn -pl content clean package
```


#### Full Build and Deploy to Repository

```bash
mvn clean deploy
```


### JGitFlow Plugin

The JGitFlow Maven Goals manages the Git Flow branching strategy.  The table below lists common usages of the JGitFlow. All commands are run in the ‘aemdesign-aem-dam’ parent module.

| Maven Goals                     | Actions                                     |
|---------------------------------|---------------------------------------------|
| mvn jgitflow:feature-start      | Creates and checks out the new feature branch from /develop |
| mvn jgitflow:feature-finish     | Merges the current working feature branch into /develop and deletes the feature branch |
| mvn jgitflow:release-start      | Creates a new /release/[build_version] branch from /develop |
| mvn jgitflow:release-finish     | Creates a tag named version/[build_version] from /release/[build_version] and merges /release/[build_version] back into /develop and /master. Finally, JGitFlow deletes /release/[build_version]. This ensures that there is only one release in any point in time |
| mvn jgitflow:hotfix-start       | Creates a new /hotfix/[build_version] branch from /master |
| mvn jgitflow:hotfix-finish      | Creates a tag named version/[build_version] from /hotfix/[build_version] and merges /hotfix/[build_version] back into /develop and /master. Finally, JGitFlow deletes /hotfix/[build_version] |


#### Plugin Usage

Branching is not be intended to be limited to the JGitFlow Maven Goals. Its underlying actions are standard Git commands and as such they can be repeated with the git command line tool. Also, there are cases where the git command line tool is required. One such case is when a new feature is required in the current release, in which case the feature is branched from */release/[build_version]* and not */develop*. Another case is resolving conflicts during branch merging.

For details on Git Flow, see the Processes section on [Git Flow](#heading=h.9cjexa5yq6qn)

For additional details on the plugin [https://bitbucket.org/atlassian/jgit-flow/wiki/Home](https://bitbucket.org/atlassian/jgit-flow/wiki/Home).

## Ansible Playbooks

There are three types of playbooks that perform automated tasks; operation playbooks, group playbooks and site playbooks. A group playbook provisions servers and applications while a site playbook provisions an entire platform. The site playbook will typically run a few group playbooks which will form the platform. Operation playbooks performs regular tasks on groups such as repository maintenance and package deployments.

By convention, the group playbooks are named after the group vars and site playbooks are prefixed with ‘site-’.

### Site Playbooks

#### site.yml

The site playbook manages the AEM platform and its testing environments with the use of inventories.

The following playbook command will provision a complete site using the local development inventory,

```bash
./devops accesslocal
```

or:

```bash
ansible-playbook -i inventory/localdev site.yml --user aemdesign --private-key ../aemdesign-vm/keys/current/aemdesign
```


A well designed playbook should perform all tasks required to provision a site in a single command. However, there are scenarios where only a part of the playbook is required. It is possible to activate a subset of tasks by running a playbook with tags. For example, by adding the --tags parameter to the ansible-playbook command.

The following are tags that are in use:

* docker-host-stop-containers

* docker-host-stopped

* docker-images-build

* Install-packages

To list all tags in the site playbook,

```bash
ansible-playbook site.yml --list-tags
```


Similarly, playbooks may skip parts of the play with the use of the --skip-tags parameter. For example, in cases where the Docker images are built separately, a playbook that is provisioning a site may decide not to rebuild the images and instead pull them from a Docker registry.

The practice of tagging tasks is best done during the development of roles. This allows the developer to not only exercise the new roles but also test that tags work in isolation.

A recommended approach in developing playbooks is to start with the localdev inventory and promote the changes through each of the environments. The project is designed with roles, groups and host variable precedence to facilitate this development process.

The following environments have inventories configured (in order of promotion):

* localdev

* develop

* sit

* uat

* training

* staging

* production

The platform consists of servers and services. In order to provision the platform, the site playbook includes the following group playbooks that perform the actual provisioning:

* convoy.yml

    * See [Convoy Volume Plugin](#heading=h.yk5do8kzow0p)

* server.yml

* applications.yml

* solr.yml

* author.yml

* publisher.yml

* processing.yml

* dispatcher.yml

* esb.yml

#### site-teardown.yml

Teardown playbook is for removing all applications and their data in a Docker host. Its purpose is to prepare the servers such that a new site can be provisioned without any dependencies on a previous state.

For example, it can be used to rebuild the develop environment on a daily basis and/or prepare the UAT environment before each test cycle.

Sample usage,

```bash
ansible-playbook -i inventory/localdev site-teardown.yml --user aemdesign --private-key ../aemdesign-vm/keys/current/aemdesign
```


#### site-devops.yml

Deploys and configures the Management services.

### Operations Playbooks

#### operation-aem-deploy.yml

Installs versioned AEM content packages from a Maven repository to each of the authors, publishers and processing servers defined in the inventory.

#### operation-esb-deploy.yml

Installs versioned ESB packages from a Maven repository to the Mulesoft ESB hot deploy folder *‘/opt/mule/apps’*.

#### operation-oak-compaction.yml

Operations playbook that implements the revision cleanup for the AEM Repository. Refer to the Adobe’s online documentation under ’*Maintaining the Repository *’for the significance of this operation:

[https://docs.adobe.com/docs/en/aem/6-3/deploy/platform/storage-elements-in-aem-6.html](https://docs.adobe.com/docs/en/aem/6-3/deploy/platform/storage-elements-in-aem-6.html)

#### operation-volume-fstrim.yml

Operations playbook to releasing unused blocks used by Convoy thinly provisioned volume. (refer to: [Thin Volume Management](#heading=h.ww4rafenb0y4)).

### Group Playbooks

There are two group playbooks. Tasks that maintain the server and tasks that manages an application.

#### Server Playbooks

| Playbook                        | Actions                                     |
|---------------------------------|---------------------------------------------|
| server.yml                      | Configures Red Hat Enterprise Linux servers. The following tasks are performed (role references in parenthesis),<br>Adding Network Interfaces before other roles requiring network connectivity ( server-network-interfaces).<br>Installation of RPMs using YUM<br>Installation of security updates<br>Installation of Python Packages required by Ansible (python-packages)<br>Configuration of the Docker service  (docker-host)<br>Configuration of Docker networks (docker-network)<br>Configuration of Server IPTables (server-iptables) |
| applications.yml                | Configures common services for the Docker service and its containers.<br>Deploys Consul servers<br>Deploys Consul clients<br>Deploys a Registrator service for all Consul servers and clients |
| convoy.yml                      | Deploys and configures the Convoy Docker plugin.<br>Creates a data device in the rhel volume group<br>Creates a metadata device in the rhel volume group<br>Installs Convoy as a system service<br>Stats the Convoy system service |



#### Application Playbooks

| Playbook                        | Actions                                     |
|---------------------------------|---------------------------------------------|
| author.yml                      | Automates the deployment and configuration of AEM authors.<br>Deploys AEM<br>Installs AEM Content Packages such as,<br>Feature Packs<br>Hotfixes<br>ACS Commons<br>3rd Party Content Packages<br>Configures Replication Agents<br>Configures Workflows |
| publisher.yml                   | Automates the deployment and configuration of AEM publishers.<br>Deploys AEM<br>Installs AEM Content Packages such as,<br>Feature Packs<br>Hotfixes<br>ACS Commons<br>3rd Party Content Packages |
| dispatcher.yml                  | Deploys and configures an author and publisher dispatcher.<br>Builds and configures the author and publisher dispatcher services Starts the services |
| esb.yml                         | Deploys and configures the ESB service |
| processing.yml                  | Automates the deployment and configuration of AEM processing.<br>Deploys AEM<br>Installs AEM Content Packages such as,<br>Feature Packs<br>Hotfixes<br>ACS Commons<br>3rd Party Content Packages |
| solr.yml                        | Deploys and configures Solr Cloud service |



### Management Playbooks

Deploys and configures management services in the AEM DAM Platform.  These are devops services such as,

1. Jenkins

2. Nexus

These are discussed in detail in the [Development Tools](#heading=h.44alh5srvsoz) section.

### Libraries

Ansible Modules adding AEM and Docker tasks to Playbooks.

Python source code for the modules can be found under the project location; *‘aemdesign-deploy/library/ansible-modules’*.

| Module                          | Action                                     |
|---------------------------------|---------------------------------------------|
| aem_bundles_wait_activated.py   | Polls AEM at ‘/system/console/bundles.json’ until ALL bundles are activated |
| docker_containers.py            | Starts or stops ALL Docker containers on a server |
| docker_images.py                | Removes ALL Docker images on a server |
| docker_volumes.py               | Removes ALL Docker volumes on a server |

There are additional modules in the project. They are omitted as they are documented in [https://github.com/wildone/pyaem](https://github.com/Sensis/pyaem).
