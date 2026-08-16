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

![Spoolman homepage](../assets/screenshots/spoolman-home-light.png#only-light){ width=400 align=right .on-glb }
![Spoolman homepage](../assets/screenshots/spoolman-home-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Keep track of your inventory of 3D-printer filament spools.

#### :symbols-hash:&ensp;Port(s)

:    `7912`

#### :symbols-link-2:&ensp;URL / Access

- <http://storage-server.internal:7912/>
{ .no-bullets }
- <http://storage-server-2.internal:7912/>
{ .no-bullets }

#### :symbols-user-key:&ensp;Credentials

:  N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                            |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `spoolman`     | `ghcr.io/donkie/spoolman:latest` |

### :symbols-settings:&ensp;Configuration

``` yaml { .mono-title title="~/.casaos/apps/big-bear-spoolman/docker-compose.yml" linenums="1" }
--8<-- "spoolman.yml"
```