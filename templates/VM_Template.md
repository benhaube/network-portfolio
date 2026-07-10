---
icon: symbols/stacks
title: VM Template
subtitle: Subtitle
tags:
  - Hardware
  - Virtual Machine
  - Server
hide:
  - toc
---
![Icon](../assets/icons/<icon>.svg){ width=200 }

# VM Template
*Subtitle*

[OS :os-icon:](https://example.com){ .md-button .md-button--primary }&emsp;[OS Docs :symbols-documentation-outline:](https://example.com){ .md-button .md-button--primary }

---
## :symbols-info: Overview

#### :symbols-toolbox-outline: Role
:    Insert role here 

#### :symbols-host-outline: Hostname

+ `hostname`

#### :symbols-layers: Hypervisor

+ (e.g., KVM / QEMU)

#### :symbols-memory: Operating System

+ :os-icon:&nbsp;[Operating System](https://example.com)

#### :symbols-network-node: Host Node

+ [:device-icon: Device_Template](Device_Template.md)

#### :symbols-user-key: Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Folder&ensp;:symbols-arrow-right-thin:&ensp;"Credential Entry"

## :symbols-square-activity: Resource Allocation

|         vCPU          |  RAM  | Storage | VDI Location  |
| :-------------------: | :---: | :------ | :------------ |
| #C / #T *(virt-tech)* | # GB  | # GB    | `path/to/vdi` |

## :symbols-lan-outline: Network Configuration

| Interface | IP Address | MAC Address         | Notes |
| :-------: | :--------- | :------------------ | :---- |
|  enp1s0   | `x.x.x.x`  | `XX:XX:XX:XX:XX:XX` | -     |

| Interface | VLAN   | FQDN                | DNS Servers | Gateway   |
| :-------: | :----- | :------------------ | :---------- | :-------- |
|  enp1s0   | VLAN50 | `hostname.internal` | `0.0.0.0`   | `x.x.x.1` |

## :symbols-web: Services / Docker Containers

#### :symbols-linux: Native Linux

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

#### :services-docker: Docker

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

---
## :symbols-note-stack: Maintenance & Snapshots

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :symbols-update: Update Policy

+ Update Policy

#### :symbols-screenshot-region: Snapshot Policy

+ Snapshot Policy

#### :symbols-restore: Recovery

+ Recovery Policy