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

| Host Device                                                          | Method                                    | Container Name | Image                            |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `spoolman`     | `ghcr.io/donkie/spoolman:latest` |

### :symbols-settings:&ensp;Configuration

#### :symbols-folder-git-2:&ensp;Data Directories

- Compose File:&ensp;`/media/nvme0n1p1/AppData/dockge/stacks/spoolman`
{ .no-bullets }
- Spoolman Data:&ensp;`/media/nvme0n1p1/AppData/dockge/stacks/spoolman/data`
{ .no-bullets }

#### :symbols-file-code-corner:&ensp;Docker Compose File

--8<-- "includes/managed_by_dockge.md"

``` yaml { .mono-title title="../AppData/dockge/stacks/spoolman/compose.yaml" }
--8<-- "spoolman.yml"
```

1. Also available at [Docker Hub](https://hub.docker.com/r/donkieyo/spoolman){ external-link }:&ensp;`donkieyo/spoolman:latest`
2. Mount the host machine's `./data` directory into the container's `/home/app/.local/share/spoolman` directory.
3. Do _NOT_ modify this line!
4. Map the host machine's port `7912` to the container's port `8000`.
5. Optional, defaults to UTC.