---
icon: services/portracker
title: Portracker
subtitle: Port Monitoring & Discovery
description: A self-hosted, real-time port monitoring and discovery tool.
tags:
  - Active
  - Docker
  - Monitor
  - Network
  - Infrastructure
  - Service
hide:
  - toc
---
![Portracker Icon](../assets/icons/portracker-light.svg#only-light){ width=200 }
![Portracker Icon](../assets/icons/portracker-dark.svg#only-dark){ width=200 }

# Portracker
*Port Monitoring & Discovery*

[GitHub&ensp;:brands-github:](https://github.com/mostafa-wahied/portracker){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation-outline:](https://deepwiki.com/mostafa-wahied/portracker){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    A self-hosted, real-time port monitoring and discovery tool.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `4999`

#### :symbols-link-alt:&ensp;URL / Access

Pi 4B Server:

+ <http://192.168.50.2:4999>
+ <http://pi-server.internal:4999>

ZimaOS NAS:

+ <http://192.168.50.4:4999>
+ <http://storage-server.internal:4999>
+ <http://storage-server-2.internal:4999>

#### :symbols-user-key:&ensp;Credentials 

+ N/A

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                    | Method                                | Container Name | Image                             |
| :--------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :-------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                      | :services-docker:&nbsp;Docker Compose | `portracker`   | `mostafawahied/portracker:latest` |
| [:symbols-server-outline:&nbsp;Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)         | :services-docker:&nbsp;Docker Compose | `portracker`   | `mostafawahied/portracker:latest` |
| [:symbols-server-outline:&nbsp;~~Pi Zero 2W Server~~](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :services-docker:&nbsp;Docker Compose | `portracker`   | `mostafawahied/portracker:latest` |

### :symbols-settings:&ensp;Configuration  

```yaml title="Pi 4B Server" linenums="1"
--8<-- "portracker-pi-4b.yml"
```

1. Required for port detection.
2. Required permissions for system ports service namespace access.
3. **Linux hosts:** read other PIDs' `/proc` entries.
4. **Docker Desktop:** allow namespace access for host ports *(required for MacOS)*.
5. Required for system ports.
6. Required for data persistence.
7. Required for discovering services running in Docker.
8. **Optional:** For enhanced TrueNAS features

```yaml title="Pi Zero 2W Server" linenums="1"
--8<-- "portracker-pi-zero.yml"
```

1. Required for port detection.
2. Required permissions for system ports service namespace access.
3. **Linux hosts:** read other PIDs' `/proc` entries.
4. **Docker Desktop:** allow namespace access for host ports *(required for MacOS)*.
5. Required for system ports.
6. Required for data persistence.
7. Required for discovering services running in Docker.
8. **Optional:** For enhanced TrueNAS features

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "portracker-zima.yml"
```