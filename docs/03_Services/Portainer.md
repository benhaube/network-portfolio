---
icon: services/portainer
title: Portainer-EE
status: deprecated
tags:
  - Inactive
  - Service
  - Software
  - Docker
  - Download
hide:
  - toc
---
![Portainer Icon](../assets/icons/portainer-pink-light.svg#only-light){ width=200 }
![Portainer Icon](../assets/icons/portainer-pink-dark.svg#only-dark){ width=200 }

# Portainer-EE
[GitHub :material-github:](https://github.com/portainer/portainer-docs){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.portainer.io/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A Docker container management platform and agent for connecting remote servers.

#### :symbols-settings-ethernet: Port(s):
+ Hub:
    + `9443`
+ Agent:
    + `9001`

#### :material-link-variant: URL / Access:
+ Hub: 
    + ~~[[https://portainer.internal]]~~
    + ~~[[https://pi-server.internal:9443]]~~
+ Agent:
    + ~~[[http://pi-zero.internal:9001]]~~
    + ~~[[http://storage-server.internal:9001]]~~

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "Portainer @ pi-server"

## :symbols-deployed-code-update: Deployment Details

### Hub

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;~~[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)~~ | :material-docker:&nbsp;Docker Compose | `portainer` | `portainer/portainer-ee:lts` |

### Agent

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;~~[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md)~~ | :material-docker:&nbsp;Docker Compose | `portainer_agent` | `portainer/agent:lts` |
| :material-nas:&nbsp;~~[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)~~ | :material-docker:&nbsp;Docker Compose | `portainer_agent` | `portainer/agent:lts` |

### :material-cog: Configuration  

#### Hub:

```yaml title="Raspberry Pi 4B Server" linenums="1"
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
      - 8000:8000
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

#### Agent:

```yaml title="Raspberry Pi Zero Server" linenums="1"
services:  
  agent:
    image: portainer/agent:lts  
    ports:  
      - 9001:9001  
    container_name: portainer_agent  
    restart: always  
    volumes:  
      - /var/run/docker.sock:/var/run/docker.sock  
      - /var/lib/docker/volumes:/var/lib/docker/volumes  
      - /:/host  
```

```yaml title="ZimaOS NAS" linenums="1"
services:
  app:
    container_name: portainer-agent
    image: portainer/agent:lts
    labels:
      icon: https://cdn.jsdelivr.net/gh/selfhst/icons/png/portainer.png
    ports:
      - mode: ingress
        target: 9001
        published: "9001"
        protocol: tcp
    volumes:
      - type: bind
        source: /var/run/docker.sock
        target: /var/run/docker.sock
        bind:
          create_host_path: true
      - type: bind
        source: /var/lib/docker/volumes
        target: /var/lib/docker/volumes
        bind:
          create_host_path: true
    deploy:
        limits:
          memory: 16508321792
    network_mode: bridge
    privileged: false
    restart: unless-stopped
    cpu_shares: 90
```