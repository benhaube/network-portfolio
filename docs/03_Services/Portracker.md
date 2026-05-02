---
icon: services/portracker
tags:
  - Active
  - Service
  - Software
  - Docker
  - Monitor
  - Network
  - Infrastructure
hide:
  - toc
---
![Portracker Icon](../assets/icons/portracker-light.svg#only-light){ width=200 }
![Portracker Icon](../assets/icons/portracker-dark.svg#only-dark){ width=200 }

# Portracker
[GitHub :material-github:](https://github.com/mostafa-wahied/portracker){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A self-hosted, real-time port monitoring and discovery tool.

#### :symbols-settings-ethernet: Port(s):
+ `4999`

#### :material-link-variant: URL / Access:  
+ <http://192.168.50.4:4999>
+ <http://storage-server.internal:4999>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                          | Method                                | Container Name | Image                             |
| :--------------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :-------------------------------- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                                  | :material-docker:&nbsp;Docker Compose | `portracker`   | `mostafawahied/portracker:latest` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)      | :material-docker:&nbsp;Docker Compose | `portracker`   | `mostafawahied/portracker:latest` |
| :material-raspberry-pi:&nbsp;~~[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md)~~ | :material-docker:&nbsp;Docker Compose | `portracker`   | `mostafawahied/portracker:latest` |

### :material-cog: Configuration  

```yaml title="Raspberry Pi 4B Server" linenums="1"
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

```yaml title="Raspberry Pi Zero Server" linenums="1"
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