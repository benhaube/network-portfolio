---
icon: symbols/router
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
![Lucide 'router' icon](../assets/icons/router.svg){ width=200 }

# ASUS RT-AX55
*AiMesh Node*

[Asuswrt-Merlin Docs&ensp;:symbols-wizard-hat:](https://github.com/RMerl/asuswrt-merlin.ng/wiki){ .md-button .md-button--primary }&emsp;[Router Settings&ensp;:symbols-settings:](https://asusrouter.internal:8443/Main_Login.asp){ .md-button .md-button--primary }&emsp;[Manual&ensp;:symbols-notebook-text:](../assets/manuals/RT-AX55_Manual.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role 

:    A secondary router located on the stationary printer cart in the office upstairs, acting as an "*AiMesh*" node to expand Wi-Fi coverage to the upper levels. All settings and firmware updates are managed through the main router's Web-UI.

#### :symbols-host:&ensp;Hostname

:    `RT-AX55-1360`

#### :symbols-map-pin:&ensp;Location

:    Office&ensp;:symbols-move-right:&ensp;Printer-Cart 

#### :symbols-cpu:&ensp;OS / Firmware

:    [:symbols-wizard-hat:&nbsp;asuswrt](https://www.asus.com/us/content/asuswrt/) *(3004.386.53329-g73d3919)*

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
      
      + Local Network&ensp;:symbols-move-right:&ensp;"Asus Router"
      + SSH Keys&ensp;:symbols-move-right:&ensp;"ASUS RT-BE91U (Admin)"

## :symbols-lan:&ensp;Network Configuration

#### :symbols-globe:&ensp;WAN Connection

| Interface | IP Address       | MAC Address         | Connected To                 |
| :-------: | :--------------- | :------------------ | :--------------------------- |
|   WAN0    | `192.168.50.221` | `7C:10:C9:DF:13:60` | :symbols-wifi:&nbsp;Backhaul |

#### :symbols-hub:&ensp;Virtual Local Networks

|               VLAN                   | Domain   | DNS Server(s)                 | CIDR              | Gateway        | Broadcast        | DHCP Range      |
| :----------------------------------: | :------- | :---------------------------- | :---------------- | :------------- | :--------------- | :-------------- |
| :symbols-shield-quarter:&nbsp;VLAN50 | internal | `192.168.50.6` `192.168.50.2` | `192.168.50.0/24` | `192.168.50.1` | `192.168.50.255` | `.22` to `.254` |

#### :symbols-wifi-cog:&ensp;Wi-Fi Networks

|  SSID  |  VLAN  |   WAN Access    | CIDR              | Frequency      | Notes                                      |
| :----: | :----: | :-------------: | :---------------- | :------------- | :----------------------------------------- |
| *Home* | VLAN50 | :symbols-check: | `192.168.50.0/24` | 2.4 GHz, 5 GHz | :symbols-shield-quarter:&nbsp;Trusted VLAN |

#### :symbols-ethernet-port:&ensp;Physical Ethernet Ports

| Port  | Connected Device                                                                          | Color / Type  | Notes                                        |
| :---: | :---------------------------------------------------------------------------------------- | :------------ | :------------------------------------------- |
| WAN 1 | :symbols-ethernet-port:&nbsp;*Empty*                                                      | -             | :symbols-wifi:&nbsp;Wi-Fi *(5 GHz)* Backhaul |
| LAN 1 | [:symbols-ethernet-port:&nbsp;TP-Link Switch](tp-link_switch.md#port-map){ data-preview } | Black / Cat6a | 1 Gb/s Uplink                                |
| LAN 2 | :symbols-ethernet-port:&nbsp;*Empty*                                                      | -             | -                                            |
| LAN 3 | :symbols-ethernet-port:&nbsp;*Empty*                                                      | -             | -                                            |
| LAN 4 | :symbols-ethernet-port:&nbsp;*Empty*                                                      | -             | -                                            |

---
## :symbols-sticky-notes:&ensp;Maintenance & Notes

!!! config inline "Critical Configurations"

    **:symbols-network-node:&ensp;AiMesh Node:**
    :    The AiMesh Node acts like a "dumb" wireless access point. All available settings for the AiMesh node are available through the main router's Web-UI. See [ASUS RT-BE92U](asus_rt-be92u.md).

#### :symbols-update:&ensp;Update Process

+ Automatic firmware updates are enabled. The firmware version and status is available through the main router's Web-UI.  

#### :symbols-cloud-upload:&ensp;Backup Policy

+ No backup is needed for AiMesh node. 
