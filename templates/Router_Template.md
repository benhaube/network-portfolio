---
icon: material/router-wireless
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

[Docs :symbols-documentation:](https://example.com){ .md-button .md-button--primary }&emsp;[Support :material-lifebuoy:](https://example.com){ .md-button }

---
## :symbols-info: Device Overview

#### :symbols-toolbox: Role
:    AiMesh Node

#### :symbols-host: Hostname(s)

+ `hostname`

#### :symbols-location: Location

+ Location
 
#### :symbols-memory: OS / Firmware

+ :symbols-router:&nbsp;Router_OS

#### :symbols-key: Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Folder&ensp;:material-arrow-right-thin:&ensp;"Credential Entry"

## :symbols-lan: Network Configuration

#### :symbols-wan: WAN Connection

| Interface | IP Address | MAC Address         | Connected To |
| :-------: | :--------- | :------------------ | :----------- |
|   WAN0    | `x.x.x.x`  | `XX:XX:XX:XX:XX:XX` | -            |

#### :symbols-lan-outline: Virtual Local Networks

|  VLAN  | Domain | DNS Server(s)       | Gateway   | Subnet       | Subnet Mask | Broadcast   | DHCP Range     |
| :----: | :----- | :------------------ | :-------- | :----------- | :---------- | :---------- | :------------- |
| *vlan* | domain | `x.x.x.x` `x.x.x.x` | `x.x.x.x` | `x.x.x.x/xx` | `255.x.x.x` | `x.x.x.255` | `.x` to `.xxx` |

#### :symbols-android-wifi-lock: Wi-Fi Networks

|  SSID  |  VLAN  | IP Address   | Frequency | Notes |
| :----: | :----: | :----------- | :-------- | :---- |
| *SSID* | *vlan* | `x.x.x.x/xx` | -         | -     |

#### :material-ethernet: Physical Ethernet Ports

|     Port #      | Connected Device            | Color / Type | Notes |
| :-------------: | :-------------------------- | :----------- | :---- |
| 10Gb WAN/LAN 1  | :material-ethernet: *Empty* | -            | -     |
| 2.5Gb WAN/LAN 2 | :material-ethernet: *Empty* | -            | -     |
|   2.5Gb LAN 1   | :material-ethernet: *Empty* | -            | -     |
|   2.5Gb LAN 2   | :material-ethernet: *Empty* | -            | -     |
|   2.5Gb LAN 3   | :material-ethernet: *Empty* | -            | -     |
|   2.5Gb LAN 4   | :material-ethernet: *Empty* | -            | -     |

## :symbols-storage: Storage & Mounts

#### :material-harddisk: Internal Drive(s)

| Mount Point    | Drive Type | Drive Capacity | Device Path | File System   | Encryption |
| :------------- | :--------- | :------------- | :---------- | :------------ | :--------- |
| `/mount/point` | -          | -              | `/dev/path` | `file-ststem` | -          |

#### :symbols-usb: External/Attached

| Mount Point    | Drive Type | Drive Capacity | Device Path | File System   | Encryption |
| :------------- | :--------- | :------------- | :---------- | :------------ | :--------- |
| `/mount/point` | -          | -              | `/dev/path` | `file-ststem` | -          |

## :symbols-web: Services / Docker Containers

#### :material-linux: Native

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

#### :material-docker: Docker

|  Status  | Service                                                  | Port(s) | Role / Notes |
| :------: | :------------------------------------------------------- | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

---
## :symbols-note-stack-fill: Maintenance & Notes

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :symbols-update: Update Process

* Update Process

#### :symbols-backup: Backup Policy

* Backup policy