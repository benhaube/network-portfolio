---
icon: symbols/ethernet-port
title: TP-Link LiteWave Switch
subtitle: Model LS1005G
tags:
  - Switch
  - Infrastructure
  - Network
  - Living Room
  - TV Stand
  - Hardware
hide:
  - toc
---
![Lucide 'ethernet-port' icon](../assets/icons/ethernet.svg){ width=200 }

# TP-Link LiteWave Switch
*Model LS1005G*

[Manual&ensp;:symbols-notebook-text:](../assets/manuals/LiteWave-Switch-Install-Guide.pdf){ .md-button .md-button--primary }&emsp;[Datasheet&ensp;:symbols-file-chart:](../assets/manuals/LiteWave-Switch-Datasheet.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Physical Overview

#### :symbols-toolbox:&ensp;Role 

:    A gigabit desktop switch *(5-port)* distributing Ethernet connections to devices in the TV stand in the living room. Located on the back of the TV stand, attached with Velcro. 

#### :symbols-map-pin:&ensp;Location 

+ Living Room
+ TV Stand
 
#### :symbols-plug:&ensp;Power Source 

+ Wall Wart *(5V / 0.6A)*
 
#### :symbols-square-activity:&ensp;Specs

+ Throughput:
    + Five 1 GbE ports
    + 10 Gb/s total switching capacity
+ Jumbo Frames: 
    + Not Supported
+ Managed: 
    + No &mdash; Unmanaged
+ Hardware Revision:
    + v5.46

## :symbols-ethernet-port:&ensp;Port Map

| Port # | Connected Device                                                                                            | Color / Type  | Notes                      |
| :----: | :---------------------------------------------------------------------------------------------------------- | :------------ | :------------------------- |
| **1**  | [:symbols-router:&nbsp;ASUS RT-BE92U](./ASUS_RT-BE92U.md)                                                   | White / Cat6  | Uplink                     |
| **2**  | [:symbols-cast:&nbsp;Google TV Streamer](../01_Infrastructure/MAC_Address_Tables.md#trusted-network)        | Black / Cat6A | `DHCP` `B8:7B:D4:9D:80:F7` |
| **3**  | [:symbols-tv-minimal:&nbsp;TCL Smart TV](../01_Infrastructure/MAC_Address_Tables.md#trusted-network)        | Black / Cat5e | `DHCP` `4C:53:FD:6A:81:D5` |
| **4**  | [:symbols-gamepad-2:&nbsp;Nintendo Switch Dock](../01_Infrastructure/MAC_Address_Tables.md#trusted-network) | Black / Cat5e | `DHCP` `74:84:69:34:69:78` |
| **5**  | :symbols-ethernet-port:&nbsp;*Empty*                                                                        | -             | -                          |
| **6**  | :symbols-ethernet-port:&nbsp;*Empty*                                                                        | -             | -                          |

---
## :symbols-sticky-notes:&ensp;Maintenance Notes

!!! visual inline "Visual Indicators"

    :symbols-led-off:&ensp;**Green LED:** 10/100/1000 Mb/s<br>
    :symbols-led-on:&ensp;**Flashing:** Activity

!!! warning inline "Troubleshooting"

    Hard reboot required if traffic stalls *(unplug power for 60s)*.
