---
icon: services/glances
title: Glances
subtitle: An Eye on Your System
description: Glances an Eye on your system. A top / htop alternative for GNU / Linux, BSD, Mac OS and Windows operating systems.  
tags:
  - Active
  - Docker
  - Monitor
hide:
  - toc
---
![Glances Logo](../assets/icons/glances-light.svg#only-light){ width=200 }
![Glances Logo](../assets/icons/glances-dark.svg#only-dark){ width=200 }

# Glances
*An Eye on Your System*

[GitHub&ensp;:simple-github:](https://github.com/nicolargo/glances){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://glances.readthedocs.io/en/latest/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Glances an Eye on your system. A `top` / `htop` alternative for GNU / Linux, BSD, Mac OS and Windows operating systems.  

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `21208`

#### :symbols-link:&ensp;URL / Access

+ <http://pi-server.internal:61208>
+ <http://storage-server.internal:61208>
+ <http://storage-server-2.internal:61208>

#### :symbols-key:&ensp;Credentials

+ N/A

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                      | Method                                | Container Name | Image                           |
| :----------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :------------------------------ |
| [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :services-docker:&nbsp;Docker Compose | `glances`      | `nicolargo/glances:latest-full` |
| [:symbols-nas-outline:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                       | :services-docker:&nbsp;Docker Compose | `glances`      | `nicolargo/glances:latest-full` |

### :symbols-settings:&ensp;Configuration

#### :services-docker:&ensp;Docker Compose

```yaml title="Raspberry Pi 4B Server" linenums="1"
--8<-- "glances-pi-4b.yml"
```

1. See all image tags here:&ensp;[:services-docker:&nbsp;Docker Hub](https://hub.docker.com/r/nicolargo/glances/tags)
2. Uncomment for SATA or NVME smartctl monitoring.
3. Uncomment for SATA smartctl monitoring.
4. Uncomment for NVME smartctl monitoring.
5. Uncomment for proper distro information in upper panel. Works only for distros that do have this file *(most distros do)*.  
6. Please set to your local timezone *(or use local `${TZ}` environment variable if set on your host)*.
7. Uncomment for GPU compatibility *(Nvidia)* inside the container.  
8. Uncomment to protect Glances WebUI by a login /password *(add `--password` to `GLANCES_OPT`)*.     

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "glances-zima.yml"
```