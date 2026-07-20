---
icon: symbols/binary
title: IP Address Management
subtitle: Organized IP Address Space
tags:
  - Network
  - VLAN
  - VPN
  - Remote Access
  - DNS
  - Server
  - Router
hide:
  - toc
---
![Lucide `binary` icon](../assets/icons/binary.svg){ width=200 }

# IP Address Management
*Organized IP Address Space*

!!! question "FAQ"

    **What is IPAM?**
    :    **IP Address Management** is a systematic approach to planning, tracking, and managing IP address space and associated services like DNS and DHCP within a network.

---
## :symbols-hub:&ensp;Virtual Local Networks

| VLAN                                                             | SSID                                                           | CIDR              | DNS Servers                   | Domain   |   WAN Access    | Role / Notes                               |
| :--------------------------------------------------------------- | :------------------------------------------------------------- | :---------------- | :---------------------------- | :------- | :-------------: | :----------------------------------------- |
| [VLAN50](../02_hardware/asus_rt-be92u.md#virtual-local-networks) | [*Home*](../02_hardware/asus_rt-be92u.md#wi-fi-networks)       | `192.168.50.0/24` | `192.168.50.6` `192.168.50.2` | internal | :symbols-check: | :symbols-shield-quarter:&nbsp;Trusted VLAN |
| [VLAN52](../02_hardware/asus_rt-be92u.md#virtual-local-networks) | [*Home_Guest*](../02_hardware/asus_rt-be92u.md#wi-fi-networks) | `192.168.52.0/24` | `9.9.9.9` `149.112.112.112`   | -        | :symbols-check: | :symbols-shield-user:&nbsp;Guest VLAN      |
| [VLAN53](../02_hardware/asus_rt-be92u.md#virtual-local-networks) | [*2G_IoT*](../02_hardware/asus_rt-be92u.md#wi-fi-networks)     | `192.168.53.0/24` | `9.9.9.9` `149.122.122.122`   | -        |   :symbols-x:   | :symbols-shield-house:&nbsp;IoT VLAN       |

## :symbols-router:&ensp;Core Infrastructure 
&emsp;&emsp;&ensp;*Static & Reserved*

| Device                                                                          | VLAN   | IP Address       | Hostname        | Type   | Role / Notes                                                                                                         |
| :------------------------------------------------------------------------------ | :----- | :--------------- | :-------------- | :----- | :------------------------------------------------------------------------------------------------------------------- |
| [:symbols-router:&nbsp;ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md)          | -      | `192.168.50.1`   | `RT-BE92U-FAF0` | Static | Main Gateway, NTP Master, DHCP Server                                                                                |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)            | VLAN50 | `192.168.50.2`   | `pi-server`     | Static | DNS Secondary *([Technitium](../03_services/technitium.md) cluster)*, [CUPS](../03_services/cups_print_server.md)    |
| [:symbols-server:&nbsp;Pi Zero 2W Server](../02_hardware/pi_zero_2w_server.md)  | VLAN50 | `192.168.50.3`   | `pi-zero`       | Static | Caddy reverse proxy server for local domain names                                                                    |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)            | VLAN50 | `192.168.50.4`   | `ZimaOS-NAS`    | Static | Main File Server, Primary Ethernet connection *(eth0)*                                                               |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)            | VLAN50 | `192.168.50.5`   | `ZimaOS-NAS`    | Static | SMB Multi-channel Path, Secondary Ethernet Connection *(eth1)*                                                       |
| [:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md)          | VLAN50 | `192.168.50.6`   | `debian-vm`     | Static | DNS Primary *([Technitium](../03_services/technitium.md) cluster)*, VM on [ZimaOS NAS](../02_hardware/zimaos_nas.md) |
| [:symbols-router:&nbsp;ASUS RT-AX55](../02_hardware/asus_rt-ax55.md)            | VLAN50 | `192.168.50.221` | `RT-AX55-1360`  | Static | AiMesh Node *(Backhaul)*                                                                                             |
| [:symbols-settings-ethernet:&nbsp;Hitron Modem](../02_hardware/hitron_modem.md) | -      | `192.168.100.1`  | `N/A`           | Static | WAN Connection for [ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md)                                                  |

