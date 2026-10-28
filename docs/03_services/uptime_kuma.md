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

![Uptime Kuma homepage](../assets/screenshots/uptime-kuma-dashboard-light.png#only-light){ width=400 align=right .on-glb }
![Uptime Kuma homepage](../assets/screenshots/uptime-kuma-dashboard-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

**Description**

:    A fancy self-hosted service monitoring tool.

**Port(s)** 

:    `3001`

**URL / Access**

- <https://uptime.internal>
{ .no-bullets }
- <http://pi-server.internal:3001>
{ .no-bullets }
- <https://uptime.rac3r4life.online>
{ .no-bullets }

**Credentials**

-   [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Uptime Kuma"
-   2FA / MFA
{ .no-bullets }
    - :symbols-clock-key:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                    | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :----------------------- | :------ |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `uptime-kuma`  | `louislam/uptime-kuma:2` | `3001`  |

---

## :symbols-settings:&ensp;Configuration

--8<-- "managed_by_dockge.md"

### :symbols-folder-git-2:&ensp;Data Directories

| Contents            | Path                                   |
| :------------------ | :------------------------------------- |
| Docker Compose File | `/opt/stacks/uptime-kuma/compose.yaml` |
| Application Data    | `/opt/stacks/uptime-kuma/data`         |

### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="/opt/stacks/uptime-kuma/compose.yaml" linenums="1" }
--8<-- "uptime-kuma.yml"
```
