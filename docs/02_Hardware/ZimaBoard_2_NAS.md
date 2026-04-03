---
tags:
  - hardware
  - nas
  - server
  - file-share
  - virtual_host
  - docker_host
hide:
  - toc
---
![[zimaos.svg|200]]

# [[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]
[IceWhale Community :services-icewhale:](https://community.zimaspace.com/){ .md-button .md-button--primary }&emsp;[ZimaOS Docs :material-file-document-multiple:](https://www.zimaspace.com/docs/zimaos/){ .md-button }

---
## :material-information-outline: Device Overview

* **Role:** Primary Network Attached Storage & VM Host
* **Hostname(s):** 
  * `storage-server` *(eth0)*
  * `storage-server-2` *(eth1)*
* **Location:** 
    * Living-Room
    * Mini-Rack
* **OS:**&nbsp;:services-zimaos:&nbsp;ZimaOS 1.5.4 *(Immutable)*
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): 
        * "storage-server (Admin)" 
        * "storage-server (bhaube)"  
        * SSH key: "admin@storage-server"

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| eth0 | `192.168.50.4` | `00:E0:4C:5B:9A:96` | [Ugreen Switch](../02_Hardware/Ugreen_Switch.md) *(Port 4)* |
| eth1 | `192.168.50.5` | `00:E0:4C:5B:9A:95` | [Ugreen Switch](../02_Hardware/Ugreen_Switch.md) *(Port 5)* |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--: | :---------- | :---------- | :------ |
| vlan50 | `storage-server.internal` | `192.168.50.6`, `192.168.50.2` | `192.168.50.1` |
| vlan50 | `storage-server-2.internal` | `192.168.50.6`, `192.168.50.2` | `192.168.50.1` |

## :material-folder-open: Storage & Mounts

#### :material-memory: Boot:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/` | eMMC | 64 GB | `/dev/mmcblk0` | `ext4` | - |

#### :material-harddisk: Data:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/media/Quick-Storage` | RAID0, 2 SATA SSDs | 2TB | `/dev/md0` | `btrfs` | - |
| `/media/nvme0n1p1` | NVMe SSD | 250 GB | `/dev/nvme0n1` | `ext4` | - |

## :material-web: Services / Docker Containers

#### :material-folder-network: File Sharing:

* SMB  *(with Multichannel enabled)*
* NFS *(for Linux PCs)*

#### :material-network-pos: Virtualization:

| Status | Operating System | Network Interface | Disk Image | Role / Notes |
| :----: | :--------------- | :---------------- | :--------- | :----------- | 
| *Active* | :material-debian: [Debian Linux 13](../02_Hardware/Debian_Server_VM.md) | Bridged (`eth0`) | `cd175b11.qcow2` | Hosting the network's primary [[Technitium]] DNS server. |

#### :simple-linux: Native Linux:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :material-folder-network: [[NFS]] | `2049` | Remote file system access. |
| *Active* | :material-console-network: [[SSH]] | `22` | Remote terminal access. |
| *Active* | :material-folder-network: [[SMB]] | `445` | Remote file system access. |

#### :material-docker: Docker:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :services-beszel: [Beszel Agent](../03_Services/Beszel_Agent.md) | `45876` | Agent for Beszel Hub *(hosted on [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md))*. |
| *Active* | :services-cloudflare: [[Cloudflared]] | `14333` | Secure reverse-proxy tunnel for hosting private services on the public internet. |
| *Active* | :services-f1-replay-timing: [F1 Replay Timing](../03_Services/F1_Replay_Timing.md) | `3000` `8000` | Visualization of real-time track data and telemetry synced to F1 live and replays. |
| *Active* | :services-glances: [[Glances]] | `61208` | A top/htop alternative. |
| *Active* | :services-homebox: [[Homebox]] | `3100` | An inventory and organization system built for the home user. |
| *Active* | :services-immich: [[Immich]] | `2283` | Photo gallery and backup service. |
| *Active* | :simple-nginx: [Nginx (Network Portfolio)](../03_Services/Nginx.md) | `8080` | The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache. |
| *Inactive* | :material-ethernet: [[ntopng]] | `3000` `5556` | Network traffic probe. |
| *Active* | :simple-obsidian: [Obsidian LiveSync](../03_Services/Obsidian_LiveSync.md) | `5984` | CouchDB database for synchronizing Obsidian Vaults. |
| *Active* | :services-openspeedtest: [[OpenSpeedTest]] | `3004` | HTML5 Network Speed Test Server. |
| *Inactive* | :services-portainer: [Portainer Agent](../03_Services/Portainer_Agent.md) | `9001` | Agent for Portainer-EE Docker management server *(hosted on [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md))*. |
| *Active* | :services-portracker: [[Portracker]] | `4999` | A self-hosted, real-time port monitoring and discovery tool. | 
| *Active* | :services-spoolman: [[Spoolman]] | `7912` | Manage 3D-printer filament spool inventory. |
| *Active* | :simple-syncthing: [[Syncthing]] | `8384` `22000` `21027` | Open decentralized file synchronization. |
| *Active* | :simple-gnubash: [[ttydBridge]] | `2222` | Easily access and use the host terminal in a web. |
| *Active* | :simple-wireguard: [WireGuard](../03_Services/Wireguard_Server.md) | `51820` `51821` | Remote access VPN server. |
| *Active* | :services-youtube-dl: [yt-dlp WebUI](../03_Services/yt-dlp_WebUI.md) | `3033` | A Web UI and RPC server for `yt-dlp`. |

---
## :material-tools: Maintenance & Notes

> [!warning] Immutable OS
> 1. This device runs ZimaOS. Do not attempt to use `apt` to install system packages or change NTP settings (stuck on systemd-timesyncd).
> 2. The [Entware](https://github.com/Entware/Entware) package manager is installed. Additional packages can be installed to the `/opt/bin` directory with the `opkg` command. Check the [Entware Wiki](https://github.com/Entware/Entware/wiki) for documentation.

> [!important] SMB Configuration
> SMB Multi-channel is enabled via custom edit to `/etc/samba/smb.conf` (or ZimaOS equivalent path).
> * **Constraint:** Requires both Ethernet cables to be connected to the 2.5Gb switch to achieve throughput > 2.5Gbps.

> [!attention]+ NAS Protocol Change (SMB --> NFS)
> **Date:** 2026-02-09 <br>
> **Reason:** SMB latency caused slow transfers for small files. *(e.g., photos / code)* <br>
> **Affected Clients:** 
> 
> + [[Ben's_Desktop|Ben's Desktop]] 
> + [[Ben's_Laptop|Ben's Laptop]]
> 
> **Performance:** Reduced backup time from ~10m to ~1.5m.
> 
> #### :services-zimaos: Server Side *(ZimaOS)*:
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
> #### :simple-fedora: Client Side *(Fedora 43)*:
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

---
