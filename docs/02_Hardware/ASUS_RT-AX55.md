---
icon: symbols/router-outline
title: ASUS RT-AX55
subtitle: AiMesh Node
tags:
  - Network
  - Router
  - Infrastructure
  - Office
  - Printer Cart
  - Hardware
hide:
  - toc
---
![Material Design 'router-wireless' icon](../assets/icons/router-wireless.svg){ width=200 }

# ASUS RT-AX55
*AiMesh Node*

[Asuswrt-Merlin Docs&ensp;:symbols-wizard-hat:](https://github.com/RMerl/asuswrt-merlin.ng/wiki){ .md-button .md-button--primary }&emsp;[Router Settings&ensp;:symbols-settings:](https://asusrouter.internal:8443/Main_Login.asp){ .md-button .md-button--primary }&emsp;[Manual&ensp;:symbols-notebook-text:](../assets/manuals/RT-AX55_Manual.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox-outline:&ensp;Role 

:    A secondary router located on the stationary printer cart in the office upstairs, acting as an "*AiMesh*" node to expand Wi-Fi coverage to the upper levels. All settings and firmware updates are managed through the main router's Web-UI.

#### :symbols-host-outline:&ensp;Hostname

+ `RT-AX55-1360`

#### :symbols-location-outline:&ensp;Location

+ Office
+ Printer-Cart 

#### :symbols-memory:&ensp;OS / Firmware

+ [:symbols-wizard-hat:&nbsp;asuswrt](https://www.asus.com/us/content/asuswrt/) *(3004.386.53329-g73d3919)*

#### :symbols-user-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Asus Router"
    + SSH Keys&ensp;:symbols-arrow-right-thin:&ensp;"ASUS RT-BE91U (Admin)"

## :symbols-lan-outline:&ensp;Network Configuration

#### :symbols-web:&ensp;WAN Connection

| Interface | IP Address       | MAC Address         | Connected To                 |
| :-------: | :--------------- | :------------------ | :--------------------------- |
|   WAN0    | `192.168.50.221` | `7C:10:C9:DF:13:60` | :symbols-wifi:&nbsp;Backhaul |

#### :symbols-graph-5:&ensp;Virtual Local Networks

|              VLAN              | Domain   | DNS Server(s)                 | CIDR              | Gateway        | Broadcast        | DHCP Range      |
| :----------------------------: | :------- | :---------------------------- | :---------------- | :------------- | :--------------- | :-------------- |
| :symbols-security:&nbsp;VLAN50 | internal | `192.168.50.6` `192.168.50.2` | `192.168.50.0/24` | `192.168.50.1` | `192.168.50.255` | `.22` to `.254` |

#### :symbols-android-wifi-lock:&ensp;Wi-Fi Networks

|  SSID  |  VLAN  |   WAN Access    | CIDR              | Frequency      | Notes                                |
| :----: | :----: | :-------------: | :---------------- | :------------- | :----------------------------------- |
| *Home* | VLAN50 | :symbols-check: | `192.168.50.0/24` | 2.4 GHz, 5 GHz | :symbols-security:&nbsp;Trusted VLAN |

#### :symbols-ethernet-port-outline:&ensp;Physical Ethernet Ports

| Port  | Connected Device                                                                        | Color / Type  | Notes                                        |
| :---: | :-------------------------------------------------------------------------------------- | :------------ | :------------------------------------------- |
| WAN 1 | :symbols-ethernet-port-outline:&nbsp;*Empty*                                            | -             | :symbols-wifi:&nbsp;Wi-Fi *(5 GHz)* Backhaul |
| LAN 1 | [:symbols-ethernet-port-outline:&nbsp;TP-Link Switch](../02_Hardware/TP-Link_Switch.md) | Black / Cat6a | 1 Gb/s Uplink                                |
| LAN 2 | :symbols-ethernet-port-outline:&nbsp;*Empty*                                            | -             | -                                            |
| LAN 3 | :symbols-ethernet-port-outline:&nbsp;*Empty*                                            | -             | -                                            |
| LAN 4 | :symbols-ethernet-port-outline:&nbsp;*Empty*                                            | -             | -                                            |

---
## :symbols-note-stack:&ensp;Maintenance & Notes

!!! config inline "Critical Configurations"

    **:symbols-network-node:&ensp;AiMesh Node:**
    :    The AiMesh Node acts like a "dumb" wireless access point. All available settings for the AiMesh node are available through the main router's Web-UI. See [ASUS RT-BE92U](ASUS_RT-BE92U.md).

#### :symbols-update:&ensp;Update Process

+ Automatic firmware updates are enabled. The firmware version and status is available through the main router's Web-UI.  

#### :symbols-backup:&ensp;Backup Policy

+ No backup is needed for AiMesh node. 
