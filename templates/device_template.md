---
icon: symbols/monitor-smartphone
title: Title
subtitle: Subtitle
description: Description
tags:
  - Hardware
  - Network
  - Server
hide:
  - toc
---

![Page Title Icon](../assets/icons/icon.svg){ width=200 }

# Title

_Subtitle_

[Button&ensp;:symbols-icon:](https://example.com){ .md-button .md-button--primary }&emsp;[Button&ensp;:symbols-icon:](https://example.com){ .md-button .md-button--primary }

---

![Device image](../assets/images/device.png){ width=400 align=right .no-shadow }

## :symbols-info:&ensp;Device Overview

Device description goes here.

![status badge](https://uptime.rac3r4life.online/api/badge/#/status)&ensp;![uptime badge](https://uptime.rac3r4life.online/api/badge/#/uptime)S

**Hostname**

:    `hostname`

**OS / Firmware**

:    :os-icon:&nbsp;Operating System

**Credentials**

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

### :symbols-brick-wall-shield:&ensp;Device Security

:    Hardware / Software security features _(e.g., TPM2)_

### :symbols-map-pin:&ensp;Location

- <!-- material/tags { include: [Location] } -->
{ .no-bullets } 

### :symbols-circuit-board:&ensp;Core Specs

| CPU                  | Cores / Threads | CPU Freq. | RAM  | GPU | GPU Freq. | VRAM |
| :------------------- | :-------------- | :-------- | :--- | :-- | :-------- | :--- |
| CPU _(architecture)_ | #C / #T         | # GHz     | # GB | GPU | # MHz     | # GB |

### :symbols-network:&ensp;Network Configuration

| Interface | Status { data-sort-method="none" }                                                                              | IP Address { data-sort-method="dotsep" } | MAC Address         | Connected To                  |
| :-------- | :-------------------------------------------------------------------------------------------------------------- | :--------------------------------------- | :------------------ | :---------------------------- |
| enp7s0    | ![enp7s0 status](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | `x.x.x.x`                                | `XX:XX:XX:XX:XX:XX` | :symbols-ethernet-port:&nbsp; |

| Interface | VLAN   | FQDN               | DNS Servers { data-sort-method="none" } | Gateway { data-sort-method="dotsep" } |
| :-------- | :----- | :----------------- | :-------------------------------------- | :------------------------------------ |
| enp7s0    | VLAN50 | `example.internal` | `x.x.x.x` `x.x.x.x`                     | `x.x.x.1`                             |

### :symbols-folders:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point    | Drive Type | Drive Capacity { data-sort-method="filesize" } | Device Path | File System | Encryption |
| :------------- | :--------- | :--------------------------------------------- | :---------- | :---------- | :--------- |
| `/mount-point` | NVMe SSD   | 929 GB                                         | `/dev/path` | `btrfs`     | -          |

#### :symbols-usb:&ensp;External/Attached

| Mount Point    | Drive Type | Drive Capacity { data-sort-method="filesize" } | Device Path | File System | Encryption |
| :------------- | :--------- | :--------------------------------------------- | :---------- | :---------- | :--------- |
| `/mount-point` | NVMe SSD   | 929 GB                                         | `/dev/path` | `btrfs`     | -          |

### :symbols-cloud:&ensp;Services & Containers

#### :symbols-layers:&ensp;Virtualization

| OS                                       | Virtual NIC             | Virtual Disk Image | Status { data-sort-method="none" }                                                                             | Role / Notes { data-sort-method="none" } |
| :--------------------------------------- | :---------------------- | :----------------- | :------------------------------------------------------------------------------------------------------------- | :--------------------------------------- |
| :os-icon:&nbsp;[OS](https://example.com) | Virtual Network _(NAT)_ | `disk-image.qcow2` | ![status badge](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | -                                        |

#### :symbols-tux:&ensp;Native Linux

| Service                                                   | Port(s) { data-sort-method="number" } | Status { data-sort-method="none" }                                                                             | Role / Notes { data-sort-method="none" } |
| :-------------------------------------------------------- | :-----------------------------------: | :------------------------------------------------------------------------------------------------------------- | :--------------------------------------- |
| :services-icon:&nbsp;[Service](../03_Services/Service.md) |                `XXXX`                 | ![status badge](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | -                                        |

#### :symbols-container:&ensp;Docker

| Service                                                   | Port(s) { data-sort-method="number" } | Status { data-sort-method="none" }                                                                             | Role / Notes { data-sort-method="none" } |
| :-------------------------------------------------------- | :-----------------------------------: | :------------------------------------------------------------------------------------------------------------- | :--------------------------------------- |
| :services-icon:&nbsp;[Service](../03_Services/Service.md) |                `XXXX`                 | ![status badge](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | -                                        |

---

## :symbols-sticky-notes:&ensp;Maintenance & Notes

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

### :symbols-rotate-cw-clock:&ensp;Update Process

Update Process

### :symbols-cloud-upload:&ensp;Backup Policy

Backup policy
