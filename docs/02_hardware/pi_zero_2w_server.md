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

[Raspberry Pi Docs&ensp;:brands-raspberry-pi:](https://www.raspberrypi.com/documentation){ .md-button .md-button--primary }&emsp;[Debian Docs&ensp;:brands-debian:](https://www.debian.org/doc/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role 

:    A tiny, low-power server acting as a dedicated as Caddy reverse-proxy, giving unique `.internal` FQDNs to services hosted on the local network. Located on the stationary printer cart in the office upstairs, and connected to the local network via 2.4 GHz Wi-Fi (SSID: `Home`).

#### :symbols-host:&ensp;Hostname

:    `pi-zero`

#### :symbols-map-pin:&ensp;Location

:    Office&ensp;:symbols-move-right:&ensp;Printer-Cart

#### :symbols-cpu:&ensp;OS / Firmware

:    [:brands-debian:&ensp;Debian Linux 13](https://www.debian.org/){ external-link } *(Trixie)*

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link } 
    
      + SSH Keys&ensp;:symbols-move-right:&ensp;"pi-zero (admin)"

## :symbols-circuit-board:&ensp;Core Specs

| CPU                                  | Cores / Threads        | CPU Freq. | RAM          | GPU          | GPU Freq. | VRAM     |
| :----------------------------------- | :--------------------- | :-------- | :----------- | :----------- | :-------- | :------- |
| :brands-arm:&nbsp;BCM2837 *(Armv-8)* | 4C / 4T *(Cortex-A53)* | 1.2 GHz   | 512 MB SDRAM | VideoCore IV | 400 MHz   | *Shared* |

## :symbols-network:&ensp;Network Configuration

| Interface | IP Address {data-sort-method='dotsep'} | MAC Address         | Connected To                                                                               |
| :-------: | :------------------------------------- | :------------------ | :----------------------------------------------------------------------------------------- |
|  `wlan0`  | `192.168.50.3`                         | `2c:cf:67:db:f5:e2` | [:symbols-wifi-cog:&nbsp;Home](asus_rt-be92u.md#wi-fi-networks){ data-preview } *(VLAN50)* |

| Interface |               VLAN                   | FQDN               | DNS Servers {data-sort-method='none'} | Gateway {data-sort-method='dotsep'} |
| :-------: | :----------------------------------: | :----------------- | :------------------------------------ | :---------------------------------- |
|  `wlan0`  | :symbols-shield-quarter:&nbsp;VLAN50 | `pi-zero.internal` | `192.168.50.6` `192.168.50.2`         | `192.168.50.1`                      |

## :symbols-folder-tree:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point      | Drive Type | Drive Capacity {data-sort-method='filesize'} | Device Path      | File System | Encryption |
| :--------------- | :--------- | :------------------------------------------- | :--------------- | :---------- | :--------- |
| `/`              | MicroSD    | 29 GB                                        | `/dev/mmcblk0p2` | `ext4`      | -          |
| `/boot/firmware` | MicroSD    | 512 MB                                       | `/dev/mmcblk0p1` | `vfat`      | -          |
| `/var/log`       | RAM        | 80 MB                                        | `log2ram`        | `tmpfs`     | -          |

## :symbols-monitor-cloud:&ensp;Services & Containers

#### :symbols-tux:&ensp;Native Linux

|  Status  | Service                                                                | Port(s) {data-sort-method='number'} | Role / Notes {data-sort-method='none'}                                                                                                |
| :------: | :--------------------------------------------------------------------- | :---------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------ |
| *Active* | [:services-caddy:&nbsp;Caddy](../03_services/caddy.md)                 |            `80`<br>`443`            | Lightweight, open-source Web server written in Go. Used as a *reverse-proxy* for creating unique domains for locally hosted services. |
| *Active* | [:symbols-terminal-alt:&nbsp;SSH](../03_services/ssh.md)               |                `22`                 | Provides secure encrypted communications between two untrusted hosts over an insecure network.                                        |
| *Active* | [:services-syncthing-alt:&nbsp;Syncthing](../03_services/syncthing.md) |     `8384`<br>`22000`<br>`21027`    | Open decentralized file synchronization.                                                                                              |

#### :symbols-container:&ensp;Docker Container

|   Status   | Service                                                            | Port(s) {data-sort-method='number'} | Role / Notes {data-sort-method='none'}                                                               |
| :--------: | :----------------------------------------------------------------- | :---------------------------------: | :--------------------------------------------------------------------------------------------------- |
|  *Active*  | [:services-beszel:&nbsp;Beszel](../03_services/beszel.md)          |               `45876`               | Agent for Beszel Hub *(hosted on [Pi 4B Server](pi_4b_server.md#docker-container){ data-preview })*. |
|  *Active*  | [:services-dockge:&nbsp;Dockge](../03_services/dockge.md)          |                `5001`               | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.          |
| *Inactive* | [:services-portainer:&nbsp;Portainer](../03_services/portainer.md) |                `9001`               | A lightweight service delivery platform for containerized applications.                              |

---
## :symbols-sticky-notes:&ensp;Maintenance & Notes

--8<-- "maintenance-raspi.md"
