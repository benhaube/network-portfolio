---
icon: symbols/server
title: Pi 4B Server
subtitle: Secondary DNS Server
description: The secondary DNS server in the Technitium cluster, a CUPS print server, a Home Assistant server, and host for other Docker containers.
tags:
  - Container Host
  - DNS
  - Hardware
  - Infrastructure
  - Linux
  - Network
  - Office 
  - Printer Cart
  - Server
hide:
  - toc
---

![Lucide 'server' icon](../assets/icons/server.svg){ width=200 }

# Pi 4B Server

_Secondary DNS Server_

[Raspberry Pi Docs&ensp;:brands-raspberry-pi:](https://www.raspberrypi.com/documentation){ .md-button .md-button--primary }&emsp;[Debian Docs&ensp;:brands-debian:](https://www.debian.org/doc/){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role

:    The secondary DNS server in the [Technitium](../03_services/technitium.md#description){ data-preview } cluster, a CUPS print server, a Home Assistant server, and host for other [Docker](https://www.docker.com/){ external-link } containers. Located next to the Ai-Mesh node on the stationary printer cart in the office upstairs, and connected to the local network through the [TP-Link Switch](tp-link_switch.md#role){ data-preview }.

#### :symbols-host:&ensp;Hostname

-    `pi-server` _(VLAN50 / `eth0`)_
{ .no-bullets }
-    `home-assistant` _(VLAN53 / `wlan0`)_
{ .no-bullets }

#### :symbols-map-pin:&ensp;Location

- <!-- material/tags { include: [Office, Printer Cart] } -->
{ .no-bullets }

#### :symbols-cpu:&ensp;OS / Firmware

:    [:brands-debian:&ensp;Debian Linux 13](https://www.debian.org/){ external-link } _(Trixie)_

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - SSH Keys&ensp;:symbols-move-right:&ensp;"pi-server (admin)"

## :symbols-circuit-board:&ensp;Core Specs

| CPU                                   | Cores / Threads        | CPU Freq. | RAM                       | GPU             | GPU Freq. | VRAM     |
| :------------------------------------ | :--------------------- | :-------- | :------------------------ | :-------------- | :-------- | :------- |
| :brands-arm:&nbsp;BCM2711 _(Armv8-A)_ | 4C / 4T _(Cortex-A72)_ | 1.5 GHz   | 4 GB LPDDR4 _(2400 MT/s)_ | VideoCore VI 3D | 500 MHz   | _Shared_ |

## :symbols-network:&ensp;Network Configuration

| Interface | IP Address { data-sort-method="dotsep" } | MAC Address         | Connected To                                                                                                 |
| :-------: | :--------------------------------------- | :------------------ | :----------------------------------------------------------------------------------------------------------- |
|  `eth0`   | `192.168.50.2`                           | `E4:5F:01:A4:60:07` | [:symbols-ethernet-port:&nbsp;TP-Link Switch](tp-link_switch.md#port-map){ data-preview } _(port 3, VLAN50)_ |
|  `wlan0`  | `192.168.53.2`                           | `E4:5F:01:A4:60:08` | [:symbols-wifi-lock:&nbsp;2G_IoT](asus_rt-be92u.md#wi-fi-networks){ data-preview } _(VLAN53)_                |

| Interface |                VLAN                | FQDN                 | DNS Servers { data-sort-method="dotsep" } | Gateway { data-sort-method="dotsep" } |
| :-------: | :--------------------------------: | :------------------- | :---------------------------------------- | :------------------------------------ |
|  `eth0`   |    :symbols-shield:&nbsp;VLAN50    | `pi-server.internal` | `127.0.0.1`                               | `192.168.50.1`                        |
|  `wlan0`  | :symbols-shield-house:&nbsp;VLAN53 | `N/A`                | `127.0.0.1`                               | `192.168.53.1`                        |

## :symbols-folder-tree:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point      | Drive Type | Drive Capacity { data-sort-method="filesize" } | Device Path      | File System | Encryption |
| :--------------- | :--------- | :--------------------------------------------- | :--------------- | :---------- | :--------- |
| `/`              | MicroSD    | 117 GB                                         | `/dev/mmcblk0p2` | `ext4`      | -          |
| `/boot/firmware` | MicroSD    | 512 MB                                         | `/dev/mmcblk0p1` | `vfat`      | -          |
| `/var/log`       | RAM        | 128 MB                                         | `log2ram`        | `tmpfs`     | -          |

#### :symbols-usb:&ensp;External / Attached

| Mount Point      | Drive Type      | Drive Capacity { data-sort-method="filesize" } | Device Path | File System | Encryption |
| :--------------- | :-------------- | :--------------------------------------------- | :---------- | :---------- | :--------- |
| `/mnt/usb-drive` | USB Flash Drive | 28.7 GB                                        | `/dev/sda1` | `ext4`      | -          |

## :symbols-cloud:&ensp;Services & Containers

#### :symbols-tux:&ensp;Native Linux

|  Status  | Service                                                                | Port(s) { data-sort-method="number" } | Role / Notes { data-sort-method="none" }                                                        |
| :------: | :--------------------------------------------------------------------- | :-----------------------------------: | :---------------------------------------------------------------------------------------------- |
| _Active_ | [:symbols-printer:&nbsp;CUPS](../03_services/cups_print_server.md)     |                 `631`                 | A standards-based, open-source printing system for Linux and other Unix-like operating systems. |
| _Active_ | [:symbols-square-terminal:&nbsp;SSH](../03_services/ssh.md)            |                 `22`                  | Provides secure encrypted communications between two untrusted hosts over an insecure network.  |
| _Active_ | [:symbols-folder-tree:&nbsp;SMB](../03_services/smb.md)                |                 `445`                 | Remote file system access.                                                                      |
| _Active_ | [:services-syncthing-alt:&nbsp;Syncthing](../03_services/syncthing.md) |     `8384`<br>`22000`<br>`21027`      | Open decentralized file synchronization.                                                        |
| _Active_ | [:services-technitium:&nbsp;Technitium](../03_services/technitium.md)  |        `53`<br>`443`<br>`5380`        | An open-source authoritative as well as recursive DNS server.                                   |

#### :symbols-container:&ensp;Docker Container

|   Status   | Service                                                                           | Port(s) { data-sort-method="number" } | Role / Notes { data-sort-method="none" }                                                                                                       |
| :--------: | :-------------------------------------------------------------------------------- | :-----------------------------------: | :--------------------------------------------------------------------------------------------------------------------------------------------- |
|  _Active_  | [:services-beszel:&nbsp;Beszel Hub](../03_services/beszel.md)                     |           `8090`<br>`45876`           | A lightweight server monitoring hub with historical data, docker stats, and alerts.                                                            |
|  _Active_  | [:services-cloudflare:&nbsp;Cloudflared](../03_services/cloudflared.md)           |                 `N/A`                 | Secure reverse-proxy tunnel for hosting private services on the public internet.                                                               |
|  _Active_  | [:services-dockge:&nbsp;Dockge](../03_services/dockge.md)                         |                `5001`                 | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.                                                    |
|  _Active_  | [:symbols-api:&nbsp;F1 API](../03_services/glance.md)                             |                `4463`                 | Part of the [Glance](../03_services/glance.md#deployment-details){ data-preview } stack. Supplies F1 data for widgets on the Glance dashboard. |
|  _Active_  | [:services-glance:&nbsp;Glance](../03_services/glance.md)                         |                `8580`                 | A self-hosted dashboard that puts all your feeds in one place.                                                                                 |
|  _Active_  | [:services-glances:&nbsp;Glances](../03_services/glances.md)                      |                `61208`                | A `top` / `htop` alternative for GNU / Linux, BSD, Mac OS and Windows operating systems.                                                       |
|  _Active_  | [:services-home-assistant:&nbsp;Home Assistant](../03_services/home_assistant.md) |                `8123`                 | Open-source home automation that puts local control and privacy first.                                                                         |
|  _Active_  | [:services-it-tools:&nbsp;IT-Tools](../03_services/it-tools.md)                   |                `8080`                 | Collection of handy online tools for developers, with great UX.                                                                                |
| _Inactive_ | [:services-portainer:&nbsp;Portainer-EE](../03_services/portainer.md)             |      `8000`<br>`9000`<br>`9443`       | A lightweight service delivery platform for containerized applications.                                                                        |
|  _Active_  | [:services-portracker:&nbsp;Portracker](../03_services/portracker.md)             |                `4999`                 | A self-hosted, real-time port monitoring and discovery tool.                                                                                   |
|  _Active_  | [:services-uptime-kuma:&nbsp;Uptime Kuma](../03_services/uptime_kuma.md)          |                `3001`                 | A fancy self-hosted monitoring tool.                                                                                                           |

---

## :symbols-sticky-notes:&ensp;Maintenance & Notes

--8<-- "maintenance-raspi.md"
