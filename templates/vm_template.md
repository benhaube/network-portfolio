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

![Virtual Machine screenshot](../assets/screenshots/screenshot.png){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-toolbox:&ensp;Role

:    Insert role here

#### :symbols-host:&ensp;Hostname

:    `hostname`

#### :symbols-layers:&ensp;Hypervisor

:    (e.g., KVM / QEMU)

#### :symbols-cpu:&ensp;Operating System

:    [:os-icon:&nbsp;Operating System](https://example.com)

#### :symbols-network-node:&ensp;Host Node

:    [:device-icon: Device_Template](device_template.md)

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

## :symbols-square-activity:&ensp;Resource Allocation

|         vCPU          | RAM { data-sort-method="filesize" } | Storage { data-sort-method="filesize" } | VDI Location  |
| :-------------------: | :---------------------------------- | :-------------------------------------- | :------------ |
| #C / #T _(virt-tech)_ | # GB                                | # GB                                    | `path/to/vdi` |

## :symbols-network:&ensp;Network Configuration

| Interface | IP Address { data-sort-method="dotsep" } | MAC Address         | Notes { data-sort-method="none" } |
| :-------: | :--------------------------------------- | :------------------ | :-------------------------------- |
|  enp1s0   | `x.x.x.x`                                | `XX:XX:XX:XX:XX:XX` | -                                 |

| Interface | VLAN   | FQDN                | DNS Servers { data-sort-method="dotsep" } | Gateway { data-sort-method="dotsep" } |
| :-------: | :----- | :------------------ | :---------------------------------------- | :------------------------------------ |
|  enp1s0   | VLAN50 | `hostname.internal` | `0.0.0.0`                                 | `x.x.x.1`                             |

## :symbols-cloud:&ensp;Services & Containers

#### :symbols-tux:&ensp;Native Linux

|  Status  | Service                                                  | Port(s) { data-sort-method="number" } | Role / Notes { data-sort-method="none" } |
| :------: | :------------------------------------------------------- | :-----------------------------------: | :--------------------------------------- |
| _Active_ | [:service-icon:&nbsp;Service](../03_Services/Service.md) |                `XXXX`                 | -                                        |

#### :symbols-container:&ensp;Container

|  Status  | Service                                                  | Port(s) { data-sort-method="number" } | Role / Notes { data-sort-method="none" } |
| :------: | :------------------------------------------------------- | :-----------------------------------: | :--------------------------------------- |
| _Active_ | [:service-icon:&nbsp;Service](../03_Services/Service.md) |                `XXXX`                 | -                                        |

---

## :symbols-sticky-notes:&ensp;Maintenance & Snapshots

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :symbols-rotate-cw-clock:&ensp;Update Policy

- Update Policy

#### :symbols-fullscreen:&ensp;Snapshot Policy

- Snapshot Policy

#### :symbols-refresh-ccw-dot:&ensp;Recovery

- Recovery Policy