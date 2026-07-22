---
icon: symbols/monitor-cloud
title: Service Template
subtitle: Subtitle
tags:
  - Active
  - Service
  - Software
  - Container
hide:
  - toc
---
![Icon](../assets/icons/<icon>.svg){ width=200 }

# Service Template
*Subtitle*

[GitHub :brands-github:](https://github.com){ .md-button .md-button--primary }&emsp;[Documentation :symbols-files:](https://docs.github.com/en){ .md-button .md-button--primary }

---
## :symbols-info: Overview

#### :symbols-file-text: Description
:    Insert description of service here
 
#### :symbols-settings-ethernet: Port(s)

:    `port`

#### :symbols-link: URL / Access

:    <https://example.com>

#### :symbols-user-key: Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

## :symbols-package-search: Deployment Details

| Host Device                                      | Method                                    | Container Name   | Image            |
| :----------------------------------------------- | :---------------------------------------- | :--------------- | :--------------- |
| :devices-icon:&nbsp;[Device](device_template.md) | :symbols-container:&nbsp;Docker Container | `container-name` | `image_name:tag` |
| :devices-icon:&nbsp;[Device](device_template.md) | :symbols-penguin:&nbsp;Native Linux       | `N/A`            | `N/A`            |

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