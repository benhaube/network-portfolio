---
icon: services/it-tools
title: IT-Tools
subtitle: Handy Tools for Devs
description: Handy tools for network administrators and developers.
tags:
  - Active
  - Docker
  - Tools
  - Development
hide:
  - toc
---
![IT-Tools Icon](../assets/icons/it-tools-light.svg#only-light){ width=200 }
![IT-Tools Icon](../assets/icons/it-tools-dark.svg#only-dark){ width=200 }

# IT-Tools
*Handy Tools for Devs*

[GitHub&ensp;:simple-github:](https://github.com/sharevb/it-tools/){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://deepwiki.com/sharevb/it-tools){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-description:&ensp;Description 

:    Handy tools for network administrators and developers.

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `8080`

#### :symbols-link:&ensp;URL / Access

+ <https://it-tools.internal>
+ <http://pi-server.internal:8080/>

#### :symbols-key:&ensp;Credentials 

+ N/A

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                      | Method                                | Container Name     | Image                             |
| :----------------------------------------------------------------------------------------------- | :------------------------------------ | :----------------- | :-------------------------------- |
| [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `it-tools`         | `sharevb/it-tools:latest`         |
|                                                                                                  | :material-docker:&nbsp;Docker Compose | `network-utils-ws` | `sharevb/network-utils-ws:latest` |

### :symbols-settings:&ensp;Configuration 

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "it-tools.yml"
```
