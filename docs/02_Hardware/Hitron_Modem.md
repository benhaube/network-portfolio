---
icon: material/wan
title: Hitron Modem
subtitle: DOCSIS 3.1 Cable Modem
tags:
  - Hardware
  - Network
  - Infrastructure
  - ISP
  - Living Room
  - Mini-Rack
hide:
  - toc
---
![WAN Icon](../assets/icons/wan.svg){ width=200 }

# Hitron Modem
*DOCSIS 3.1 Cable Modem*

[Xfinity Account :brands-xfinity:](https://login.xfinity.com/login){ .md-button .md-button--primary }

---
## :material-information-outline: Device Overview

#### :material-toolbox: Role: 

:    The DOCSIS 3.1 cable modem that communicates with the ISP *([Xfinity](https://www.xfinity.com/overview))*. Located in the 10-inch mini-rack.

#### :material-map-marker-outline: Location: 

+ Living-Room
+ Mini-Rack

#### :material-memory: OS / Firmware: 

+ Hitron FW version: 7.3.5.3.2b2

#### :material-key-chain: Credentials:

+ N/A

## :material-lan: Network Configuration

| Interface | IP Address      | MAC Address         | Connected To                                                                                        |
| :-------: | :-------------- | :------------------ | :-------------------------------------------------------------------------------------------------- |
|   LAN 1   | `192.168.100.1` | `00:1c:73:00:00:99` | :material-router-wireless:&nbsp;WAN Connection for [ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) |
|   LAN 2   | `Down`          | `xx:xx:xx:xx:xx:xx` | -                                                                                                   |

---
## :material-tools: Maintenance & Notes

> [!config inline] Critical Configurations
> :material-web-off:&nbsp;**WAN Down:**
> 
> * If WAN connection goes down, unplug power from modem for 60-seconds to reboot.
>   
> :material-application-cog-outline:&nbsp;**Access WebUI:**
> 
> * To access the modem's Web UI enter <https://192.168.100.1> or <https://hitron-modem.internal>

#### :material-update: Update Process: 

+ N/A

#### :material-cloud-upload-outline: Backup Policy: 

+ N/A
