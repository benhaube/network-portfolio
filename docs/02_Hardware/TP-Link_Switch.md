---
icon: symbols/ethernet-port-outline
title: TP-Link Switch
subtitle: Model SG105
tags:
  - Switch
  - Infrastructure
  - Network
  - Office
  - Printer Cart
  - Hardware
hide:
  - toc
---
![Material Design switch icon](../assets/icons/ethernet.svg){ width=200 }&ensp;![TP-Link Logo](../assets/icons/tp-link.svg){ width=50 }

# TP-Link Switch
*Model SG105*

[Manual&ensp;:symbols-notebook-text:](../assets/manuals/TL-SG105.pdf){ .md-button .md-button--primary }&emsp;[Datasheet&ensp;:symbols-file-chart-outline:](../assets/manuals/TL-SG105_info.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Physical Overview

#### :symbols-toolbox-outline:&ensp;Role

:    A gigabit desktop switch *(5-port)* distributing Ethernet connections to devices in the office. It is located on the floor underneath the stationary printer cart.

#### :symbols-location-outline:&ensp;Location

+ Office
+ Printer-Cart

#### :symbols-power-outline:&ensp;Power Source

+ Wall Wart *(5V / 0.6A)*

#### :symbols-monitor-heart-outline:&ensp;Specs

+ Throughput: 
    + Five 1 GbE ports
    + 10 Gb/s total switching capacity
+ Jumbo Frames: 
    + Supported *(16 KB)*
+ Managed:
    + No &mdash; Unmanaged

## :symbols-ethernet-port-outline:&ensp;Port Map 

| Port # | Connected Device                                                                                 | Color / Type  | Notes                                        |
| :----: | :----------------------------------------------------------------------------------------------- | :------------ | :------------------------------------------- |
| **1**  | [:symbols-desktop-pc-outline:&nbsp;Ben's Desktop](../02_Hardware/Ben's_Desktop.md)               | White / Cat5e | `enp7s0` `192.168.50.10` `3C:7C:3F:0D:A9:CD` |
| **2**  | [:symbols-desktop-pc-outline:&nbsp;Rob's Desktop](../02_Hardware/Rob's_Desktop.md)               | White / Cat5e | `DHCP` `50:EB:F6:59:74:C3`                   |
| **3**  | [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | White / Cat5e | `eth0` `192.168.50.2` `E4:5F:01:A4:60:07`    |
| **4**  | :symbols-ethernet-port-outline:&nbsp;*Empty*                                                     | -             | -                                            |
| **5**  | [:symbols-router-outline:&nbsp;ASUS RT-AX55](../02_Hardware/ASUS_RT-AX55.md)                     | Black / Cat6A | Uplink                                       |

---
## :symbols-note-stack:&ensp;Maintenance Notes

!!! visual inline "Visual Indicators"

    :symbols-led-off:&ensp;**Green LED:** 10/100/1000 Mb/s<br>
    :symbols-led-on:&ensp;**Flashing:** Activity

!!! warning inline "Troubleshooting"

    Hard reboot required if traffic stalls *(unplug power for 60s)*.
