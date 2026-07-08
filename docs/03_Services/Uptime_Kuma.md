---
icon: services/uptime-kuma
title: Uptime Kuma
subtitle: A Fancy Monitoring Tool
description: A fancy self-hosted service monitoring tool.
tags:
  - Active
  - Docker
  - Monitor
  - Network
  - Service
hide:
  - toc
---
![Uptime Kuma Icon](../assets/icons/uptime-kuma-light.svg#only-light){ width=200 }
![Uptime Kuma Icon](../assets/icons/uptime-kuma.svg#only-dark){ width=200 }

# Uptime Kuma
*A Fancy Monitoring Tool*

[GitHub&ensp;:simple-github:](https://github.com/louislam/uptime-kuma){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation-outline:](https://github.com/louislam/uptime-kuma/wiki){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    A fancy self-hosted service monitoring tool.

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `3001`

#### :symbols-link:&ensp;URL / Access 

+ :symbols-lan-outline:&nbsp;LAN Access
    + <https://uptime.internal>
    + <http://pi-server.internal:3001>
+ :symbols-web:&nbsp;WAN Access
    + <https://uptime.rac3r4life.online>

#### :symbols-user-key:&ensp;Credentials  

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Uptime Kuma"
+ 2FA / MFA:
    + :symbols-clock:&nbsp;TOTP 

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                      | Method                                | Container Name | Image                    |
| :----------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :----------------------- |
| [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :services-docker:&nbsp;Docker Compose | `uptime-kuma`  | `louislam/uptime-kuma:2` |

### :symbols-settings:&ensp;Configuration 

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "uptime-kuma.yml"
```
