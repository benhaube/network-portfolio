---
icon: material/web
title: Service Template
subtitle: Subtitle
tags:
  - Active
  - Service
  - Software
  - Docker
hide:
  - toc
---
![Icon](../assets/icons/<icon>.svg){ width=200 }

# Service Template
*Subtitle*

[GitHub :material-github:](https://github.com){ .md-button .md-button--primary }&emsp;[Documentation :symbols-documentation:](https://docs.github.com/en){ .md-button }

---
## :symbols-info: Overview

#### :symbols-description: Description
:    Insert description of service here
 
#### :symbols-settings-ethernet: Port(s)

+ `port`

#### :symbols-link: URL / Access

+ <https://example.com>

#### :symbols-key: Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Folder&ensp;:material-arrow-right-thin:&ensp;"Credential Entry"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                      | Method                                | Container Name   | Image            |
| :----------------------------------------------- | :------------------------------------ | :--------------- | :--------------- |
| :devices-icon:&nbsp;[Device](Device_Template.md) | :material-docker:&nbsp;Docker Compose | `container-name` | `image_name:tag` |

### :symbols-settings: Configuration 

```bash title="" linenums="1"
# Paste your docker-compose.yaml or docker run command here!
docker run -d \
  --name=homeassistant \
  --restart=unless-stopped \
  -v /path/to/config:/config \
  --network=host \
  homeassistant/home-assistant:stable
```