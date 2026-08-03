---
icon: symbols/server-nas
title: ZimaOS NAS
subtitle: Rack-Mount ZimaBoard 2
description: The primary rack-mounted NAS server & VM host for the LAN. With a ZimaBoard 2 1664 as the "beating heart," it is the most powerful server on the LAN.
tags:
  - NAS
  - File Share
  - Virtual Host
  - Container Host
  - Living Room
  - Server Rack
  - Linux
  - Server
  - Hardware
hide:
  - toc
---
![Custom 'server-nas' icon following Lucide style guidelines](../assets/icons/server-nas.svg){ width=200 }

# ZimaOS NAS
*Rack-Mount ZimaBoard 2*

[IceWhale Community&ensp;:services-icewhale:](https://community.zimaspace.com/){ .md-button .md-button--primary }&emsp;[ZimaOS Docs&ensp;:services-zimaos:](https://www.zimaspace.com/docs/zimaos/){ .md-button .md-button--primary }&emsp;[Backblaze B2&ensp;:services-backblaze:](https://secure.backblaze.com/user_signin.htm){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role 

:    The primary rack-mounted NAS server & VM host for the local network. With a [ZimaBoard 2 1664](https://www.zimaspace.com/products/single-board2-server?utm_source=head&utm_medium=menu){ external-link } as the "beating heart," it is the most powerful server on the local network. It has an *x86-64* Intel N150 quad-core CPU *(3.6 GHz)* and 16 GB of LPDDR5 *(6400 MHz)* RAM, and it is located in the 10-inch server rack in the living room on the main floor. It has two 2.5 Gb/s Ethernet NICs connected through the Ugreen Switch.

#### :symbols-host:&ensp;Hostname

:    `ZimaOS-NAS`

#### :symbols-map-pin:&ensp;Location 

:    Living-Room&ensp;:symbols-move-right:&ensp;Server Rack

#### :symbols-cpu:&ensp;OS / Firmware

:    [:services-zimaos:&ensp;ZimaOS v1.7.0](https://www.zimaspace.com/zimaos){ external-link } *(Immutable)*

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (admin)" 
      + Local Network&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (bhaube)"
      + Local Network&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (rpereira)"   
      + SSH Keys&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (admin)"

## :symbols-circuit-board:&ensp;Core Specs

| CPU                                 | Cores / Threads | CPU Freq. | RAM                       | GPU                              | GPU Freq. | VRAM     |
| :---------------------------------- | :-------------- | :-------- | :------------------------ | :------------------------------- | :-------- | :------- |
| :brands-intel:&nbsp;N150 *(x86-64)* | 4C / 4T         | 3.6 GHz   | 16 GB LPDDR5 *(6400 MHz)* | :brands-intel:&nbsp;UHD Graphics | 1.0 GHz   | *Shared* |

## :symbols-network:&ensp;Network Configuration

| Interface | IP Address {data-sort-method='dotsep'} | MAC Address         | Connected To                                                                                       |
| :-------: | :------------------------------------- | :------------------ | :------------------------------------------------------------------------------------------------- |
|  `eth0`   | `192.168.50.4`                         | `00:E0:4C:5B:9A:96` | [:symbols-ethernet-port:&nbsp;Ugreen Switch](ugreen_switch.md#port-map){ data-preview } *(Port 4)* |
|  `eth1`   | `192.168.50.5`                         | `00:E0:4C:5B:9A:95` | [:symbols-ethernet-port:&nbsp;Ugreen Switch](ugreen_switch.md#port-map){ data-preview } *(Port 5)* |

| Interface |             VLAN             | FQDN                        | DNS Servers {data-sort-method='none'} | Gateway {data-sort-method='dotsep'} |
| :-------: | :--------------------------: | :-------------------------- | :------------------------------------ | :---------------------------------- |
|  `eth0`   | :symbols-shield:&nbsp;VLAN50 | `storage-server.internal`   | `192.168.50.6` `192.168.50.2`         | `192.168.50.1`                      |
|  `eth1`   | :symbols-shield:&nbsp;VLAN50 | `storage-server-2.internal` | `192.168.50.6` `192.168.50.2`         | `192.168.50.1`                      |

## :symbols-folder-tree:&ensp;Storage & Mounts

#### :symbols-microchip:&ensp;Boot

| Mount Point | Drive Type | Drive Capacity {data-sort-method='filesize'} | Device Path    | File System | Encryption |
| :---------- | :--------- | :------------------------------------------- | :------------- | :---------- | :--------- |
| `/`         | eMMC       | 64 GB                                        | `/dev/mmcblk0` | `ext4`      | -          |

#### :symbols-hard-drive:&ensp;Data

| Mount Point            | Drive Type         | Drive Capacity {data-sort-method='filesize'} | Device Path    | File System | Encryption |
| :--------------------- | :----------------- | :------------------------------------------- | :------------- | :---------- | :--------- |
| `/media/Quick-Storage` | RAID0, 2 SATA SSDs | 2 TB                                         | `/dev/md0`     | `btrfs`     | -          |
| `/media/nvme0n1p1`     | NVMe SSD           | 250 GB                                       | `/dev/nvme0n1` | `ext4`      | -          |

## :symbols-monitor-cloud:&ensp;Services & Containers

#### :symbols-share:&ensp;File Sharing

+ SMB  *(with Multichannel enabled)*
+ NFS *(for Linux PCs)*

#### :symbols-layers:&ensp;Virtualization

|  Status  | OS                                                                              | Virtual NIC | Virtual Disk Image | Role / Notes {data-sort-method='none'}                                                                                  |
| :------: | :------------------------------------------------------------------------------ | :---------- | :----------------- | :---------------------------------------------------------------------------------------------------------------------- |
| *Active* | [:brands-debian:&nbsp;Debian *(trixie)*](debian_server.md#role){ data-preview } | Bridge      | `cd175b11.qcow2`   | Hosting the network's primary [Technitium](../03_services/technitium.md#deployment-details){ data-preview } DNS server. |

#### :symbols-tux:&ensp;Native Linux

|  Status  | Service                                                  | Port(s) {data-sort-method='number'} | Role / Notes {data-sort-method='none'}                                                         |
| :------: | :------------------------------------------------------- | :---------------------------------: | :--------------------------------------------------------------------------------------------- |
| *Active* | [:symbols-folder-tree:&nbsp;NFS](../03_services/nfs.md)  |                `2049`               | Remote file system access.                                                                     |
| *Active* | [:symbols-terminal-alt:&nbsp;SSH](../03_services/ssh.md) |                 `22`                | Provides secure encrypted communications between two untrusted hosts over an insecure network. |
| *Active* | [:symbols-folder-tree:&nbsp;SMB](../03_services/smb.md)  |                 `445`               | Remote file system access.                                                                     |

#### :symbols-container:&ensp;Docker Container

|   Status   | Service                                                                                 | Port(s) {data-sort-method='number'} | Role / Notes {data-sort-method='none'}                                                                                                              |
| :--------: | :-------------------------------------------------------------------------------------- | :---------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------------------------- |
|  *Active*  | [:services-beszel:&nbsp;Beszel](../03_services/beszel.md)                               |               `45876`               | Agent for Beszel Hub *(hosted on [Pi 4B Server](pi_4b_server.md#docker-container){ data-preview })*.                                                | 
|  *Active*  | [:services-cloudflare:&nbsp;Cloudflared](../03_services/cloudflared.md)                 |               `14333`               | Secure reverse-proxy tunnel for hosting private services on the public internet.                                                                    |
|  *Active*  | [:services-dockge:&nbsp;Dockge](../03_services/dockge.md)                               |                `5001`               | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.                                                         |
|  *Active*  | [:services-f1-replay-timing:&nbsp;F1 Replay Timing](../03_services/f1_replay_timing.md) |                `8000`               | Visualization of real-time track data and telemetry synced to F1 live and replays.                                                                  |
|  *Active*  | [:services-gitea:&nbsp;Gitea](../03_services/gitea.md)                                  |            `3080`<br>`222`          | Painless, self-hosted, all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD. |
|  *Active*  | [:services-glances:&nbsp;Glances](../03_services/glances.md)                            |               `61208`               | A `top` / `htop` alternative for GNU / Linux, BSD, Mac OS and Windows operating systems.                                                            |
|  *Active*  | [:services-gotify-notification:&nbsp;Gotify](../03_services/gotify.md)                  |                `8180`               | A simple server for sending and receiving messages in real-time per WebSocket.                                                                      |
|  *Active*  | [:services-homebox:&nbsp;Homebox](../03_services/homebox.md)                            |                `3100`               | An inventory and organization system built for the home user.                                                                                       |
|  *Active*  | [:services-immich:&nbsp;Immich](../03_services/immich.md)                               |                `2283`               | High performance self-hosted photo and video management solution.                                                                                   |
|  *Active*  | [:services-netalertx:&nbsp;NetAlertX](../03_services/netalertx.md)                      |          `20211`<br>`20212`         | Centralized network visibility and continuous asset discovery. Monitor devices, detect change, and stay aware across distributed networks.          |
|  *Active*  | [:services-nginx:&nbsp;Nginx](../03_services/nginx.md)                                  |                `8080`               | The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.                                  |
| *Inactive* | [:services-ntop:&nbsp;ntopng](../03_services/ntopng.md)                                 |           `3000`<br>`5556`          | Web-based traffic and security network traffic monitoring.                                                                                          |
|  *Active*  | [:services-obsidian:&nbsp;Obsidian LiveSync](../03_services/obsidian_livesync.md)       |                `5984`               | Seamless multi-primary syncing database with an intuitive HTTP / JSON API, designed for reliability.                                                |
|  *Active*  | [:services-openspeedtest:&nbsp;OpenSpeedTest](../03_services/openspeedtest.md)          |                `3004`               | A free & open-source HTML5 network performance estimation tool.                                                                                     |
| *Inactive* | [:services-portainer:&nbsp;Portainer](../03_services/portainer.md)                      |                `9001`               | A lightweight service delivery platform for containerized applications.                                                                             |
|  *Active*  | [:services-portracker:&nbsp;Portracker](../03_services/portracker.md)                   |                `4999`               | A self-hosted, real-time port monitoring and discovery tool.                                                                                        |
|  *Active*  | [:services-spoolman:&nbsp;Spoolman](../03_services/spoolman.md)                         |                `7912`               | Keep track of your inventory of 3D-printer filament spools.                                                                                         |
|  *Active*  | [:services-syncthing-alt:&nbsp;Syncthing](../03_services/syncthing.md)                  |     `8384`<br>`22000`<br>`21027`    | Open decentralized file synchronization.                                                                                                            |
|  *Active*  | [:symbols-terminal:&nbsp;ttydBridge](../03_services/ttydbridge.md)                      |                `2222`               | A DockerApp makes it easy to use the host terminal in the Web.                                                                                      |
|  *Active*  | [:services-youtube-dl:&nbsp;yt-dlp WebUI](../03_services/yt-dlp_web-ui.md)              |                `3033`               | High performance extendable Web-UI and RPC server for `yt-dlp` with low impact on resources.                                                        |

---
## :symbols-sticky-notes:&ensp;Maintenance & Notes

!!! zima inline end "ZimaOS"

    This server runs **ZimaOS**, an "Atomic" *(a.k.a., immutable)* operating system.
  
    + Do not attempt to use `apt` to install or upgrade system packages. 
    + Do not change NTP settings *(stuck on `systemd-timesyncd`)*.

    :symbols-package-open:&ensp;**Entware:**
 
    + The [Entware](https://github.com/Entware/Entware){ external-link } package manager is installed, allowing additional packages not included in ZimaOS to be installed. 
    + Additional packages can be installed to the `/opt/bin` directory with the `opkg` command. 
    + Check the [Entware Wiki](https://github.com/Entware/Entware/wiki){ external-link } for documentation.

!!! config "Critical Configurations"

    :symbols-folder-tree:&ensp;**SMB Multi-Channel:**
    
    + SMB Multi-channel is enabled via custom edit to `/etc/samba/smb.conf` (or ZimaOS equivalent path).
    + **Constraint:** 
        + Requires both Ethernet cables to be connected to the 2.5 Gb switch to achieve throughput > 2.5 Gb/s.

    ---
    See the ["Configuration"](../03_services/smb.md#configuration) section of the SMB service documentation page for server configuration details.

!!! change "NAS Protocol Change (SMB :symbols-move-right: NFS)"
    
    :symbols-calendar:&ensp;**Date:** 2026-02-09 <br>
    :symbols-circle-question-mark:&ensp;**Reason:** SMB latency caused slow transfers for small files. *(e.g., photos / code)* <br>
    :symbols-activity:&ensp;**Performance:** Reduced backup time from ~10m to ~1.5m. <br>
    :symbols-monitor-smartphone:&ensp;**Affected Clients:** 
 
    + [Ben's Desktop PC](bens_desktop.md#role){ data-preview } 
    + [Ben's Laptop PC](bens_laptop.md#role){ data-preview }

    --- 
    See the ["Configuration"](../03_services/nfs.md#configuration) section of the NFS service documentation page for server and client configuration details. 

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

#### :symbols-log-in:&ensp;Fastfetch Login Preset

The Fastfetch Login Preset prints a customized Fastfetch output with relevant information every time a new terminal session is started. I have all variants of the preset hosted in a code repository on [GitHub](https://github.com/benhaube/fastfetch-login-preset){ external-link }.

##### Install

1. Download the latest `fastfetch` release from [GitHub](https://github.com/fastfetch-cli/fastfetch/releases/latest){ external-link } and decompress the archive: 

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

1. Sets the width of the percentage bars.
2.     **Options:** 
       
       + `1` = number 
       + `2` = bar 
       + `3` = both 
       + `9` = colored number

3.     **Options:** 
       
       + `string`
       + `icon` 
       + `both` 
       + `none`

4. Aligns all keys to this uniform width.
5. Sets the separator symbol used between the keys and values.

#### :symbols-clock-fading:&ensp;Zima Cron

##### About

:    A modern, reliable task scheduler for ZimaOS with a completely redesigned web interface. Replaces the previous cron implementation with improved task persistence, advanced scheduling options, and comprehensive notification support. 

##### Install

1. Download the latest release from [GitHub](https://github.com/chicohaager/cron){ external-link }.

    ```bash linenums="1"
    wget https://github.com/chicohaager/cron/releases/download/<version>/cron.raw
    ```

2. Copy the `cron.raw` package into the `/tmp` directory on the server:

    ```bash linenums="1"
    scp cron.raw admin@ZimaOS-NAS:/tmp/
    ```

3. Install the package:

    ```bash linenums="1"
    ssh admin@ZimaOS-NAS
    sudo zpkg install /tmp/cron.raw
    ```

!!! note

    :symbols-folder-git-2:&ensp;**Data Directory:**

    :    The task configurations and logs are stored in `/DATA/AppData/cron/`

    :symbols-rotate-ccw:&ensp;**Persistence:**

    :    Tasks are persisted to disk and automatically restored after system restart using the Systemd unit, `cron.service`. This fixes the known issue where tasks did not continue after a reboot in previous versions.

    Open it from the [ZimaOS dashboard](http://storage-server.internal){ external-link } *(Cron)*, or directly at <http://storage-server.internal/modules/cron/>.

#### :symbols-brick-wall-fire:&ensp;Zima Firewall

##### About

:    Host firewall for ZimaOS &mdash; a standalone module with a web UI and a live security dashboard. Default-drop INPUT allowlist + DOCKER-USER blocklist, IPv6-aware, dead-man Safe-Apply, GeoIP, threat detection. 

##### Install

1. Download the latest release from [GitHub](https://github.com/chicohaager/zfw){ external-link }.

    ```bash linenums="1"
    wget https://github.com/chicohaager/zfw/releases/download/<version>/zfw-<version>-amd64.tar.gz
    ```

2. Copy the compressed archive into the `/tmp` directory on the server:

    ```bash linenums="1"
    scp zfw-<version>-amd64.tar.gz admin@ZimaOS-NAS:/tmp/
    ```

3. Extract the archive, enter the directory, and run the `install.sh` script:

    ```bash linenums="1"
    ssh admin@ZimaOS-NAS 
    cd /tmp && tar xzf zfw-<version>-amd64.tar.gz && cd zfw-*
    sudo sh install.sh'
    ```

!!! note

    The script, `install.sh`, places the sysext module in `/var/lib/extensions/`, installs the engine script to `/DATA/zfw/zfw` *(root:root, 0700)*, verifies the module checksum, merges the sysext and (re)starts `zfw-ui.service`. Re-run it any time to update an install in place. 
 
    Open it from the [ZimaOS dashboard](http://storage-server.internal){ external-link } *(ZFW Firewall)*, or directly at <http://storage-server.internal/modules/zfw/index.html>.