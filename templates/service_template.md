---
icon: symbols/cloud
title: Title
subtitle: Subtitle
tags:
  - Active
  - Container
  - Service
  - Software
hide:
  - toc
---

![Page Title Icon](../assets/icons/icon.svg){ width=200 }

# Title

_Subtitle_

[GitHub :brands-github:](https://github.com){ .md-button .md-button--primary }&emsp;[Documentation :symbols-files:](https://docs.github.com/en){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Insert description of service here

#### :symbols-hash:&ensp;Port(s)

:    `port`

#### :symbols-link-2:&ensp;URL / Access 

:    <https://example.com>

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }:

    - Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                      | Method                                    | Container Name   | Image            |
| :----------------------------------------------- | :---------------------------------------- | :--------------- | :--------------- |
| :devices-icon:&nbsp;[Device](device_template.md) | :symbols-container:&nbsp;Docker Container | `container-name` | `image_name:tag` |
| :devices-icon:&nbsp;[Device](device_template.md) | :symbols-tux:&nbsp;Native Linux           | `N/A`            | `N/A`            |

### :symbols-settings:&ensp;Configuration

``` bash title="" linenums="1"
# Paste your docker-compose.yaml or docker run command here!
docker run -d \
  --name=homeassistant \
  --restart=unless-stopped \
  -v /path/to/config:/config \
  --network=host \
  homeassistant/home-assistant:stable
```