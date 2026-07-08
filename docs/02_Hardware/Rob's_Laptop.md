---
icon: symbols/laptop-minimal
title: Rob's Laptop
subtitle: ASUS TUF Gaming Laptop
tags: 
  - PC 
  - Laptop 
  - Mobile
  - Windows
  - Remote Access
  - Hardware
hide:
  - toc
---
![Lucide laptop-minimal icon](../assets/icons/laptop-minimal.svg){ width=200 }

# Rob's Laptop
*ASUS TUF Gaming Laptop*

[Windows Docs&ensp;:brands-microsoft:](https://support.microsoft.com/en-us/windows){ .md-button .md-button--primary }&emsp;[User Manual&ensp;:symbols-notebook-text:](../assets/manuals/FA507XI_User_Manual.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox-outline:&ensp;Role

:    Rob's laptop PC, an ASUS TUF Gaming laptop, used for work and gaming. A mobile device primarily connected to the Trusted Wi-Fi network (SSID: `Home`). However, sometimes it has a 2.5 Gb/s Ethernet connection through the rack-mounted [Ugreen Switch](./Ugreen_Switch.md).

#### :symbols-host-outline:&ensp;Hostname

+ `ems1`

#### :symbols-location-outline:&ensp;Location 

+ Mobile

#### :symbols-memory:&ensp;OS / Firmware

+ [:brands-microsoft:&nbsp;Windows 11 Home](https://microsoft.com/windows)

#### :symbols-user-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"PIN - Rob's Laptop PC"

## :symbols-monitor-heart-outline:&ensp;Core Specs

| CPU                                            | Cores / Threads | CPU Freq. | RAM                      | GPU                                              | GPU Freq. | VRAM       |
| :--------------------------------------------- | :-------------- | :-------- | :----------------------- | :----------------------------------------------- | :-------- | :--------- |
| :brands-amd:&nbsp;Ryzen(r) 9 7940HS *(x86-64)* | 8C / 16T        | 4.0 GHz   | 16 GB DDR5 *(4800 MT/s)* | :brands-amd:&nbsp;Radeon(r) 780M                 | 2700 MHz  | *Shared*   |
|                                                |                 |           |                          | :simple-nvidia:&nbsp;GeForce RTX 4070 *(mobile)* | 2175 MHz  | 8 GB GDDR6 |

## :symbols-lan-outline:&ensp;Network Configuration

| Interface | IP Address | MAC Address         | Connected To                                                                                                           |
| :-------: | :--------- | :------------------ | :--------------------------------------------------------------------------------------------------------------------- |
| Ethernet  | `DHCP`     | `E8:9C:25:90:8B:11` | [:symbols-ethernet-port-outline:&nbsp;Ugreen Switch](../02_Hardware/Ugreen_Switch.md) *(Port-1)*, Temporary connection |
|   Wi-Fi   | `DHCP`     | `F8:54:F6:C1:88:D2` | [:symbols-android-wifi-lock:&nbsp;Home](./ASUS_RT-BE92U.md#wi-fi-networks) *(VLAN50)*                                  |

| Interface |              VLAN              | FQDN  | DNS Servers                   | Gateway        |
| :-------: | :----------------------------: | :---- | :---------------------------- | :------------- |
| Ethernet  | :symbols-security:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |
|   Wi-Fi   | :symbols-security:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :symbols-folder-open-outline:&ensp;Storage & Mounts

#### :symbols-hard-drive-outline:&ensp;Internal Drive(s)

| Mount Point | Drive Type | Drive Capacity | Device Path                                                    | File System | Encryption |
| :---------- | :--------- | :------------- | :------------------------------------------------------------- | :---------- | :--------- |
| `C:`        | NVMe SSD   | 926 GB         | `SCSI\DISK&VEN_NVME&PROD_WD_PC_SN560_SDDP\5&194EBDF0&0&000000` | `ntfs`      | BitLocker  |

#### :symbols-usb:&ensp;External / Attached

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption |
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `-`         | -          | -              | `-`         | `-`         | -          |

---
## :symbols-note-stack:&ensp;Maintenance & Notes

--8<-- "maintenance-rob-pc.md"
