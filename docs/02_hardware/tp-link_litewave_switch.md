---
icon: symbols/ethernet-port
title: TP-Link LiteWave Switch
subtitle: Model LS1005G
status: new
description: A gigabit desktop switch (5-port) distributing Ethernet connections to devices in the TV stand in the living room.
tags:
  - Hardware
  - Infrastructure
  - Living Room
  - Network
  - Switch
  - TV Stand
hide:
  - toc
---

![Lucide 'ethernet-port' icon](../assets/icons/ethernet-port.svg){ width=200 }

# TP-Link LiteWave Switch

_Model LS1005G_

[Manual&ensp;:symbols-notebook-text:](../assets/manuals/LiteWave-Switch-Install-Guide.pdf){ .md-button .md-button--primary }&emsp;[Datasheet&ensp;:symbols-file-chart-column:](../assets/manuals/LiteWave-Switch-Datasheet.pdf){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Physical Overview

#### :symbols-toolbox:&ensp;Role

: A gigabit desktop switch _(5-port)_ distributing Ethernet connections to devices in the TV stand in the living room. Located on the back of the TV stand, attached with Velcro.

#### :symbols-map-pin:&ensp;Location

- <!-- material/tags { include: [Living Room, TV Stand] } -->
{ .no-bullets }

#### :symbols-plug:&ensp;Power Source

:    Wall Wart _(5V / 0.6A)_

#### :symbols-circuit-board:&ensp;Specs

##### Throughput

- Five 1 GbE ports
{ .no-bullets }
- 10 Gb/s total switching capacity
{ .no-bullets }

##### Jumbo Frames

- Not Supported
{ .no-bullets }

##### Managed

- No &mdash; Unmanaged
{ .no-bullets }

##### Hardware Revision

- v5.46
{ .no-bullets }

## :symbols-ethernet-port:&ensp;Port Map

| Port # { data-sort-method="number" } | Connected Device                                                                                                            | Color / Type { data-sort-method="none" } | Notes { data-sort-method="none" } |
| :----------------------------------: | :-------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------- | :-------------------------------- |
|                  1                   | [:symbols-router:&nbsp;ASUS RT-BE92U](asus_rt-be92u.md#physical-ethernet-ports){ data-preview }                             | White / Cat6                             | Uplink                            |
|                  2                   | [:symbols-cast:&nbsp;Google TV Streamer](../01_infrastructure/mac_address_tables.md#trusted-network){ data-preview }        | Black / Cat6A                            | `DHCP` `B8:7B:D4:9D:80:F7`        |
|                  3                   | [:symbols-tv-minimal:&nbsp;TCL Smart TV](../01_infrastructure/mac_address_tables.md#trusted-network){ data-preview }        | Black / Cat5e                            | `DHCP` `4C:53:FD:6A:81:D5`        |
|                  4                   | [:symbols-gamepad-2:&nbsp;Nintendo Switch Dock](../01_infrastructure/mac_address_tables.md#trusted-network){ data-preview } | Black / Cat5e                            | `DHCP` `74:84:69:34:69:78`        |
|                  5                   | :symbols-ethernet-port:&nbsp;_Empty_                                                                                        | -                                        | -                                 |
|                  6                   | :symbols-ethernet-port:&nbsp;_Empty_                                                                                        | -                                        | -                                 |

---

## :symbols-sticky-notes:&ensp;Maintenance Notes

!!! visual inline "Visual Indicators"

    :symbols-led:&ensp;**Green LED** 
    
    - 10/100/1000 Mb/s
    { .no-bullets }
    
    :symbols-led-on:&ensp;**Flashing** 
    
    - Network Activity
    { .no-bullets }

!!! warning inline "Troubleshooting"

    Hard reboot required if traffic stalls _(unplug power for 60s)_.
