---
icon: symbols/router
title: Title
subtitle: Subtitle
description: Description
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

[Docs&ensp;:symbols-files:](https://example.com){ .md-button .md-button--primary }&emsp;[Manual&ensp;:symbols-notebook-text:](../path/to/file){ .md-button .md-button--primary }

---

![Router image](../assets/images/router.png){ width=400 align=right .no-shadow }

## :symbols-info:&ensp;Device Overview

Router description goes here.

![status badge](https://uptime.rac3r4life.online/api/badge/#/status)&ensp;![uptime badge](https://uptime.rac3r4life.online/api/badge/#/uptime)&ensp;![cert expire badge](https://uptime.rac3r4life.online/api/badge/#/cert-exp)

**Hostname**

:    `hostname`

**FQDN**

:    `*.internal`

**OS / Firmware**

:    :symbols-router:&nbsp;Router_OS

**Credentials**

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

### :symbols-map-pin:&ensp;Location

- <!-- material/tags { include: [Location] } -->
{ .no-bullets } 

### :symbols-network:&ensp;Network Configuration

#### :symbols-globe:&ensp;WAN Connection

| Interface { data-sort-method="number" } | Status { data-sort-method="none" }                                                                            | IP Address { data-sort-method="dotsep" } | MAC Address         | Connected To { data-sort-method="none" } |
| :-------------------------------------- | :------------------------------------------------------------------------------------------------------------ | :--------------------------------------- | :------------------ | :--------------------------------------- |
| `wan0`                                  | ![wan0 status](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | `x.x.x.x`                                | `XX:XX:XX:XX:XX:XX` | -                                        |

#### :symbols-network:&ensp;Virtual Local Networks

| VLAN { data-sort-method="number" } | Status { data-sort-method="none" }                                                                              | DNS Server(s) { data-sort-method="dotsep" } | Gateway { data-sort-method="dotsep" } | Subnet { data-sort-method="dotsep" } | Subnet Mask { data-sort-method="dotsep" } | Broadcast { data-sort-method="dotsep" } | DHCP Range { data-sort-method="none" } |
| :--------------------------------- | :-------------------------------------------------------------------------------------------------------------- | :------------------------------------------ | :------------------------------------ | :----------------------------------- | :---------------------------------------- | :-------------------------------------- | :------------------------------------- |
| VLAN50                             | ![VLAN50 status](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | `x.x.x.x` `x.x.x.x`                         | `x.x.x.1`                             | `x.x.x.x/xx`                         | `255.x.x.x`                               | `x.x.x.255`                             | `.x` to `.xxx`                         |

#### :symbols-wifi-lock:&ensp;Wi-Fi Networks

| SSID   | VLAN { data-sort-method="number" } |                        WAN Access                        | IP Address { data-sort-method="dotsep" } | Frequency { data-sort-method="number" } | Notes |
| :----- | :--------------------------------- | :------------------------------------------------------: | :--------------------------------------- | :-------------------------------------- | :---- |
| _SSID_ | VLAN50                             | <span aria-label="Yes" role="img">:symbols-check:</span> | `x.x.x.x/xx`                             | 2.4 GHz / 5 GHz / 6 GHz                 | -     |

#### :symbols-ethernet-port:&ensp;Physical Ethernet Ports

| Port { data-sort-method="number" } | Connected Device                | Color / Type { data-sort-method="none" } | Notes { data-sort-method="none" } |
| :--------------------------------: | :------------------------------ | :--------------------------------------- | :-------------------------------- |
|           10Gb WAN/LAN 0           | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |
|          2.5Gb WAN/LAN 1           | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |
|            2.5Gb LAN 2             | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |
|            2.5Gb LAN 3             | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |
|            2.5Gb LAN 4             | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |
|            2.5Gb LAN 5             | :symbols-ethernet-port: _Empty_ | -                                        | -                                 |

### :symbols-folder-tree:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point    | Drive Type | Drive Capacity { data-sort-method="filesize" } | Device Path | File System   | Encryption |
| :------------- | :--------- | :--------------------------------------------- | :---------- | :------------ | :--------- |
| `/mount/point` | -          | -                                              | `/dev/path` | `file-ststem` | -          |

#### :symbols-usb:&ensp;External/Attached

| Mount Point    | Drive Type | Drive Capacity { data-sort-method="filesize" } | Device Path | File System   | Encryption |
| :------------- | :--------- | :--------------------------------------------- | :---------- | :------------ | :--------- |
| `/mount/point` | -          | -                                              | `/dev/path` | `file-ststem` | -          |

### :symbols-cloud:&ensp;Services & Containers

#### :symbols-tux:&ensp;Native

| Service                                                  | Port(s) { data-sort-method="number" } | Status { data-sort-method="none" }                                                                             | Role / Notes { data-sort-method="none" } |
| :------------------------------------------------------- | :-----------------------------------: | :------------------------------------------------------------------------------------------------------------- | :--------------------------------------- |
| [:service-icon:&nbsp;Service](../03_Services/Service.md) |                `XXXX`                 | ![status badge](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | -                                        |

#### :symbols-container:&ensp;Container

| Service                                                  | Port(s) { data-sort-method="number" } | Status { data-sort-method="none" }                                                                             | Role / Notes { data-sort-method="none" } |
| :------------------------------------------------------- | :-----------------------------------: | :------------------------------------------------------------------------------------------------------------- | :--------------------------------------- |
| [:service-icon:&nbsp;Service](../03_Services/Service.md) |                `XXXX`                 | ![status badge](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | -                                        |

---

## :symbols-sticky-notes:&ensp;Maintenance & Notes

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

### :symbols-rotate-cw-clock:&ensp;Update Process

Update Process

### :symbols-cloud-upload:&ensp;Backup Policy

Backup policy
