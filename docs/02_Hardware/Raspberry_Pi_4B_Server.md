---
icon: symbols/server-outline
title: Pi 4B Server
subtitle: Secondary DNS Server
tags:
  - Server
  - DNS
  - Infrastructure
  - Docker Host
  - Network
  - Office
  - Printer Cart
  - Linux
  - Hardware
hide:
  - toc
---
![Material Design raspberry-pi icon](../assets/icons/raspberry-pi.svg){ width=200 }

# Pi 4B Server
*Secondary DNS Server*

[Raspberry Pi Docs&ensp;:brands-raspberry-pi:](https://www.raspberrypi.com/documentation){ .md-button .md-button--primary }&emsp;[Debian Docs&ensp;:simple-debian:](https://www.debian.org/doc/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox-outline:&ensp;Role 

:    The secondary DNS server in the [Technitium](../03_Services/Technitium.md) cluster, a CUPS print server, a Home Assistant server, and host for other [Docker](https://www.docker.com/) containers. Located next to the Ai-Mesh node on the stationary printer cart in the office upstairs, and connected to the local network through the [TP-Link Switch](./TP-Link_Switch.md).

#### :symbols-host-outline:&ensp;Hostname

+ `pi-server` *(VLAN50 / `eth0`)*
+ `home-assistant` *(VLAN53 / `wlan0`)*

#### :symbols-location-outline:&ensp;Location  

+ Office
+ Printer-Cart

#### :symbols-memory:&ensp;OS / Firmware

+ [:symbols-debian:&nbsp;Debian Linux 13](https://www.debian.org/) *(Trixie)*

#### :symbols-user-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + SSH Keys&ensp;:symbols-arrow-right-thin:&ensp;"pi-server (admin)"

## :symbols-monitor-heart-outline:&ensp;Core Specs

| CPU                                   | Cores / Threads        | CPU Freq. | RAM                       | GPU             | GPU Freq. | VRAM     |
| :------------------------------------ | :--------------------- | :-------- | :------------------------ | :-------------- | :-------- | :------- |
| :simple-arm:&nbsp;BCM2711 *(Armv8-A)* | 4C / 4T *(Cortex-A72)* | 1.5 GHz   | 4 GB LPDDR4 *(2400 MT/s)* | VideoCore VI 3D | 500 MHz   | *Shared* |

## :symbols-lan-outline:&ensp;Network Configuration

| Interface | IP Address     | MAC Address         | Connected To                                                                                               |
| :-------: | :------------- | :------------------ | :--------------------------------------------------------------------------------------------------------- |
|  `eth0`   | `192.168.50.2` | `E4:5F:01:A4:60:07` | [:symbols-ethernet-port-outline:&nbsp;TP-Link Switch](../02_Hardware/TP-Link_Switch.md) *(port 3, VLAN50)* |
|  `wlan0`  | `192.168.53.2` | `E4:5F:01:A4:60:08` | [:symbols-android-wifi-lock:&nbsp;2G_IoT](./ASUS_RT-BE92U.md#wi-fi-networks) *(VLAN53)*                    |

| Interface |                  VLAN                   | FQDN                 | DNS Servers | Gateway        |
| :-------: | :-------------------------------------: | :------------------- | :---------- | :------------- |
|  `eth0`   |     :symbols-security:&nbsp;VLAN50      | `pi-server.internal` | `127.0.0.1` | `192.168.50.1` |
|  `wlan0`  | :symbols-shield-house-fill:&nbsp;VLAN53 | `N/A`                | `127.0.0.1` | `192.168.53.1` |

## :symbols-folder-open-outline:&ensp;Storage & Mounts

#### :symbols-hard-drive-outline:&ensp;Internal Drive(s)

| Mount Point      | Drive Type | Drive Capacity | Device Path      | File System | Encryption |
| :--------------- | :--------- | :------------- | :--------------- | :---------- | :--------- |
| `/`              | MicroSD    | 117 GB         | `/dev/mmcblk0p2` | `ext4`      | -          |
| `/boot/firmware` | MicroSD    | 512 MB         | `/dev/mmcblk0p1` | `vfat`      | -          |
| `/var/log`       | RAM        | 128 MB         | `log2ram`        | `tmpfs`     | -          |

#### :symbols-usb:&ensp;External / Attached

| Mount Point      | Drive Type      | Drive Capacity | Device Path | File System | Encryption |
| :--------------- | :-------------- | :------------- | :---------- | :---------- | :--------- |
| `/mnt/usb-drive` | USB Flash Drive | 28.7 GB        | `/dev/sda1` | `ext4`      | -          |

## :symbols-web:&ensp;Services / Docker Containers

#### :symbols-linux:&ensp;Native Linux

|  Status  | Service                                                                  |        Port(s)         | Role / Notes                                                                                    |
| :------: | :----------------------------------------------------------------------- | :--------------------: | :---------------------------------------------------------------------------------------------- |
| *Active* | [:symbols-print-outline:&nbsp;CUPS](../03_Services/CUPS_Print_Server.md) |         `631`          | A standards-based, open-source printing system for Linux and other Unix-like operating systems. |
| *Active* | [:symbols-terminal-alt:&nbsp;SSH](../03_Services/SSH.md)                 |          `22`          | Provides secure encrypted communications between two untrusted hosts over an insecure network.  |
| *Active* | [:symbols-smb-share-outline:&nbsp;SMB](../03_Services/SMB.md)            |         `445`          | Remote file system access.                                                                      |
| *Active* | [:simple-syncthing:&nbsp;Syncthing](../03_Services/Syncthing.md)         | `8384` `22000` `21027` | Open decentralized file synchronization.                                                        |
| *Active* | [:services-technitium:&nbsp;Technitium](../03_Services/Technitium.md)    |   `53` `443` `5380`    | An open-source authoritative as well as recursive DNS server.                                   |

#### :services-docker:&ensp;Docker

|   Status   | Service                                                                           |       Port(s)        | Role / Notes                                                                                                |
| :--------: | :-------------------------------------------------------------------------------- | :------------------: | :---------------------------------------------------------------------------------------------------------- |
|  *Active*  | [:services-beszel:&nbsp;Beszel Hub](../03_Services/Beszel_Hub.md)                 |    `8090` `45876`    | A lightweight server monitoring hub with historical data, docker stats, and alerts.                         |
|  *Active*  | [:services-cloudflare:&nbsp;Cloudflared](../03_Services/Cloudflared.md)           |        `N/A`         | Secure reverse-proxy tunnel for hosting private services on the public internet.                            |
|  *Active*  | [:services-dockge:&nbsp;Dockge](../03_Services/Dockge.md)                         |        `5001`        | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.                 |
|  *Active*  | [:symbols-api:&nbsp;F1 API](../03_Services/Glance.md)                             |        `4463`        | Part of the [Glance](../03_Services/Glance.md) stack. Supplies F1 data for widgets on the Glance dashboard. |
|  *Active*  | [:services-glance:&nbsp;Glance](../03_Services/Glance.md)                         |        `8580`        | A self-hosted dashboard that puts all your feeds in one place.                                              |
|  *Active*  | [:services-glances:&nbsp;Glances](../03_Services/Glances.md)                      |       `61208`        | A `top` / `htop` alternative for GNU / Linux, BSD, Mac OS and Windows operating systems.                    |
|  *Active*  | [:services-home-assistant:&nbsp;Home Assistant](../03_Services/Home_Assistant.md) |        `8123`        | Open-source home automation that puts local control and privacy first.                                      |
|  *Active*  | [:services-it-tools:&nbsp;IT-Tools](../03_Services/IT-Tools.md)                   |        `8080`        | Collection of handy online tools for developers, with great UX.                                             |
| *Inactive* | [:services-portainer:&nbsp;Portainer-EE](../03_Services/Portainer.md)             | `8000` `9000` `9443` | A lightweight service delivery platform for containerized applications.                                     |
|  *Active*  | [:services-portracker:&nbsp;Portracker](../03_Services/Portracker.md)             |        `4999`        | A self-hosted, real-time port monitoring and discovery tool.                                                |
|  *Active*  | [:services-uptime-kuma:&nbsp;Uptime Kuma](../03_Services/Uptime_Kuma.md)          |        `3001`        | A fancy self-hosted monitoring tool.                                                                        |
 
---
## :symbols-note-stack:&ensp;Maintenance & Notes

--8<-- "maintenance-raspi.md"
