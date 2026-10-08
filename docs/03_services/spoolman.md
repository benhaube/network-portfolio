---
icon: services/spoolman
title: Spoolman
subtitle: Filament Inventory Management
description: Keep track of your inventory of 3D-printer filament spools.
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

#### :symbols-file-text:&ensp;Description

:    Spoolman is a self-hosted web service designed to help you efficiently manage your 3D printer filament spools and monitor their usage. It acts as a centralized database that seamlessly integrates with popular 3D printing software like **OctoPrint** and **Klipper / Moonraker**. When connected, it automatically updates spool weights as printing progresses, giving you real-time insights into filament usage.

#### :symbols-hash:&ensp;Port(s)

:    `7912`

#### :symbols-link-2:&ensp;URL / Access

- <http://storage-server.internal:7912/>
{ .no-bullets }
- <http://storage-server-2.internal:7912/>
{ .no-bullets }

#### :symbols-user-key:&ensp;Credentials

: N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                            | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------- | :------ |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `spoolman`     | `ghcr.io/donkie/spoolman:latest` | `7912`  |

### :symbols-settings:&ensp;Configuration

--8<-- "includes/managed_by_dockge.md"

#### :symbols-folder-git-2:&ensp;Data Directories

| Contents            | Path                                                           |
| :------------------ | :------------------------------------------------------------- |
| Docker Compose File | `/media/nvme0n1p1/AppData/dockge/stacks/spoolman/compose.yaml` |
| Application Data    | `/media/nvme0n1p1/AppData/dockge/stacks/spoolman/data`         |

#### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="../AppData/dockge/stacks/spoolman/compose.yaml" }
--8<-- "spoolman.yml"
```

#### :symbols-file-type-corner:&ensp;Environment Variables File

``` properties { .mono-title title="../AppData/dockge/stacks/spoolman/.env" }
--8<-- "spoolman.env"
```
