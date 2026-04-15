---
icon: services/dockge
tags:
  - active
  - service
  - software
  - docker
hide:
  - toc
---
![Dockge Icon](../assets/icons/dockge-light.svg#only-light){ width=200 }
![Dockge Icon](../assets/icons/dockge.svg#only-dark){ width=200 }

# Dockge
[GitHub :material-github:](https://github.com/louislam/dockge){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/louislam/dockge/wiki){ .md-button }

---
## :material-information-outline: Overview
#### Purpose:
+ A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.

#### Port(s):
+ `5001`

#### URL / Access: 
+ <http://pi-server.internal:5001>
+ <http://pi-zero.internal:5001>
+ <http://debian-vm.internal:5001>

#### Credentials:** 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + "Dockge @ pi-server"
    + "Dockge @ pi-zero"
    + "Dockge @ debian-vm"

## :material-package-down: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `dockge-dockge-1` | `louislam/dockge:1` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :material-docker:&nbsp;Docker Compose | `dockge-dockge-1` | `louislam/dockge:1` |
| :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md) | :material-docker:&nbsp;Docker Compose | `dockge-dockge-1` | `louislam/dockge:1` | 

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
services:
  dockge:
    image: louislam/dockge:1
    restart: unless-stopped
    ports:
      # Host Port : Container Port
      - 5001:5001
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./data:/app/data
        
      # If you want to use private registries, you need to share the auth file with Dockge:
      # - /root/.docker/:/root/.docker

      # Stacks Directory
      # ⚠️ READ IT CAREFULLY. If you did it wrong, your data could end up writing into a WRONG PATH.
      # ⚠️ 1. FULL path only. No relative path (MUST)
      # ⚠️ 2. Left Stacks Path === Right Stacks Path (MUST)
      - /opt/stacks:/opt/stacks
    environment:
      # Tell Dockge where is your stacks directory
      - DOCKGE_STACKS_DIR=/opt/stacks
      - DOCKGE_CONSOLE_ENBLE=true
```
