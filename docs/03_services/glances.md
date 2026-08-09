---
icon: services/glances
title: Glances
subtitle: An Eye on Your System
description: Glances an Eye on your system. A 'top' / 'htop' alternative for GNU / Linux, BSD, Mac OS and Windows operating systems.  
tags:
  - Active
  - Container
  - Monitor
  - Service
hide:
  - toc
---

![Glances Logo](../assets/icons/glances-light.svg#only-light){ width=200 }
![Glances Logo](../assets/icons/glances-dark.svg#only-dark){ width=200 }

# Glances

_An Eye on Your System_

[GitHub&ensp;:brands-github:](https://github.com/nicolargo/glances){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://glances.readthedocs.io/en/latest/){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Glances an Eye on your system. A `top` / `htop` alternative for GNU / Linux, BSD, Mac OS and Windows operating systems.  

#### :symbols-hash:&ensp;Port(s) 

:    `61208`

#### :symbols-link-2:&ensp;URL / Access 

:    <http://pi-server.internal:61208>

:    <http://storage-server.internal:61208>

#### :symbols-user-key:&ensp;Credentials

:    N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                           |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------ |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `glances`      | `nicolargo/glances:latest-full` |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `glances`      | `nicolargo/glances:latest-full` |

### :symbols-settings:&ensp;Configuration

#### :symbols-folder-git-2:&ensp;Data Directories

##### Pi 4B Server

:    `/opt/stacks/glances/glances.conf`
:    `/opt/stacks/glances/compose.yaml`

##### ZimaOS NAS

:    `../AppData/glances/glances.conf`
:    `../AppData/dockge/stacks/glances/compose.yaml`

#### :symbols-file-code-corner:&ensp;Docker Compose File

--8<-- "deploy_with_dockge.md"

##### Pi 4B Server

``` yaml { .mono-title title="/opt/stacks/glances/compose.yaml" linenums="1" }
--8<-- "glances-pi-4b.yml"
```

1. See all image tags here:&ensp;[Docker Hub](https://hub.docker.com/r/nicolargo/glances/tags){ external-link }
2. Uncomment for SATA or NVME smartctl monitoring.
3. Uncomment for SATA smartctl monitoring.
4. Uncomment for NVME smartctl monitoring.
5. Uncomment for proper distro information in upper panel. Works only for distros that do have this file _(most distros do)_.  
6. Please set to your local timezone _(or use local `${TZ}` environment variable if set on your host)_.
7. Uncomment for GPU compatibility _(Nvidia)_ inside the container.  
8. Uncomment to protect Glances WebUI by a login /password *(add `--password` to `GLANCES_OPT`)*.  

##### ZimaOS NAS

``` yaml { .mono-title title="../AppData/dockge/stacks/glances/compose.yaml" linenums="1" }
--8<-- "glances-zima.yml"
```