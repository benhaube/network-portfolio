---
icon: services/immich
title: Immich
subtitle: Bye Bye, Google Photos
description: High performance self-hosted photo and video management solution.
tags:
  - Active
  - Service
  - Software
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

[GitHub&ensp;:simple-github:](https://github.com/immich-app/immich){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:material-file-document-multiple:](https://docs.immich.app/overview/quick-start/){ .md-button .md-button--primary }

---
## :material-information-outline:&ensp;Overview

#### :symbols-description:&ensp;Description  

:    High performance self-hosted photo and video management solution. 

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `2283`

#### :material-link-variant:&ensp;URL / Access

+ :material-lan: LAN Access:
    + <https://immich.internal>
    + <http://storage-server.internal:2283>
    + <http://storage-server-2.internal:2283>
+ :material-web: WAN Access:
    + <https://immich.rac3r4life.online>

#### :material-key-chain:&ensp;Credentials  

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Immich Admin"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Immich User"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                         | Method                                | Container Name            | Image                                                            |
| :------------------------------------------------------------------ | :------------------------------------ | :------------------------ | :--------------------------------------------------------------- |
| [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `immich-server`           | `ghcr.io/immich-app/immich-server:v2.7.5`                        |
|                                                                     |                                       | `immich-machine-learning` | `ghcr.io/immich-app/immich-machine-learning:v2.7.5-openvino`     |
|                                                                     |                                       | `immich-redis`            | `docker.io/redis:6.2-alpine`                                     |
|                                                                     |                                       | `immich-postgres`         | `ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0` |

### :material-cog:&ensp;Configuration 

```yaml title="<code>compose.yml</code>" linenums="1"
--8<-- "immich.yml"
```