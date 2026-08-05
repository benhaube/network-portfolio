---
icon: symbols/ethernet-port
title: TP-Link Switch
subtitle: Model SG105
description: A gigabit desktop switch (5-port) distributing Ethernet connections to devices in the office.
tags:
  - Hardware
  - Infrastructure
  - Network
  - Office 
  - Printer Cart
  - Switch
hide:
  - toc
---
![Lucide 'ethernet-port' icon](../assets/icons/ethernet.svg){ width=200 }

# TP-Link Switch
*Model SG105*

[Manual&ensp;:symbols-notebook-text:](../assets/manuals/TL-SG105.pdf){ .md-button .md-button--primary }&emsp;[Datasheet&ensp;:symbols-file-chart-column:](../assets/manuals/TL-SG105_info.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Physical Overview

#### :symbols-toolbox:&ensp;Role

:    A gigabit desktop switch *(5-port)* distributing Ethernet connections to devices in the office. It is located on the floor underneath the stationary printer cart.

#### :symbols-map-pin:&ensp;Location

+ <!-- material/tags { include: [Office, Printer Cart] } -->
{: .no-bullets }

#### :symbols-plug:&ensp;Power Source

:    Wall Wart *(5V / 0.6A)*

#### :symbols-circuit-board:&ensp;Specs

:    Throughput: 
    
      + Five 1 GbE ports
      + 10 Gb/s total switching capacity

:    Jumbo Frames: 
    
      + Supported *(16 KB)*

:    Managed:
    
      + No &mdash; Unmanaged

## :symbols-ethernet-port:&ensp;Port Map 

| Port # {data-sort-method='number'} | Connected Device                                                                              | Color / Type {data-sort-method='none'} | Notes {data-sort-method='none'}              |
| :--------------------------------: | :-------------------------------------------------------------------------------------------- | :------------------------------------- | :------------------------------------------- |
|                  1                 | [:symbols-pc-case:&nbsp;Ben's Desktop](bens_desktop.md#network-configuration){ data-preview } | White / Cat5e                          | `enp7s0` `192.168.50.10` `3C:7C:3F:0D:A9:CD` |
|                  2                 | [:symbols-pc-case:&nbsp;Rob's Desktop](robs_desktop.md#network-configuration){ data-preview } | White / Cat5e                          | `DHCP` `50:EB:F6:59:74:C3`                   |
|                  3                 | [:symbols-server:&nbsp;Pi 4B Server](pi_4b_server.md#network-configuration){ data-preview }   | White / Cat5e                          | `eth0` `192.168.50.2` `E4:5F:01:A4:60:07`    |
|                  4                 | :symbols-ethernet-port:&nbsp;*Empty*                                                          | -                                      | -                                            |
|                  5                 | [:symbols-router:&nbsp;ASUS RT-AX55](asus_rt-ax55.md#physical-ethernet-ports){ data-preview } | Black / Cat6A                          | Uplink                                       |

---
## :symbols-sticky-notes:&ensp;Maintenance Notes

!!! visual inline "Visual Indicators"

    :symbols-led:&ensp;**Green LED:** 10/100/1000 Mb/s<br>
    :symbols-led-on:&ensp;**Flashing:** Activity

!!! warning inline "Troubleshooting"

    Hard reboot required if traffic stalls *(unplug power for 60s)*.
