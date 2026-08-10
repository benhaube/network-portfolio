---
icon: services/uptime-kuma
title: Uptime Kuma
subtitle: A Fancy Monitoring Tool
description: A fancy self-hosted service monitoring tool.
tags:
  - Active
  - Container
  - Monitor
  - Network
  - Service
hide:
  - toc
---

![Uptime Kuma Icon](../assets/icons/uptime-kuma-light.svg#only-light){ width=200 }
![Uptime Kuma Icon](../assets/icons/uptime-kuma.svg#only-dark){ width=200 }

# Uptime Kuma

_A Fancy Monitoring Tool_

[GitHub&ensp;:brands-github:](https://github.com/louislam/uptime-kuma){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://github.com/louislam/uptime-kuma/wiki){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A fancy self-hosted service monitoring tool.

#### :symbols-hash:&ensp;Port(s) 

:    `3001`

#### :symbols-link-2:&ensp;URL / Access  

- :symbols-network:&ensp;Local Access
{ .no-bullets }
    - <https://uptime.internal>
    - <http://pi-server.internal:3001>
- :symbols-globe-arrow:&ensp;Remote Access
{ .no-bullets }
    - <https://uptime.rac3r4life.online>

#### :symbols-user-key:&ensp;Credentials  

- [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Uptime Kuma"
- 2FA / MFA
{ .no-bullets }
    - :symbols-clock:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                    |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :----------------------- |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `uptime-kuma`  | `louislam/uptime-kuma:2` |

### :symbols-settings:&ensp;Configuration

--8<-- "deploy_with_dockge.md"

``` yaml { .mono-title title="/opt/stacks/uptime-kuma/compose.yaml" linenums="1" }
--8<-- "uptime-kuma.yml"
```