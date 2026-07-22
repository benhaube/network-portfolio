---
icon: symbols/server
title: Pi 4B Server
subtitle: Secondary DNS Server
tags:
  - Server
  - DNS
  - Infrastructure
  - Container Host
  - Network
  - Office 
  - Printer Cart
  - Linux
  - Hardware
hide:
  - toc
---
![Lucide 'server' icon](../assets/icons/server.svg){ width=200 }

# Pi 4B Server
*Secondary DNS Server*

[Raspberry Pi Docs&ensp;:brands-raspberry-pi:](https://www.raspberrypi.com/documentation){ .md-button .md-button--primary }&emsp;[Debian Docs&ensp;:symbols-debian:](https://www.debian.org/doc/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role 

:    The secondary DNS server in the [Technitium](../03_services/technitium.md) cluster, a CUPS print server, a Home Assistant server, and host for other [Docker](https://www.docker.com/){ external-link } containers. Located next to the Ai-Mesh node on the stationary printer cart in the office upstairs, and connected to the local network through the [TP-Link Switch](tp-link_switch.md#role){ data-preview }.

#### :symbols-host:&ensp;Hostname

:    `pi-server` *(VLAN50 / `eth0`)*

:    `home-assistant` *(VLAN53 / `wlan0`)*

#### :symbols-map-pin:&ensp;Location  

:    Office&ensp;:symbols-move-right:&ensp;Printer-Cart

#### :symbols-cpu:&ensp;OS / Firmware

:    [:symbols-debian:&nbsp;Debian Linux 13](https://www.debian.org/) *(Trixie)*

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    
      + SSH Keys&ensp;:symbols-move-right:&ensp;"pi-server (admin)"

## :symbols-circuit-board:&ensp;Core Specs

| CPU                                   | Cores / Threads        | CPU Freq. | RAM                       | GPU             | GPU Freq. | VRAM     |
| :------------------------------------ | :--------------------- | :-------- | :------------------------ | :-------------- | :-------- | :------- |
| :brands-arm:&nbsp;BCM2711 *(Armv8-A)* | 4C / 4T *(Cortex-A72)* | 1.5 GHz   | 4 GB LPDDR4 *(2400 MT/s)* | VideoCore VI 3D | 500 MHz   | *Shared* |

## :symbols-lan:&ensp;Network Configuration

| Interface | IP Address     | MAC Address         | Connected To                                                                                                 |
| :-------: | :------------- | :------------------ | :----------------------------------------------------------------------------------------------------------- |
|  `eth0`   | `192.168.50.2` | `E4:5F:01:A4:60:07` | [:symbols-ethernet-port:&nbsp;TP-Link Switch](tp-link_switch.md#port-map){ data-preview } *(port 3, VLAN50)* |
|  `wlan0`  | `192.168.53.2` | `E4:5F:01:A4:60:08` | [:symbols-wifi-cog:&nbsp;2G_IoT](asus_rt-be92u.md#wi-fi-networks){ data-preview } *(VLAN53)*                 |

| Interface |                VLAN                    | FQDN                 | DNS Servers | Gateway        |
| :-------: | :------------------------------------: | :------------------- | :---------- | :------------- |
|  `eth0`   |  :symbols-shield-quarter:&nbsp;VLAN50  | `pi-server.internal` | `127.0.0.1` | `192.168.50.1` |
|  `wlan0`  |   :symbols-shield-house:&nbsp;VLAN53   | `N/A`                | `127.0.0.1` | `192.168.53.1` |

## :symbols-folder-tree:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point      | Drive Type | Drive Capacity | Device Path      | File System | Encryption |
| :--------------- | :--------- | :------------- | :--------------- | :---------- | :--------- |
| `/`              | MicroSD    | 117 GB         | `/dev/mmcblk0p2` | `ext4`      | -          |
| `/boot/firmware` | MicroSD    | 512 MB         | `/dev/mmcblk0p1` | `vfat`      | -          |
| `/var/log`       | RAM        | 128 MB         | `log2ram`        | `tmpfs`     | -          |

#### :symbols-usb:&ensp;External / Attached

| Mount Point      | Drive Type      | Drive Capacity | Device Path | File System | Encryption |
| :--------------- | :-------------- | :------------- | :---------- | :---------- | :--------- |
| `/mnt/usb-drive` | USB Flash Drive | 28.7 GB        | `/dev/sda1` | `ext4`      | -          |

## :symbols-monitor-cloud:&ensp;Services / Docker Containers

#### :symbols-penguin:&ensp;Native Linux

|  Status  | Service                                                                |        Port(s)         | Role / Notes                                                                                    |
| :------: | :--------------------------------------------------------------------- | :--------------------: | :---------------------------------------------------------------------------------------------- |
| *Active* | [:symbols-printer:&nbsp;CUPS](../03_services/cups_print_server.md)     |         `631`          | A standards-based, open-source printing system for Linux and other Unix-like operating systems. |
| *Active* | [:symbols-terminal-alt:&nbsp;SSH](../03_services/ssh.md)               |          `22`          | Provides secure encrypted communications between two untrusted hosts over an insecure network.  |
| *Active* | [:symbols-cloud-sync:&nbsp;SMB](../03_services/smb.md)                 |         `445`          | Remote file system access.                                                                      |
| *Active* | [:services-syncthing-alt:&nbsp;Syncthing](../03_services/syncthing.md) | `8384` `22000` `21027` | Open decentralized file synchronization.                                                        |
| *Active* | [:services-technitium:&nbsp;Technitium](../03_services/technitium.md)  |   `53` `443` `5380`    | An open-source authoritative as well as recursive DNS server.                                   |

#### :symbols-container:&ensp;Docker Container

|   Status   | Service                                                                           |       Port(s)        | Role / Notes                                                                                                                                   |
| :--------: | :-------------------------------------------------------------------------------- | :------------------: | :--------------------------------------------------------------------------------------------------------------------------------------------- |
|  *Active*  | [:services-beszel:&nbsp;Beszel Hub](../03_services/beszel.md)                     |    `8090` `45876`    | A lightweight server monitoring hub with historical data, docker stats, and alerts.                                                            |
|  *Active*  | [:services-cloudflare:&nbsp;Cloudflared](../03_services/cloudflared.md)           |        `N/A`         | Secure reverse-proxy tunnel for hosting private services on the public internet.                                                               |
|  *Active*  | [:services-dockge:&nbsp;Dockge](../03_services/dockge.md)                         |        `5001`        | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.                                                    |
|  *Active*  | [:symbols-api:&nbsp;F1 API](../03_services/glance.md)                             |        `4463`        | Part of the [Glance](../03_services/glance.md#deployment-details){ data-preview } stack. Supplies F1 data for widgets on the Glance dashboard. |
|  *Active*  | [:services-glance:&nbsp;Glance](../03_services/glance.md)                         |        `8580`        | A self-hosted dashboard that puts all your feeds in one place.                                                                                 |
|  *Active*  | [:services-glances:&nbsp;Glances](../03_services/glances.md)                      |       `61208`        | A `top` / `htop` alternative for GNU / Linux, BSD, Mac OS and Windows operating systems.                                                       |
|  *Active*  | [:services-home-assistant:&nbsp;Home Assistant](../03_services/home_assistant.md) |        `8123`        | Open-source home automation that puts local control and privacy first.                                                                         |
|  *Active*  | [:services-it-tools:&nbsp;IT-Tools](../03_services/it-tools.md)                   |        `8080`        | Collection of handy online tools for developers, with great UX.                                                                                |
| *Inactive* | [:services-portainer:&nbsp;Portainer-EE](../03_services/portainer.md)             | `8000` `9000` `9443` | A lightweight service delivery platform for containerized applications.                                                                        |
|  *Active*  | [:services-portracker:&nbsp;Portracker](../03_services/portracker.md)             |        `4999`        | A self-hosted, real-time port monitoring and discovery tool.                                                                                   |
|  *Active*  | [:services-uptime-kuma:&nbsp;Uptime Kuma](../03_services/uptime_kuma.md)          |        `3001`        | A fancy self-hosted monitoring tool.                                                                                                           |
 
---
## :symbols-sticky-notes:&ensp;Maintenance & Notes

--8<-- "maintenance-raspi.md"
