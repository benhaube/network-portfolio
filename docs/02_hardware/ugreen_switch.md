---
icon: symbols/ethernet-port
title: Ugreen Switch
subtitle: Model UM106X
tags:
  - Switch
  - Infrastructure
  - Network
  - Living Room
  - Mini-Rack
  - Hardware
hide:
  - toc
---
![Lucide 'ethernet-port' icon](../assets/icons/ethernet.svg){ width=200 }

# Ugreen Switch
*Model UM106X*

[Manual&ensp;:symbols-notebook-text:](../assets/manuals/Ugreen_CM106X_Manual.pdf){ .md-button .md-button--primary }&emsp;[Datasheet&ensp;:symbols-file-chart:](../assets/manuals/Ugreen_CM106X_Datasheet.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Physical Overview

#### :symbols-toolbox:&ensp;Role

:    A rack-mounted 2.5 gigabit switch in the living room with a 10 Gb/s SFP+ uplink to the router, distributing Ethernet connections to the devices in the 10-inch mini-rack with extra ports available for future network expansion.

#### :symbols-map-pin:&ensp;Location 

:    Living-Room&ensp;:symbols-move-right:&ensp;Mini-Rack 

#### :symbols-plug:&ensp;Power Source

:    Wall wart *(12.0V / 1.0A)*

#### :symbols-square-activity:&ensp;Specs

:    **Throughput:** 
    
      + Five 2.5 Gb/s Ports
      + One SFP+ 10 Gb/s Uplink *(from [ASUS RT-BE92U](asus_rt-be92u.md) router)*
      + 45 Gb/s Total Switching Capacity

:    **Jumbo Frames:** 
    
      + Supported *(12 KB)*

:    **Managed:**
    
      + No &mdash; Unmanaged

## :symbols-ethernet-port:&ensp;Port Map

| Port # | Connected Device                                             | Color / Type   | Notes                                                      |
| :----: | :----------------------------------------------------------- | :------------- | :--------------------------------------------------------- |
| **1**  | [:symbols-laptop-minimal:&nbsp;Rob's Laptop](robs_laptop.md) | White / Cat5e  | 2.5 Gb/s &mdash; Temporary Connection `E8:9C:25:90:8B:11`  |
| **2**  | :symbols-ethernet-port:&nbsp;*Empty*                         | -              | -                                                          |
| **3**  | :symbols-ethernet-port:&nbsp;*Empty*                         | -              | -                                                          |
| **4**  | [:symbols-server-nas:&nbsp;ZimaOS NAS](zimaos_nas.md)        | Blue / Cat6A   | 2.5 Gb/s &mdash; `eth1` `192.168.50.5` `00:E0:4C:5B:9A:95` |
| **5**  | [:symbols-server-nas:&nbsp;ZimaOS NAS](zimaos_nas.md)        | Yellow / Cat6A | 2.5 Gb/s &mdash; `eth0` `192.168.50.4` `00:E0:4C:5B:9A:96` |
| **6**  | [:symbols-router:&nbsp;ASUS RT-BE92U](asus_rt-be92u.md)      | Red / Cat6A    | 10 Gb/s &mdash; SFP+ Ethernet Transceiver                  |

---
## :symbols-sticky-notes:&ensp;Maintenance Notes

!!! visual inline "Visual Indicators"

    **Ethernet Ports:** 
 
    :symbols-led:&ensp;**Green LED:** 2500 Mb/s <br>
    :symbols-led:&ensp;**Amber LED:** 10/100/1000 Mb/s <br>
    :symbols-led-on:&ensp;**Flashing:** Activity
   
    **SFP+ Port:** 
 
    :symbols-led:&ensp;**Green LED:** 10 Gb/s <br>
    :symbols-led:&ensp;**Amber LED:** 1000 / 2500 Mb/s <br>
    :symbols-led-on:&ensp;**Flashing:** Activity

!!! warning inline "Troubleshooting"

    Hard reboot required if traffic stalls *(unplug power for 60s)*.
