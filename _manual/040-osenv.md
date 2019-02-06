---
title: "Manual"
permalink: /manual/osenv/
excerpt: "AEM.Design Framework Manual"
author: yaw@aem.design
comments: true
redirect_from:
  - /manual/management/
categories:
  - info
tags:
  - docs
---

{% include toc %}

# Operating Environment

## Server

### Red Hat Enterprise Linux

The following sections details the configuration of Red Hat Enterprise Linux in accordance with the operability of the devops services such as Docker. Topic areas include:

1. Network security and IPTables

2. Data management with Thin Pools and Thinly Provisioned Volumes

#### IPTables

The servers are configured with the IPTables service. The initial configuration is applied in the [Virtual Machine Project](#heading=h.rocwy889w6ac) in the script ```aemdesign-vm/scripts/devops/firewall.sh```.

The IPTables rules are specified within the applications *group var* in the aemdesign-deploy project using the ‘*iptable’ *variable,

```
group_vars/applications/vars.yml
```

The role *‘server-iptables’* automates the application of the configuration in the [Using the IPTables service](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Security_Guide/sec-Using_iptables.html) (NOTE:  https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Security_Guide/sec-Using_iptables.html) of the Red Hat Product Information.

The configuration of IPTables is not strictly required for the Docker containers that bind to the host IP and port. The Docker service will forward packets from the statically assigned IP network interface *eth0* to the network interface *docker0 *that binds to the Docker bridge network (under the Virtual Machine Project and in the file  *aemdesign-vm/scripts/devops/firewall.sh*)

The IPTables rules for applications that are installed as services on the operating system are required to be defined.

#### Thin Pool

A Thin Pool named *‘rhel’* is configured in the aemdesign-vm project as part of the initial Docker installation. Details on the installation can be found ‘*aemdesign-vm/scripts/devops/docker-install.sh*’.

Each server is configured with Convoy (NOTE:  Convoy project home: https://github.com/rancher/convoy) which is used in Docker as a volume plugin. Convoy is a Docker Plugin that wraps a thin pool backed by the kernel level Device Mapper (NOTE:  Red Hat Device Mapper documentation : https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/device_mapper.html). The Docker containers in the AEM Platform are configured to use Convoy to manage their data.

#### Thin Volume Management

As the Docker containers write and delete data in the logical volumes, blocks allocated by the thin pool are not released immediately. This is by design as a security and as a performance concern. The security concern is as blocks are marked as unused, the blocks may contain sensitive data that can be read by another process when released. The thin pool can ‘*zero out’* the data block but this is a performance concern as a delete will incur a corresponding write operation.

A recommended way to ensure unused blocks are eventually released, is to schedule a regular job to execute the command *‘fstrim’** *on the mounted file systems. This command returns unused blocks to the thin pool.

See [operation-volume-fstrim.yml](#heading=h.4v3bfwjhvfhq).

### Docker

Docker is configured to manage applications using thin pool volume data management via Convoy.

The service is installed via the [aemdesign-vm](#heading=h.rocwy889w6ac) project in the script *‘aemdesign-vm/scripts/devops/docker-install.sh’*.

#### Convoy Volume Plugin

As Convoy is configured as a Docker volume plugin, it is not required to use the *‘convoy’* command line tool. Docker calls the Convoy API as part of the container lifecycle API to create and delete Docker volumes.

The following convoy command output demonstrates the ‘wrapping’ of the Device Mapper i.e. the *dmsetup* command.

##### List Managed Volumes

```bash
convoy list
```

output:

```bash
"consul-client":{
	"Name": "consul-client",
	"Driver": "devicemapper",
	"MountPoint": "/var/lib/rancher/convoy/devicemapper/mounts/consul-client",
	"CreatedTime": "Mon Jul 24 15:28:08 +0800 2017",
	"DriverInfo": {
		"DevID": "10",
		"Device": "/dev/mapper/consul-client",
		"Driver": "devicemapper",
		"Filesystem": "ext4",
		"MountPoint": "/var/lib/rancher/convoy/devicemapper/mounts/consul-client",
		"Size": "107374182400",
		"VolumeCreatedAt": "Mon Jul 24 15:28:08 +0800 2017",
		"VolumeName": "consul-client"
	},
	"Snapshots": {}
}
```

##### Create Volume

```bash
convoy create [volume_name]
```


##### Delete Volume

```bash
convoy delete [volume_name]
```


#### Docker Images

**NOTE**: These images will be migrated to aemdesign-docker and will be available on [https://hub.docker.com/u/aemdesign](https://hub.docker.com/u/aemdesign)

| Role                            | Deploy Project Source Path                  |
|---------------------------------|---------------------------------------------|
| AEM                             | aem/files/docker/aem                     |
| AEM Base                        | aem-base/files/docker/aem-base              |
| AEM Dispatcher                  | dispatcher/files/docker/dispatcher |
| Oracle JDK                      | docker-image-oracle-jdk/files/docker/oracle-jdk |
| Jenkins                         | jenkins/files/docker/jenkins |
| Jenkins Base                    | jenkins/files/docker/jenkins-base |
| Nexus                           | nexus/files/docker/nexus |
| Mulesoft ESB                    | mule-esb/files/docker/muleesb |
| Solr Cloud                      | solr-cloud/files/docker/aem-solr |


##### Updating Docker Images

The high level process for updating a Docker image is as follows:

1. Develop the Dockerfile for the service ([https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)).

2. Create a new version folder (under *files/docker/[image_name]/[image_version]*) in the role that is provisioning the service in the aemdesign-deploy project. Place the Dockerfile and all supporting build files in the folder.

3. Update the variable *docker_image_tag *using variable precedence to target environments, groups and servers.

    1. Update the variable in the role’s default vars (*default/main.yml*) if this Docker image supersedes all previous image versions. For example, the new image version contains critical application updates or an external dependency that is no longer available.

    2. Update the variable in the group vars (*group_vars/[group_name]/vars.yml*) to update the servers belonging to the group. For example, AEM authors, publishers and processing groups are running the same Docker image.

    3. Update the group vars for services in an environment (*inventory/[environment_name]*). Create a group var using the group suffix ‘:vars’ (reference: [http://docs.ansible.com/ansible/latest/intro_inventory.html#group-variables](http://docs.ansible.com/ansible/latest/intro_inventory.html#group-variables)). Limit the use of this approach as it is best to promote Docker images from one environment to the next environment.

4. Commit the changes to the repository.

5. In Jenkins, under ‘Packages’,  schedule the job titled ‘Playbook Build Images’. This job will build the Docker image and deploy it to the private repository (Nexus).

6. In Jenkins, under ‘Playbooks’, schedule the site playbook in an environment by invoking the job ‘Site Playbook (*[environment_name]*)’

#### Consul

Consul provides the AEM Platform with **Service Discovery** using an application level Domain Name System (DNS). Online documentation can be found here: [https://www.consul.io/docs/index.html](https://www.consul.io/docs/index.html).

Consul abstracts the underlying network details from the AEM platform. This design allows the playbooks to reference a single configuration regardless of environment. Additionally, this reduces the amount of configuration to maintain.

#### Registrator

Automatic Docker service registration for service discovery in Consul.
