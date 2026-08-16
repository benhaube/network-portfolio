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

![OpenSpeedTest screenshot](../assets/screenshots/openspeedtest-light.png#only-light){ width=400 align=right }
![OpenSpeedTest screenshot](../assets/screenshots/openspeedtest-dark.png#only-dark){ width=400 align=right }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A free & open-source HTML5 network performance estimation tool.

#### :symbols-hash:&ensp;Port(s)

:    `3004`

#### :symbols-link-2:&ensp;URL / Access

- <http://storage-server.internal:3004>
{ .no-bullets }
- <http://storage-server-2.internal:3004>
{ .no-bullets }

#### :symbols-user-key:&ensp;Credentials

:  N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name  | Image                  |
| :------------------------------------------------------------------- | :---------------------------------------- | :-------------- | :--------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `openspeedtest` | `openspeedtest/latest` |

### :symbols-settings:&ensp;Configuration

--8<-- "deploy_with_dockge.md"

``` yaml { .mono-title title="../AppData/dockge/stacks/openspeedtest/compose.yaml" linenums="1" }
--8<-- "openspeedtest.yml"
```

1. Use port `3000` for HTTP
2. Use port `3001` for HTTPS