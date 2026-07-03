---
icon: services/immich
title: Immich
subtitle: Bye Bye, Google Photos
description: High performance self-hosted photo and video management solution.
tags:
  - Active
  - Docker
  - File Share
  - Download
  - Backup
hide:
  - toc
---
![Immich Logo](../assets/icons/immich.svg){ width=200 }

# Immich
*Bye Bye, Google Photos*

[GitHub&ensp;:simple-github:](https://github.com/immich-app/immich){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://docs.immich.app/overview/quick-start/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-description:&ensp;Description  

:    High performance self-hosted photo and video management solution. 

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `2283`

#### :symbols-link:&ensp;URL / Access

+ :symbols-lan: LAN Access:
    + <https://immich.internal>
    + <http://storage-server.internal:2283>
    + <http://storage-server-2.internal:2283>
+ :symbols-web: WAN Access:
    + <https://immich.rac3r4life.online>

#### :symbols-key:&ensp;Credentials  

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Immich Admin"
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Immich User"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                        | Method                                | Container Name            | Image                                                            |
| :----------------------------------------------------------------- | :------------------------------------ | :------------------------ | :--------------------------------------------------------------- |
| [:symbols-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :services-docker:&nbsp;Docker Compose | `immich-server`           | `ghcr.io/immich-app/immich-server:v2.7.5`                        |
|                                                                    |                                       | `immich-machine-learning` | `ghcr.io/immich-app/immich-machine-learning:v2.7.5-openvino`     |
|                                                                    |                                       | `immich-redis`            | `docker.io/redis:6.2-alpine`                                     |
|                                                                    |                                       | `immich-postgres`         | `ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0` |

### :symbols-settings:&ensp;Configuration 

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "immich.yml"
```