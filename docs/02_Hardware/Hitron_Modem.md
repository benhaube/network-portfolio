---
icon: symbols/web
title: Hitron Modem
subtitle: DOCSIS 3.1 Cable Modem
tags:
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

[Xfinity Account&ensp;:brands-xfinity:](https://login.xfinity.com/login){ .md-button .md-button--primary }&emsp;[User Manual&ensp;:symbols-notebook-text:](../assets/manuals/CODA_User_Manual.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role 

:    The DOCSIS 3.1 cable modem that communicates with the ISP *([Xfinity](https://www.xfinity.com/overview))*. Located in the 10-inch mini-rack.

#### :symbols-location:&ensp;Location

+ Living-Room
+ Mini-Rack

#### :symbols-memory:&ensp;OS / Firmware

+ Hitron FW version: `7.3.5.3.2b2`

#### :symbols-key:&ensp;Credentials

+ N/A

## :symbols-lan:&ensp;Network Configuration

| Interface | IP Address      | MAC Address         | Connected To                                                                   |
| :-------: | :-------------- | :------------------ | :----------------------------------------------------------------------------- |
|   LAN 1   | `192.168.100.1` | `00:1c:73:00:00:99` | [:symbols-router-outline:&nbsp;ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) |
|   LAN 2   | `Down`          | `xx:xx:xx:xx:xx:xx` | -                                                                              |

---
## :symbols-note-stack-fill:&ensp;Maintenance & Notes

!!! config inline "Critical Configurations"

    :symbols-web-cancel:&ensp;**WAN Down:**
 
    * If WAN connection goes down, unplug power from modem for 60-seconds to reboot.
   
    :symbols-iframe:&ensp;**Access WebUI:**
 
    * To access the modem's Web UI enter <https://192.168.100.1> or <https://hitron-modem.internal>

#### :symbols-update:&ensp;Update Process 

+ N/A

#### :symbols-backup:&ensp;Backup Policy 

+ N/A
