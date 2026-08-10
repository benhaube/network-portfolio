---
icon: services/immich
title: Immich
subtitle: Bye Bye, Google Photos
description: High performance self-hosted photo and video management solution.
tags:
  - Active
  - Backup
  - Container
  - File Share
  - Service
hide:
  - toc
---

![Immich Logo](../assets/icons/immich.svg){ width=200 }

# Immich

_Bye Bye, Google Photos_

[GitHub&ensp;:brands-github:](https://github.com/immich-app/immich){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.immich.app/overview/quick-start/){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    High performance self-hosted photo and video management solution.

#### :symbols-hash:&ensp;Port(s) 

:    `2283`

#### :symbols-link-2:&ensp;URL / Access 

:    :symbols-network:&nbsp;Local Access:

    - <http://storage-server.internal:2283>
    - <http://storage-server-2.internal:2283>

:    :symbols-globe-arrow:&nbsp;Remote Access:

    - <https://immich.rac3r4life.online>

#### :symbols-user-key:&ensp;Credentials  

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Immich (admin)"
    - Local Network&ensp;:symbols-move-right:&ensp;"Immich (bhaube)"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name            | Image                                                            |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------------------ | :--------------------------------------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `immich-server`           | `ghcr.io/immich-app/immich-server:v3.0.3`                        |
|                                                                      |                                           | `immich-machine-learning` | `ghcr.io/immich-app/immich-machine-learning:v3.0.3-openvino`     |
|                                                                      |                                           | `immich-redis`            | `docker.io/redis:6.2-alpine`                                     |
|                                                                      |                                           | `immich-postgres`         | `ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0` |

### :symbols-settings:&ensp;Configuration

#### :symbols-folder-git-2:&ensp;Data Directories

##### Docker Deploy

:    `~/.casaos/apps/immich/docker-compose.yml`

##### Database

:    `../AppData/immich/pgdata`

##### Machine Learning Data

:    `../AppData/immich/model-cache`

##### Immich-Redis Data

:    `../AppData/immich/redis`

##### Server Data

:    `/media/Quick-Storage/Gallery/immich`

##### Photo Library

:    `/media/Quick-Storage/Gallery/immich/library`

#### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="~/.casaos/apps/immich/docker-compose.yml" linenums="1" }
--8<-- "immich.yml"
```