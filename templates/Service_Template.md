---
icon: material/web
title: Service Template
tags:
  - active
  - service
  - software
  - docker
hide:
  - toc
---
![Icon](../assets/icons/<icon>.svg){ width=200 }

# Service Template
[GitHub :material-github:](https://github.com){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.github.com/en){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ [Insert description of service here]
 
#### :symbols-settings-ethernet: Port(s): 
+ `port`

#### :material-link-variant: URL / Access: 
+ <https://example.com>

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Credential Entry"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                      | Method                                | Container Name   | Image            |
| :----------------------------------------------- | :------------------------------------ | :--------------- | :--------------- |
| :devices-icon:&nbsp;[Device](Device_Template.md) | :material-docker:&nbsp;Docker Compose | `container-name` | `image_name:tag` |

### :material-cog: Configuration 

```bash title="" linenums="1"
# Paste your docker-compose.yaml or docker run command here!
docker run -d \
  --name=homeassistant \
  --restart=unless-stopped \
  -v /path/to/config:/config \
  --network=host \
  homeassistant/home-assistant:stable
```