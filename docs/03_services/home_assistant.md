---
icon: services/home-assistant
title: Home Assistant
subtitle: Awaken Your Home
description: Open-source home automation that puts local control and privacy first.
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

#### :symbols-file-text:&ensp;Description

:    Open-source home automation that puts local control and privacy first.

#### :symbols-hash:&ensp;Port(s) 

:    `8123`

#### :symbols-link-2:&ensp;URL / Access  

:    <http://pi-server.internal:8123>

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Home Assistant"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name  | Image                                          |
| :------------------------------------------------------------------- | :---------------------------------------- | :-------------- | :--------------------------------------------- |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `homeassistant` | `ghcr.io/home-assistant/home-assistant:latest` |

### :symbols-settings:&ensp;Configuration

#### :symbols-folder-git-2:&ensp;Data Directories

##### Docker Deploy

:    `/opt/stacks/home-assistant/compose.yaml`

##### App Data

:    `/home-assistant-container`

#### :symbols-file-code-corner:&ensp;Docker Compose File

--8<-- "deploy_with_dockge.md"

``` yaml { .mono-title title="/opt/stacks/home-assistant/compose.yaml" linenums="1" }
--8<-- "home-assistant.yml"
```