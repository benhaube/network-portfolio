---
icon: symbols/desktop-pc-outline
title: Rob's Workstation
subtitle: High-Performance Desktop PC
tags:  
  - PC 
  - Desktop 
  - Office
  - Windows
  - Hardware
hide:
  - toc
---
![Lucide pc-case icon](../assets/icons/pc-case.svg){ width=200 }

# Rob's Workstation
*High-Performance Desktop PC*

[Windows Docs&ensp;:brands-microsoft:](https://support.microsoft.com/en-us/windows){ .md-button .md-button--primary }&emsp;[User Manual&ensp;:symbols-notebook-text:](../assets/manuals/ASUS_H670-PRO_WIFI_D4_User_Manual.pdf){ .md-button .md-button--primary }&emsp;[UEFI Manual&ensp;:symbols-notebook-text:](../assets/manuals/ASUS_600_Series_UEFI_Manual.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox-outline:&ensp;Role 

:    Rob's main workstation PC located at his desk in the office upstairs. Connected to the local network through the [TP-Link Switch](./TP-Link_Switch.md).

#### :symbols-host-outline:&ensp;Hostname

+ `Rob-Desktop`

#### :symbols-location-outline:&ensp;Location

+ Office 
+ Desk 

#### :symbols-memory:&ensp;OS / Firmware

+ [:brands-microsoft:&nbsp;Windows 11 Pro](https://microsoft.com/windows)

#### :symbols-user-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"PIN - Rob's Desktop PC"

## :symbols-monitor-heart-outline:&ensp;Core Specs

| CPU                                              | Cores / Threads | CPU Freq. | RAM                     | GPU                                      | GPU Freq. | VRAM       |
| :----------------------------------------------- | :-------------- | :-------- | :---------------------- | :--------------------------------------- | :-------- | :--------- |
| :brands-intel:&nbsp;Core(r) i7 12700K *(x86-64)* | 12C / 20T       | 5.0 GHz   | 32 GB DDR4 *(3600 MHz)* | :brands-intel:&nbsp;UHD 770 Graphics     | 1500 MHz  | *Shared*   |
|                                                  |                 |           |                         | :brands-nvidia:&nbsp;GeForce(r) RTX 3070 | 1725 MHz  | 8 GB GDDR6 |

## :symbols-lan-outline:&ensp;Network Configuration

| Interface | IP Address | MAC Address         | Connected To                                                                                      |
| :-------: | :--------- | :------------------ | :------------------------------------------------------------------------------------------------ |
| Ethernet  | `DHCP`     | `50:EB:F6:59:74:C3` | [:symbols-ethernet-port-outline:&nbsp;TP-Link Switch](../02_Hardware/TP-Link_Switch.md) *(Port2)* |
|   Wi-Fi   | `DHCP`     | `70:A6:CC:B5:F5:4A` | [:symbols-android-wifi-lock:&nbsp;Home](./ASUS_RT-BE92U.md#wi-fi-networks) *(VLAN50)*             |

| Interface |              VLAN              | FQDN  | DNS Servers                   | Gateway        |
| :-------: | :----------------------------: | :---- | :---------------------------- | :------------- |
| Ethernet  | :symbols-security:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |
|   Wi-Fi   | :symbols-security:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :symbols-folder-open-outline:&ensp;Storage & Mounts

#### :symbols-hard-drive-outline:&ensp;Internal Drive(s)

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
## :symbols-note-stack:&ensp;Maintenance & Notes

--8<-- "maintenance-rob-pc.md"
