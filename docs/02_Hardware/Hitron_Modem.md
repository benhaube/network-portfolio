---
tags:
  - hardware
  - network
  - infrastructure
  - ISP
hide:
  - toc
---
![[wan.svg|200]]

# [[Hitron_Modem|Hitron Modem]]
[Xfinity ![[xfinity-light.svg|20]]](https://login.xfinity.com/login){ .md-button .md-button--primary }&emsp;[Hitron Docs :material-file-document-multiple:](https://us.hitrontech.com/products/consumers/docsis-3-1-cable-modem/){ .md-button }

---
## :material-information-outline: Device Overview

* **Role:** DOCSIS Cable Modem
* **Location:** 
    * Living-Room
    * Mini-Rack
* **OS / Firmware:** 
    * Hitron FW version: 7.3.5.3.2b2
* **Credentials:** N/A

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| **LAN 1** | `192.168.100.1` | `00:1c:73:00:00:99` | WAN Connection for [ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) |
| **LAN 2** | `down` | `xx:xx:xx:xx:xx:xx` | - |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--: | :---------- | :---------- | :------ |
| - | `hitron-modem.internal` | - | `192.168.100.1` |

---
## :material-tools: Maintenance & Notes

> [!NOTE] Critical Configurations
> **:material-network-off: WAN Down:**
> 
> * If WAN connection goes down, unplug power from modem for 60-seconds to reboot.
>   
> **:material-application-cog: Access WebUI:**
> 
> * To access the modem's Web UI enter <https://192.168.100.1> or <https://hitron-modem.internal>

#### :material-update: Update Process: 

+ N/A

#### :material-cloud-upload-outline: Backup Policy: 

+ N/A
