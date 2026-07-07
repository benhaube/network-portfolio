---
icon: services/portainer
title: Portainer-EE
subtitle: Container Management
description: A lightweight service delivery platform for containerized applications. 
status: inactive
tags:
  - Inactive
  - Dashboard
  - Docker
  - Download
  - Shell
  - Tools
hide:
  - toc
---
![Portainer Icon](../assets/icons/portainer-pink.svg){ width=200 }

# Portainer-EE
*Container Management*

[GitHub&ensp;:simple-github:](https://github.com/portainer/portainer){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://docs.portainer.io/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    A lightweight service delivery platform for containerized applications. 

#### :symbols-settings-ethernet:&ensp;Port(s)

+ Hub:
    + `9443`
+ Agent:
    + `9001`

#### :symbols-link:&ensp;URL / Access

+ Hub: 
    + ~~<https://portainer.internal>~~
    + ~~<https://pi-server.internal:9443>~~
+ Agent:
    + ~~<http://pi-zero.internal:9001>~~
    + ~~<http://storage-server.internal:9001>~~

#### :symbols-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Portainer"
+ [:simple-github:&nbsp;GitHub OAuth](https://github.com/settings/developers)

## :symbols-deployed-code-update:&ensp;Deployment Details

##### Hub

| Host Device                                                                                          | Method                                | Container Name | Image                        |
| :--------------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :--------------------------- |
| [:symbols-server-outline:&nbsp;~~Raspberry Pi 4B Server~~](../02_Hardware/Raspberry_Pi_4B_Server.md) | :services-docker:&nbsp;Docker Compose | `portainer`    | `portainer/portainer-ee:lts` |

##### Agent

| Host Device                                                                                           | Method                                | Container Name    | Image                 |
| :---------------------------------------------------------------------------------------------------- | :------------------------------------ | :---------------- | :-------------------- |
| [:symbols-server-outline:&nbsp;~~Raspberry Pi Zero Server~~](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :services-docker:&nbsp;Docker Compose | `portainer_agent` | `portainer/agent:lts` |
| [:symbols-nas-outline:&nbsp;~~ZimaOS NAS~~](../02_Hardware/ZimaBoard_2_NAS.md)                                | :services-docker:&nbsp;Docker Compose | `portainer_agent` | `portainer/agent:lts` |

### :symbols-settings:&ensp;Configuration  

##### Hub

```yaml title="Raspberry Pi 4B Server" linenums="1"
--8<-- "portainer-pi-4b.yml"
```

##### Agent

```yaml title="Raspberry Pi Zero Server" linenums="1"
--8<-- "portainer-pi-zero.yml"
```

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "portainer-zima.yml"
```