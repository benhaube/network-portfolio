---
tags:
  - hardware
  - server
  - dns
  - infrastructure
  - docker_host
  - network
  - office
  - printer-cart
hide:
  - toc
---
![[raspberry-pi.svg|200]]

# [[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]
[Raspberry Pi Docs :simple-raspberrypi:](https://www.raspberrypi.com/documentation){ .md-button .md-button--primary }&emsp;[Debian Docs :material-file-document-multiple:](https://www.debian.org/doc/){ .md-button }

---
## :material-information-outline: Device Overview

* **Role:** Secondary DNS server *(Technitium Cluster)*, CUPS print server, Home Assistant server
* **Hostname(s):** `pi-server`
* **Location:** 
    * Office
    * Printer-Cart
* **OS / Firmware:** &nbsp;:material-debian:&nbsp;[Debian Linux 13](https://www.debian.org/) *(Trixie)*
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com) SSH key: "admin@pi-server"

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| eth0 | `192.168.50.2` | `E4:5F:01:A4:60:07` | :material-ethernet:&nbsp;[TP-Link Switch](../02_Hardware/TP-Link_Switch.md) *(Port 3)* |
| wlan0 | `DHCP` | `E4:5F:01:A4:60:07` | :material-wifi:&nbsp;2G_IoT *(vlan53)* |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--: | :---------- | :---------- | :------ |
| :material-security:&nbsp;vlan50 | `pi-server.internal` | `127.0.0.1` | `192.168.50.1` |
| :material-home-automation:&nbsp;vlan53 | - | `9.9.9.9`, `149.112.112.112` | `192.168.53.1` |

## :material-folder-open: Storage & Mounts

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
| *Active* | :material-printer:&nbsp;[CUPS Print Server](../03_Services/CUPS_Print_Server.md) | `631` | Print server for `Brother_HL-L2300D_series` laser printer. |
| *Active* | :material-console-network:&nbsp;[SSH](../03_Services/SSH.md) | `22` | Remote terminal access. |
| *Active* | :simple-syncthing:&nbsp;[[Syncthing]] | `8384` `22000` `21027` | Open decentralized file synchronization. |
| *Active* | :services-technitium:&nbsp;[[Technitium]] | `53` `443` `5380` | An open source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security. | 

#### :material-docker: Docker:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :services-beszel:&nbsp;[Beszel Agent](../03_Services/Beszel_Agent.md) | `45876` | Agent for Beszel Hub *(hosted on [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md))*. |
| *Active* | :services-beszel:&nbsp;[Beszel Hub](../03_Services/Beszel_Hub.md) | `8090` | Lightweight server monitoring hub with historical data, docker stats, and alerts. |
| *Active* | :services-dockge:&nbsp;[[Dockge]] | `5001` | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager. |
| *Active* | :simple-f1:&nbsp;[F1 API](../03_Services/Glance.md) | `4463` | Part of the [[Glance]] stack. Supplies Formula 1 data for widgets on Glance dashboard. |
| *Active* | :services-glance:&nbsp;[[Glance]] | `8580` | A server home-page/dashboard. |
| *Active* | :services-glances:&nbsp;[[Glances]] | `61208` | A top/htop alternative. |
| *Active* | :simple-homeassistant:&nbsp;[Home Assistant](../03_Services/Home_Assistant.md) | `8123` | Smart home management dashboard. |
| *Active* | :services-it-tools:&nbsp;[[IT-Tools]] | `8080` | Collection of handy online tools for developers, with great UX. |
| *Inactive* | :services-portainer:&nbsp;[[Portainer]] | `8000` `9000` `9443` | Docker container management. |
| *Active* | :services-portracker:&nbsp;[[Portracker]] | `4999` | A self-hosted, real-time port monitoring and discovery tool. | 
| *Active* | :services-uptime-kuma:&nbsp;[Uptime Kuma](../03_Services/Uptime_Kuma.md) | `3001` | A fancy self-hosted monitoring tool. |
 
---
## :material-tools: Maintenance & Notes

> [!important inline] Critical Configurations
> #### :material-web-clock: Chrony:
> * Do not modify NTP settings or enable `systemd-timesyncd`. It has been replaced with `chrony`.
> 
> #### :material-text-long: Logs:
> * Logs are configured with `log2ram` to reduce wear on the MicroSD card.
> 
> #### :material-email-alert: Email Notifications:
> * This server has email notifications configured for new SSH sessions and `unattended-upgrades`. See [SSH Login Email Notification](../Linux_Tutorials/Setup_SSH_Login_Email_Notification.md) for documentation.

#### :material-update: Update Process:

* `#!bash apt update && apt upgrade` *(Standard Debian)*
* `unattended-upgrades` enabled for critical bug and security fixes.

#### :material-cloud-upload-outline: Backup Policy:

* Image of MicroSD card stored on [[ZimaBoard_2_NAS|ZimaBoard 2 NAS]] `/media/Quick-Storage/Backup` directory.
