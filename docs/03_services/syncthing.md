---
icon: services/syncthing-alt
title: Syncthing
subtitle: File Synchronization
description: Open decentralized file synchronization.
tags:
  - Active
  - Backup
  - Container
  - File Share
  - Native
  - Service
  - Sync
hide:
  - toc
---
![Syncthing Icon](../assets/icons/syncthing.svg){ width=200 }

# Syncthing
*File Synchronization*

[GitHub&ensp;:brands-github:](https://github.com/syncthing/syncthing){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.syncthing.net/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Open decentralized file synchronization.

#### :symbols-settings-ethernet:&ensp;Port(s) 

:    `8384`&emsp;`22000`&emsp;`21027`

#### :symbols-link:&ensp;URL / Access  

:    :symbols-pc-case:&nbsp;Ben's Desktop
    
      + <https://bens-workstation.internal:8384>

:    :lucide-laptop-minimal:&nbsp;Ben's Laptop
    
      + <https://localhost:8384>

:    :symbols-smartphone:&nbsp;Ben's Smartphone
    
      + <https://localhost:8384>

:    :symbols-server:&nbsp;Debian Server
    
      + <https://debian-vm.internal:8384>

:    :symbols-server:&nbsp;Pi 4B Server
    
      + <https://pi-server.internal:8384>

:    :symbols-server:&nbsp;Pi Zero 2W Server
    
      + <https://pi-zero.internal:8384>

:    :symbols-server-nas:&nbsp;ZimaOS NAS
    
      + <https://storage-server.internal:8384>
      + <https://storage-server-2.internal:8384>

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com):
    
      + Local Network&ensp;:symbols-move-right:&ensp;"Syncthing @ bens-workstation"
      + Local Network&ensp;:symbols-move-right:&ensp;"Syncthing @ ben-laptop"
      + Local Network&ensp;:symbols-move-right:&ensp;"Syncthing @ bens-phone" 
      + Local Network&ensp;:symbols-move-right:&ensp;"Syncthing @ debian-vm" 
      + Local Network&ensp;:symbols-move-right:&ensp;"Syncthing @ pi-server"
      + Local Network&ensp;:symbols-move-right:&ensp;"Syncthing @ pi-zero"
      + Local Network&ensp;:symbols-move-right:&ensp;"Syncthing @ storage-server"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                                     | Method                                    | Container Name | Image                          |
| :------------------------------------------------------------------------------ | :---------------------------------------- | :------------- | :----------------------------- |
| [:symbols-pc-case:&nbsp;Ben's Desktop](../02_hardware/bens_desktop.md)          | :symbols-penguin:&nbsp;Native Linux       | `N/A`          | `N/A`                          |
| [:lucide-laptop-minimal:&nbsp;Ben's Laptop](../02_hardware/bens_laptop.md)     | :symbols-penguin:&nbsp;Native Linux       | `N/A`          | `N/A`                          |
| [:symbols-smartphone:&nbsp;Ben's Smartphone](../02_hardware/bens_smartphone.md) | :brands-android:&nbsp;Native Android      | `N/A`          | `N/A`                          |
| [:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md)          | :symbols-penguin:&nbsp;Native Linux       | `N/A`          | `N/A`                          |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)            | :symbols-penguin:&nbsp;Native Linux       | `N/A`          | `N/A`                          |
| [:symbols-server:&nbsp;Pi Zero 2W Server](../02_hardware/pi_zero_2w_server.md)  | :symbols-penguin:&nbsp;Native Linux       | `N/A`          | `N/A`                          |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)            | :symbols-container:&nbsp;Docker Container | `syncthing`    | `linuxserver/syncthing:latest` |

### :symbols-settings:&ensp;Configuration  

#### :symbols-install-desktop:&ensp;Install Commands

+ :symbols-fedora:&nbsp;Fedora / RHEL:

    ```bash linenums="1"
    sudo dnf install -y syncthing
    sudo systemctl enable syncthing@bhaube.service
    sudo systemctl start syncthing@bhaube.service
    ```

+ :symbols-debian:&nbsp;Debian 13 *(trixie)*:

    ```bash linenums="1"
    sudo apt install -y syncthing
    sudo systemctl enable syncthing@server-admin.service
    sudo systemctl start syncthing@server-admin.service
    ```

+ :brands-raspberry-pi:&nbsp;Raspberry Pi OS Lite *(also Debian 13)*:

    ```bash linenums="1"
    sudo apt install -y syncthing
    sudo systemctl enable syncthing@admin.service
    sudo systemctl start syncthing@admin.service
    ```

+ :brands-android:&nbsp;Android:

    [Syncthing-Fork&ensp;:brands-f-droid:](https://f-droid.org/packages/com.github.catfriend1.syncthingfork/){ .md-button }

#### :symbols-file-code-corner:&ensp;Docker Compose File

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "syncthing-zima.yml"
```