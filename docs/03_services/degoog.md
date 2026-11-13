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

![Degoog search results screenshot](../assets/screenshots/degoog-search-light.png#only-light){ width=400 align=right .on-glb }
![Degoog search results screenshot](../assets/screenshots/degoog-search-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

A self-hosted search engine aggregator with a comprehensive plugin / extension system.

![status badge](https://uptime.rac3r4life.online/api/badge/81/status)&ensp;![uptime badge](https://uptime.rac3r4life.online/api/badge/81/uptime)&ensp;![GitHub Release](https://img.shields.io/github/v/release/degoog-org/degoog?label=Release&color=%234580E4)

**Port(s)**

:    `4444`

**URL / Access**

- <http://storage-server.internal:4444>
{ .no-bullets }
- <http://storage-server-2.internal:4444>
{ .no-bullets }

**Credentials**

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Degoog Settings"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name    | Image                              | Status                                                                                                          | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :---------------- | :--------------------------------- | :-------------------------------------------------------------------------------------------------------------- | :------ |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `degoog-degoog-1` | `ghcr.io/degoog-org/degoog:latest` | ![status badge](https://uptime.rac3r4life.online/api/badge/81/status?label=){ style='vertical-align: middle;' } | `4444`  |

---

## :symbols-settings:&ensp;Configuration

--8<-- "managed-by-arcane.md"

### :symbols-folder-git-2:&ensp;Data Directories

| Contents            | Path                                                         |
| :------------------ | :----------------------------------------------------------- |
| Docker Compose File | `/media/nvme0n1p1/AppData/dockge/stacks/degoog/compose.yaml` |
| Degoog Data         | `/media/nvme0n1p1/AppData/dockge/stacks/degoog/data`         |

### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="../AppData/dockge/stacks/degoog/compose.yaml" } 
--8<-- "degoog.yaml"
```

1. Place your settings password in the `.env` file with the variable `SETTINGS_PW`.
