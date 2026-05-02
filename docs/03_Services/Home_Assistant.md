---
icon: simple/homeassistant
tags:
  - Active
  - Service
  - Software
  - Docker
  - IoT
hide:
  - toc
---
![Home Assistant Logo](../assets/icons/home-assistant.svg){ width=200 }

# Home Assistant
[GitHub :material-github:](https://github.com/home-assistant/home-assistant.io){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://www.home-assistant.io/docs/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A home automation and IoT dashboard.

#### :symbols-settings-ethernet: Port(s): 
+ `8123`

#### :material-link-variant: URL / Access: 
+ <http://pi-server.internal:8123>
+ <https://home-assistant.internal>

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Home Assistant @ pi-server"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                     | Method                                | Container Name  | Image                                          |
| :---------------------------------------------------------------------------------------------- | :------------------------------------ | :-------------- | :--------------------------------------------- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `homeassistant` | `ghcr.io/home-assistant/home-assistant:latest` |

### :material-cog: Configuration

```yaml title="compose.yml" linenums="1"
--8<-- "home-assistant.yml"
```
