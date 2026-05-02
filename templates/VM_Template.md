---
icon: material/network-pos
title: VM Template
tags:
  - hardware
  - virtual_machine
  - server
hide:
  - toc
---
![Icon](../assets/icons/<icon>.svg){ width=200 }

# VM Template
[OS :os-icon:](https://example.com){ .md-button .md-button--primary }&emsp;[OS Docs :material-file-document-multiple:](https://example.com){ .md-button }

---
## :material-information-outline: Overview

#### :material-toolbox: Role: 
+ [Insert role here] 

#### :symbols-host: Hostname(s):
+ `hostname`

#### :material-network-pos: Hypervisor: 
+ (e.g., KVM / QEMU)

#### :material-memory: Operating System:
+ :os-icon:&nbsp;[Operating System](https://example.com)

#### :material-server-network-outline: Host Node: 
+ [:device-icon: Device_Template](Device_Template.md)

#### :material-key-chain: Credentials:
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): .
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Credential Entry"

#### :symbols-monitor-heart: Resource Allocation:

|         vCPU          |  RAM  | Storage | VDI Location  |
| :-------------------: | :---: | :------ | :------------ |
| #C / #T *(virt-tech)* | # GB  | # GB    | `path/to/vdi` |

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address         | Notes |
| :-------: | :--------- | :------------------ | :---- |
|  enp1s0   | `x.x.x.x`  | `XX:XX:XX:XX:XX:XX` | -     |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s)         | DNS Servers | Gateway   |
| :--- | :------------------ | :---------- | :-------- |
| vlan | `hostname.internal` | `0.0.0.0`   | `x.x.x.1` |

## :material-web: Services / Docker Containers

#### :material-linux: Native Linux:

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

#### :material-docker: Docker:

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

---
## :material-tools: Maintenance & Snapshots

> [!config] Critical Configurations
> Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :material-update: Update Policy:

+ Update Policy

#### :material-camera: Snapshot Policy:

+ Snapshot Policy

#### :material-backup-restore: Recovery:

+ Recovery Policy