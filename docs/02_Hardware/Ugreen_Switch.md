---
icon: material/switch
title: Ugreen Switch
subtitle: Model UM106X
tags:
  - Hardware
  - Switch
  - Infrastructure
  - Network
  - Living Room
  - Mini-Rack
hide:
  - toc
---
![Material Design switch icon](../assets/icons/switch.svg){ width=200 }&nbsp;
![Ugreen Logo](../assets/icons/ugreen-light.svg#only-light){ width=50 }
![Ugreen Logo](../assets/icons/ugreen-dark.svg#only-dark){ width=50 }

# Ugreen Switch
*Model UM106X*

[Manual :material-book-information-variant:](../assets/manuals/Ugreen_CM106X_Manual.pdf){ .md-button .md-button--primary }&emsp;[Datasheet :material-file-chart:](../assets/manuals/Ugreen_CM106X_Datasheet.pdf){ .md-button .md-button--primary }

---
## :material-information-outline: Physical Overview

#### :material-toolbox: Role: 

:    A rack-mounted 2.5 gigabit switch in the living room with a 10 Gb/s SFP+ uplink to the router, distributing Ethernet connections to the devices in the 10-inch mini-rack with extra ports available for future network expansion.

#### :material-map-marker-outline: Location: 

+ Living-Room 
+ Mini-Rack 

#### :material-power-plug: Power Source: 

+ Wall wart *(12.0V / 1.0A)*

#### :symbols-monitor-heart: Specs:

+ Throughput: 
    + Five 2.5 Gb/s Ports
    + One SFP+ 10 Gb/s Uplink *(from [ASUS RT-BE92U](./ASUS_RT-BE92U.md) router)*
    + 45 Gb/s Total Switching Capacity
+ Jumbo Frames: 
    + Supported *(12 KB)*
+ Managed:
    + No &mdash; Unmanaged

## :material-ethernet: Port Map

| Port # | Connected Device                                                                 | Color / Type   | Notes                                                      |
| :----: | :------------------------------------------------------------------------------- | :------------- | :--------------------------------------------------------- |
| **1**  | [:material-laptop:&nbsp;Rob's Laptop](../02_Hardware/Rob's_Laptop.md)            | White / Cat5e  | 2.5 Gb/s &mdash; Temporary Connection `E8:9C:25:90:8B:11`  |
| **2**  | :material-ethernet:&nbsp;*Empty*                                                 | -              | -                                                          |
| **3**  | :material-ethernet:&nbsp;*Empty*                                                 | -              | -                                                          |
| **4**  | [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)              | Blue / Cat6A   | 2.5 Gb/s &mdash; `eth1` `192.168.50.5` `00:E0:4C:5B:9A:95` |
| **5**  | [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)              | Yellow / Cat6A | 2.5 Gb/s &mdash; `eth0` `192.168.50.4` `00:E0:4C:5B:9A:96` |
| **6**  | [:material-router-wireless:&nbsp;ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | Red / Cat6A    | 10 Gb/s &mdash; SFP+ Ethernet Transceiver                  |

---
## :material-tools: Maintenance Notes

!!! visual inline "Visual Indicators"

    **Ethernet Ports:** 
 
    &emsp;:material-led-off:&nbsp;**Green LED:** 2500 Mb/s <br>
    &emsp;:material-led-off:&nbsp;**Amber LED:** 10/100/1000 Mb/s <br>
    &emsp;:material-led-on:&nbsp;**Flashing:** Activity
   
    **SFP+ Port:** 
 
    &emsp;:material-led-off:&nbsp;**Green LED:** 10 Gb/s <br>
    &emsp;:material-led-off:&nbsp;**Amber LED:** 1000 / 2500 Mb/s <br>
    &emsp;:material-led-on:&nbsp;**Flashing:** Activity

!!! warning inline "Troubleshooting"

    Hard reboot required if traffic stalls *(unplug power for 60s)*.
