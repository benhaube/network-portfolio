---
icon: services/dockge
tags:
  - Active
  - Service
  - Software
  - Docker
hide:
  - toc
---
![Dockge Icon](../assets/icons/dockge-light.svg#only-light){ width=200 }
![Dockge Icon](../assets/icons/dockge.svg#only-dark){ width=200 }

# Dockge
[GitHub :material-github:](https://github.com/louislam/dockge){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/louislam/dockge/wiki){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description:  
+ A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.

#### :symbols-settings-ethernet: Port(s): 
+ `5001`

#### :material-link-variant: URL / Access: 
+ <http://pi-server.internal:5001>
+ <http://pi-zero.internal:5001>
+ <http://debian-vm.internal:5001>

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + "Dockge @ pi-server"
    + "Dockge @ pi-zero"
    + "Dockge @ debian-vm"

## :symbols-deployed-code-update: Deployment Details

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
      - 5001:5001  # (1)!
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./data:/app/data
      # - /root/.docker/:/root/.docker  (2)
      - /opt/stacks:/opt/stacks  # (3)!
    environment:
      - DOCKGE_STACKS_DIR=/opt/stacks  # (4)!
      - DOCKGE_CONSOLE_ENBLE=true
```

1. Host Port : Container Port
2. If you want to use private registries you need to uncomment this line to share the auth file with Dockge.
3. READ IT CAREFULLY. If you did it wrong, your data could end up writing into a WRONG PATH. FULL path only, no relative path! Left Stacks Path === Right Stacks Path.
4. Tell Dockge where is your stacks directory