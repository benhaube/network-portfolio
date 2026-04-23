---
icon: material/raspberry-pi
tags:
  - Hardware
  - Server
  - DNS
  - Infrastructure
  - Docker Host
  - Network
  - Office
  - Printer Cart
  - Linux
hide:
  - toc
---
![Material Design raspberry-pi icon](../assets/icons/raspberry-pi.svg){ width=200 }&nbsp;
![Raspberry Pi Icon](../assets/icons/raspberry-pi-light.svg#only-light){ width=50 }
![Raspberry Pi Icon](../assets/icons/raspberry-pi-dark.svg#only-dark){ width=50 }
&nbsp;![Arm Logo](../assets/icons/arm.svg){ width=50 }

# Raspberry Pi 4B Server
[Raspberry Pi Docs :simple-raspberrypi:](https://www.raspberrypi.com/documentation){ .md-button .md-button--primary }&emsp;[Debian Docs :material-debian:](https://www.debian.org/doc/){ .md-button }

---
## :material-information-outline: Device Overview

#### :material-toolbox: Role: 
* Secondary DNS server *(Technitium Cluster)*, CUPS print server, Home Assistant server

#### :symbols-host: Hostname(s):
* `pi-server`

#### :material-map-marker-outline: Location:  
* Office
* Printer-Cart

#### :material-memory: OS / Firmware: 
* [:material-debian:&nbsp;Debian Linux 13](https://www.debian.org/) *(Trixie)*

#### :material-key-chain: Credentials:
* [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com) SSH key: "admin@pi-server"

#### :symbols-monitor-heart: Core Specs:

| CPU | Cores / Threads | CPU Freq. | RAM | GPU | GPU Freq. | VRAM |
| :-- | :-------------- | :-------- | :-- | :-- | :-------- | :--- |
| :simple-arm:&nbsp;BCM2711 *(Armv8-A)* | 4C / 4T *(Cortex-A72)* | 1.5 GHz | 4 GB LPDDR4 *(2400 MT/s)* | VideoCore VI 3D | 500 MHz | *Shared* |

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| eth0 | `192.168.50.2` | `E4:5F:01:A4:60:07` | :material-switch:&nbsp;[TP-Link Switch](../02_Hardware/TP-Link_Switch.md) *(Port 3)* |
| wlan0 | `DHCP` | `E4:5F:01:A4:60:07` | :symbols-shield-house-fill:&nbsp;2G_IoT *(vlan53)* |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--: | :---------- | :---------- | :------ |
| :material-security:&nbsp;vlan50 | `pi-server.internal` | `127.0.0.1` | `192.168.50.1` |
| :symbols-shield-house-fill:&nbsp;vlan53 | - | `9.9.9.9`, `149.112.112.112` | `192.168.53.1` |

## :symbols-storage: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/` | MicroSD | 117 GB | `/dev/mmcblk0p2` | `ext4` | - |
| `/boot/firmware` | MicroSD | 512 MB | `/dev/mmcblk0p1` | `vfat` | - |
| `/var/log` | RAM | 128 MB | `log2ram` | `tmpfs` | - |

#### :material-usb: External/Attached:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/mnt/usb-drive` | USB Flash Drive | 28.7 GB | `/dev/sda1` | `ext4` | - |

## :material-web: Services / Docker Containers

#### :material-linux: Native Linux:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :material-printer:&nbsp;[CUPS](../03_Services/CUPS_Print_Server.md) | `631` | Print server for `Brother_HL-L2300D_series` laser printer. |
| *Active* | :material-console-network:&nbsp;[SSH](../03_Services/SSH.md) | `22` | Remote terminal access. |
| *Active* | :simple-syncthing:&nbsp;[[Syncthing]] | `8384` `22000` `21027` | Open decentralized file synchronization. |
| *Active* | :services-technitium:&nbsp;[[Technitium]] | `53` `443` `5380` | An open source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security. | 

#### :material-docker: Docker:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :services-beszel:&nbsp;[Beszel (Hub & Agent)](../03_Services/Beszel_Hub.md) | `8090` `45876` | A lightweight server monitoring hub with historical data, docker stats, and alerts. |
| *Active* | :services-dockge:&nbsp;[[Dockge]] | `5001` | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager. |
| *Active* | :simple-f1:&nbsp;[F1 API](../03_Services/Glance.md) | `4463` | Part of the [[Glance]] stack. Supplies Formula 1 data for widgets on Glance dashboard. |
| *Active* | :services-glance:&nbsp;[[Glance]] | `8580` | A server home-page/dashboard. |
| *Active* | :services-glances:&nbsp;[[Glances]] | `61208` | A top/htop alternative. |
| *Active* | :simple-homeassistant:&nbsp;[Home Assistant](../03_Services/Home_Assistant.md) | `8123` | Smart home management dashboard. |
| *Active* | :services-it-tools:&nbsp;[[IT-Tools]] | `8080` | Collection of handy online tools for developers, with great UX. |
| *Inactive* | :services-portainer:&nbsp;[Portainer-EE](../03_Services/Portainer.md) | `8000` `9000` `9443` | A Docker container management platform. |
| *Active* | :services-portracker:&nbsp;[[Portracker]] | `4999` | A self-hosted, real-time port monitoring and discovery tool. | 
| *Active* | :services-uptime-kuma:&nbsp;[Uptime Kuma](../03_Services/Uptime_Kuma.md) | `3001` | A fancy self-hosted monitoring tool. |
 
---
## :material-tools: Maintenance & Notes

> [!config inline] Critical Configurations
> **:material-web-clock: Chrony:**
> * Do not modify NTP settings or enable `systemd-timesyncd`. It has been replaced with `chrony`.
> 
> **:material-text-long: Logs:**
> * Logs are configured with `log2ram` to reduce wear on the MicroSD card.
> 
> **:material-email-alert: Email Notifications:**
> * This server has email notifications configured for new SSH sessions and `unattended-upgrades`. See [SSH Login Email Notification](../Linux_Tutorials/Setup_SSH_Login_Email_Notification.md) for documentation.

#### :material-update: Update Process:

* `#!bash apt update && apt upgrade` *(Standard Debian)*
* `unattended-upgrades` enabled for critical bug and security fixes.

#### :material-cloud-upload-outline: Backup Policy:

* Image of MicroSD card stored on [[ZimaBoard_2_NAS|ZimaOS NAS]] `/media/Quick-Storage/Backup` directory.
