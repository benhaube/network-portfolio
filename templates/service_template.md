---
icon: symbols/cloud
title: Title
subtitle: Subtitle
description: Description
status: new
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

[GitHub&ensp;:brands-github:](https://github.com){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.github.com/en){ .md-button .md-button--primary }

---

![Service screenshot](../assets/screenshots/screenshot.png){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

Insert description of service here

![status badge](https://uptime.rac3r4life.online/api/badge/#/status)&ensp;![uptime badge](https://uptime.rac3r4life.online/api/badge/#/uptime)&ensp;![cert expire badge](https://uptime.rac3r4life.online/api/badge/#/cert-exp)&ensp;![GitHub Release](https://img.shields.io/github/v/release/{user}/{repo}?label=Release&color=%23{color})

**Port(s)**

:    `1234`

**URL / Access** 

:    <https://example.com>

**Credentials** 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                      | Method                                    | Container Name   | Image            | Status                                                                                                         | Port(s) |
| :----------------------------------------------- | :---------------------------------------- | :--------------- | :--------------- | :------------------------------------------------------------------------------------------------------------- | :------ |
| [:devices-icon:&nbsp;Device](device_template.md) | :symbols-container:&nbsp;Docker Container | `container-name` | `image_name:tag` | ![status badge](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | `1234`  |
| [:devices-icon:&nbsp;Device](device_template.md) | :symbols-tux:&nbsp;Native Linux           | `N/A`            | `N/A`            | ![status badge](https://uptime.rac3r4life.online/api/badge/#/status?label=){ style='vertical-align: middle;' } | `1234`  |

---

## :symbols-settings:&ensp;Configuration

``` bash title="" linenums="1"
# Paste your docker-compose.yaml or docker run command here!
docker run -d \
  --name=homeassistant \
  --restart=unless-stopped \
  -v /path/to/config:/config \
  --network=host \
  homeassistant/home-assistant:stable
```
