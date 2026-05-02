---
icon: material/ip-network
title: IP Address Management
tags:
  - Infrastructure
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

> [!question] What is IPAM?
> **IP Address Management** is a systematic approach to planning, tracking, and managing IP address space and associated services like DNS and DHCP within a network.

---
## :material-lan: Local Network(s)

| VLAN   | SSID         | Subnet            | Subnet Mask     | Gateway        | DNS Servers                                                                         | Domain   | WAN Access *(default)* | Role / Notes                            |
| :----- | :----------- | :---------------- | :-------------- | :------------- | :---------------------------------------------------------------------------------- | :------- | :--------------------: | :-------------------------------------- |
| VLAN50 | *Home*       | `192.168.50.0/24` | `255.255.255.0` | `192.168.50.1` | `192.168.50.6` `192.168.50.2` *\[[Technitium](../03_Services/Technitium.md) (DoT)]* | internal |    :material-check:    | :material-security:&nbsp;Trusted        |
| VLAN52 | *Home_Guest* | `192.168.52.0/24` | `255.255.255.0` | `192.168.52.1` | `9.9.9.9` `149.112.112.112` *\[[Quad-9](https://quad9.net) (DoT)]*                  | -        |    :material-check:    | :symbols-shield-person-fill:&nbsp;Guest |
| VLAN53 | *2G_IoT*     | `192.168.53.0/24` | `255.255.255.0` | `192.168.53.1` | `9.9.9.9` `149.122.122.122` *\[[Quad-9](https://quad9.net) (DoT)]*                  | -        |    :material-close:    | :symbols-shield-house-fill:&nbsp;IoT    |

## :material-router-wireless: Core Infrastructure *(Static & Reserved)*

| Device Name                                                                                              | VLAN   | IP Address       | Hostname                    | Type     | Role / Notes                                                                                  |
| :------------------------------------------------------------------------------------------------------- | :----- | :--------------- | :-------------------------- | :------- | :-------------------------------------------------------------------------------------------- |
| :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md)                         | -      | `192.168.50.1`   | `asusrouter.internal`       | Static   | Main Gateway, NTP Master, DHCP Server                                                         |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) *(eth0)* | VLAN50 | `192.168.50.2`   | `pi-server.internal`        | Static   | DNS Secondary *([[Technitium]] cluster)*, [CUPS](../03_Services/CUPS_Print_Server.md)         |
| :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md)         | VLAN50 | `192.168.50.3`   | `proxy.pi-zero.internal`    | Static   | Caddy reverse proxy server for local domain names                                             |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) *(eth0)*                             | VLAN50 | `192.168.50.4`   | `storage-server.internal`   | Static   | Main File Server *(eth0)*                                                                     |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) *(eth1)*                             | VLAN50 | `192.168.50.5`   | `storage-server-2.internal` | Static   | SMB Multi-channel Path *(eth1)*                                                               |
| :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md)                            | VLAN50 | `192.168.50.6`   | `debian-vm.internal`        | Reserved | DNS Primary *([[Technitium]] cluster)*, VM on [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) |
| :material-router-wireless:&nbsp;[ASUS RT-AX55](../02_Hardware/ASUS_RT-AX55.md)                           | VLAN50 | `192.168.50.221` | `aimesh-node.internal`      | Reserved | AiMesh Node *(Backhaul)*                                                                      |
| :material-wan:&nbsp;[Hitron Modem](../02_Hardware/Hitron_Modem.md)                                       | -      | `192.168.100.1`  | `hitron-modem.internal`     | Static   | WAN Connection for [ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md)                           |

## :symbols-devices: Key Clients *(DHCP Reserved)*