## :symbols-monitor-smartphone:&ensp;Key Clients 
&emsp;&emsp;&ensp;*DHCP Reserved*

| Device                                                                                  | VLAN   | IP Address      | Hostname           | Role / Notes                                                            |
| :-------------------------------------------------------------------------------------- | :----- | :-------------- | :----------------- | :---------------------------------------------------------------------- |
| [:symbols-pc-case:&nbsp;Ben's Desktop](../02_hardware/bens_desktop.md)                  | VLAN50 | `192.168.50.10` | `bens-workstation` | Fedora Linux 44 *(KDE Plasma Desktop Edition)*                          |
| [:symbols-printer-3d-nozzle:&nbsp;Kacey 3D-Printer](../02_hardware/kacey_3d-printer.md) | VLAN50 | `192.168.50.15` | `k1c-a71e`         | Creality K1C *(Modified)*                                               |
| [:symbols-server:&nbsp;Ras-Pi 4B Server](../02_hardware/pi_4b_server.md) *(`wlan0`)*    | VLAN53 | `192.168.53.2`  | `pi-server`        | Bridge to VLAN53 for [Home Assistant](../03_services/home_assistant.md) |

## :symbols-globe-ip:&ensp;Dynamic DNS Providers

| Status   | Provider                           | Server                                                                 | FQDN                            | TLS Certificate                         | Certificate Expire |
| :------- | :--------------------------------- | :--------------------------------------------------------------------- | :------------------------------ | :-------------------------------------- | :----------------- |
| *Active* | :symbols-terminal:&nbsp;addr.tools | [:symbols-router:&nbsp;ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md) | <https://rac3r4life.myaddr.dev> | :brands-lets-encrypt:&nbsp;Lets Encrypt | 2026-08-23         |

## :symbols-waypoints:&ensp;VPN Servers / Clients

#### :services-wireguard:&ensp;WireGuard @ ASUS Router
&emsp;&ensp;*Main Server*

| Client                                     | CIDR          | DNS Servers                   | Endpoint                    |
| :----------------------------------------- | :------------ | :---------------------------- | :-------------------------- |
| :symbols-smartphone:&nbsp;Ben's-Phone      | `10.6.0.2/32` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:41820 |
| :symbols-laptop-minimal:&nbsp;Ben's-Laptop | `10.6.0.3/32` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:41820 |
| :symbols-smartphone:&nbsp;Rob's-Phone      | `10.6.0.4/32` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:41820 |
| :symbols-laptop-minimal:&nbsp;Rob's-Laptop | `10.6.0.5/32` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:41820 |

#### :services-wireguard:&ensp;WireGuard @ ZimaOS NAS
&emsp;&ensp;*Backup Server*

| Client                                   | CIDR                              | DNS Servers                   | Endpoint                    |
| :--------------------------------------- | :-------------------------------- | :---------------------------- | :-------------------------- |
| :symbols-laptop-minimal:&nbsp;ben-laptop | `10.8.0.2/32` `fd42:42:42::2/128` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:51820 |
| :symbols-smartphone:&nbsp;ben-pixel      | `10.8.0.3/32` `fd42:42:42::3/128` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:51820 |
| :symbols-laptop-minimal:&nbsp;rob-laptop | `10.8.0.4/32` `fd42:42:42::4/128` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:51820 |
| :symbols-smartphone:&nbsp;rob-phone      | `10.8.0.5/32` `fd42:42:42::5/128` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:51820 |

---
<div class="grid cards" markdown>

-   :symbols-grid-3x3:{ .lg .middle }&emsp;**MAC Addresses**

    ---

    [MAC Address Tables](mac_address_tables.md){ .md-button }

-   :symbols-sitemap:{ .lg .middle }&emsp;**Network Diagrams**

    ---

    [Logical Map](logical_map.md){ .md-button }&emsp;[Physical Map](physical_map.md){ .md-button }

</div>

<div class="grid cards" markdown>

-   :symbols-tornado:{ .lg .middle }&emsp;**Disaster Recovery**
    
    ---

    [Disaster Recovery Plan](disaster_recovery_plan.md){ .md-button }

-   :symbols-firewall:{ .lg .middle }&emsp;**Network Security**

    ---

    [Network Security Policy](network_security_policy.md){ .md-button }

</div>
