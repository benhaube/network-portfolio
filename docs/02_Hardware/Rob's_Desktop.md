---
icon: material/desktop-tower
title: Rob's Workstation
subtitle: High-Performance Desktop PC
tags: 
  - Hardware 
  - PC 
  - Desktop 
  - Office
  - Windows
hide:
  - toc
---
![ASUS Logo](../assets/icons/asus-full.svg){ width=250 }![Nvidia Logo](../assets/icons/nvidia.svg){ width=25 }&ensp;![Intel Logo](../assets/icons/intel.svg){ width=40 }

# Rob's Workstation
*High-Performance Desktop PC*

[Windows Docs&ensp;:material-microsoft:](https://support.microsoft.com/en-us/windows){ .md-button .md-button--primary }&emsp;[ASUS Support&ensp;:material-lifebuoy:](https://account.asus.com/us/myproductedit.aspx?rowguid=dc554ee0-d7d2-4018-992d-7267ebccf458&sn=MCM0KK06J149GK4&from=Myproducts){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role 

:    Rob's main workstation PC located at his desk in the office upstairs. Connected to the local network through the [TP-Link Switch](./TP-Link_Switch.md).

#### :symbols-host:&ensp;Hostname

+ `Rob-Desktop`

#### :symbols-location:&ensp;Location

+ Office 
+ Desk 

#### :symbols-memory:&ensp;OS / Firmware

+ [:material-microsoft:&nbsp;Windows 11 Pro](https://microsoft.com/windows)

#### :symbols-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"PIN - Rob's Desktop PC"

## :symbols-monitor-heart:&ensp;Core Specs

| CPU                                              | Cores / Threads | CPU Freq. | RAM                     | GPU                                      | GPU Freq. | VRAM       |
| :----------------------------------------------- | :-------------- | :-------- | :---------------------- | :--------------------------------------- | :-------- | :--------- |
| :brands-intel:&nbsp;Core(r) i7 12700K *(x86-64)* | 12C / 20T       | 5.0 GHz   | 32 GB DDR4 *(3600 MHz)* | :brands-intel:&nbsp;UHD 770 Graphics     | 1500 MHz  | *Shared*   |
|                                                  |                 |           |                         | :simple-nvidia:&nbsp;GeForce(r) RTX 3070 | 1725 MHz  | 8 GB GDDR6 |

## :symbols-lan:&ensp;Network Configuration

| Interface | IP Address | MAC Address         | Connected To                                                                        |
| :-------: | :--------- | :------------------ | :---------------------------------------------------------------------------------- |
| Ethernet  | `DHCP`     | `50:EB:F6:59:74:C3` | [:material-switch:&nbsp;TP-Link Switch](../02_Hardware/TP-Link_Switch.md) *(Port2)* |
|   Wi-Fi   | `DHCP`     | `70:A6:CC:B5:F5:4A` | [:symbols-wifi:&nbsp;Home](./ASUS_RT-BE92U.md#wi-fi-networks) *(VLAN50)*            |

| Interface |              VLAN              | FQDN  | DNS Servers                   | Gateway        |
| :-------: | :----------------------------: | :---- | :---------------------------- | :------------- |
| Ethernet  | :symbols-security:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |
|   Wi-Fi   | :symbols-security:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :symbols-storage:&ensp;Storage & Mounts

#### :material-harddisk:&ensp;Internal Drive(s)

| Mount Point | Drive Type | Drive Capacity | Device Path                                                   | File System | Encryption |
| :---------- | :--------- | :------------- | :------------------------------------------------------------ | :---------- | :--------- |
| `C:`        | NVMe SSD   | 464 GB         | `SCSI\DISK&VEN_NVME&PROD_SAMSUNG_SSD_970\5&345CC925&0&000000` | `ntfs`      | BitLocker  |
| `D:`        | SATA HDD   | 1.81 TB        | `SCSI\DISK&VEN_WDC&PROD_WD2003FZEX-00SRL\4&E91BE7&0&050000`   | `ntfs`      | -          |
| `G:`        | NVMe SSD   | 931 GB         | `SCSI\DISK&VEN_NVME&PROD_SAMSUNG_SSD_980\5&EBD909B&0&000000`  | `ntfs`      | -          |

#### :symbols-usb:&ensp;External / Attached

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption |
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `-`         | -          | -              | `-`         | `-`         | -          |

---
## :symbols-note-stack-fill:&ensp;Maintenance & Notes

--8<-- "maintenance-rob-pc.md"
