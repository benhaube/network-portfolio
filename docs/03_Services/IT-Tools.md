---
icon: services/it-tools
title: IT-Tools
tags:
  - active
  - service
  - software
  - docker
  - tools
hide:
  - toc
---
![IT-Tools Icon](../assets/icons/it-tools-light.svg#only-light){ width=200 }
![IT-Tools Icon](../assets/icons/it-tools-dark.svg#only-dark){ width=200 }

# IT-Tools
[GitHub :material-github:](https://github.com/CorentinTh/it-tools){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Handy tools for network administrators and developers.

#### :symbols-settings-ethernet: Port(s): 
+ `8080`

#### :material-link-variant: URL / Access: 
+ <https://it-tools.internal>
+ <http://pi-server.internal:8080/>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `it-tools` | `sharevb/it-tools:latest` |

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
services:  
  it-tools:  
    image: sharevb/it-tools:latest  
    pull_policy: always  
    container_name: it-tools  
    ports:  
      - 8080:8080  
    restart: unless-stopped
```
