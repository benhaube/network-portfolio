---
icon: material/nas
title: ZimaOS NAS
tags:
  - Hardware
  - NAS
  - Server
  - File Share
  - Virtual Host
  - Docker Host
  - Living Room
  - Mini-Rack
  - Linux
hide:
  - toc
---
![Material Design nas icon](../assets/icons/nas.svg){ width=200 }&nbsp;
![ZimaOS Icon](../assets/icons/zimaos-light.svg#only-light){ width=50 }
![ZimaOS Icon](../assets/icons/zimaos-dark.svg#only-dark){ width=50 }
&nbsp;![Intel Logo](../assets/icons/intel.svg){ width=50 }

# ZimaOS NAS
[IceWhale Community :services-icewhale:](https://community.zimaspace.com/){ .md-button .md-button--primary }&emsp;[ZimaOS Docs :services-zimaos:](https://www.zimaspace.com/docs/zimaos/){ .md-button }

---
## :material-information-outline: Device Overview

#### :material-toolbox: Role: 

+ Primary NAS & VM Host

#### :symbols-host: Hostname(s):

+ `storage-server` *(eth0)*
+ `storage-server-2` *(eth1)*

#### :material-map-marker-outline: Location: 

+ Living-Room
+ Mini-Rack

#### :material-memory: OS / Firmware: 

+ [:services-zimaos:&nbsp;ZimaOS v1.6.0](https://www.zimaspace.com/zimaos) *(Immutable)*

#### :material-key-chain: Credentials:

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + "storage-server (Admin)" 
    + "storage-server (bhaube)"  
    + SSH key: "admin@storage-server"

#### :symbols-monitor-heart: Core Specs:

| CPU | Cores / Threads | CPU Freq. | RAM | GPU | GPU Freq. | VRAM |
| :-- | :-------------- | :-------- | :-- | :-- | :-------- | :--- |
| :brands-intel:&nbsp;N150 *(x86-64)* | 4C / 4T | 3.6 GHz | 16 GB LPDDR5 *(6400 MHz)* | :brands-intel:&nbsp;UHD Graphics | 1.0 GHz | *Shared* |

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| eth0 | `192.168.50.4` | `00:E0:4C:5B:9A:96` | :material-switch:&nbsp;[Ugreen Switch](../02_Hardware/Ugreen_Switch.md) *(Port 4)* |
| eth1 | `192.168.50.5` | `00:E0:4C:5B:9A:95` | :material-switch:&nbsp;[Ugreen Switch](../02_Hardware/Ugreen_Switch.md) *(Port 5)* |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--: | :---------- | :---------- | :------ |
| :material-security:&nbsp;vlan50 | `storage-server.internal` | `192.168.50.6`, `192.168.50.2` | `192.168.50.1` |
| :material-security:&nbsp;vlan50 | `storage-server-2.internal` | `192.168.50.6`, `192.168.50.2` | `192.168.50.1` |

## :symbols-storage: Storage & Mounts

#### :material-chip: Boot:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/` | eMMC | 64 GB | `/dev/mmcblk0` | `ext4` | - |

#### :material-harddisk: Data:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/media/Quick-Storage` | RAID0, 2 SATA SSDs | 2 TB | `/dev/md0` | `btrfs` | - |
| `/media/nvme0n1p1` | NVMe SSD | 250 GB | `/dev/nvme0n1` | `ext4` | - |

## :material-web: Services / Docker Containers

#### :material-folder-network: File Sharing:

* SMB  *(with Multichannel enabled)*
* NFS *(for Linux PCs)*

#### :material-network-pos: Virtualization:

| Status | Operating System | Network Interface | Disk Image | Role / Notes |
| :----: | :--------------- | :---------------- | :--------- | :----------- | 
| *Active* | :material-debian:&nbsp;[Debian Linux 13](../02_Hardware/Debian_Server_VM.md) | Bridged (`eth0`) | `cd175b11.qcow2` | Hosting the network's primary [[Technitium]] DNS server. |

#### :material-linux: Native Linux:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :material-folder-network:&nbsp;[[NFS]] | `2049` | Remote file system access. |
| *Active* | :material-console-network:&nbsp;[[SSH]] | `22` | Remote terminal access. |
| *Active* | :material-folder-network:&nbsp;[[SMB]] | `445` | Remote file system access. |

#### :material-docker: Docker:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :services-beszel:&nbsp;[Beszel Agent](../03_Services/Beszel_Agent.md) | `45876` | Agent for Beszel Hub *(hosted on [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md))*. |
| *Active* | :services-cloudflare:&nbsp;[[Cloudflared]] | `14333` | Secure reverse-proxy tunnel for hosting private services on the public internet. |
| *Active* | :services-f1-replay-timing:&nbsp;[F1 Replay Timing](../03_Services/F1_Replay_Timing.md) | `3000` `8000` | Visualization of real-time track data and telemetry synced to F1 live and replays. |
| *Active* | :services-glances:&nbsp;[[Glances]] | `61208` | A top/htop alternative. |
| *Active* | :services-homebox:&nbsp;[[Homebox]] | `3100` | An inventory and organization system built for the home user. |
| *Active* | :services-immich:&nbsp;[[Immich]] | `2283` | Photo gallery and backup service. |
| *Active* | :simple-nginx:&nbsp;[Nginx (Network Portfolio)](../03_Services/Nginx.md) | `8080` | The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache. |
| *Inactive* | :material-ethernet:&nbsp;[[ntopng]] | `3000` `5556` | Network traffic probe. |
| *Active* | :simple-obsidian:&nbsp;[Obsidian LiveSync](../03_Services/Obsidian_LiveSync.md) | `5984` | CouchDB database for synchronizing Obsidian Vaults. |
| *Active* | :services-openspeedtest:&nbsp;[[OpenSpeedTest]] | `3004` | HTML5 Network Speed Test Server. |
| *Inactive* | :services-portainer:&nbsp;[Portainer Agent](../03_Services/Portainer_Agent.md) | `9001` | Agent for Portainer-EE Docker management server *(hosted on [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md))*. |
| *Active* | :services-portracker:&nbsp;[[Portracker]] | `4999` | A self-hosted, real-time port monitoring and discovery tool. | 
| *Active* | :services-spoolman:&nbsp;[[Spoolman]] | `7912` | Manage 3D-printer filament spool inventory. |
| *Active* | :simple-syncthing:&nbsp;[[Syncthing]] | `8384` `22000` `21027` | Open decentralized file synchronization. |
| *Active* | :material-console:&nbsp;[[ttydBridge]] | `2222` | Easily access and use the host terminal in a web. |
| *Active* | :simple-wireguard:&nbsp;[WireGuard](../03_Services/Wireguard_Server.md) | `51820` `51821` | Remote access VPN server. |
| *Active* | :services-youtube-dl:&nbsp;[yt-dlp WebUI](../03_Services/yt-dlp_WebUI.md) | `3033` | A Web UI and RPC server for `yt-dlp`. |

---
## :material-tools: Maintenance & Notes

> [!zima inline end] ZimaOS
> This server runs **ZimaOS**, an "Atomic" *(immutable)* operating system.
>  
> + Do not attempt to use `apt` to install or upgrade system packages. 
> + Do not change NTP settings *(stuck on systemd-timesyncd)*.
>
> :material-package-variant:&nbsp;**Entware:**
> 
> + The [Entware](https://github.com/Entware/Entware) package manager is installed. 
> + Additional packages can be installed to the `/opt/bin` directory with the `opkg` command. 
> + Check the [Entware Wiki](https://github.com/Entware/Entware/wiki) for documentation.

> [!config] Critical Configurations
> :symbols-smb-share:&nbsp;**SMB Multi-Channel:**
> + SMB Multi-channel is enabled via custom edit to `/etc/samba/smb.conf` (or ZimaOS equivalent path).
> + **Constraint:** 
>     + Requires both Ethernet cables to be connected to the 2.5 Gb switch to achieve throughput > 2.5 Gb/s.

> [!change]+ NAS Protocol Change (SMB :material-arrow-right-thin: NFS)
> :material-calendar:&nbsp;**Date:** 2026-02-09 <br>
> :material-help-circle-outline:&nbsp;**Reason:** SMB latency caused slow transfers for small files. *(e.g., photos / code)* <br>
> :symbols-monitor-heart:&nbsp;**Performance:** Reduced backup time from ~10m to ~1.5m. <br>
> :material-devices:&nbsp;**Affected Clients:** 
> 
> + [[Ben's_Desktop|Ben's Desktop]] 
> + [[Ben's_Laptop|Ben's Laptop]]
> 
>
> ---
> 
> :services-zimaos:&nbsp;**Server Side *(ZimaOS)*:**
> 
> + Config File: `etc/exports`
> + Exports Entry:
> 
>     ```ini title="/etc/exports" linenums="1"
>     /media/Quick-Storage *(rw,sync,no_subtree_check)  
>     /media/nvme0n1p1 *(rw,sync,no_subtree_check)
>     ```
>     
> + Command to apply:
> 
>     ```bash linenums="1"
>     exportfs -ra
>     ```
>     
>     **or**
>     
>     ```bash linenums="1"
>     systemctl restart nfs-server
>     ```
>     
> :material-fedora:&nbsp;**Client Side *(Fedora 43)*:**
> 
> + Package required: `nfs-utils`
> + Systemd `.mount` unit files: `/etc/systemd/system`
> 
>     ```systemd title="mnt-storage_server-Quick_Storage.mount" linenums="1"
>     [Unit]  
>     Description=Mount ZimaOS Quick-Storage via NFS  
>     After=network-online.target  
>     Wants=network-online.target  
>     
>     [Mount]  
>     # The remote share  
>     What=192.168.50.4:/media/Quick-Storage  
>     # The local path  
>     Where=/mnt/storage_server/Quick_Storage  
>     Type=nfs  
>     # Standard NFS options for performance  
>     Options=defaults,noatime,nodiratime,rsize=1048576,wsize=1048576,timeo=14,soft  
>     
>     [Install]  
>     WantedBy=multi-user.target
>     ```
>     
>     ```systemd title="mnt-storage_server-NVMe.mount" linenums="1"
>     [Unit]  
>     Description=Mount ZimaOS Quick-Storage  
>     After=network-online.target  
>     Wants=network-online.target  
>     
>     [Mount]  
>     # The remote share  
>     What=192.168.50.4:/media/nvme0n1p1  
>     # The local path  
>     Where=/mnt/storage_server/NVMe  
>     Type=nfs  
>     # Standard NFS options for performance  
>     Options=defaults,noatime,nodiratime,rsize=1048576,wsize=1048576,timeo=14,soft  
>     
>     [Install]  
>     WantedBy=multi-user.target
>     ```
>     
> + Systemd `.automount` unit files: `/etc/systemd/system`
> 
>     ```systemd title="mnt-storage_server-Quick_Storage.automount" linenums="1"
>     [Unit]  
>     Description=Automount for ZimaOS NAS Quick-Storage  
>     
>     [Automount]  
>     Where=/mnt/storage_server/Quick_Storage  
>     # Unmount if idle for 10 minutes (optional, saves resources)  
>     TimeoutIdleSec=600  
>     
>     [Install]  
>     WantedBy=multi-user.target
>     ```
>     
>     ```systemd title="mnt-storage_server-NVMe.automount" linenums="1"
>     [Unit]  
>     Description=Automount for ZimaOS NVMe drive  
>     
>     [Automount]  
>     Where=/mnt/storage_server/NVMe  
>     # Unmount if idle for 10 minutes (optional, saves resources)  
>     TimeoutIdleSec=600  
>     
>     [Install]  
>     WantedBy=multi-user.target
>     ```
>     
> + Systemd daemon reload command:
> 
>     ```bash linenums="1"
>     sudo systemd daemon-reload
>     ```

