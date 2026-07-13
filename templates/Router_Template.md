---
icon: symbols/router
title: Router Template
subtitle: Subtitle
tags:
  - Hardware
  - Network
  - Router
  - Infrastructure
hide:
  - toc
---
![Icon](../assets/icons/<icon>.svg){ width=200 }

# Router Template
*Subtitle*

[Docs :symbols-files:](https://example.com){ .md-button .md-button--primary }&emsp;[Manual :symbols-notebook-text:](../path/to/file){ .md-button .md-button--primary }

---
## :symbols-info: Device Overview

#### :symbols-toolbox: Role
:    AiMesh Node

#### :symbols-host: Hostname(s)

+ `hostname`

#### :symbols-map-pin: Location

+ Location
 
#### :symbols-cpu: OS / Firmware

+ :symbols-router:&nbsp;Router_OS

#### :symbols-user-key: Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

## :symbols-lan: Network Configuration

#### :symbols-wan: WAN Connection

| Interface | IP Address | MAC Address         | Connected To |
| :-------: | :--------- | :------------------ | :----------- |
|   WAN0    | `x.x.x.x`  | `XX:XX:XX:XX:XX:XX` | -            |

#### :symbols-lan: Virtual Local Networks

|  VLAN  | Domain | DNS Server(s)       | Gateway   | Subnet       | Subnet Mask | Broadcast   | DHCP Range     |
| :----: | :----- | :------------------ | :-------- | :----------- | :---------- | :---------- | :------------- |
| *vlan* | domain | `x.x.x.x` `x.x.x.x` | `x.x.x.x` | `x.x.x.x/xx` | `255.x.x.x` | `x.x.x.255` | `.x` to `.xxx` |

#### :symbols-wifi-cog: Wi-Fi Networks

|  SSID  |  VLAN  | IP Address   | Frequency | Notes |
| :----: | :----: | :----------- | :-------- | :---- |
| *SSID* | *vlan* | `x.x.x.x/xx` | -         | -     |

#### :symbols-ethernet-port: Physical Ethernet Ports

|     Port #      | Connected Device                        | Color / Type | Notes |
| :-------------: | :-------------------------------------- | :----------- | :---- |
| 10Gb WAN/LAN 1  | :symbols-ethernet-port: *Empty* | -            | -     |
| 2.5Gb WAN/LAN 2 | :symbols-ethernet-port: *Empty* | -            | -     |
|   2.5Gb LAN 1   | :symbols-ethernet-port: *Empty* | -            | -     |
|   2.5Gb LAN 2   | :symbols-ethernet-port: *Empty* | -            | -     |
|   2.5Gb LAN 3   | :symbols-ethernet-port: *Empty* | -            | -     |
|   2.5Gb LAN 4   | :symbols-ethernet-port: *Empty* | -            | -     |

## :symbols-folders: Storage & Mounts

#### :symbols-hard-drive: Internal Drive(s)

| Mount Point    | Drive Type | Drive Capacity | Device Path | File System   | Encryption |
| :------------- | :--------- | :------------- | :---------- | :------------ | :--------- |
| `/mount/point` | -          | -              | `/dev/path` | `file-ststem` | -          |

#### :symbols-usb: External/Attached

| Mount Point    | Drive Type | Drive Capacity | Device Path | File System   | Encryption |
| :------------- | :--------- | :------------- | :---------- | :------------ | :--------- |
| `/mount/point` | -          | -              | `/dev/path` | `file-ststem` | -          |

## :symbols-monitor-cloud: Services / Docker Containers

#### :symbols-penguin: Native

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

#### :services-docker: Docker

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

---
## :symbols-sticky-notes: Maintenance & Notes

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :symbols-update: Update Process

* Update Process

#### :symbols-cloud-upload: Backup Policy

* Backup policy