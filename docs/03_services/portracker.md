---
icon: services/portracker
title: Portracker
subtitle: Port Monitoring & Discovery
description: A self-hosted, real-time port monitoring and discovery tool.
tags:
  - Active
  - Container
  - Infrastructure
  - Monitor
  - Network
  - Service
hide:
  - toc
---

![Portracker Icon](../assets/icons/portracker.svg){ width=200 }

# Portracker

_Port Monitoring & Discovery_

[GitHub&ensp;:brands-github:](https://github.com/mostafa-wahied/portracker){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://deepwiki.com/mostafa-wahied/portracker){ .md-button .md-button--primary }

---

![Portracker homepage](../assets/screenshots/portracker-home-light.png#only-light){ width=400 align=right .on-glb }
![Portracker homepage](../assets/screenshots/portracker-home-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

A self-hosted, real-time port monitoring and discovery tool.

![status badge](https://uptime.rac3r4life.online/api/badge/62/status)&ensp;![uptime badge](https://uptime.rac3r4life.online/api/badge/62/uptime)&ensp;![GitHub Release](https://img.shields.io/github/v/release/mostafa-wahied/portracker?label=Release&color=%237c86ff)

**Port(s)**

:    `4999`

**URL / Access**

- <http://pi-server.internal:4999>
{ .no-bullets }
- <http://storage-server.internal:4999>
{ .no-bullets }
- <http://storage-server-2.internal:4999>
{ .no-bullets }

**Credentials**

:   N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                             | Status                                                                                                          | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :-------------------------------- | :-------------------------------------------------------------------------------------------------------------- | :------ |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `portracker`   | `mostafawahied/portracker:latest` | ![status badge](https://uptime.rac3r4life.online/api/badge/55/status?label=){ style='vertical-align: middle;' } | `4999`  |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `portracker`   | `mostafawahied/portracker:latest` | ![status badge](https://uptime.rac3r4life.online/api/badge/41/status?label=){ style='vertical-align: middle;' } | `4999`  |

---

## :symbols-settings:&ensp;Configuration

--8<-- "managed-by-arcane.md"

### :symbols-folder-git-2:&ensp;Data Directories

#### Pi 4B Server

| Contents            | Path                                     |
| :------------------ | :--------------------------------------- |
| Docker Compose File | `/opt/stacks/portracker/compose.yaml`    |
| Application Data    | `/opt/stacks/portracker/portracker-data` |

#### ZimaOS NAS

| Contents            | Path                                                     |
| :------------------ | :------------------------------------------------------- |
| Docker Compose File | `/media/nvme0n1p1/dockge/stacks/portracker/compose.yaml` |
| Application Data    | `/media/nvme0n1p1/dockge/stacks/portracker/data`         |

### :symbols-file-code-corner:&ensp;Docker Compose File

#### Pi 4B Server

``` yaml { .mono-title title="/opt/stacks/portracker/compose.yaml" linenums="1" }
--8<-- "portracker-pi-4b.yml"
```

1. Required for port detection.
2. Required permissions for system ports service namespace access.
3. **Linux hosts:** read other PIDs' `/proc` entries.
4. **Docker Desktop:** allow namespace access for host ports _(required for MacOS)_.
5. Required for system ports.
6. Required for data persistence.
7. Required for discovering services running in Docker.
8. **Optional:** For enhanced TrueNAS features

#### ZimaOS NAS

``` yaml { .mono-title title="../AppData/dockge/stacks/portracker/compose.yaml" linenums="1" }
--8<-- "portracker-zima.yml"
```
