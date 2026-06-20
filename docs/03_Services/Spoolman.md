---
icon: services/spoolman
title: Spoolman
subtitle: Filament Inventory Management
tags:
  - Active
  - Service
  - Software
  - Docker
  - 3D-Printer
hide:
  - toc
---
![Spoolman logo](../assets/icons/spoolman.svg){ width=200 }

# Spoolman
*Filament Inventory Management*

[GitHub&ensp;:simple-github:](https://github.com/Donkie/Spoolman){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:material-file-document-multiple:](https://github.com/Donkie/Spoolman/wiki/Installation){ .md-button .md-button--primary }

---
## :material-information-outline:&ensp;Overview

#### :symbols-description:&ensp;Description 

:    Keep track of your inventory of 3D-printer filament spools. 

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `7912`

#### :material-link-variant:&ensp;URL / Access   

+ <http://storage-server.internal:7912/>
+ <http://storage-server-2.internal:7912/>
+ <https://spoolman.internal>

#### :material-key-chain:&ensp;Credentials 

+ N/A

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                            |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :------------------------------- |
| [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `spoolman`     | `ghcr.io/donkie/spoolman:latest` |

### :material-cog:&ensp;Configuration 

```yaml title="<code>compose.yml</code>" linenums="1"
--8<-- "spoolman.yml"
```
