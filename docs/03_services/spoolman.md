---
icon: services/spoolman
title: Spoolman
subtitle: Filament Inventory Management
description: Spoolman is a self-hosted web service designed to help you efficiently manage your 3D printer filament spools and monitor their usage. 
tags:
  - 3D-Printer
  - Active
  - Container
  - Inventory
  - Service
hide:
  - toc
---

![Spoolman logo](../assets/icons/spoolman.svg){ width=200 }

# Spoolman

_Filament Inventory Management_

[GitHub&ensp;:brands-github:](https://github.com/Donkie/Spoolman){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://github.com/Donkie/Spoolman/wiki/Installation){ .md-button .md-button--primary }

---

![Spoolman homepage](../assets/screenshots/spoolman-library-light.png#only-light){ width=400 align=right .on-glb }
![Spoolman homepage](../assets/screenshots/spoolman-library-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

Spoolman is a self-hosted web service designed to help you efficiently manage your 3D printer filament spools and monitor their usage. It acts as a centralized database that seamlessly integrates with popular 3D printing software like **OctoPrint** and **Klipper / Moonraker**. When connected, it automatically updates spool weights as printing progresses, giving you real-time insights into filament usage.

![status badge](https://uptime.rac3r4life.online/api/badge/43/status)&ensp;![uptime badge](https://uptime.rac3r4life.online/api/badge/43/uptime)&ensp;![GitHub Release](https://img.shields.io/github/v/release/Donkie/spoolman?label=Release&color=%23dc7734)

**Port(s)**

:    `7912`

**URL / Access**

- <http://storage-server.internal:7912/>
{ .no-bullets }
- <http://storage-server-2.internal:7912/>
{ .no-bullets }

**Credentials**

:   N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                            | Status { data-sort-method="none" }                                                                              | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------- | :-------------------------------------------------------------------------------------------------------------- | :------ |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `spoolman`     | `ghcr.io/donkie/spoolman:latest` | ![status badge](https://uptime.rac3r4life.online/api/badge/43/status?label=){ style='vertical-align: middle;' } | `7912`  |

---

## :symbols-settings:&ensp;Configuration

--8<-- "managed-by-arcane.md"

### :symbols-folder-git-2:&ensp;Data Directories

| Contents                   | Path                                                           |
| :------------------------- | :------------------------------------------------------------- |
| Docker Compose File        | `/media/nvme0n1p1/AppData/dockge/stacks/spoolman/compose.yaml` |
| Environment Variables File | `/media/nvme0n1p1/AppData/dockge/stacks/spoolman/.env`         |
| Application Data           | `/media/nvme0n1p1/AppData/dockge/stacks/spoolman/data`         |

### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="../AppData/dockge/stacks/spoolman/compose.yaml" }
--8<-- "spoolman.yml"
```

### :symbols-file-type-corner:&ensp;Environment Variables File

``` properties { .mono-title title="../AppData/dockge/stacks/spoolman/.env" }
--8<-- "spoolman.env"
```
