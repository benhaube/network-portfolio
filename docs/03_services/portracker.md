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

![Portracker homepage](../assets/screenshots/portracker-home-light.png#only-light){ width=400 align=right }
![Portracker homepage](../assets/screenshots/portracker-home-dark.png#only-dark){ width=400 align=right }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A self-hosted, real-time port monitoring and discovery tool.

#### :symbols-hash:&ensp;Port(s)

:    `4999`

#### :symbols-link-2:&ensp;URL / Access

-   :symbols-server:&ensp;Pi 4B Server:
{ .no-bullets }
    - <http://pi-server.internal:4999>
-   :symbols-server-nas:&ensp;ZimaOS NAS:
{ .no-bullets }
    - <http://storage-server.internal:4999>
    - <http://storage-server-2.internal:4999>

#### :symbols-user-key:&ensp;Credentials

:  N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                             |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :-------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `portracker`   | `mostafawahied/portracker:latest` |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `portracker`   | `mostafawahied/portracker:latest` |

### :symbols-settings:&ensp;Configuration

--8<-- "deploy_with_dockge.md"

##### Pi 4B Server

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

##### ZimaOS NAS

``` yaml { .mono-title title="../AppData/dockge/stacks/portracker/compose.yaml" linenums="1" }
--8<-- "portracker-zima.yml"
```