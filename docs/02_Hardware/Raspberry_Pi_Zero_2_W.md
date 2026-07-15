---
icon: symbols/server
title: Pi Zero 2W Server
subtitle: Reverse-Proxy Server
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
![Lucide `server` icon](../assets/icons/server.svg){ width=200 }

# Pi Zero 2W Server
*Reverse-Proxy Server*

[Raspberry Pi Docs&ensp;:brands-raspberry-pi:](https://www.raspberrypi.com/documentation){ .md-button .md-button--primary }&emsp;[Debian Docs&ensp;:symbols-debian:](https://www.debian.org/doc/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role 

:    A tiny, low-power server acting as a dedicated as Caddy reverse-proxy, giving unique `.internal` FQDNs to services hosted on the local network. Located on the stationary printer cart in the office upstairs, and connected to the local network via 2.4 GHz Wi-Fi (SSID: `Home`).

#### :symbols-host:&ensp;Hostname

:    `pi-zero`

#### :symbols-map-pin:&ensp;Location

:    Office&ensp;:symbols-move-right:&ensp;Printer-Cart

#### :symbols-cpu:&ensp;OS / Firmware

:    [:symbols-debian:&nbsp;Debian Linux 13](https://www.debian.org/) *(Trixie)*

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com) 
    
      + SSH Keys&ensp;:symbols-move-right:&ensp;"pi-zero (admin)"

## :symbols-square-activity:&ensp;Core Specs

| CPU                                  | Cores / Threads        | CPU Freq. | RAM          | GPU          | GPU Freq. | VRAM     |
| :----------------------------------- | :--------------------- | :-------- | :----------- | :----------- | :-------- | :------- |
| :brands-arm:&nbsp;BCM2837 *(Armv-8)* | 4C / 4T *(Cortex-A53)* | 1.2 GHz   | 512 MB SDRAM | VideoCore IV | 400 MHz   | *Shared* |

## :symbols-lan:&ensp;Network Configuration

| Interface | IP Address     | MAC Address         | Connected To                                                                 |
| :-------: | :------------- | :------------------ | :--------------------------------------------------------------------------- |
|  `wlan0`  | `192.168.50.3` | `2c:cf:67:db:f5:e2` | [:symbols-wifi-cog:&nbsp;Home](./ASUS_RT-BE92U.md#wi-fi-networks) *(VLAN50)* |

| Interface |               VLAN                   | FQDN               | DNS Servers                   | Gateway        |
| :-------: | :----------------------------------: | :----------------- | :---------------------------- | :------------- |
|  `wlan0`  | :symbols-shield-quarter:&nbsp;VLAN50 | `pi-zero.internal` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :symbols-folders:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point      | Drive Type | Drive Capacity | Device Path      | File System | Encryption |
| :--------------- | :--------- | :------------- | :--------------- | :---------- | :--------- |
| `/`              | MicroSD    | 29 GB          | `/dev/mmcblk0p2` | `ext4`      | -          |
| `/boot/firmware` | MicroSD    | 512 MB         | `/dev/mmcblk0p1` | `vfat`      | -          |
| `/var/log`       | RAM        | 80 MB          | `log2ram`        | `tmpfs`     | -          |

## :symbols-monitor-cloud:&ensp;Services / Docker Containers

#### :symbols-penguin:&ensp;Native Linux

|  Status  | Service                                                            |        Port(s)         | Role / Notes                                                                                                                          |
| :------: | :----------------------------------------------------------------- | :--------------------: | :------------------------------------------------------------------------------------------------------------------------------------ |
| *Active* | [:services-caddy:&nbsp;Caddy](../03_Services/Caddy.md)             |       `80` `443`       | Lightweight, open-source Web server written in Go. Used as a *reverse-proxy* for creating unique domains for locally hosted services. |
| *Active* | [:symbols-terminal-alt:&nbsp;SSH](../03_Services/SSH.md)           |          `22`          | Provides secure encrypted communications between two untrusted hosts over an insecure network.                                        |
| *Active* | [:services-syncthing:&nbsp;Syncthing](../03_Services/Syncthing.md) | `8384` `22000` `21027` | Open decentralized file synchronization.                                                                                              |

#### :symbols-container:&ensp;Docker Container

|   Status   | Service                                                            | Port(s) | Role / Notes                                                                                 |
| :--------: | :----------------------------------------------------------------- | :-----: | :------------------------------------------------------------------------------------------- |
|  *Active*  | [:services-beszel:&nbsp;Beszel](../03_Services/Beszel_Hub.md)      | `45876` | Agent for Beszel Hub *(hosted on [Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md))*. |
|  *Active*  | [:services-dockge:&nbsp;Dockge](../03_Services/Dockge.md)          | `5001`  | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.  |
| *Inactive* | [:services-portainer:&nbsp;Portainer](../03_Services/Portainer.md) | `9001`  | A lightweight service delivery platform for containerized applications.                      |

---
## :symbols-sticky-notes:&ensp;Maintenance & Notes

--8<-- "maintenance-raspi.md"
