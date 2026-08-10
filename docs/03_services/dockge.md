---
icon: services/dockge
title: Dockge
subtitle: Docker Management
description: A fancy, easy-to-use, and reactive self-hosted Docker Compose stack-oriented manager.
tags:
  - Active
  - Container
  - Dashboard
  - Download
  - Service
  - Shell
  - Tools
hide:
  - toc
---

![Dockge Icon](../assets/icons/dockge-light.svg#only-light){ width=200 }
![Dockge Icon](../assets/icons/dockge.svg#only-dark){ width=200 }

# Dockge

_Docker Management_

[GitHub&ensp;:brands-github:](https://github.com/louislam/dockge){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://dockge.kuma.pet/){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A fancy, easy-to-use, and reactive self-hosted Docker Compose stack-oriented manager.

#### :symbols-hash:&ensp;Port(s) 

:    `5001`

#### :symbols-link-2:&ensp;URL / Access 

:    Main Server:  

    - <http://pi-server.internal:5001>

:    Other Servers _(connected to main server)_:

    - <http://pi-zero.internal:5001>
      - <http://debian-vm.internal:5001>
      - <http://storage-server.internal:5001>

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Dockge @ debian-vm"
    - Local Network&ensp;:symbols-move-right:&ensp;"Dockge @ pi-server"
    - Local Network&ensp;:symbols-move-right:&ensp;"Dockge @ pi-zero"
    - Local Network&ensp;:symbols-move-right:&ensp;"Dockge @ storage-server"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                                    | Method                                    | Container Name    | Image               |
| :----------------------------------------------------------------------------- | :---------------------------------------- | :---------------- | :------------------ |
| [:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md)         | :symbols-container:&nbsp;Docker Container | `dockge-dockge-1` | `louislam/dockge:1` |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)           | :symbols-container:&nbsp;Docker Container | `dockge-dockge-1` | `louislam/dockge:1` |
| [:symbols-server:&nbsp;Pi Zero 2W Server](../02_hardware/pi_zero_2w_server.md) | :symbols-container:&nbsp;Docker Container | `dockge-dockge-1` | `louislam/dockge:1` |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)           | :symbols-container:&nbsp;Docker Container | `dockge`          | `louislam/dockge:1` |

### :symbols-settings:&ensp;Configuration

#### :symbols-monitor-arrow-down-corner:&ensp;Install Dockge

1.  Create the directories that store your stacks and stores Dockge's stack:

    ``` bash linenums="1"
    mkdir -p /opt/stacks /opt/dockge
    cd /opt/dockge
    ```

2.  Download the `compose.yaml` file:

    ``` bash linenums="1"
    curl https://raw.githubusercontent.com/louislam/dockge/master/compose.yaml --output compose.yaml
    ```

3.  Start the server:

    ``` bash linenums="1"
    docker compose up -d
    ```

    Dockge is now running on: `http://localhost:5001`

#### :symbols-rotate-cw-clock:&ensp;Update Dockge

1.  To update Dockge, run the following commands:

    ``` bash linenums="1"
    cd /opt/dockge
    docker compose pull && docker compose up -d
    ```

#### :symbols-file-code-corner:&ensp;Docker Compose File

##### Debian 13 Servers

``` yaml { .mono-title title="/opt/dockge/compose.yaml" linenums="1" }
--8<-- "dockge.yaml"
```

1.  If you want to use private registries you need to uncomment this line to share the auth file with Dockge.

2.  :symbols-triangle-alert:&nbsp;**READ CAREFULLY!**

    If you did it wrong, your data could end up writing into a WRONG PATH.

    - FULL path only, no relative path!
    - Left Stacks Path === Right Stacks Path.

3.  Tell Dockge the location of your stacks directory.

##### ZimaOS NAS

``` yaml { .mono-title title="/DATA/.casaos/apps/big-bear-dockge/docker-compose.yml" linenums="1" } 
--8<-- "dockge-zima.yaml"
```