| Device Name                                                                                                       | VLAN   | IP Address       | Hostname                    | Role / Notes                                             |
| :---------------------------------------------------------------------------------------------------------------- | :----- | :--------------- | :-------------------------- | :------------------------------------------------------- |
| :material-desktop-tower:&nbsp;[Ben's Desktop](../02_Hardware/Ben's_Desktop.md)                                    | VLAN50 | `192.168.50.61`  | `bens-workstation.internal` | Fedora Linux 43 *(KDE Plasma Desktop Edition)*           |
| :material-printer-3d-nozzle:&nbsp;[Kacey *(Creality^&copy;^ K1C)* 3D-Printer](../02_Hardware/Kacey_3D-printer.md) | VLAN50 | `192.168.50.153` | `k1c-a71e.internal`         | Creality K1C *(Modified)*                                |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) *(wlan0)*         | VLAN53 | `DHCP`           | -                           | DHCP, [Home Assistant](../03_Services/Home_Assistant.md) |

## :material-web-refresh: Dynamic DNS Provider(s)

| Status   | Server                                                                           | Provider                 | Domain Name                                | TLS Certificate                        | Certificate Expire |
| :------- | :------------------------------------------------------------------------------- | :----------------------- | :----------------------------------------- | :------------------------------------- | :----------------- |
| *Active* | :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | [ASUS](https://asus.com) | https://remote-access-home-34.asuscomm.com | :simple-letsencrypt:&nbsp;Lets Encrypt | 06-07-2026         |

## :material-vpn: VPN Server(s) / Client(s)

#### :simple-wireguard:&nbsp;WireGuard @ ASUS Router
&emsp;*(the main server)*

| Client                              | IP Address    | DNS Server(s)                 | Endpoint                                 |
| :---------------------------------- | :------------ | :---------------------------- | :--------------------------------------- |
| :symbols-mobile:&nbsp;Ben's-Phone   | `10.6.0.2/32` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:41820 |
| :material-laptop:&nbsp;Ben's-Laptop | `10.6.0.3/32` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:41820 |
| :symbols-mobile:&nbsp;Rob's-Phone   | `10.6.0.4/32` | `10.6.0.1` *\[Quad-9 (DoT)]*  | remote-access-home-34.asuscomm.com:41820 |
| :material-laptop:&nbsp;Rob's-Laptop | `10.6.0.5/32` | `10.6.0.1` *\[Quad-9 (DoT)]*  | remote-access-home-34.asuscomm.com:41820 |

#### :simple-wireguard:&nbsp;WireGuard @ ZimaOS NAS
&emsp;*(the backup server)*

| Client                            | IP Address                        | DNS Server(s)                 | Endpoint                                 |
| :-------------------------------- | :-------------------------------- | :---------------------------- | :--------------------------------------- |
| :material-laptop:&nbsp;ben-laptop | `10.8.0.2/32` `fd42:42:42::2/128` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:51820 |
| :symbols-mobile:&nbsp;ben-pixel   | `10.8.0.3/32` `fd42:42:42::3/128` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:51820 |
| :material-laptop:&nbsp;rob-laptop | `10.8.0.4/32` `fd42:42:42::4/128` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:51820 |
| :symbols-mobile:&nbsp;rob-phone   | `10.8.0.5/32` `fd42:42:42::5/128` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:51820 |

---
<div class="grid cards" markdown>

-   :material-ethernet:{ .lg .middle } **MAC Addresses**

    ---

    [MAC Address Tables](../01_Infrastructure/MAC_Address_Tables.md){ .md-button }

-   :material-sitemap:{ .lg .middle } **Network Diagrams**

    ---

    [Logical Map](../01_Infrastructure/Logical_Map.md){ .md-button }&emsp;[Physical Map](../01_Infrastructure/Physical_Map.md){ .md-button }

</div>

<div class="grid cards" markdown>

-   :material-restore-alert:{ .lg .middle } **Disaster Recovery**
    
    ---

    [Disaster Recovery Plan](../01_Infrastructure/Disaster_Recovery_Plan.md){ .md-button }

-   :material-server-security:{ .lg .middle } **Network Security**

    ---

    [Network Security Policy](../01_Infrastructure/Network_Security_Policy.md){ .md-button }

</div>
