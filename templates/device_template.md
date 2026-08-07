---
icon: symbols/monitor-smartphone
title: Title
subtitle: Subtitle
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

[Button :symbols-icon:](https://example.com){ .md-button .md-button--primary }&emsp;[Button :symbols-icon:](https://example.com){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role

:    Device role

#### :symbols-host:&ensp;Hostname

:    `hostname`

#### :symbols-map-pin:&ensp;Location

:    Location

#### :symbols-cpu:&ensp;OS / Firmware

:    :os-icon:&nbsp;Operating System

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }:

    - Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

#### :symbols-brick-wall-shield:&ensp;Device Security

:    Hardware / Software security features _(e.g., TPM2)_

## :symbols-circuit-board:&ensp;Core Specs

| CPU                  | Cores / Threads | CPU Freq. | RAM  | GPU | GPU Freq. | VRAM |
| :------------------- | :-------------- | :-------- | :--- | :-- | :-------- | :--- |
| CPU _(architecture)_ | #C / #T         | # GHz     | # GB | GPU | # MHz     | # GB |

## :symbols-network:&ensp;Network Configuration

| Interface | IP Address { data-sort-method="dotsep" } | MAC Address         | Connected To                  |
| :-------: | :--------------------------------------- | :------------------ | :---------------------------- |
|  enp7s0   | `x.x.x.x`                                | `XX:XX:XX:XX:XX:XX` | :symbols-ethernet-port:&nbsp; |

| Interface | VLAN   | FQDN               | DNS Servers { data-sort-method="none" } | Gateway { data-sort-method="dotsep" } |
| :-------: | :----- | :----------------- | :-------------------------------------- | :------------------------------------ |
|  enp7s0   | VLAN50 | `example.internal` | `x.x.x.x` `x.x.x.x`                     | `x.x.x.1`                             |

## :symbols-folders:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point    | Drive Type | Drive Capacity { data-sort-method="filesize" } | Device Path | File System | Encryption |
| :------------- | :--------- | :--------------------------------------------- | :---------- | :---------- | :--------- |
| `/mount-point` | NVMe SSD   | 929 GB                                         | `/dev/path` | `btrfs`     | -          |

#### :symbols-usb:&ensp;External/Attached

| Mount Point    | Drive Type | Drive Capacity { data-sort-method="filesize" } | Device Path | File System | Encryption |
| :------------- | :--------- | :--------------------------------------------- | :---------- | :---------- | :--------- |
| `/mount-point` | NVMe SSD   | 929 GB                                         | `/dev/path` | `btrfs`     | -          |

## :symbols-cloud:&ensp;Services & Containers

#### :symbols-layers:&ensp;Virtualization

|  Status  | OS                                       | Virtual NIC             | Virtual Disk Image | Role / Notes |
| :------: | :--------------------------------------- | :---------------------- | :----------------- | :----------- |
| _Active_ | :os-icon:&nbsp;[OS](https://example.com) | Virtual Network _(NAT)_ | `disk-image.qcow2` | -            |

#### :symbols-tux:&ensp;Native Linux

|  Status  | Service                                                   | Port(s) { data-sort-method="number" } | Role / Notes |
| :------: | :-------------------------------------------------------- | :-----------------------------------: | :----------- |
| _Active_ | :services-icon:&nbsp;[Service](../03_Services/Service.md) |                `XXXX`                 | -            |

#### :symbols-container:&ensp;Docker

|  Status  | Service                                                   | Port(s) { data-sort-method="number" } | Role / Notes |
| :------: | :-------------------------------------------------------- | :-----------------------------------: | :----------- |
| _Active_ | :services-icon:&nbsp;[Service](../03_Services/Service.md) |                `XXXX`                 | -            |

---

## :symbols-sticky-notes:&ensp;Maintenance & Notes

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :symbols-rotate-cw-clock:&ensp;Update Process

- Update Process

#### :symbols-cloud-upload:&ensp;Backup Policy

- Backup policy