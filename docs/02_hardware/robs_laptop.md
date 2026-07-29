---
icon: symbols/laptop-minimal
title: Rob's Laptop
subtitle: ASUS TUF Gaming A16
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
![Lucide 'laptop-minimal' icon](../assets/icons/laptop-minimal.svg){ width=200 }

# Rob's Laptop
*ASUS TUF Gaming A16*

[Windows Docs&ensp;:brands-microsoft:](https://support.microsoft.com/en-us/windows){ .md-button .md-button--primary }&emsp;[User Manual&ensp;:symbols-notebook-text:](../assets/manuals/FA507XI_User_Manual.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role

:    Rob's laptop PC, an ASUS TUF Gaming laptop, used for work and gaming. A mobile device primarily connected to the Trusted Wi-Fi network (SSID: `Home`). However, sometimes it has a 2.5 Gb/s Ethernet connection through the rack-mounted [Ugreen Switch](ugreen_switch.md#role){ data-preview }.

#### :symbols-host:&ensp;Hostname

:    `ems1`

#### :symbols-map-pin:&ensp;Location 

:    Mobile

#### :symbols-cpu:&ensp;OS / Firmware

:    [:brands-microsoft:&ensp;Windows 11 Pro](https://microsoft.com/windows){ external-link }

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"PIN - Rob's Laptop PC"

## :symbols-circuit-board:&ensp;Core Specs

| CPU                                            | Cores / Threads | CPU Freq. | RAM                      | GPU                                              | GPU Freq. | VRAM       |
| :--------------------------------------------- | :-------------- | :-------- | :----------------------- | :----------------------------------------------- | :-------- | :--------- |
| :brands-amd:&nbsp;Ryzen(r) 9 7940HS *(x86-64)* | 8C / 16T        | 4.0 GHz   | 16 GB DDR5 *(4800 MT/s)* | :brands-amd:&nbsp;Radeon(r) 780M                 | 2700 MHz  | *Shared*   |
|                                                |                 |           |                          | :brands-nvidia:&nbsp;GeForce RTX 4070 *(mobile)* | 2175 MHz  | 8 GB GDDR6 |

## :symbols-network:&ensp;Network Configuration

| Interface | IP Address | MAC Address         | Connected To                                                                                                             |
| :-------: | :--------- | :------------------ | :----------------------------------------------------------------------------------------------------------------------- |
| Ethernet  | `DHCP`     | `E8:9C:25:90:8B:11` | [:symbols-ethernet-port:&nbsp;Ugreen Switch](ugreen_switch.md#port-map){ data-preview } *(Port-1)*, Temporary connection |
|   Wi-Fi   | `DHCP`     | `F8:54:F6:C1:88:D2` | [:symbols-wifi-cog:&nbsp;Home](asus_rt-be92u.md#wi-fi-networks){data-preview} *(VLAN50)*                                 |

| Interface |               VLAN                   | FQDN  | DNS Servers {data-sort-method='none'} | Gateway {data-sort-method='dotsep'} |
| :-------: | :----------------------------------: | :---- | :------------------------------------ | :---------------------------------- |
| Ethernet  | :symbols-shield-quarter:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2`         | `192.168.50.1`                      |
|   Wi-Fi   | :symbols-shield-quarter:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2`         | `192.168.50.1`                      |

## :symbols-folder-tree:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point | Drive Type | Drive Capacity {data-sort-method='filesize'} | Device Path                                                    | File System | Encryption                              |
| :---------- | :--------- | :------------------------------------------- | :------------------------------------------------------------- | :---------- | :-------------------------------------- |
| `C:`        | NVMe SSD   | 926 GB                                       | `SCSI\DISK&VEN_NVME&PROD_WD_PC_SN560_SDDP\5&194EBDF0&0&000000` | `ntfs`      | :symbols-shield-keyhole:&nbsp;BitLocker |

#### :symbols-usb:&ensp;External / Attached

| Mount Point | Drive Type | Drive Capacity {data-sort-method='filesize'} | Device Path | File System | Encryption |
| :---------- | :--------- | :------------------------------------------- | :---------- | :---------- | :--------- |
| `-`         | -          | -                                            | `-`         | `-`         | -          |

---
## :symbols-sticky-notes:&ensp;Maintenance & Notes

--8<-- "maintenance-rob-pc.md"
