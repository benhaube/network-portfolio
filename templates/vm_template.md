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
## :symbols-info:&ensp;Overview

#### :symbols-toolbox:&ensp;Role
:    Insert role here 

#### :symbols-host:&ensp;Hostname

:    `hostname`

#### :symbols-layers:&ensp;Hypervisor

:    (e.g., KVM / QEMU)

#### :symbols-cpu:&ensp;Operating System

:    :os-icon:&nbsp;[Operating System](https://example.com)

#### :symbols-network-node:&ensp;Host Node

:    [:device-icon: Device_Template](device_template.md)

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

## :symbols-square-activity:&ensp;Resource Allocation

|         vCPU          |  RAM  | Storage | VDI Location  |
| :-------------------: | :---: | :------ | :------------ |
| #C / #T *(virt-tech)* | # GB  | # GB    | `path/to/vdi` |

## :symbols-lan:&ensp;Network Configuration

| Interface | IP Address | MAC Address         | Notes |
| :-------: | :--------- | :------------------ | :---- |
|  enp1s0   | `x.x.x.x`  | `XX:XX:XX:XX:XX:XX` | -     |

| Interface | VLAN   | FQDN                | DNS Servers | Gateway   |
| :-------: | :----- | :------------------ | :---------- | :-------- |
|  enp1s0   | VLAN50 | `hostname.internal` | `0.0.0.0`   | `x.x.x.1` |

## :symbols-monitor-cloud:&ensp;Services / Docker Containers

#### :symbols-penguin:&ensp;Native Linux

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

#### :symbols-container:&ensp;Container

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

---
## :symbols-sticky-notes:&ensp;Maintenance & Snapshots

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :symbols-update:&ensp;Update Policy

+ Update Policy

#### :symbols-fullscreen:&ensp;Snapshot Policy

+ Snapshot Policy

#### :symbols-refresh-ccw-dot:&ensp;Recovery

+ Recovery Policy