---
icon: symbols/stacks
title: Title
subtitle: Subtitle
description: Description
tags:
  - Hardware
  - Server
  - Virtual Machine
hide:
  - toc
---

![Page Title Icon](../assets/icons/icon.svg){ width=200 }

# Title

_Subtitle_

[OS&ensp;:os-icon:](https://example.com){ .md-button .md-button--primary }&emsp;[OS Docs&ensp;:symbols-files:](https://example.com){ .md-button .md-button--primary }

---

![Virtual Machine image](../assets/screenshots/screenshot.png){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

Description of virtual machine goes here.

![status badge](https://uptime.rac3r4life.online/api/badge/#/status)&ensp;![uptime badge](https://uptime.rac3r4life.online/api/badge/#/uptime)

**Hostname**

:    `hostname`

**Hypervisor**

:    (e.g., KVM / QEMU)

**Operating System**

:    [:os-icon:&nbsp;Operating System](https://example.com)

**Host Node**

:    [:device-icon: Device_Template](device_template.md)

**Credentials**

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

### :symbols-square-activity:&ensp;Resource Allocation

| vCPU                  | RAM { data-sort-method="filesize" } | Storage { data-sort-method="filesize" } | VDI Location  |
| :-------------------- | :---------------------------------- | :-------------------------------------- | :------------ |
| #C / #T _(virt-tech)_ | # GB                                | # GB                                    | `path/to/vdi` |

### :symbols-network:&ensp;Network Configuration

| Interface                                                                                                                     | IP Address { data-sort-method="dotsep" } | MAC Address         | Notes { data-sort-method="none" } |
| :---------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------- | :------------------ | :-------------------------------- |
| enp1s0&ensp;![enp1s0 status](https://uptime.rac3r4life.online/api/badge/119/status?label=){ style='vertical-align: middle;' } | `x.x.x.x`                                | `XX:XX:XX:XX:XX:XX` | -                                 |

| Interface | VLAN   | FQDN                | DNS Servers { data-sort-method="dotsep" } | Gateway { data-sort-method="dotsep" } |
| :-------- | :----- | :------------------ | :---------------------------------------- | :------------------------------------ |
| enp1s0    | VLAN50 | `hostname.internal` | `0.0.0.0`                                 | `x.x.x.1`                             |

### :symbols-cloud:&ensp;Services & Containers

#### :symbols-tux:&ensp;Native Linux

| Service                                                  | Port(s) { data-sort-method="number" } | Status                                                                                                         | Role / Notes { data-sort-method="none" } |
| :------------------------------------------------------- | :-----------------------------------: | :------------------------------------------------------------------------------------------------------------- | :--------------------------------------- |
| [:service-icon:&nbsp;Service](../03_Services/Service.md) |                `XXXX`                 | ![status badge](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | -                                        |

#### :symbols-container:&ensp;Container

| Service                                                  | Port(s) { data-sort-method="number" } | Status                                                                                                         | Role / Notes { data-sort-method="none" } |
| :------------------------------------------------------- | :-----------------------------------: | :------------------------------------------------------------------------------------------------------------- | :--------------------------------------- |
| [:service-icon:&nbsp;Service](../03_Services/Service.md) |                `XXXX`                 | ![status badge](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | -                                        |

---

## :symbols-sticky-notes:&ensp;Maintenance & Snapshots

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

### :symbols-rotate-cw-clock:&ensp;Update Policy

Update Policy

### :symbols-fullscreen:&ensp;Snapshot Policy

Snapshot Policy

### :symbols-refresh-ccw-dot:&ensp;Recovery

Recovery Policy
