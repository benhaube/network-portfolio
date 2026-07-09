---
icon: symbols/nas-outline
title: ZimaOS NAS
subtitle: Rack-Mount ZimaBoard 2
tags:
  - NAS
  - File Share
  - Virtual Host
  - Docker Host
  - Living Room
  - Mini-Rack
  - Linux
  - Server
  - Hardware
hide:
  - toc
---
![Material Design nas icon](../assets/icons/10-in-rack.svg){ width=200 }

# ZimaOS NAS
*Rack-Mount ZimaBoard 2*

[IceWhale Community&ensp;:services-icewhale:](https://community.zimaspace.com/){ .md-button .md-button--primary }&emsp;[ZimaOS Docs&ensp;:services-zimaos:](https://www.zimaspace.com/docs/zimaos/){ .md-button .md-button--primary }&emsp;[Backblaze B2&ensp;:services-backblaze:](https://secure.backblaze.com/user_signin.htm){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox-outline:&ensp;Role 

:    The primary rack-mounted NAS server & VM host for the local network. With a [ZimaBoard 2 1664:symbols-external-link-small:](https://www.zimaspace.com/products/single-board2-server?utm_source=head&utm_medium=menu) as the "beating heart," it is the most powerful server on the local network. It has an *x86-64* Intel N150 quad-core CPU *(3.6 GHz)* and 16 GB of LPDDR5 *(6400 MHz)* RAM, and it is located in the 10-inch mini-rack in the living room on the main floor. It has two 2.5 Gb/s Ethernet NICs connected through the Ugreen Switch.

#### :symbols-host-outline:&ensp;Hostname

+ `ZimaOS-NAS`

#### :symbols-location-outline:&ensp;Location 

+ Living-Room
+ Mini-Rack

#### :symbols-memory:&ensp;OS / Firmware

+ [:services-zimaos:&nbsp;ZimaOS v1.6.1](https://www.zimaspace.com/zimaos) *(Immutable)*

#### :symbols-user-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"ZimaOS NAS (admin)" 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"ZimaOS NAS (bhaube)"
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"ZimaOS NAS (rpereira)"   
    + SSH Keys&ensp;:symbols-arrow-right-thin:&ensp;"ZimaOS NAS (admin)"

## :symbols-monitor-heart-outline:&ensp;Core Specs

| CPU                                 | Cores / Threads | CPU Freq. | RAM                       | GPU                              | GPU Freq. | VRAM     |
| :---------------------------------- | :-------------- | :-------- | :------------------------ | :------------------------------- | :-------- | :------- |
| :brands-intel:&nbsp;N150 *(x86-64)* | 4C / 4T         | 3.6 GHz   | 16 GB LPDDR5 *(6400 MHz)* | :brands-intel:&nbsp;UHD Graphics | 1.0 GHz   | *Shared* |

## :symbols-lan-outline:&ensp;Network Configuration

| Interface | IP Address     | MAC Address         | Connected To                                                                                     |
| :-------: | :------------- | :------------------ | :----------------------------------------------------------------------------------------------- |
|  `eth0`   | `192.168.50.4` | `00:E0:4C:5B:9A:96` | [:symbols-ethernet-port-outline:&nbsp;Ugreen Switch](../02_Hardware/Ugreen_Switch.md) *(Port 4)* |
|  `eth1`   | `192.168.50.5` | `00:E0:4C:5B:9A:95` | [:symbols-ethernet-port-outline:&nbsp;Ugreen Switch](../02_Hardware/Ugreen_Switch.md) *(Port 5)* |

| Interface |              VLAN              | FQDN                        | DNS Servers                   | Gateway        |
| :-------: | :----------------------------: | :-------------------------- | :---------------------------- | :------------- |
|  `eth0`   | :symbols-security:&nbsp;VLAN50 | `storage-server.internal`   | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |
|  `eth1`   | :symbols-security:&nbsp;VLAN50 | `storage-server-2.internal` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :symbols-folder-open-outline:&ensp;Storage & Mounts

#### :symbols-memory-alt:&ensp;Boot

| Mount Point | Drive Type | Drive Capacity | Device Path    | File System | Encryption |
| :---------- | :--------- | :------------- | :------------- | :---------- | :--------- |
| `/`         | eMMC       | 64 GB          | `/dev/mmcblk0` | `ext4`      | -          |

#### :symbols-hard-drive-outline:&ensp;Data

| Mount Point            | Drive Type         | Drive Capacity | Device Path    | File System | Encryption |
| :--------------------- | :----------------- | :------------- | :------------- | :---------- | :--------- |
| `/media/Quick-Storage` | RAID0, 2 SATA SSDs | 2 TB           | `/dev/md0`     | `btrfs`     | -          |
| `/media/nvme0n1p1`     | NVMe SSD           | 250 GB         | `/dev/nvme0n1` | `ext4`      | -          |

## :symbols-web:&ensp;Services / Docker Containers

#### :symbols-smb-share-outline:&ensp;File Sharing

+ SMB  *(with Multichannel enabled)*
+ NFS *(for Linux PCs)*

#### :symbols-layers:&ensp;Virtualization

|  Status  | OS                                                                             | Virtual NIC | Virtual Disk Image | Role / Notes                                                                         |
| :------: | :----------------------------------------------------------------------------- | :---------- | :----------------- | :----------------------------------------------------------------------------------- |
| *Active* | [:symbols-debian:&nbsp;Debian *(trixie)*](../02_Hardware/Debian_Server_VM.md)  | Bridge      | `cd175b11.qcow2`   | Hosting the network's primary [Technitium](../03_Services/Technitium.md) DNS server. |

#### :symbols-linux:&ensp;Native Linux

|  Status  | Service                                                       | Port(s) | Role / Notes                                                                                   |
| :------: | :------------------------------------------------------------ | :-----: | :--------------------------------------------------------------------------------------------- |
| *Active* | [:symbols-smb-share-outline:&nbsp;NFS](../03_Services/NFS.md) | `2049`  | Remote file system access.                                                                     |
| *Active* | [:symbols-terminal-alt:&nbsp;SSH](../03_Services/SSH.md)      |  `22`   | Provides secure encrypted communications between two untrusted hosts over an insecure network. |
| *Active* | [:symbols-smb-share-outline:&nbsp;SMB](../03_Services/SMB.md) |  `445`  | Remote file system access.                                                                     |

#### :services-docker:&ensp;Docker

|   Status   | Service                                                                                 |        Port(s)         | Role / Notes                                                                                                                                        |
| :--------: | :-------------------------------------------------------------------------------------- | :--------------------: | :-------------------------------------------------------------------------------------------------------------------------------------------------- |
|  *Active*  | [:services-beszel:&nbsp;Beszel](../03_Services/Beszel_Hub.md)                           |        `45876`         | Agent for Beszel Hub *(hosted on [Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md))*.                                                        |
|  *Active*  | [:services-cloudflare:&nbsp;Cloudflared](../03_Services/Cloudflared.md)                 |        `14333`         | Secure reverse-proxy tunnel for hosting private services on the public internet.                                                                    |
|  *Active*  | [:services-dockge:&nbsp;Dockge](../03_Services/Dockge.md)                               |         `5001`         | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.                                                         |
|  *Active*  | [:services-f1-replay-timing:&nbsp;F1 Replay Timing](../03_Services/F1_Replay_Timing.md) |     `3000` `8000`      | Visualization of real-time track data and telemetry synced to F1 live and replays.                                                                  |
|  *Active*  | [:services-gitea:&nbsp;Gitea](../03_Services/Gitea.md)                                  |      `3080` `222`      | Painless, self-hosted, all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD. |
|  *Active*  | [:services-glances:&nbsp;Glances](../03_Services/Glances.md)                            |        `61208`         | A `top` / `htop` alternative for GNU / Linux, BSD, Mac OS and Windows operating systems.                                                            |
|  *Active*  | [:services-gotify-notification:&nbsp;Gotify](../03_Services/Gotify.md)                  |         `8180`         | A simple server for sending and receiving messages in real-time per WebSocket.                                                                      |
|  *Active*  | [:services-homebox:&nbsp;Homebox](../03_Services/Homebox.md)                            |         `3100`         | An inventory and organization system built for the home user.                                                                                       |
|  *Active*  | [:services-immich:&nbsp;Immich](../03_Services/Immich.md)                               |         `2283`         | High performance self-hosted photo and video management solution.                                                                                   |
|  *Active*  | [:simple-nginx:&nbsp;Nginx](../03_Services/Nginx.md)                                    |         `8080`         | The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.                                  |
| *Inactive* | [:services-ntop:&nbsp;ntopng](../03_Services/ntopng.md)                                 |     `3000` `5556`      | Web-based traffic and security network traffic monitoring.                                                                                          |
|  *Active*  | [:simple-obsidian:&nbsp;Obsidian LiveSync](../03_Services/Obsidian_LiveSync.md)         |         `5984`         | Seamless multi-primary syncing database with an intuitive HTTP / JSON API, designed for reliability.                                                |
|  *Active*  | [:services-openspeedtest:&nbsp;OpenSpeedTest](../03_Services/OpenSpeedTest.md)          |         `3004`         | A free & open-source HTML5 network performance estimation tool.                                                                                     |
| *Inactive* | [:services-portainer:&nbsp;Portainer](../03_Services/Portainer.md)                      |         `9001`         | A lightweight service delivery platform for containerized applications.                                                                             |
|  *Active*  | [:services-portracker:&nbsp;Portracker](../03_Services/Portracker.md)                   |         `4999`         | A self-hosted, real-time port monitoring and discovery tool.                                                                                        |
|  *Active*  | [:services-spoolman:&nbsp;Spoolman](../03_Services/Spoolman.md)                         |         `7912`         | Keep track of your inventory of 3D-printer filament spools.                                                                                         |
|  *Active*  | [:simple-syncthing:&nbsp;Syncthing](../03_Services/Syncthing.md)                        | `8384` `22000` `21027` | Open decentralized file synchronization.                                                                                                            |
|  *Active*  | [:symbols-terminal:&nbsp;ttydBridge](../03_Services/ttydBridge.md)                      |         `2222`         | A DockerApp makes it easy to use the host terminal in the Web.                                                                                      |
|  *Active*  | [:services-wireguard:&nbsp;WireGuard](../03_Services/Wireguard_Server.md)               |    `51820` `51821`     | An extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography.                                                            |
|  *Active*  | [:services-youtube-dl:&nbsp;yt-dlp WebUI](../03_Services/yt-dlp_WebUI.md)               |         `3033`         | High performance extendable Web-UI and RPC server for `yt-dlp` with low impact on resources.                                                        |

---
## :symbols-note-stack:&ensp;Maintenance & Notes

!!! zima inline end "ZimaOS"

    This server runs **ZimaOS**, an "Atomic" *(a.k.a., immutable)* operating system.
  
    + Do not attempt to use `apt` to install or upgrade system packages. 
    + Do not change NTP settings *(stuck on `systemd-timesyncd`)*.

    :symbols-boxes:&ensp;**Entware:**
 
    + The [Entware:symbols-external-link-small:](https://github.com/Entware/Entware) package manager is installed, allowing additional packages not included in ZimaOS to be installed. 
    + Additional packages can be installed to the `/opt/bin` directory with the `opkg` command. 
    + Check the [Entware Wiki:symbols-external-link-small:](https://github.com/Entware/Entware/wiki) for documentation.

!!! config "Critical Configurations"

    :symbols-smb-share-outline:&ensp;**SMB Multi-Channel:**
    
    + SMB Multi-channel is enabled via custom edit to `/etc/samba/smb.conf` (or ZimaOS equivalent path).
    + **Constraint:** 
        + Requires both Ethernet cables to be connected to the 2.5 Gb switch to achieve throughput > 2.5 Gb/s.

    ---
    See the ["Configuration"](../03_Services/SMB.md#configuration) section of the SMB service documentation page for server configuration details.

!!! change "NAS Protocol Change (SMB :symbols-arrow-right-thin: NFS)"
    
    :symbols-calendar-event:&ensp;**Date:** 2026-02-09 <br>
    :symbols-info:&ensp;**Reason:** SMB latency caused slow transfers for small files. *(e.g., photos / code)* <br>
    :symbols-monitor-heart-outline:&ensp;**Performance:** Reduced backup time from ~10m to ~1.5m. <br>
    :symbols-devices:&ensp;**Affected Clients:** 
 
    + [Ben's Desktop PC](./Ben's_Desktop.md) 
    + [Ben's Laptop PC](./Ben's_Laptop.md)

    --- 
    See the ["Configuration"](../03_Services/NFS.md#configuration) section of the NFS service documentation page for server and client configuration details. 

--8<-- "nerd-fonts.md"

#### :symbols-rocket:&ensp;Starship Terminal Prompt

The Starship terminal prompt is a cross-platform, cross-shell application that replaces the standard shell prompt on your Android, BSD, Windows, Linux, or MacOS computer. It is compatible with Bash, Cmd, Elvish, Fish, Ion, Nutshell, Powershell, Tcsh, Xonsh, and Zsh. 

##### Install

1. Install the latest version:

    ```bash linenums="1" 
    sudo curl -sS https://starship.rs/install.sh
    sudo sh install.sh -b /opt/bin
    ```

2. Add init script to `~/.bashrc`: 

    ```bash linenums="1"
    eval "$(starship init bash)"
    ```

3. Copy the `starship.toml` config file into the `~/.config` directory: 

    ```bash linenums="1"
    sudo cp starship.toml .config/
    ```

##### Starship Config File

```toml {title="/DATA/.config/starship.toml" linenums="1" .mono-title}
--8<-- "starship-zimaos.toml"
```

#### :symbols-login:&ensp;Fastfetch Login Preset

The Fastfetch Login Preset prints a customized Fastfetch output with relevant information every time a new terminal session is started. I have all variants of the preset hosted in a code repository on [GitHub:symbols-external-link-small:](https://github.com/benhaube/fastfetch-login-preset).

##### Install

1. Download the latest `fastfetch` release from [GitHub:symbols-external-link-small:](https://github.com/fastfetch-cli/fastfetch/releases/latest) and decompress the archive: 

    ```bash linenums="1"
    sudo wget https://github.com/fastfetch-cli/fastfetch/releases/download/[release-version]/fastfetch-linux-amd64.zip
    sudo unzip fastfetch-linux-amd64.zip
    ```

2. Manually install `fastfetch` into `/opt/bin` directory: 

    ```bash linenums="1" 
    sudo cp fastfetch-linux-amd64/usr/bin/fastfetch /opt/bin
    sudo cp -r fastfetch-linux-amd64/usr/share/fastfetch /opt/share
    sudo cp -r fastfetch-linux-amd64/usr/share/bash-completion /opt/share
    ```

##### Configure

1. Copy the `login.jsonc` preset file into the presets directory:

    ```bash linenums="1"
    sudo cp login.jsonc /opt/share/fastfetch/presets
    ```

2. Add the `fastfetch` command to the `~/.bashrc` file: 

    ```bash linenums="1"
    fastfetch -c login
    ```

##### Fastfetch Preset File

```json {title="/usr/share/fastfetch/presets/login.jsonc" linenums="1" .mono-title}
--8<-- "fastfetch-login-storage-server.jsonc"
```

#### :symbols-cron:&ensp;Zima Cron

##### About

:    A modern, reliable task scheduler for ZimaOS with a completely redesigned web interface. Replaces the previous cron implementation with improved task persistence, advanced scheduling options, and comprehensive notification support. 

##### Install

1. Download the latest release from [GitHub:symbols-external-link-small:](https://github.com/chicohaager/cron).
2. Copy the `cron.raw` package into the `/tmp` directory on the server:

    ```bash linenums="1"
    scp cron.raw root@storage-server.internal:/tmp/
    ```

3. Install the package:

    ```bash linenums="1"
    sudo zpkg install /tmp/cron.raw
    ```

!!! note

    :symbols-folder-git-2:&ensp;**Data Directory:**

    :    The task configurations and logs are stored in `/DATA/AppData/cron/`

    :symbols-restart-alt:&ensp;**Persistence:**

    :    Tasks are persisted to disk and automatically restored after system restart using the Systemd unit, `cron.service`. This fixes the known issue where tasks did not continue after a reboot in previous versions.

    Open it from the [ZimaOS dashboard:symbols-external-link-small:](http://storage-server.internal) *(Cron)*, or directly at <http://storage-server.internal/modules/cron/>.

#### :symbols-security:&ensp;Zima Firewall

##### About

:    Host firewall for ZimaOS &mdash; a standalone module with a web UI and a live security dashboard. Default-drop INPUT allowlist + DOCKER-USER blocklist, IPv6-aware, dead-man Safe-Apply, GeoIP, threat detection. 

##### Install

1. Download the latest release from [GitHub:symbols-external-link-small:](https://github.com/chicohaager/zfw).
2. Copy the compressed archive into the `/tmp` directory on the server:

    ```bash linenums="1"
    scp zfw-<version>-amd64.tar.gz root@storage-server.internal:/tmp/
    ```

3. Extract the archive, enter the directory, and run the `install.sh` script:

    ```bash linenums="1"
    ssh root@storage-server.internal 'cd /tmp && tar xzf zfw-<version>-amd64.tar.gz && cd zfw-* && sh install.sh'
    ```

!!! note

    The script, `install.sh`, places the sysext module in `/var/lib/extensions/`, installs the engine script to `/DATA/zfw/zfw` *(root:root, 0700)*, verifies the module checksum, merges the sysext and (re)starts `zfw-ui.service`. Re-run it any time to update an install in place. 
 
    Open it from the [ZimaOS dashboard:symbols-external-link-small:](http://storage-server.internal) *(ZFW Firewall)*, or directly at <http://storage-server.internal/modules/zfw/index.html>.