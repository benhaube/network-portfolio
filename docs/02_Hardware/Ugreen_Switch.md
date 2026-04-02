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
## Physical Overview
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
    * **Jumbo Frames:** Supported *(12KB)*

## Port Map
> [!note]-
> *Since this switch is unmanaged, use this table to track physical cabling.*

| Port # | Connected Device | Color / Type | Notes |
| :----: | :--------------- | :----------- | :---- |
| **1** | :material-laptop: [Rob's Laptop](../02_Hardware/Rob's_Laptop.md) | White, Cat5e | Temporary Connection |
| **2** | :material-ethernet: *Empty* | - | - |
| **3** | :material-ethernet: *Empty* | - | - |
| **4** | :material-nas: [ZimaBoard 2 NAS](../02_Hardware/ZimaBoard_2_NAS.md) | Blue, 2.5Gb/s, Cat6A | `eth1`, `192.168.50.5` |
| **5** | :material-nas: [ZimaBoard 2 NAS](../02_Hardware/ZimaBoard_2_NAS.md) | Yellow, 2.5Gb/s, Cat6A | `eth0`, `192.168.50.4` |
| **6** | :material-router-wireless: [ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | Red, 10Gb/s, Cat6A | SFP+ Ethernet Transceiver |

---
## Maintenance Notes
> [!TIP] Visual Indicators
> **Ethernet Ports:** 
> * **Green LED:** 2500 Mbps Link 
> * **Amber LED:** 10/100/1000 Mbps Link
>   
> **SFP+ Port:** 
> * **Green LED:** 10 Gbps Link 
> * **Amber LED:** 1000/2500 Mbps Link

> [!WARNING] Troubleshooting
> Hard reboot required if traffic stalls *(unplug power for 60s)*.
