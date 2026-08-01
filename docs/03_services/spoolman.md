---
icon: services/spoolman
title: Spoolman
subtitle: Filament Inventory Management
description: Keep track of your inventory of 3D-printer filament spools.
tags:
  - Active
  - Container
  - Inventory
  - 3D-Printer
  - Service
hide:
  - toc
---
![Spoolman logo](../assets/icons/spoolman.svg){ width=200 }

# Spoolman
*Filament Inventory Management*

[GitHub&ensp;:brands-github:](https://github.com/Donkie/Spoolman){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://github.com/Donkie/Spoolman/wiki/Installation){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Keep track of your inventory of 3D-printer filament spools. 

#### :symbols-hash:&ensp;Port(s)

:    `7912`

#### :symbols-link-2:&ensp;URL / Access    

:    <http://storage-server.internal:7912/>

:    <http://storage-server-2.internal:7912/>

#### :symbols-user-key:&ensp;Credentials 

:    N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                            |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `spoolman`     | `ghcr.io/donkie/spoolman:latest` |

### :symbols-settings:&ensp;Configuration 

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "spoolman.yml"
```