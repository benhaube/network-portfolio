---
icon: services/it-tools
title: IT-Tools
subtitle: Handy Tools for Devs
description: Handy tools for network administrators and developers.
tags:
  - Active
  - Container
  - Development
  - Service
  - Tools
hide:
  - toc
---

![IT-Tools Icon](../assets/icons/it-tools-light.svg#only-light){ width=200 }
![IT-Tools Icon](../assets/icons/it-tools-dark.svg#only-dark){ width=200 }

# IT-Tools

_Handy Tools for Devs_

[GitHub&ensp;:brands-github:](https://github.com/sharevb/it-tools/){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://deepwiki.com/sharevb/it-tools){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Handy tools for network administrators and developers.

#### :symbols-hash:&ensp;Port(s) 

:    `8080`

#### :symbols-link-2:&ensp;URL / Access 

:    <http://pi-server.internal:8080/>

#### :symbols-user-key:&ensp;Credentials 

:    N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name     | Image                             |
| :------------------------------------------------------------------- | :---------------------------------------- | :----------------- | :-------------------------------- |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `it-tools`         | `sharevb/it-tools:latest`         |
|                                                                      | :symbols-container:&nbsp;Docker Container | `network-utils-ws` | `sharevb/network-utils-ws:latest` |

### :symbols-settings:&ensp;Configuration

``` yaml { .mono-title title="compose.yml" linenums="1" }
--8<-- "it-tools.yml"
```