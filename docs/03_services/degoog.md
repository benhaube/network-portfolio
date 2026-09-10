---
icon: services/degoog
title: Degoog
subtitle: Search You Run Yourself
description: A self-hosted search engine aggregator with a comprehensive plugin / extension system.
status: new
tags:
  - Active
  - Container
  - New
  - Service
  - Tools
hide:
  - toc
---

![Degoog logo](../assets/icons/degoog-light.svg#only-light){ width=200 }
![Degoog logo](../assets/icons/degoog-dark.svg#only-dark){ width=200 }

# Degoog

_Search You Run Yourself_

[GitHub&ensp;:brands-github:](https://github.com/degoog-org/degoog){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://degoog-org.github.io/docs/){ .md-button .md-button--primary }

---

![Degoog search results screenshot](../assets/screenshots/degoog-home-light.png#only-light){ width=400 align=right .on-glb }
![Degoog search results screenshot](../assets/screenshots/degoog-home-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A self-hosted search engine aggregator with a comprehensive plugin / extension system.

#### :symbols-hash:&ensp;Port(s)

:    `4444`

#### :symbols-link-2:&ensp;URL / Access

- <http://storage-server.internal:4444>
{ .no-bullets }
- <http://storage-server-2.internal:4444>
{ .no-bullets }

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Degoog Settings"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name    | Image                              | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :---------------- | :--------------------------------- | :------ |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `degoog-degoog-1` | `ghcr.io/degoog-org/degoog:latest` | `4444`  |

### :symbols-settings:&ensp;Configuration

--8<-- "includes/managed_by_dockge.md"

``` yaml { .mono-title title="../AppData/dockge/stacks/degoog/compose.yaml" } 
--8<-- "degoog.yaml"
```
