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

![Immich library homepage](../assets/screenshots/immich-library-light.png#only-light){ width=400 align=right .on-glb }
![Immich library homepage](../assets/screenshots/immich-library-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    High performance self-hosted photo and video management solution.

#### :symbols-hash:&ensp;Port(s) 

:    `2283`

#### :symbols-link-2:&ensp;URL / Access

-   :symbols-network:&ensp;Local Access:
{ .no-bullets }
    - <http://storage-server.internal:2283>
    - <http://storage-server-2.internal:2283>
-   :symbols-globe-arrow:&ensp;Remote Access:
{ .no-bullets }
    - <https://immich.rac3r4life.online>

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Immich (admin)"
    - Local Network&ensp;:symbols-move-right:&ensp;"Immich (bhaube)"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name            | Image                                                            |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------------------ | :--------------------------------------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `immich-server`           | `ghcr.io/immich-app/immich-server:v3-release`                    |
|                                                                      |                                           | `immich-machine-learning` | `ghcr.io/immich-app/immich-machine-learning:v3-openvino`         |
|                                                                      |                                           | `redis`                   | `docker.io/valkey/valkey:9`                                      |
|                                                                      |                                           | `database`                | `ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0` |

### :symbols-settings:&ensp;Configuration

#### :symbols-folder-git-2:&ensp;Data Directories

##### Docker Deploy

- `../AppData/dockge/stacks/immich/compose.yaml`
{ .no-bullets }
- `../AppData/dockge/stacks/immich/.env`
{ .no-bullets }
- `../AppData/dockge/stacks/immich/hwaccel.transcoding.yml`
{ .no-bullets }
- `../AppData/dockge/stacks/immich/hwaccel.ml.yml`
{ .no-bullets }

##### Database

- `../AppData/immich/pgdata`
{ .no-bullets }

##### Machine Learning

- `../AppData/immich/model-cache`
{ .no-bullets }

##### Redis

- `../AppData/immich/redis`
{ .no-bullets }

##### Server

- `/media/Quick-Storage/Gallery/immich`
{ .no-bullets }

##### Photo Library

- `/media/Quick-Storage/Gallery/immich/library`
{ .no-bullets } 

#### :symbols-file-code-corner:&ensp;Docker Compose File

--8<-- "includes/managed_by_dockge.md"

``` yaml { .mono-title title="../AppData/dockge/stacks/immich/compose.yaml" linenums="1" }
--8<-- "immich.yml"
```

1.  WARNING: To install Immich, follow our [guide](https://docs.immich.app/install/docker-compose){ external-link }.

    Make sure to use the [`docker-compose.yml`](https://github.com/immich-app/immich/releases/latest/download/docker-compose.yml){ external-link } of the current release. The compose file on main may not be compatible with the latest release.

2.  Set to one of `nvenc`, `quicksync`, `rkmpp`, `vaapi`, `vaapi-wsl` for accelerated transcoding.
3.  Do not edit the next line. If you want to change the media storage location on your system, edit the value of `UPLOAD_LOCATION` in the `.env` file.
4.  For hardware acceleration, add one of `-armnn`, `-cuda`, `-rocm`, `-openvino`, `-rknn` to the image tag.

    Example tag: `${IMMICH_VERSION:-release}-cuda`

5.  Uncomment the `DB_STORAGE_TYPE: 'HDD'` variable if your database isn't stored on SSDs.
6.  Do not edit the next line. If you want to change the database storage location on your system, edit the value of `DB_DATA_LOCATION` in the `.env` file.

##### Environment Variables

``` properties { .mono-title title="../AppData/dockge/stacks/immich/.env" }
--8<-- "immich.env"
```

1. You can find documentation for all the supported env variables at <https://docs.immich.app/install/environment-variables>.
2. Connection secret for postgres. You should change it to a random password. Please use only the characters, `A-Za-z0-9`, without special characters or spaces.
3. The values below this line do not need to be changed.

##### Hardware Acceleration Configuration

``` yaml { .mono-title title="../AppData/dockge/stacks/immich/hwaccel.transcoding.yml" }
--8<-- "immich.hwaccel.transcoding.yml"
```

1.  Configurations for hardware-accelerated transcoding.

    If using Unraid or another platform that doesn't allow multiple Compose files, you can inline the config for a backend by copying its contents into the `immich-microservices` service in the `docker-compose.yml` file.

    See <https://docs.immich.app/features/hardware-transcoding> for more info on using hardware transcoding.

2.  Enables full access to `/sys` and `/proc`, still far better than `privileged: true`.
3.  Only required to enable OpenCL-accelerated HDR :symbols-move-right: SDR tonemapping.
4.  Only required to enable OpenCL-accelerated HDR :symbols-move-right: SDR tonemapping.
5.  Only required to enable OpenCL-accelerated HDR :symbols-move-right: SDR tonemapping.
6.  Use this for `VAAPI` if you're running Immich in WSL2.

``` yaml { .mono-title title="../AppData/dockge/stacks/immich/hwaccel.ml.yml" }
--8<-- "immich.hwaccel.ml.yml"
```

1.  Configurations for hardware-accelerated machine learning.

    If using Unraid or another platform that doesn't allow multiple Compose files, you can inline the config for a backend by copying its contents into the `immich-machine-learning` service in the `docker-compose.yml` file.

    See <https://docs.immich.app/features/ml-hardware-acceleration> for info on usage.

2.  Mali firmware for your chipset _(not always required depending on the driver)_.
3.  Mali driver for your chipset _(always required)_.