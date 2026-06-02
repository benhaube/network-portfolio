---
icon: services/dockge
title: Dockge
subtitle: Docker Management
description: A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.
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
*Docker Management*

[GitHub :material-github:](https://github.com/louislam/dockge){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://dockge.kuma.pet/){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description:  

:    A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.

#### :symbols-settings-ethernet: Port(s): 

+ `5001`

#### :material-link-variant: URL / Access: 

+ <http://pi-server.internal:5001>
+ <http://pi-zero.internal:5001>
+ <http://debian-vm.internal:5001>
+ <http://storage-server.internal:5001>

#### :material-key-chain: Credentials: 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Dockge @ debian-vm"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Dockge @ pi-server"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Dockge @ pi-zero"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Dockge @ storage-server"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                      | Method                                | Container Name    | Image                   |
| :----------------------------------------------------------------------------------------------- | :------------------------------------ | :---------------- | :---------------------- |
| [:material-debian:&nbsp;Debian Server VM](../02_Hardware/Debian_Server_VM.md)                    | :material-docker:&nbsp;Docker Compose | `dockge-dockge-1` | `louislam/dockge:1`     |  
| [:material-raspberry-pi:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)  | :material-docker:&nbsp;Docker Compose | `dockge-dockge-1` | `louislam/dockge:1`     |
| [:material-raspberry-pi:&nbsp;Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :material-docker:&nbsp;Docker Compose | `dockge-dockge-1` | `louislam/dockge:1`     |
| [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                              | :material-docker:&nbsp;Docker Compose | `dockge`          | `louislam/dockge:1.5.0` |

### :material-cog: Configuration 

#### :material-monitor-arrow-down-variant: Install Dockge:

1. Create the directories that store your stacks and stores Dockge's stack:

    ```bash linenums="1"
    mkdir -p /opt/stacks /opt/dockge
    cd /opt/dockge
    ```

2. Download the `compose.yaml` file:

    ```bash linenums="1"
    curl https://raw.githubusercontent.com/louislam/dockge/master/compose.yaml --output compose.yaml
    ```

3. Start the server:

    ```bash linenums="1"
    docker compose up -d
    ```

    Dockge is now running on: <http://localhost:5001>

#### :material-update: Update Dockge: 

1. To update Dockge, run the following commands: 

    ```bash linenums="1"
    cd /opt/dockge
    docker compose pull && docker compose up -d
    ```

#### :material-docker: Docker Compose:

```yaml title="Debian Server VM | Raspberry Pi 4B Server | Raspberry Pi Zero Server" linenums="1"
--8<-- "dockge.yaml"
```

1. If you want to use private registries you need to uncomment this line to share the auth file with Dockge.

2.    :material-alert:&nbsp;**READ CAREFULLY!** 
   
      If you did it wrong, your data could end up writing into a WRONG PATH.
      
      + FULL path only, no relative path!
      + Left Stacks Path === Right Stacks Path.

3. Tell Dockge the location of your stacks directory.

```yaml title="ZimaOS NAS" linenums="1" 
--8<-- "dockge-zima.yaml"
```