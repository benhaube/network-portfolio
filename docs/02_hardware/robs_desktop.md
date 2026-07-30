---
icon: symbols/pc-case
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
![Lucide 'pc-case' icon](../assets/icons/pc-case.svg){ width=200 }

# Rob's Workstation
*High-Performance Desktop PC*

[Windows Docs&ensp;:brands-microsoft:](https://support.microsoft.com/en-us/windows){ .md-button .md-button--primary }&emsp;[User Manual&ensp;:symbols-notebook-text:](../assets/manuals/ASUS_H670-PRO_WIFI_D4_User_Manual.pdf){ .md-button .md-button--primary }&emsp;[UEFI Manual&ensp;:symbols-notebook-text:](../assets/manuals/ASUS_600_Series_UEFI_Manual.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role 

:    Rob's main workstation PC located at his desk in the office upstairs. Connected to the local network through the [TP-Link Switch](tp-link_switch.md#role){ data-preview }.

#### :symbols-host:&ensp;Hostname

:    `Rob-Desktop`

#### :symbols-map-pin:&ensp;Location

:    Office&ensp;:symbols-move-right:&ensp;Desk 

#### :symbols-cpu:&ensp;OS / Firmware

:    [:brands-microsoft:&ensp;Windows 11 Pro](https://microsoft.com/windows){ external-link }

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"PIN - Rob's Desktop PC"

## :symbols-circuit-board:&ensp;Core Specs

| CPU                                              | Cores / Threads | CPU Freq. | RAM                     | GPU                                      | GPU Freq. | VRAM       |
| :----------------------------------------------- | :-------------- | :-------- | :---------------------- | :--------------------------------------- | :-------- | :--------- |
| :brands-intel:&nbsp;Core(r) i7 12700K *(x86-64)* | 12C / 20T       | 5.0 GHz   | 32 GB DDR4 *(3600 MHz)* | :brands-intel:&nbsp;UHD 770 Graphics     | 1500 MHz  | *Shared*   |
|                                                  |                 |           |                         | :brands-nvidia:&nbsp;GeForce(r) RTX 3070 | 1725 MHz  | 8 GB GDDR6 |

## :symbols-network:&ensp;Network Configuration

| Interface | IP Address | MAC Address         | Connected To                                                                                        |
| :-------: | :--------- | :------------------ | :-------------------------------------------------------------------------------------------------- |
| Ethernet  | `DHCP`     | `50:EB:F6:59:74:C3` | [:symbols-ethernet-port:&nbsp;TP-Link Switch](tp-link_switch.md#port-map){ data-preview } *(Port2)* |
|   Wi-Fi   | `DHCP`     | `70:A6:CC:B5:F5:4A` | [:symbols-wifi-lock:&nbsp;Home](asus_rt-be92u.md#wi-fi-networks){ data-preview } *(VLAN50)*         |

| Interface |               VLAN                   | FQDN  | DNS Servers {data-sort-method='none'} | Gateway {data-sort-method='dotsep'} |
| :-------: | :----------------------------------: | :---- | :------------------------------------ | :---------------------------------- |
| Ethernet  | :symbols-shield-quarter:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2`         | `192.168.50.1`                      |
|   Wi-Fi   | :symbols-shield-quarter:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2`         | `192.168.50.1`                      |

## :symbols-folder-tree:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point | Drive Type | Drive Capacity {data-sort-method='filesize'} | Device Path                                                   | File System | Encryption                              |
| :---------- | :--------- | :------------------------------------------- | :------------------------------------------------------------ | :---------- | :-------------------------------------- |
| `C:`        | NVMe SSD   | 464 GB                                       | `SCSI\DISK&VEN_NVME&PROD_SAMSUNG_SSD_970\5&345CC925&0&000000` | `ntfs`      | :symbols-shield-keyhole:&nbsp;BitLocker |
| `D:`        | SATA HDD   | 1.81 TB                                      | `SCSI\DISK&VEN_WDC&PROD_WD2003FZEX-00SRL\4&E91BE7&0&050000`   | `ntfs`      | -                                       |
| `G:`        | NVMe SSD   | 931 GB                                       | `SCSI\DISK&VEN_NVME&PROD_SAMSUNG_SSD_980\5&EBD909B&0&000000`  | `ntfs`      | -                                       |

#### :symbols-usb:&ensp;External / Attached

| Mount Point | Drive Type | Drive Capacity {data-sort-method='filesize'} | Device Path | File System | Encryption |
| :---------- | :--------- | :------------------------------------------- | :---------- | :---------- | :--------- |
| `-`         | -          | -                                            | `-`         | `-`         | -          |

---
## :symbols-sticky-notes:&ensp;Maintenance & Notes

--8<-- "maintenance-rob-pc.md"
