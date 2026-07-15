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

[OS :os-icon:](https://example.com){ .md-button .md-button--primary }&emsp;[OS Docs :symbols-files:](https://example.com){ .md-button .md-button--primary }

---
## :symbols-info: Overview

#### :symbols-toolbox: Role
:    Insert role here 

#### :symbols-host: Hostname

:    `hostname`

#### :symbols-layers: Hypervisor

:    (e.g., KVM / QEMU)

#### :symbols-cpu: Operating System

:    :os-icon:&nbsp;[Operating System](https://example.com)

#### :symbols-network-node: Host Node

:    [:device-icon: Device_Template](Device_Template.md)

#### :symbols-user-key: Credentials

:    [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    
      + Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

## :symbols-square-activity: Resource Allocation

|         vCPU          |  RAM  | Storage | VDI Location  |
| :-------------------: | :---: | :------ | :------------ |
| #C / #T *(virt-tech)* | # GB  | # GB    | `path/to/vdi` |

## :symbols-lan: Network Configuration

| Interface | IP Address | MAC Address         | Notes |
| :-------: | :--------- | :------------------ | :---- |
|  enp1s0   | `x.x.x.x`  | `XX:XX:XX:XX:XX:XX` | -     |

| Interface | VLAN   | FQDN                | DNS Servers | Gateway   |
| :-------: | :----- | :------------------ | :---------- | :-------- |
|  enp1s0   | VLAN50 | `hostname.internal` | `0.0.0.0`   | `x.x.x.1` |

## :symbols-monitor-cloud: Services / Docker Containers

#### :symbols-penguin: Native Linux

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

#### :services-docker: Docker

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

---
## :symbols-sticky-notes: Maintenance & Snapshots

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :symbols-update: Update Policy

+ Update Policy

#### :symbols-fullscreen: Snapshot Policy

+ Snapshot Policy

#### :symbols-refresh-ccw-dot: Recovery

+ Recovery Policy