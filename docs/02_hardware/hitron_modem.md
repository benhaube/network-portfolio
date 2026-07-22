---
icon: symbols/settings-ethernet
title: Hitron Modem
subtitle: DOCSIS 3.1 Cable Modem
tags:
  - Network
  - Infrastructure
  - ISP
  - Living Room
  - Server Rack
  - Hardware
hide:
  - toc
---
![Lucide 'chevrons-left-right-ellipsis' icon](../assets/icons/modem.svg){ width=200 }

# Hitron Modem
*DOCSIS 3.1 Cable Modem*

[Xfinity Account&ensp;:brands-xfinity:](https://login.xfinity.com/login){ .md-button .md-button--primary }&emsp;[User Manual&ensp;:symbols-notebook-text:](../assets/manuals/CODA_User_Manual.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role 

:    The DOCSIS 3.1 cable modem that communicates with the ISP *([Xfinity](https://www.xfinity.com/overview){ external-link })*. Located in the 10-inch mini-rack.

#### :symbols-map-pin:&ensp;Location

:    Living-Room&ensp;:symbols-move-right:&ensp;Mini-Rack

#### :symbols-cpu:&ensp;OS / Firmware

:    Hitron FW version: `7.3.5.3.2b2`

#### :symbols-user-key:&ensp;Credentials

:    N/A

## :symbols-lan:&ensp;Network Configuration

| Interface | IP Address      | MAC Address         | Connected To                                                                           |
| :-------: | :-------------- | :------------------ | :------------------------------------------------------------------------------------- |
|   LAN 1   | `192.168.100.1` | `00:1c:73:00:00:99` | [:symbols-router:&nbsp;ASUS RT-BE92U](asus_rt-be92u.md#wan-connection){ data-preview } |
|   LAN 2   | `Down`          | `xx:xx:xx:xx:xx:xx` | -                                                                                      |

---
## :symbols-sticky-notes:&ensp;Maintenance & Notes

!!! config inline "Critical Configurations"

    :symbols-globe-x:&ensp;**WAN Down:**
 
    * If WAN connection goes down, unplug power from modem for 60-seconds to reboot.
   
    :symbols-monitor-cog:&ensp;**Access WebUI:**
 
    * To access the modem's Web UI enter `https://192.168.100.1`.

#### :symbols-update:&ensp;Update Process 

+ N/A

#### :symbols-cloud-upload:&ensp;Backup Policy 

+ N/A
