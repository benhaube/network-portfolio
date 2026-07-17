---
icon: services/immich
title: Immich
subtitle: Bye Bye, Google Photos
description: High performance self-hosted photo and video management solution.
tags:
  - Active
  - Container
  - File Share
  - Backup
  - Service
hide:
  - toc
---
![Immich Logo](../assets/icons/immich.svg){ width=200 }

# Immich
*Bye Bye, Google Photos*

[GitHub&ensp;:brands-github:](https://github.com/immich-app/immich){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.immich.app/overview/quick-start/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description  

:    High performance self-hosted photo and video management solution. 

#### :symbols-settings-ethernet:&ensp;Port(s) 

:    `2283`

#### :symbols-link:&ensp;URL / Access

:    :symbols-lan:&nbsp;LAN Access:
    
      + <https://immich.internal>
      + <http://storage-server.internal:2283>
      + <http://storage-server-2.internal:2283>

:    :symbols-globe:&nbsp;WAN Access:
    
      + <https://immich.rac3r4life.online>

#### :symbols-user-key:&ensp;Credentials  

:    [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"Immich Admin"
      + Local Network&ensp;:symbols-move-right:&ensp;"Immich User"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name            | Image                                                            |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------------------ | :--------------------------------------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `immich-server`           | `ghcr.io/immich-app/immich-server:v2.7.5`                        |
|                                                                      |                                           | `immich-machine-learning` | `ghcr.io/immich-app/immich-machine-learning:v2.7.5-openvino`     |
|                                                                      |                                           | `immich-redis`            | `docker.io/redis:6.2-alpine`                                     |
|                                                                      |                                           | `immich-postgres`         | `ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0` |

### :symbols-settings:&ensp;Configuration 

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "immich.yml"
```