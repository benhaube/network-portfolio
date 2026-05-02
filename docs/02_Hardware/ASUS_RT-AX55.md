---
icon: material/router-wireless
title: ASUS RT-AX55
tags:
  - Hardware
  - Network
  - Router
  - Infrastructure
  - Office
  - Printer Cart
hide:
  - toc
---
![ASUS Router Icon](../assets/icons/asus-router-light.svg#only-light){ width=200 }
![ASUS Router Icon](../assets/icons/asus-router.svg#only-dark){ width=200 }

# ASUS RT-AX55
[Asuswrt-Merlin Docs :material-wizard-hat:](https://github.com/RMerl/asuswrt-merlin.ng/wiki){ .md-button .md-button--primary }&emsp;[ASUS Support :material-lifebuoy:](https://account.asus.com/us/myproductedit.aspx?rowguid=c59d7d6d-28e2-476f-affc-cb81b9846164&sn=MBIG31800578KSJ&from=Myproducts){ .md-button }

---
## :material-information-outline: Device Overview

#### :material-toolbox: Role: 
+ AiMesh Node

#### :symbols-host: Hostname(s):
+ `aimesh-node`

#### :material-map-marker-outline: Location: 
+ Office
+ Printer-Cart 

#### :material-memory: OS / Firmware: 
+ [:material-router-wireless:&nbsp;asuswrt](https://www.asus.com/us/content/asuswrt/) *(3.0.0.4.386_53327-g852eb80)*

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "Asus Router"

## :material-lan: Network Configuration

#### :material-wan: WAN Connection:

| Interface | IP Address       | MAC Address         | Connected To                  |
| :-------: | :--------------- | :------------------ | :---------------------------- |
| WAN0      | `192.168.50.221` | `7C:10:C9:DF:13:60` | :material-wifi:&nbsp;Backhaul |

#### :material-lan: Local Networks:

| VLAN                            | Domain   | DNS Server(s)                 | Gateway        | Subnet            | Subnet Mask     | Broadcast        | DHCP Range     |
| :-----------------------------: | :------- | :---------------------------- | :------------- | :---------------- | :-------------- | :--------------- | :------------- |
| :material-security:&nbsp;VLAN50 | internal | `192.168.50.6` `192.168.50.2` | `192.168.50.1` | `192.168.50.0/24` | `255.255.255.0` | `192.168.50.255` | `.6` to `.254` |

#### :material-wifi: Wi-Fi Networks:

| SSID   | VLAN   | WAN Access       | IP Address        | Frequency      | Notes                                 |  
| :----: | :----: | :--------------: | :---------------- | :------------- | :------------------------------------ |
| *Home* | VLAN50 | :material-check: | `192.168.50.0/24` | 2.4 GHz, 5 GHz | :material-security:&nbsp;Trusted VLAN |

#### :material-ethernet: Physical Ethernet Ports:

| Port  | Connected Device                                                          | Color / Type | Notes                                         |
| :---: | :------------------------------------------------------------------------ | :----------- | :-------------------------------------------- |
| WAN 1 | :material-ethernet:&nbsp;*Empty*                                          | -            | :material-wifi:&nbsp;Wi-Fi *(5 GHz)* Backhaul |
| LAN 1 | :material-switch:&nbsp;[TP-Link Switch](../02_Hardware/TP-Link_Switch.md) | Black Cat6a  | 1 Gb/s Uplink                                 |
| LAN 2 | :material-ethernet:&nbsp;*Empty*                                          | -            | -                                             |
| LAN 3 | :material-ethernet:&nbsp;*Empty*                                          | -            | -                                             |
| LAN 4 | :material-ethernet:&nbsp;*Empty*                                          | -            | -                                             |

---
## :material-tools: Maintenance & Notes

> [!config inline] Critical Configurations
> **:material-hub-outline: AiMesh Node:**
> + All settings for AiMesh node are available through the main router's Web UI. See [ASUS RT-BE92U](ASUS_RT-BE92U.md).

#### :material-update: Update Process: 

+ Automatic firmware and script updates enabled. 

#### :material-cloud-upload-outline: Backup Policy: 

+ No settings backup needed for AiMesh node. 
