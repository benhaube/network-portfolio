---
icon: services/openspeedtest
title: OpenSpeedTest
subtitle: Test Network Performance
description: A free & open-source HTML5 network performance estimation tool.
tags:
  - Active
  - Service
  - Software
  - Docker
  - Network
  - Infrastructure
  - Monitor
hide:
  - toc
---
![OpenSpeedTest Logo](../assets/icons/openspeedtest.svg){ width=200 }

# OpenSpeedTest
*Test Network Performance*

[GitHub&ensp;:simple-github:](https://github.com/openspeedtest/Docker-Image){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:material-file-document-multiple:](https://openspeedtest.com/selfhosted-speedtest){ .md-button .md-button--primary }

---
## :material-information-outline:&ensp;Overview

#### :symbols-description:&ensp;Description 

:    A free & open-source HTML5 network performance estimation tool.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `3004`

#### :material-link-variant:&ensp;URL / Access  

+ <https://openspeedtest.internal>
+ <http://storage-server.internal:3004>
+ <http://storage-server-2.internal:3004>

#### :material-key-chain:&ensp;Credentials 

+ N/A

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                         | Method                                | Container Name  | Image                  |
| :------------------------------------------------------------------ | :------------------------------------ | :-------------- | :--------------------- |
| [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `openspeedtest` | `openspeedtest/latest` |

### :material-cog:&ensp;Configuration

```yaml title="<code>compose.yml</code>" linenums="1"
--8<-- "openspeedtest.yml"
```

1. Use port `3000` for HTTP
2. Use port `3001` for HTTPS