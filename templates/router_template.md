---
icon: symbols/router
title: Title
subtitle: Subtitle
tags:
  - Hardware
  - Infrastructure
  - Network
  - Router
hide:
  - toc
---

![Page Title Icon](../assets/icons/icon.svg){ width=200 }

# Title

_Subtitle_

[Docs :symbols-files:](https://example.com){ .md-button .md-button--primary }&emsp;[Manual :symbols-notebook-text:](../path/to/file){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox: Role

:    AiMesh Node

#### :symbols-host:&ensp;Hostname(s)

:    `hostname`

#### :symbols-map-pin:&ensp;Location

:    Location

#### :symbols-cpu:&ensp;OS / Firmware

:    :symbols-router:&nbsp;Router_OS

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

## :symbols-network:&ensp;Network Configuration

#### :symbols-globe:&ensp;WAN Connection

| Interface { data-sort-method="number" } | IP Address { data-sort-method="dotsep" } | MAC Address         | Connected To { data-sort-method="none" } |
| :-------------------------------------: | :--------------------------------------- | :------------------ | :--------------------------------------- |
|                 `wan0`                  | `x.x.x.x`                                | `XX:XX:XX:XX:XX:XX` | -                                        |

#### :symbols-network:&ensp;Virtual Local Networks

|  VLAN  | Domain | DNS Server(s) { data-sort-method="none" } | Gateway { data-sort-method="dotsep" } | Subnet { data-sort-method="dotsep" } | Subnet Mask { data-sort-method="dotsep" } | Broadcast { data-sort-method="dotsep" } | DHCP Range { data-sort-method="none" } |
| :----: | :----- | :---------------------------------------- | :------------------------------------ | :----------------------------------- | :---------------------------------------- | :-------------------------------------- | :------------------------------------- |
| _vlan_ | domain | `x.x.x.x` `x.x.x.x`                       | `x.x.x.1`                             | `x.x.x.x/xx`                         | `255.x.x.x`                               | `x.x.x.255`                             | `.x` to `.xxx`                         |

#### :symbols-wifi-lock:&ensp;Wi-Fi Networks

|  SSID  |  VLAN  | IP Address { data-sort-method="dotsep" } | Frequency { data-sort-method="none" } | Notes |
| :----: | :----: | :--------------------------------------- | :------------------------------------ | :---- |
| _SSID_ | _vlan_ | `x.x.x.x/xx`                             | -                                     | -     |

#### :symbols-ethernet-port:&ensp;Physical Ethernet Ports

| Port { data-sort-method="number" } | Connected Device                | Color / Type { data-sort-method="none" } | Notes { data-sort-method="none" } |
| :--------------------------------: | :------------------------------ | :--------------------------------------- | :-------------------------------- |
|           10Gb WAN/LAN 0           | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |
|          2.5Gb WAN/LAN 1           | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |
|            2.5Gb LAN 2             | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |
|            2.5Gb LAN 3             | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |
|            2.5Gb LAN 4             | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |
|            2.5Gb LAN 5             | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |

## :symbols-folder-tree:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point    | Drive Type | Drive Capacity { data-sort-method="filesize" } | Device Path | File System   | Encryption |
| :------------- | :--------- | :--------------------------------------------- | :---------- | :------------ | :--------- |
| `/mount/point` | -          | -                                              | `/dev/path` | `file-ststem` | -          |

#### :symbols-usb:&ensp;External/Attached

| Mount Point    | Drive Type | Drive Capacity { data-sort-method="filesize" } | Device Path | File System   | Encryption |
| :------------- | :--------- | :--------------------------------------------- | :---------- | :------------ | :--------- |
| `/mount/point` | -          | -                                              | `/dev/path` | `file-ststem` | -          |

## :symbols-cloud:&ensp;Services & Containers

#### :symbols-tux:&ensp;Native

|  Status  | Service                                                  | Port(s) { data-sort-method="number" } | Role / Notes { data-sort-method="none" } |
| :------: | :------------------------------------------------------- | :-----------------------------------: | :--------------------------------------- |
| _Active_ | :service-icon:&nbsp;[Service](../03_Services/Service.md) |                `XXXX`                 | -                                        |

#### :symbols-container:&ensp;Container

|  Status  | Service                                                  | Port(s) { data-sort-method="number" } | Role / Notes { data-sort-method="none" } |
| :------: | :------------------------------------------------------- | :-----------------------------------: | :--------------------------------------- |
| _Active_ | :service-icon:&nbsp;[Service](../03_Services/Service.md) |                `XXXX`                 | -                                        |

---

## :symbols-sticky-notes:&ensp;Maintenance & Notes

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :symbols-rotate-cw-clock:&ensp;Update Process

- Update Process

#### :symbols-cloud-upload:&ensp;Backup Policy

- Backup policy