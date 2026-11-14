---
icon: services/openspeedtest
title: OpenSpeedTest
subtitle: Test Network Performance
description: A free & open-source HTML5 network performance estimation tool.
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

![OpenSpeedTest Logo](../assets/icons/openspeedtest.svg){ width=200 }

# OpenSpeedTest

_Test Network Performance_

[GitHub&ensp;:brands-github:](https://github.com/openspeedtest/Docker-Image){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://deepwiki.com/openspeedtest/Speed-Test){ .md-button .md-button--primary }

---

![OpenSpeedTest screenshot](../assets/screenshots/openspeedtest-light.png#only-light){ width=400 align=right .on-glb }
![OpenSpeedTest screenshot](../assets/screenshots/openspeedtest-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

A free & open-source HTML5 network performance estimation tool.

![status badge](https://uptime.rac3r4life.online/api/badge/89/status)&ensp;![uptime badge](https://uptime.rac3r4life.online/api/badge/89/uptime)&ensp;![GitHub Release](https://img.shields.io/github/v/release/openspeedtest/Docker-Image?label=Release&color=%233da6ff)

**Port(s)**

:    `3004`

**URL / Access**

- <http://storage-server.internal:3004>
{ .no-bullets }
- <http://storage-server-2.internal:3004>
{ .no-bullets }

**Credentials**

:   N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name  | Image                  | Status { data-sort-method="none" }                                                                              | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :-------------- | :--------------------- | :-------------------------------------------------------------------------------------------------------------- | :------ |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `openspeedtest` | `openspeedtest/latest` | ![status badge](https://uptime.rac3r4life.online/api/badge/89/status?label=){ style='vertical-align: middle;' } | `3004`  |

---

## :symbols-settings:&ensp;Configuration

--8<-- "managed-by-arcane.md"

``` yaml { .mono-title title="../AppData/dockge/stacks/openspeedtest/compose.yaml" linenums="1" }
--8<-- "openspeedtest.yml"
```

1. Use port `3000` for HTTP
2. Use port `3001` for HTTPS
