---
tags:
  - hardware
  - switch
  - infrastructure
  - network
hide:
  - toc
---
![[tp-link.svg|200]]

# [[TP-Link_Switch|TP-Link Switch]]
[Info :material-information-outline:](../assets/manuals/TL-SG105_info.pdf){ .md-button .md-button--primary }&emsp;[Manual :material-book-information-variant:](../assets/manuals/TL-SG105.pdf){ .md-button }

---
## :material-information-outline: Physical Overview

* **Role:** Core Desktop Switch
* **Location:** 
    * Office
    * Printer-Cart
* **Power Source:** Wall Wart *(5V / 0.6A)*
* **Specs:**
    * **Throughput:** 
        * Unmanaged Gigabit
        * Five 1GbE ports
        * 10Gb/s total switching capacity
    * **Jumbo Frames:** Supported *(16 KB)*

## :material-ethernet: Port Map 

> [!info]-
> *Since this switch is unmanaged, use this table to track physical cabling.*

| Port # | Connected Device | Color / Type | Notes |
| :----: | :--------------- | :----------- | :---- |
| **1** | :material-desktop-tower:&nbsp;[Ben's Desktop](../02_Hardware/Ben's_Desktop.md) | White Cat5e | `enp7s0`, `192.168.50.61` |
| **2** | :material-desktop-tower:&nbsp;[Rob's Desktop](../02_Hardware/Rob's_Desktop.md) | White Cat5e | DHCP |
| **3** | :material-server:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | White Cat5e | `eth0`, `192.168.50.2` |
| **4** | :material-ethernet:&nbsp;*Empty* | - | - |
| **5** | :material-router-wireless:&nbsp;[ASUS RT-AX55](../02_Hardware/ASUS_RT-AX55.md) | Black Cat5e | Uplink |

---
## :material-tools: Maintenance Notes

> [!TIP] Visual Indicators
> **Green LED:** 10/100/1000 Mbps Link <br>
> **Flashing:** Activity

> [!WARNING] Troubleshooting
> Hard reboot required if traffic stalls *(unplug power for 60s)*.
