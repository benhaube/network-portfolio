---
icon: services/portainer
title: Portainer-EE
subtitle: Container Management
description: A lightweight service delivery platform for containerized applications. 
status: inactive
tags:
  - Inactive
  - Dashboard
  - Container
  - Download
  - Shell
  - Tools
  - Service
hide:
  - toc
---
![Portainer Icon](../assets/icons/portainer-pink.svg){ width=200 }

# Portainer-EE
*Container Management*

[GitHub&ensp;:brands-github:](https://github.com/portainer/portainer){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.portainer.io/){ .md-button .md-button--primary }

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

#### :symbols-user-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-move-right:&ensp;"Portainer"
+ [:brands-github:&nbsp;GitHub OAuth](https://github.com/settings/developers)
+ 2FA / MFA:
    + :symbols-key-fido2:&nbsp;FIDO2 / WebAuthn
    + :symbols-clock:&nbsp;TOTP 

## :symbols-package-search:&ensp;Deployment Details

##### Hub

| Host Device                                                                        | Method                                | Container Name | Image                        |
| :--------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :--------------------------- |
| [:symbols-server:&nbsp;~~Pi 4B Server~~](../02_Hardware/Raspberry_Pi_4B_Server.md) | :services-docker:&nbsp;Docker Compose | `portainer`    | `portainer/portainer-ee:lts` |

##### Agent

| Host Device                                                                            | Method                                | Container Name    | Image                 |
| :------------------------------------------------------------------------------------- | :------------------------------------ | :---------------- | :-------------------- |
| [:symbols-server:&nbsp;~~Pi Zero 2W Server~~](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :services-docker:&nbsp;Docker Compose | `portainer_agent` | `portainer/agent:lts` |
| [:symbols-server-nas:&nbsp;~~ZimaOS NAS~~](../02_Hardware/ZimaBoard_2_NAS.md)          | :services-docker:&nbsp;Docker Compose | `portainer_agent` | `portainer/agent:lts` |

### :symbols-settings:&ensp;Configuration  

##### Hub

```yaml title="Pi 4B Server" linenums="1"
--8<-- "portainer-pi-4b.yml"
```

##### Agent

```yaml title="Pi Zero 2W Server" linenums="1"
--8<-- "portainer-pi-zero.yml"
```

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "portainer-zima.yml"
```