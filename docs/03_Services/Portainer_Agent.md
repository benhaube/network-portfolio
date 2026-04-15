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

# Portainer Agent
[GitHub :material-github:](https://github.com/portainer/portainer-docs){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.portainer.io/){ .md-button }

---
## :material-information-outline: Overview

#### Purpose:
+ Agent for [[Portainer]]

#### Port(s):
+ `9001`

#### URL / Access: 
+ ~~[[http://pi-zero.internal:9001]]~~
+ ~~[[http://storage-server.internal:9001]]~~

#### Credentials:
+ N/A

## :material-package-down: Deployment Details 

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :simple-raspberrypi:&nbsp;~~[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md)~~ | :material-docker:&nbsp;Docker Compose | `portainer_agent` | `portainer/agent:lts` |
| :services-zimaos:&nbsp;~~[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)~~ | :material-docker:&nbsp;Docker Compose | `portainer_agent` | `portainer/agent:lts` |

### :material-cog: Configuration  

#### Raspberry Pi Zero Server:

```yaml title="docker-compose.yml" linenums="1"
services:  
  agent:  
    ports:  
      - 9001:9001  
    container_name: portainer_agent  
    restart: always  
    volumes:  
      - /var/run/docker.sock:/var/run/docker.sock  
      - /var/lib/docker/volumes:/var/lib/docker/volumes  
      - /:/host  
    image: portainer/agent:lts
```

#### ZimaOS NAS:

```yaml title="docker-compose.yml" linenums="1"
name: big-bear-portainer-agent
services:
  app:
    container_name: portainer-agent
    image: portainer/agent:2.37.0
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
    x-casaos:
      ports:
        - container: "9001"
          description:
            en_us: "Container Port: 9001"
      volumes:
        - container: /var/run/docker.sock
          description:
            en_us: "Container Path: /var/run/docker.sock"
        - container: /var/lib/docker/volumes
          description:
            en_us: "Container Path: /var/lib/docker/volumes"
    devices: []
    cap_add: []
    command: []
    deploy:
      resources:
        reservations:
          devices: []
        limits:
          memory: 16508321792
    environment: []
    network_mode: bridge
    privileged: false
    restart: unless-stopped
    cpu_shares: 90
x-casaos:
  architectures:
    - amd64
    - arm64
  author: BigBearTechWorld
  category: BigBearCasaOS
  description:
    en_us: Portainer uses the Portainer Agent container to communicate with the
      Portainer Server instance and provide access to the node's resources. This
      document will outline how to install the Portainer Agent on your node and
      how to connect to it from your Portainer Server instance. If you do not
      have a working Portainer Server instance yet, please refer to the
      Portainer Server installation guide first.
  developer: portainer
  icon: https://cdn.jsdelivr.net/gh/selfhst/icons/png/portainer.png
  is_uncontrolled: false
  main: app
  port_map: "9001"
  store_app_id: big-bear-portainer-agent
  tagline:
    en_us: Portainer Agent
  thumbnail: ""
  tips:
    before_install:
      en_us: >
        The Portainer Agent is reachable on port 9001. You will need Portainer
        Server running to connect to the Portainer Agent.
  title:
    en_us: Portainer Agent
    custom: ""
  hostname: ""
  scheme: http
  index: /
```
