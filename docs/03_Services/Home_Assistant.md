---
tags:
  - active
  - service
  - software
  - docker
  - IoT
hide:
  - toc
---
![Home Assistant Logo](../assets/icons/home-assistant.svg){ width=200 }

# [[Home_Assistant|Home Assistant]]
[GitHub :material-github:](https://github.com/home-assistant/home-assistant.io){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://www.home-assistant.io/docs/){ .md-button }

---
## :material-information-outline: Overview

#### Purpose: 
+ A home automation and IoT dashboard.

#### Port(s): 
+ `8123`

#### URL / Access: 
+ <http://pi-server.internal:8123>
+ <https://home-assistant.internal>

#### Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "Home Assistant @ pi-server"

## :material-package-down: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :simple-raspberrypi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `homeassistant` | `ghcr.io/home-assistant/home-assistant:latest` |

### :material-cog: Configuration

```yaml title="docker-compose.yml" linenums="1"
services:
  homeassistant:
    container_name: homeassistant
    image: "ghcr.io/home-assistant/home-assistant:latest"
    volumes:
      - /home-assistant-container:/config
      - /etc/localtime:/etc/localtime:ro
      - /run/dbus:/run/dbus:ro
    restart: unless-stopped
    privileged: true
    network_mode: host
    dns:
      - 192.168.50.6
      - 192.168.50.2
```
