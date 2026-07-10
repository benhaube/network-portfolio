---
icon: symbols/ethernet-port-outline
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
![Material Design switch icon](../assets/icons/ethernet.svg){ width=200 }

# Ugreen Switch
*Model UM106X*

[Manual&ensp;:symbols-notebook-text:](../assets/manuals/Ugreen_CM106X_Manual.pdf){ .md-button .md-button--primary }&emsp;[Datasheet&ensp;:symbols-file-chart-outline:](../assets/manuals/Ugreen_CM106X_Datasheet.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Physical Overview

#### :symbols-toolbox-outline:&ensp;Role

:    A rack-mounted 2.5 gigabit switch in the living room with a 10 Gb/s SFP+ uplink to the router, distributing Ethernet connections to the devices in the 10-inch mini-rack with extra ports available for future network expansion.

#### :symbols-location-outline:&ensp;Location 

+ Living-Room 
+ Mini-Rack 

#### :symbols-power-outline:&ensp;Power Source

+ Wall wart *(12.0V / 1.0A)*

#### :symbols-square-activity:&ensp;Specs

+ Throughput: 
    + Five 2.5 Gb/s Ports
    + One SFP+ 10 Gb/s Uplink *(from [ASUS RT-BE92U](./ASUS_RT-BE92U.md) router)*
    + 45 Gb/s Total Switching Capacity
+ Jumbo Frames: 
    + Supported *(12 KB)*
+ Managed:
    + No &mdash; Unmanaged

## :symbols-ethernet-port-outline:&ensp;Port Map

| Port # | Connected Device                                                               | Color / Type   | Notes                                                      |
| :----: | :----------------------------------------------------------------------------- | :------------- | :--------------------------------------------------------- |
| **1**  | [:symbols-laptop-minimal:&nbsp;Rob's Laptop](../02_Hardware/Rob's_Laptop.md)   | White / Cat5e  | 2.5 Gb/s &mdash; Temporary Connection `E8:9C:25:90:8B:11`  |
| **2**  | :symbols-ethernet-port-outline:&nbsp;*Empty*                                   | -              | -                                                          |
| **3**  | :symbols-ethernet-port-outline:&nbsp;*Empty*                                   | -              | -                                                          |
| **4**  | [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)      | Blue / Cat6A   | 2.5 Gb/s &mdash; `eth1` `192.168.50.5` `00:E0:4C:5B:9A:95` |
| **5**  | [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)      | Yellow / Cat6A | 2.5 Gb/s &mdash; `eth0` `192.168.50.4` `00:E0:4C:5B:9A:96` |
| **6**  | [:symbols-router-outline:&nbsp;ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | Red / Cat6A    | 10 Gb/s &mdash; SFP+ Ethernet Transceiver                  |

---
## :symbols-note-stack:&ensp;Maintenance Notes

!!! visual inline "Visual Indicators"

    **Ethernet Ports:** 
 
    :symbols-led-off:&ensp;**Green LED:** 2500 Mb/s <br>
    :symbols-led-off:&ensp;**Amber LED:** 10/100/1000 Mb/s <br>
    :symbols-led-on:&ensp;**Flashing:** Activity
   
    **SFP+ Port:** 
 
    :symbols-led-off:&ensp;**Green LED:** 10 Gb/s <br>
    :symbols-led-off:&ensp;**Amber LED:** 1000 / 2500 Mb/s <br>
    :symbols-led-on:&ensp;**Flashing:** Activity

!!! warning inline "Troubleshooting"

    Hard reboot required if traffic stalls *(unplug power for 60s)*.
