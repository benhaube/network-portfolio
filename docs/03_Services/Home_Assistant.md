---
icon: services/home-assistant
title: Home Assistant
subtitle: Awaken Your Home
description: Open-source home automation that puts local control and privacy first.
tags:
  - Active
  - Dashboard
  - Container
  - IoT
  - Service
hide:
  - toc
---
![Home Assistant Logo](../assets/icons/home-assistant.svg){ width=200 }

# Home Assistant
*Awaken Your Home*

[GitHub&ensp;:brands-github:](https://github.com/home-assistant/home-assistant.io){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://www.home-assistant.io/docs/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Open-source home automation that puts local control and privacy first.

#### :symbols-settings-ethernet:&ensp;Port(s) 

:    `8123`

#### :symbols-link:&ensp;URL / Access 

:    <http://pi-server.internal:8123>

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"Home Assistant"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                                    | Method                                | Container Name  | Image                                          |
| :----------------------------------------------------------------------------- | :------------------------------------ | :-------------- | :--------------------------------------------- |
| [:symbols-server:&nbsp;Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :services-docker:&nbsp;Docker Compose | `homeassistant` | `ghcr.io/home-assistant/home-assistant:latest` |

### :symbols-settings:&ensp;Configuration

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "home-assistant.yml"
```
