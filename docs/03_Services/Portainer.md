---
icon: services/portainer
status: deprecated
tags:
  - inactive
  - service
  - software
  - docker
  - download
hide:
  - toc
---
![Portainer Icon](../assets/icons/portainer-pink-light.svg#only-light){ width=200 }
![Portainer Icon](../assets/icons/portainer-pink-dark.svg#only-dark){ width=200 }

# Portainer-EE
[GitHub :material-github:](https://github.com/portainer/portainer-docs){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.portainer.io/){ .md-button }

---
## :material-information-outline: Overview

#### Purpose:
+ Docker container management platform

#### Port(s):
+ `9443`

#### URL / Access: 
+ ~~[[https://portainer.internal]]~~
+ ~~[[https://pi-server.internal:9443]]~~

#### Credentials:
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "Portainer @ pi-server"

## :material-package-down: Deployment Details 

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :simple-raspberrypi:&nbsp;~~[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)~~ | :material-docker:&nbsp;Docker Compose | `portainer` | `portainer/portainer-ee:lts` |

### :material-cog: Configuration  

```yaml title="docker-compose.yml" linenums="1"
services:  
  portainer:  
    container_name: portainer  
    image: portainer/portainer-ee:lts  
    restart: always  
    volumes:  
      - /var/run/docker.sock:/var/run/docker.sock  
      - portainer_data:/data  
      - /:/host  
    ports:  
      - 9443:9443  
      - 8000:8000  # Remove if you do not intend to use Edge Agents  
    dns:  
      - 192.168.50.6  
      - 192.168.50.2  
  
volumes:  
  portainer_data:  
    name: portainer_data  
  
networks:  
  default:  
    name: portainer_network
```
