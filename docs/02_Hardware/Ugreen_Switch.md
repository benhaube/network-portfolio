---
icon: material/switch
tags:
  - hardware
  - switch
  - infrastructure
  - network
  - living-room
  - mini-rack
hide:
  - toc
---
![Material Design switch icon](../assets/icons/switch.svg){ width=200 }&nbsp;
![Ugreen Logo](../assets/icons/ugreen-light.svg#only-light){ width=50 }
![Ugreen Logo](../assets/icons/ugreen-dark.svg#only-dark){ width=50 }

# Ugreen Switch
[Manual :material-book-information-variant:](../assets/manuals/Ugreen_CM753.pdf){ .md-button .md-button--primary }

---
## :material-information-outline: Physical Overview

#### :material-toolbox: Role: 

* Rack Aggregation

#### :material-map-marker-outline: Location: 

* Living-Room 
* Mini-Rack 

#### :material-power-plug: Power Source: 

* Wall wart *(12.0V / 1.0A)*

#### :material-clipboard-pulse-outline: Specs:

* **Throughput:** 
    * Unmanaged 
    * Five 2.5 Gb/s Ports
    * One SFP+ 10 Gb/s Uplink *(from [[ASUS_RT-BE92U|ASUS RT-BE92U]] router)*
    * 45 Gb/s Total Switching Capacity
* **Jumbo Frames:** Supported *(12 KB)*

## :material-ethernet: Port Map

| Port # | Connected Device | Color / Type | Notes |
| :----: | :--------------- | :----------- | :---- |
| **1** | :material-laptop:&nbsp;Rob's Laptop (`ems1`) | White, Cat5e | Temporary Connection |
| **2** | :material-ethernet:&nbsp;*Empty* | - | - |
| **3** | :material-ethernet:&nbsp;*Empty* | - | - |
| **4** | :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | Blue, 2.5 Gb/s, Cat6A | `eth1`, `192.168.50.5` |
| **5** | :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | Yellow, 2.5 Gb/s, Cat6A | `eth0`, `192.168.50.4` |
| **6** | :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | Red, 10 Gb/s, Cat6A | SFP+ Ethernet Transceiver |

---
## :material-tools: Maintenance Notes

> [!tip inline] Visual Indicators
> **Ethernet Ports:** 
> 
> * **Green LED:** 2500 Mb/s Link 
> * **Amber LED:** 10/100/1000 Mb/s Link
>   
> **SFP+ Port:** 
> 
> * **Green LED:** 10 Gb/s Link 
> * **Amber LED:** 1000 / 2500 Mb/s Link

> [!warning inline] Troubleshooting
> Hard reboot required if traffic stalls *(unplug power for 60s)*.
