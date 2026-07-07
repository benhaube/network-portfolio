---
icon: symbols/ip-outline
title: IP Address Management
subtitle: Organized IP Address Space
tags:
  - Network
  - Hardware
  - VLAN
  - VPN
  - Remote Access
  - Hardware
  - DNS
  - Server
  - Router
  - Desktop
  - PC
  - 3D-Printer
hide:
  - toc
---
![Material Design ip-network icon](../assets/icons/ip-network.svg){ width=200 }

# IP Address Management
*Organized IP Address Space*

!!! question "FAQ"

    **What is IPAM?**
    :    **IP Address Management** is a systematic approach to planning, tracking, and managing IP address space and associated services like DNS and DHCP within a network.

---
## :symbols-lan-outline:&ensp;Virtual Local Networks

| VLAN                                                             | SSID                                                           | CIDR              | DNS Servers                   | Domain   |   WAN Access    | Role / Notes                                 |
| :--------------------------------------------------------------- | :------------------------------------------------------------- | :---------------- | :---------------------------- | :------- | :-------------: | :------------------------------------------- |
| [VLAN50](../02_Hardware/ASUS_RT-BE92U.md#virtual-local-networks) | [*Home*](../02_Hardware/ASUS_RT-BE92U.md#wi-fi-networks)       | `192.168.50.0/24` | `192.168.50.6` `192.168.50.2` | internal | :symbols-check: | :symbols-security:&nbsp;Trusted VLAN         |
| [VLAN52](../02_Hardware/ASUS_RT-BE92U.md#virtual-local-networks) | [*Home_Guest*](../02_Hardware/ASUS_RT-BE92U.md#wi-fi-networks) | `192.168.52.0/24` | `9.9.9.9` `149.112.112.112`   | -        | :symbols-check: | :symbols-shield-person-fill:&nbsp;Guest VLAN |
| [VLAN53](../02_Hardware/ASUS_RT-BE92U.md#virtual-local-networks) | [*2G_IoT*](../02_Hardware/ASUS_RT-BE92U.md#wi-fi-networks)     | `192.168.53.0/24` | `9.9.9.9` `149.122.122.122`   | -        |   :symbols-x:   | :symbols-shield-house-fill:&nbsp;IoT VLAN    |

## :symbols-router-outline:&ensp;Core Infrastructure 
&emsp;&emsp;&ensp;*Static & Reserved*

| Device                                                                                     | VLAN   | IP Address       | Hostname        | Type   | Role / Notes                                                                                                              |
| :----------------------------------------------------------------------------------------- | :----- | :--------------- | :-------------- | :----- | :------------------------------------------------------------------------------------------------------------------------ |
| [:symbols-router-outline:&nbsp;ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md)             | -      | `192.168.50.1`   | `RT-BE92U-FAF0` | Static | Main Gateway, NTP Master, DHCP Server                                                                                     |
| [:symbols-server-outline:&nbsp;Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)     | VLAN50 | `192.168.50.2`   | `pi-server`     | Static | DNS Secondary *([Technitium](../03_Services/Technitium.md) cluster)*, [CUPS](../03_Services/CUPS_Print_Server.md)         |
| [:symbols-server-outline:&nbsp;Pi Zero 2W Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | VLAN50 | `192.168.50.3`   | `pi-zero`       | Static | Caddy reverse proxy server for local domain names                                                                         |
| [:symbols-nas-outline:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                 | VLAN50 | `192.168.50.4`   | `ZimaOS-NAS`    | Static | Main File Server, Primary Ethernet connection *(eth0)*                                                                    |
| [:symbols-nas-outline:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                 | VLAN50 | `192.168.50.5`   | `ZimaOS-NAS`    | Static | SMB Multi-channel Path, Secondary Ethernet Connection *(eth1)*                                                            |
| [:symbols-server-outline:&nbsp;Debian Server](../02_Hardware/Debian_Server_VM.md)          | VLAN50 | `192.168.50.6`   | `debian-vm`     | Static | DNS Primary *([Technitium](../03_Services/Technitium.md) cluster)*, VM on [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) |
| [:symbols-router-outline:&nbsp;ASUS RT-AX55](../02_Hardware/ASUS_RT-AX55.md)               | VLAN50 | `192.168.50.221` | `RT-AX55-1360`  | Static | AiMesh Node *(Backhaul)*                                                                                                  |
| [:symbols-web:&nbsp;Hitron Modem](../02_Hardware/Hitron_Modem.md)                          | -      | `192.168.100.1`  | `N/A`           | Static | WAN Connection for [ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md)                                                       |

## :symbols-devices:&ensp;Key Clients 
&emsp;&emsp;&ensp;*DHCP Reserved*

| Device                                                                                                 | VLAN   | IP Address      | Hostname           | Role / Notes                                                            |
| :----------------------------------------------------------------------------------------------------- | :----- | :-------------- | :----------------- | :---------------------------------------------------------------------- |
| [:symbols-desktop-pc-outline:&nbsp;Ben's Desktop](../02_Hardware/Ben's_Desktop.md)                     | VLAN50 | `192.168.50.10` | `bens-workstation` | Fedora Linux 44 *(KDE Plasma Desktop Edition)*                          |
| [:symbols-printer-3d-nozzle-outline:&nbsp;Kacey 3D-Printer](../02_Hardware/Kacey_3D-printer.md)        | VLAN50 | `192.168.50.15` | `k1c-a71e`         | Creality K1C *(Modified)*                                               |
| [:symbols-server-outline:&nbsp;Ras-Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) *(`wlan0`)* | VLAN53 | `192.168.53.2`  | `pi-server`        | Bridge to VLAN53 for [Home Assistant](../03_Services/Home_Assistant.md) |

## :symbols-web-ip:&ensp;Dynamic DNS Providers

| Status   | Provider                        | Server                                                                         | FQDN                            | TLS Certificate                        | Certificate Expire |
| :------- | :------------------------------ | :----------------------------------------------------------------------------- | :------------------------------ | :------------------------------------- | :----------------- |
| *Active* | :services-addr:&nbsp;addr.tools | [:symbols-router-outline:&nbsp;ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | <https://rac3r4life.myaddr.dev> | :simple-letsencrypt:&nbsp;Lets Encrypt | 2026-08-23         |

## :symbols-vpn-outline:&ensp;VPN Servers / Clients

#### :simple-wireguard:&ensp;WireGuard @ ASUS Router
&emsp;&ensp;*Main Server*

| Client                             | CIDR          | DNS Servers                   | Endpoint                    |
| :--------------------------------- | :------------ | :---------------------------- | :-------------------------- |
| :symbols-mobile:&nbsp;Ben's-Phone  | `10.6.0.2/32` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:41820 |
| :symbols-laptop:&nbsp;Ben's-Laptop | `10.6.0.3/32` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:41820 |
| :symbols-mobile:&nbsp;Rob's-Phone  | `10.6.0.4/32` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:41820 |
| :symbols-laptop:&nbsp;Rob's-Laptop | `10.6.0.5/32` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:41820 |

#### :simple-wireguard:&ensp;WireGuard @ ZimaOS NAS
&emsp;&ensp;*Backup Server*

| Client                           | CIDR                              | DNS Servers                   | Endpoint                    |
| :------------------------------- | :-------------------------------- | :---------------------------- | :-------------------------- |
| :symbols-laptop:&nbsp;ben-laptop | `10.8.0.2/32` `fd42:42:42::2/128` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:51820 |
| :symbols-mobile:&nbsp;ben-pixel  | `10.8.0.3/32` `fd42:42:42::3/128` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:51820 |
| :symbols-laptop:&nbsp;rob-laptop | `10.8.0.4/32` `fd42:42:42::4/128` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:51820 |
| :symbols-mobile:&nbsp;rob-phone  | `10.8.0.5/32` `fd42:42:42::5/128` | `192.168.50.6` `192.168.50.2` | rac3r4life.myaddr.dev:51820 |

---
<div class="grid cards" markdown>

-   :symbols-ethernet-port-outline:{ .lg .middle }&emsp;**MAC Addresses**

    ---

    [MAC Address Tables](../01_Infrastructure/MAC_Address_Tables.md){ .md-button }

-   :symbols-graph-2:{ .lg .middle }&emsp;**Network Diagrams**

    ---

    [Logical Map](../01_Infrastructure/Logical_Map.md){ .md-button }&emsp;[Physical Map](../01_Infrastructure/Physical_Map.md){ .md-button }

</div>

<div class="grid cards" markdown>

-   :symbols-restore:{ .lg .middle }&emsp;**Disaster Recovery**
    
    ---

    [Disaster Recovery Plan](../01_Infrastructure/Disaster_Recovery_Plan.md){ .md-button }

-   :symbols-policy:{ .lg .middle }&emsp;**Network Security**

    ---

    [Network Security Policy](../01_Infrastructure/Network_Security_Policy.md){ .md-button }

</div>
