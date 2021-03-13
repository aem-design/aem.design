---
title: "Deployment Practices"
permalink: /manifesto/deployment/
excerpt: "Content Modeling has to be a first and foremost activity of any Feature/Capability planning"
modified: 2016-11-03T10:01:43-04:00
author: max@aem.design
categories:
  - manifesto
tags:
  - guide
redirect_from:
  - /manifesto/project/
---

{% include toc_sticky.html %}


To be able to support CI/CD practice automation should used to minimise deployment overheads and avoid conflicts. When segregating infrastructure and security, production artifacts and environments should be replicated to other environments so that its configurations can be tested throughout normal development cycles. Practices must be continually refactored to be simple and transparent so that they can be used without manual intervention. It's important to utilise same practices across all environments without exceptions, this ensures continuous improvement on practices as they are used by wider group of users.

![image alt text](/assets/images/manifesto/content-deployment-practice.png)

The whole environment should be able to be replicated in different configurations in a local environment. Using Docker and Ansible for streamlining the deployment architecture and inventory enable consistency of environment and enables persistence of operations functions.

General practice is to only allow System Console and Package Installation in Local Dev environment. This practice ensures that all efforts to update a node persisted into Code and do not create conflict of the Node configuration state.

## Package Deployment and Replication

Packages should be used to deploy system content and for bulk content operations (backup, archive, migration etc). Replication should be used to replicate content by authors during normal operations.

It's important that package can be installed and uninstalled from a node. This is to ensure that update by the package can be rolled back in cases where testing has failed. Replicating packages from one node to another removes ability to Uninstall the package from the target node. Additionally replication of a package does not allow for additional processes to be carried out on the node during a deployment process.

## Deployment Cycle

Deployment cycle is deployment steps that run automatically triggered by Code updates by developers or triggered manually or automatically by other jobs. The cycle is divided into Build and Deploy Stages. Build stage is used to respond to Code updates and carry out subsequent build processes and artifact storage. Deploy Stage is used for Deploying a particular versioned artifact to an environment.

### Build Stage

1. Commit - Developer commits code to Repository

2. Pull - Jenkins monitors updates and pulls code into workspace

3. Build - Jenkins build the code using a Docker Container

4. Store - on successful build artifact is stored in Nexus

### Deploy Stage

5. Retrieve - Jenkins deploy job retrieves a package from Nexus into workspace

6. Deploy - Jenkins deploys package to target Node

7. Test - Jenkins runs Testing job for the target Node

8. Push - Push project version update to repo

9. Cache - Optional, if docker containers are updated then containers is cached in shared docker registry

![image alt text](/assets/images/manifesto/content-deployment-cycle.png)
