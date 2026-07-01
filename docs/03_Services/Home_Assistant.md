---
icon: simple/homeassistant
title: Home Assistant
subtitle: Awaken Your Home
description: Open-source home automation that puts local control and privacy first.
tags:
  - Active
  - Docker
  - IoT
hide:
  - toc
---
![Home Assistant Logo](../assets/icons/home-assistant.svg){ width=200 }

# Home Assistant
*Awaken Your Home*

[GitHub&ensp;:simple-github:](https://github.com/home-assistant/home-assistant.io){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://www.home-assistant.io/docs/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-description:&ensp;Description 

:    Open-source home automation that puts local control and privacy first.

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `8123`

#### :symbols-link:&ensp;URL / Access 

+ <http://pi-server.internal:8123>
+ <https://home-assistant.internal>

#### :symbols-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Home Assistant"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                      | Method                                | Container Name  | Image                                          |
| :----------------------------------------------------------------------------------------------- | :------------------------------------ | :-------------- | :--------------------------------------------- |
| [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `homeassistant` | `ghcr.io/home-assistant/home-assistant:latest` |

### :symbols-settings:&ensp;Configuration

```yaml title="<code>compose.yml</code>" linenums="1"
--8<-- "home-assistant.yml"
```
