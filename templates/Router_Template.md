---
icon: material/router-wireless
title: Router Template
tags:
  - hardware
  - network
  - router
  - infrastructure
hide:
  - toc
---
![Icon](../assets/icons/<icon>.svg){ width=200 }

# Router Template
[Docs :material-file-document-multiple:](https://example.com){ .md-button .md-button--primary }&emsp;[Support :material-lifebuoy:](https://example.com){ .md-button }

---
## :material-information-outline: Device Overview

#### :material-toolbox: Role: 
+ AiMesh Node

#### :symbols-host: Hostname(s):
+ `hostname`

#### :material-map-marker-outline: Location: 
+ Location
 
#### :material-memory: OS / Firmware: 
+ :material-router-network-wireless:&nbsp;Router_OS

#### :material-key-chain: Credentials:
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "Credential Entry"

## :material-lan: Network Configuration

#### :material-wan: WAN Connection:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| WAN0 | `x.x.x.x` | `XX:XX:XX:XX:XX:XX` | - |

#### :material-lan: Local Networks:

| VLAN | Domain | DNS Server(s) | Gateway | Subnet | Subnet Mask | Broadcast | DHCP Range |
| :--: | :----- | :------------ | :------ | :----- | :---------- | :-------- | :--------- |
| *vlan* | domain | `x.x.x.x` `x.x.x.x` | `x.x.x.x` | `x.x.x.x/xx` | `255.x.x.x` | `x.x.x.255` | `.x` to `.xxx` |

#### :material-wifi: Wi-Fi Networks:

| SSID | VLAN | IP Address | Frequency | Notes |  
| :--: | :--: | :--------- | :-------- | :---- |
| *SSID* | *vlan* | `x.x.x.x/xx` | - | - |

#### :material-ethernet: Physical Ethernet Ports:

| Port # | Connected Device | Color / Type | Notes |
| :----: | :--------------- | :----------- | :---- |
| 10Gb WAN/LAN 1 | :material-ethernet: *Empty* | - | - |
| 2.5Gb WAN/LAN 2 | :material-ethernet: *Empty* | - | - |
| 2.5Gb LAN 1 | :material-ethernet: *Empty* | - | - |
| 2.5Gb LAN 2 | :material-ethernet: *Empty* | - | - |
| 2.5Gb LAN 3 | :material-ethernet: *Empty* | - | - |
| 2.5Gb LAN 4 | :material-ethernet: *Empty* | - | - |

## :symbols-storage: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/mount/point` | - | - | `/dev/path` | `file-ststem` | - |

#### :material-usb: External/Attached:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/mount/point` | - | - | `/dev/path` | `file-ststem` | - |

## :material-web: Services / Docker Containers

#### :material-linux: Native:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX` | - |

#### :material-docker: Docker:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX` | - |

---
## :material-tools: Maintenance & Notes

> [!config inline] Critical Configurations
> Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :material-update: Update Process:

* Update Process

#### :material-cloud-upload-outline: Backup Policy:

* Backup policy