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

[Xfinity Account&ensp;:brands-xfinity:](https://login.xfinity.com/login){ .md-button .md-button--primary }

---
## :material-information-outline&ensp;Device Overview

#### :material-toolbox:&ensp;Role 

:    The DOCSIS 3.1 cable modem that communicates with the ISP *([Xfinity](https://www.xfinity.com/overview))*. Located in the 10-inch mini-rack.

#### :material-map-marker-outline:&ensp;Location

+ Living-Room
+ Mini-Rack

#### :material-memory:&ensp;OS / Firmware

+ Hitron FW version: `7.3.5.3.2b2`

#### :material-key-chain:&ensp;Credentials

+ N/A

## :material-lan:&ensp;Network Configuration

| Interface | IP Address      | MAC Address         | Connected To                                                                     |
| :-------: | :-------------- | :------------------ | :------------------------------------------------------------------------------- |
|   LAN 1   | `192.168.100.1` | `00:1c:73:00:00:99` | [:material-router-wireless:&nbsp;ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) |
|   LAN 2   | `Down`          | `xx:xx:xx:xx:xx:xx` | -                                                                                |

---
## :symbols-note-stack-fill:&ensp;Maintenance & Notes

!!! config inline "Critical Configurations"

    :material-web-off:&ensp;**WAN Down:**
 
    * If WAN connection goes down, unplug power from modem for 60-seconds to reboot.
   
    :material-application-cog-outline:&ensp;**Access WebUI:**
 
    * To access the modem's Web UI enter <https://192.168.100.1> or <https://hitron-modem.internal>

#### :material-update:&ensp;Update Process 

+ N/A

#### :material-cloud-upload-outline:&ensp;Backup Policy 

+ N/A
