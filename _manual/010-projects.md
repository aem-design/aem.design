---
title: "Projects"
permalink: /manual/projects/
author: yaw@aem.design
editor: max@aem.design
comments: true
redirect_from:
  - /manual/
categories:
  - manual
tags:
  - project
  - convnetions
---

{% include toc_sticky.html %}

# Projects

## Overview

There are three primary project sources in the AEM implementation:

1. [Ansible Deploy Project](#ansible-deploy-project) - used to contain all of the ansible playbooks for managing AEM docker services

2. [Virtual Machine Project](#virtual-machine-project) - used to create VM hosts using packer.io.

3. [docker-aem](https://github.com/aem-design/docker-aem) - docker container used to run local AEM instances.

The following sections will highlight their key design decisions and their implementation details.

## Ansible Deploy Project

The aemdesign-deploy project is a **server automation** project using Ansible to deploy and configure services. The project also contains scripted operational tasks for maintaining the operating system and services..

Before proceeding, this section contains content with assumed Ansible knowledge. Recommended starting points are '*[Intro to Playbook*s](http://docs.ansible.com/ansible/latest/playbooks_intro.html)' (NOTE:  http://docs.ansible.com/ansible/latest/playbooks_intro.html) and *'**[Intro to Inventorie*s](http://docs.ansible.com/ansible/latest/intro_inventory.html)*'* (NOTE:  http://docs.ansible.com/ansible/latest/intro_inventory.html) in the Ansible online documentation.

This project is implemented with the following features and their concepts are required to maintain the project:

1. Roles ([http://docs.ansible.com/ansible/latest/playbooks_roles.html](http://docs.ansible.com/ansible/latest/playbooks_roles.html))

2. Tags ([http://docs.ansible.com/ansible/latest/playbooks_tags.html](http://docs.ansible.com/ansible/latest/playbooks_tags.html))

3. Variables ([http://docs.ansible.com/ansible/latest/playbooks_variables.html](http://docs.ansible.com/ansible/latest/playbooks_variables.html))

Additional topics on Ansible, can be found in the [online documentation](http://docs.ansible.com/ansible/latest/index.html).

The aemdesign-deploy project is implemented using the standard Ansible layout. Anyone familiar with Ansible should also be familiar with this implementation layout.

An implementation specific overview is provided in the following section.

### Ansible Project Overview

The recommended operating system for the aemdesign-deploy project is either MacOS or a distribution of Linux such as Red Hat and Ubuntu.

| Path                            | Description                                 |
|---------------------------------|---------------------------------------------|
| /                               | Playbooks for site, group and operations are located at the root of the project. This is discussed in detail in the Playbooks section. |
| /inventory                      | The inventory defines servers (defined as a SSH host). The servers provide the automation scripts with machine targets to deploy and configure services. In the aemdesign-deploy project, servers are typically Red Hat Enterprise Linux servers with a Docker service and Docker containers are specified in a group using an alias for the target machine. The inventories are organised into environments in a group var (group_vars/[environment_name]/vars.yml) which specifies environment specific configurations. See for Testing Environments for inventory details. |
| /roles                          | A role is a reusable unit of work that is composed of serial tasks. For example, a role can create a logical volume or start a web server in a Docker host. |
| /group_vars                     | There are two categories of group vars; application and environment. Typically, application group vars are used to override the default variables defined within roles. The environment group vars are used to define environment specific variables by overriding the group variables. This is represented as a hierarchy within the inventories as groups with the ':children' suffix. |
| /host_vars                      | These are variables for servers that form the site and they are shared across all environments. This means that automation scripts apply the same host vars in each environment which ensures all environments are similar to each other. |
| /library                        | Custom modules developed for the project. Modules have been developed to orchestrate AEM and Docker. |


### Ansible Variables

Table of variable descriptions.

| Variable                        | Description                                 |
|---------------------------------|---------------------------------------------|
| docker_image_tag                | Common variable name used  in roles for specifying which Docker image version to run. |


### Group Variables

For each role,  there is  group variable that overrides the default variable defined in the role. Within each file, there is the variable *docker_image_tag *that can be updated to change the version of the Docker image to run.

| Role                            | Group Variable                              | Role / Files / Dockerfile                   |
|---------------------------------|---------------------------------------------|---------------------------------------------|
| publisher                       | /aemdesign-deploy/group_vars/publisher/vars.yml | /aemdesign-deploy/roles/aem/files/docker/aem |
| author                          | /aemdesign-deploy/group_vars/author/vars.yml | /aemdesign-deploy/roles/aem/files/docker/aem |
| consul-client                   | /aemdesign-deploy/group_vars/consul-client/vars.yml | consul:latest |
| dispatcher                      | /aemdesign-deploy/group_vars/dispatcher/vars.yml | /aemdesign-deploy/roles/dispatcher/files/docker/dispatcher |
| esb                             | /aemdesign-deploy/group_vars/esb/vars.yml | /aemdesign-deploy/roles/mule-esb/files/docker/muleesb |
| solr                            | /aemdesign-deploy/group_vars/solr/vars.yml | /aemdesign-deploy/roles/solr-cloud/files/docker/aem-solr |
| processing                      | /aemdesign-deploy/group_vars/processing/vars.yml | /aemdesign-deploy/roles/aem/files/docker/aem |
| consul-server                   | /aemdesign-deploy/group_vars/consul-server/vars.yml | consul:latest |
| nexus                           | /aemdesign-deploy/group_vars/nexus/vars.yml | /aemdesign-deploy/roles/nexus/files/docker/nexus |



### Source Code Repositories

| Repo                            | Notes                                       |
|---------------------------------|---------------------------------------------|
| aemdesign-parent/               | root repo for devops script and automation |
| aemdesign-aem-author/           | changes to authoring experience |
| aemdesign-aem-common/           | common components |
| aemdesign-aem-config/           | configuration for author and publishers |
| aemdesign-aem-content/          | initial content |
| aemdesign-aem-services/         | services for author and publisher |
| aemdesign-aem-showcase/         | showcase content |
| aemdesign-aem-training/         | training site content |
| aemdesign-deploy/               | deploy project, contains all docker files |
| aemdesign-devbot/               | used to control devops script remotely |
| aemdesign-docker/               | parent docker project, outdated |
| aemdesign-esb-mule/             | esb implementation |
| aemdesign-jenkins/              | jenkins backup |
| aemdesign-prototype/            | font-end prototype project |
| aemdesign-security/             | security for hardening not Atomic hosts |
| aemdesign-testing/              | testing suite |
| aemdesign-vm/                   | vm templating |




## Adobe Experience Manager Project

Adobe Experience Manager (AEM) Project Source Code and Content Packages

* AEM Project Sources

* AEM Service Bundle

* AEM Configuration

* AEM Initial Content

### AEM Project Sources

The AEM Project Sources contain AEM 6.1 components, client libraries (HTML, CSS and JavaScript) and AEM lib overlays (NOTE:  AEM overlays https://docs.adobe.com/docs/en/aem/6-3/develop/platform/overlays.html).

### AEM Service Bundle

The AEM Service Bundle contains Java sources for OSGi services and components that extend or add functionality to AEM.

### AEM Configuration

The AEM Configuration project contains [configurations](https://docs.adobe.com/docs/en/aem/6-3/deploy/configuring/configuring-osgi.html) (NOTE:  OSGi configuration https://docs.adobe.com/docs/en/aem/6-3/deploy/configuring/configuring-osgi.html) for AEM OSGi services as well as the OSGi services developed in the `aemdesign-aem-services` module.

For environment specific configurations, apply them with run modes to activate configurations. These environment run modes are configured:

1. localdev

2. develop

3. sit

4. uat

5. training

6. staging

7. Production

These server run modes are configured:

1. author

2. publisher

3. processing

#### OSGi Run modes

The path to the run mode configurations is located at:

```
config/src/main/content/jcr_root/apps/aemdesign
```


These run modes are configured for the AEM servers and environments:

* config.author

* config.author.develop

* config.author.localdev

* config.author.processing

* config.author.processing.develop

* config.author.processing.localdev

* config.author.processing.sit

* config.author.production

* config.author.sit

* config.author.staging

* config.author.training

* config.author.uat

* config.publish

By default it will use the AEM server run mode, the OSGi service definition XMLs in *config.author**, **config.publisher** and **config.author.processing*. Each environment can override them by specifying a OSGi service definition XML in the corresponding environment run mode.

More information can be found in the online documentation [Deploying and Maintaining, Configuring, Run Modes](https://docs.adobe.com/docs/en/aem/6-3/deploy/configuring/configure-runmodes.html) (NOTE:  https://docs.adobe.com/docs/en/aem/6-3/deploy/configuring/configure-runmodes.html).

#### Environment Config Content

The AEM Configuration project produces one configuration file per environment. This is to configure AEM components that are not OSGi based. For example, the following AEM configurations:

1. Cloud Configs

2. Replication Agents

These configuration packages are created:

* aemdesign-aem-config-[*release_version*]-develop.zip

* aemdesign-aem-config-[*release_version*]-production.zip

* aemdesign-aem-config-[*release_version*]-sit.zip

* aemdesign-aem-config-[*release_version*]-staging.zip

* aemdesign-aem-config-[*release_version*]-training.zip

* aemdesign-aem-config-[*release_version*].zip

### AEM Initial Content

The AEM Initial Content project contains content that is required for a functioning site. It also enables transportable content between testing environments.

## Virtual Machine Project

The aemdesign-vm project uses Packer by HashiCorp to automate machine image creation.

To learn more about Packer, refer to the [online documentation](https://www.packer.io/docs/index.html) (NOTE:  https://www.packer.io/docs/index.html).

The project was built using VirtualBox Version 5.1.10. The binaries are available for download at: [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

### Packer Project Overview

The project is designed to build on Centos and has built and provisioned Centos versions 7+ for deployment on private datacenter infrastructure.

While the datacenter servers are running on VMWare virtualisation, the local development image is built for VirtualBox.

#### Packer Project Structure

| Path                            | Content                                     |
|---------------------------------|---------------------------------------------|
| Path                            | Content
| /                               | Templates with build configuration for the machine image automation |
| http/                           | Path to the configuration files for the HTTP server during Machine Image creation. The Anaconda Kickstart scripts configures RHEL7 in an non-interactive environment (the template file's builder variable boot_command is used to execute the script). [Kickstart Syntax Reference](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-kickstart-syntax.html) |
| http/iso                        | Path to Red Hat Enterprise Linux 7 Full ISO for building the machine image |
| scripts/                        | Shell scripts executed as provisioners during the build |
| scripts/common                  | Scripts common to all machine image builds |
| scripts/devops                  | Scripts to install and configure devops services such as Docker |
| scripts/rhel                    | Scripts to configure Red Hat Enterprise Linux |
| settings/                       | Setting variable files to customise machine images. Overrides variables defined in the build templates |


### Using Packer

#### Packer Installation

In the aemdesign-vm project,

```bash
npm install && ./packer.io/install
```


#### Packer Command

The Packer command requires two json configuration files to build a machine image,

```bash
./bin/packer build -var-file=./settings/[variables].json [template_file].json
```


Where

* **_template_file_*** *is the configuration for the build

* **_variables_** overrides the "variables" section in the **_template_file_**

The **_template_file_*** *build configuration files can be found in the project's root path. The **_variables_** file overrides values defined in the **_template_file_**. This enables the customisation of images.

| Template File                   | Actions                                     |
|---------------------------------|---------------------------------------------|
| centos-vbox.json                | Builds a VM Machine Image, configures a NAT network interface and installs VM tools  |

### Machine Image Builds

**Note**: For best results please pass params to packer instead of using settings files, this will keep repo clean

#### Local Image Build

```bash
./bin/packer build -var-file=./settings/variables-online.json template-rhel-build-virtualbox-localdev.json
```

#### SIT Image Build

```bash
./bin/packer build -var-file=./settings/variables-online-sit.json template-rhel-build-virtualbox-server.json
```


#### Staging Image Build

```bash
./bin/packer build -var-file=./settings/variables-online-stage.json ./templates/centos-vbox.json
```

#### Production Image Build

```bash
./bin/packer build -var-file=./settings/variables-online-prod.json ./templates/centos-vbox.json
```

### Updating a Machine Image

**Note**: Packer will download and cache ISO file first time, follow this if you want manual control over this process

1. Download a Centos ISO

2. Copy it to ./*http/iso/ *in the aemdesign-vm project.

3. Update the **_iso_url_*** variable *to path of the ISO:

    3.1  from "iso_url": "http://ftp.swin.edu.au/centos/7/isos/x86_64/CentOS-7-x86_64-DVD-1708.iso",

    3.2. to "iso_url": "http/iso/your-iso-name.iso"

4. Update the **_iso_checksum_*** *variables to match the ISO:

    4.1. from "iso_checksum": "ec7500d4b006702af6af023b1f8f1b890b6c7ee54400bb98cef968b883cd6546"

    4.2. to "iso_checksum": "your-iso-sha256-checksum"
