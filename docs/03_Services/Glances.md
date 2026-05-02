---
icon: services/glances
tags:
  - Active
  - Service
  - Software
  - Docker
  - Monitor
hide:
  - toc
---
![Glances Logo](../assets/icons/glances-light.svg#only-light){ width=200 }
![Glances Logo](../assets/icons/glances-dark.svg#only-dark){ width=200 }

# Glances
[GitHub :material-github:](https://github.com/nicolargo/glances){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/nicolargo/glances/wiki){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Glances an Eye on your system. A `top` / `htop` alternative for the Web browser. 

#### :symbols-settings-ethernet: Port(s): 
+ `21208`

#### :material-link-variant: URL / Access: 
+ <http://pi-server.internal:61208>
+ <http://storage-server.internal:61208>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                     | Method                                | Container Name | Image                           |
| :---------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :------------------------------ |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `glances`      | `nicolargo/glances:latest-full` |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                             | :material-docker:&nbsp;Docker Compose | `glances`      | `nicolargo/glances:latest-full` |

### :material-cog: Configuration

#### :material-docker: Docker Compose:

```yaml title="Raspberry Pi 4B Server" linenums="1"
--8<-- "glances-pi-4b.yml"
```

1. See all images tags here: <https://hub.docker.com/r/nicolargo/glances/tags>
2. Uncomment for SATA or NVME smartctl monitoring.
3. Uncomment for SATA smartctl monitoring.
4. Uncomment for NVME smartctl monitoring.
5. Uncomment for proper distro information in upper panel. Works only for distros that do have this file *(most distros do)*.  
6. Please set to your local timezone *(or use local ${TZ} environment variable if set on your host)*.
7. Uncomment for GPU compatibility (Nvidia) inside the container.  
8. Uncomment to protect Glances WebUI by a login /password *(add `--password` to `GLANCES_OPT`)*.     

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "glances-zima.yml"
```