---
tags:
  - hardware
  - switch
  - infrastructure
  - network
hide:
  - toc
---
![[ugreen.svg|200]]

# [[Ugreen_Switch|Ugreen Switch]]
[Manual :material-book-information-variant:](../assets/manuals/Ugreen_CM753.pdf){ .md-button .md-button--primary }

---
## :material-information-outline: Physical Overview

* **Role:** Rack Aggregation
* **Location:**
    * Living-Room 
    * Mini-Rack 
* **Power Source:** Wall wart *(12.0V / 1.0A)*
* **Specs:**
    * **Throughput:** 
        * Unmanaged 
        * Five 2.5 Gb/s Ports
        * One SFP+ 10 Gb/s Uplink *(from [[ASUS_RT-BE92U|ASUS RT-BE92U]] router)*
        * 45 Gb/s Total Switching Capacity
    * **Jumbo Frames:** Supported *(12 KB)*

## :material-ethernet: Port Map

> [!note]-
> *Since this switch is unmanaged, use this table to track physical cabling.*

| Port # | Connected Device | Color / Type | Notes |
| :----: | :--------------- | :----------- | :---- |
| **1** | :material-laptop:&nbsp;[Rob's Laptop](../02_Hardware/Rob's_Laptop.md) | White, Cat5e | Temporary Connection |
| **2** | :material-ethernet:&nbsp;*Empty* | - | - |
| **3** | :material-ethernet:&nbsp;*Empty* | - | - |
| **4** | :material-nas:&nbsp;[ZimaBoard 2 NAS](../02_Hardware/ZimaBoard_2_NAS.md) | Blue, 2.5 Gb/s, Cat6A | `eth1`, `192.168.50.5` |
| **5** | :material-nas:&nbsp;[ZimaBoard 2 NAS](../02_Hardware/ZimaBoard_2_NAS.md) | Yellow, 2.5 Gb/s, Cat6A | `eth0`, `192.168.50.4` |
| **6** | :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | Red, 10 Gb/s, Cat6A | SFP+ Ethernet Transceiver |

---
## :material-tools: Maintenance Notes

> [!TIP] Visual Indicators
> #### Ethernet Ports: 
> 
> * **Green LED:** 2500 Mb/s Link 
> * **Amber LED:** 10/100/1000 Mb/s Link
>   
> #### SFP+ Port: 
> 
> * **Green LED:** 10 Gb/s Link 
> * **Amber LED:** 1000/2500 Mb/s Link

> [!WARNING] Troubleshooting
> Hard reboot required if traffic stalls *(unplug power for 60s)*.
