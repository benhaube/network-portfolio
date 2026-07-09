---
icon: services/openspeedtest
title: OpenSpeedTest
subtitle: Test Network Performance
description: A free & open-source HTML5 network performance estimation tool.
tags:
  - Active
  - Docker
  - Network
  - Infrastructure
  - Monitor
  - Service
hide:
  - toc
---
![OpenSpeedTest Logo](../assets/icons/openspeedtest.svg){ width=200 }

# OpenSpeedTest
*Test Network Performance*

[GitHub&ensp;:simple-github:](https://github.com/openspeedtest/Docker-Image){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation-outline:](https://deepwiki.com/openspeedtest/Speed-Test){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    A free & open-source HTML5 network performance estimation tool.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `3004`

#### :symbols-link-alt:&ensp;URL / Access  

+ <https://openspeedtest.internal>
+ <http://storage-server.internal:3004>
+ <http://storage-server-2.internal:3004>

#### :symbols-user-key:&ensp;Credentials 

+ N/A

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                | Method                                | Container Name  | Image                  |
| :------------------------------------------------------------------------- | :------------------------------------ | :-------------- | :--------------------- |
| [:symbols-nas-outline:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :services-docker:&nbsp;Docker Compose | `openspeedtest` | `openspeedtest/latest` |

### :symbols-settings:&ensp;Configuration

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "openspeedtest.yml"
```

1. Use port `3000` for HTTP
2. Use port `3001` for HTTPS