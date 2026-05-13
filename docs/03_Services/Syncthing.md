---
icon: simple/syncthing
title: Syncthing
subtitle: File Synchronization
description: Open decentralized file synchronization.
tags:
  - Active
  - Backup
  - Service
  - Software
  - Docker
  - Download
  - File Share
  - Native
hide:
  - toc
---
![Syncthing Icon](../assets/icons/syncthing-light.svg#only-light){ width=200 }
![Syncthing Icon](../assets/icons/syncthing.svg#only-dark){ width=200 }

# Syncthing
[GitHub :material-github:](https://github.com/syncthing/syncthing){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.syncthing.net/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Open decentralized file synchronization.

#### :symbols-settings-ethernet: Port(s): 
+ `8384` *(TCP)*
+ `22000` *(TCP / UDP)*
+ `21027` *(UDP)*

#### :material-link-variant: URL / Access:  
+ :material-desktop-tower:&nbsp;[Ben's Desktop](../02_Hardware/Ben's_Desktop.md):
    + <https://bens-workstation.internal:8384>
    + <https://192.168.50.61:8384>
+ :material-laptop:&nbsp;[Ben's Laptop](../02_Hardware/Ben's_Laptop.md):
    + <http://localhost:8384>
+ :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md):
    + <https://debian-vm.internal:8384>
    + <https://192.168.50.6:8384>
+ :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md):
    + <https://pi-server.internal:8384>
    + <https://192.168.50.2:8384>
+ :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md):
    + <https://pi-zero.internal:8384>
    + <https://192.168.50.3:8384>
+ :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md):
    + <http://storage-server.internal:8384>
    + <http://storage-server-2.internal:8384>
    + <http://192.168.50.4:8384>
    + <http://192.168.50.5:8384>

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com):
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Syncthing @ bens-workstation"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Syncthing @ ben-laptop" 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Syncthing @ debian-vm" 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Syncthing @ pi-server"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Syncthing @ pi-zero"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Syncthing @ storage-server"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                      | Method                                | Container Name | Image                          |
| :----------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :----------------------------- |
| :material-desktop-tower:&nbsp;[Ben's Desktop](../02_Hardware/Ben's_Desktop.md)                   | :material-linux:&nbsp;Native Linux    | `N/A`          | `N/A`                          |
| :material-laptop:&nbsp;[Ben's Laptop](../02_Hardware/Ben's_Laptop.md)                            | :material-linux:&nbsp;Native Linux    | `N/A`          | `N/A`                          |
| :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md)                    | :material-linux:&nbsp;Native Linux    | `N/A`          | `N/A`                          |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)  | :material-linux:&nbsp;Native Linux    | `N/A`          | `N/A`                          |
| :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :material-linux:&nbsp;Native Linux    | `N/A`          | `N/A`                          |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                              | :material-docker:&nbsp;Docker Compose | `syncthing`    | `linuxserver/syncthing:latest` |

### :material-cog: Configuration  

#### :symbols-install-desktop: Install Commands:
+ :material-fedora:&nbsp;Ben's Desktop / Ben's Laptop:

    ```bash linenums="1"
    sudo dnf install -y syncthing
    sudo systemctl enable syncthing@bhaube.service
    sudo systemctl start syncthing@bhaube.service
    ```

+ :material-debian:&nbsp;Debian Server VM:

    ```bash linenums="1"
    sudo apt install -y syncthing
    sudo systemctl enable syncthing@server-admin.service
    sudo systemctl start syncthing@server-admin.service
    ```

+ :material-raspberry-pi:&nbsp;Raspberry Pi 4B Server / Raspberry Pi Zero Server:

    ```bash linenums="1"
    sudo apt install -y syncthing
    sudo systemctl enable syncthing@admin.service
    sudo systemctl start syncthing@admin.service
    ```

#### :material-docker: Docker Compose:

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "syncthing-zima.yml"
```
