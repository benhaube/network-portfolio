---
icon: services/home-assistant
title: Home Assistant
subtitle: Awaken Your Home
description: Open-source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts.
tags:
  - Active
  - Container
  - Dashboard
  - IoT
  - Service
hide:
  - toc
---

![Home Assistant Logo](../assets/icons/home-assistant.svg){ width=200 }

# Home Assistant

_Awaken Your Home_

[GitHub&ensp;:brands-github:](https://github.com/home-assistant/home-assistant.io){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://www.home-assistant.io/docs/){ .md-button .md-button--primary }

---

![Home Assistant Overview dashboard](../assets/screenshots/home-assistant-overview-light.png#only-light){ width=400 align=right .on-glb }
![Home Assistant Overview dashboard](../assets/screenshots/home-assistant-overview-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

**Description**

:    Open-source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts.

**Port(s)** 

:    `8123`

**URL / Access**  

- <http://pi-server.internal:8123>
{ .no-bullets }
- <https://home.rac3r4life.online>
{ .no-bullets }

**Credentials**

-   [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Home Assistant"
-   2FA / MFA
{ .no-bullets }
    - :symbols-clock-key:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name  | Image                                          | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :-------------- | :--------------------------------------------- | :------ |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `homeassistant` | `ghcr.io/home-assistant/home-assistant:latest` | `8123`  |

---

## :symbols-settings:&ensp;Configuration

--8<-- "managed_by_dockge.md"

### :symbols-folder-git-2:&ensp;Data Directories

| Contents            | Path                                      |
| :------------------ | :---------------------------------------- |
| Docker Compose File | `/opt/stacks/home-assistant/compose.yaml` |
| Application Data    | `/home-assistant-container`               |

### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="/opt/stacks/home-assistant/compose.yaml" linenums="1" }
--8<-- "home-assistant.yml"
```
