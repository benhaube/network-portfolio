---
icon: material/laptop
title: Rob's Laptop PC
tags: 
  - Hardware 
  - PC 
  - Laptop 
  - Mobile
  - Windows
  - Remote Access
hide:
  - toc
---
![ASUS TUF Gaming Logo](../assets/icons/asus-tuf-light.svg#only-light){ width=200 }
![ASUS TUF Gaming Logo](../assets/icons/asus-tuf-dark.svg#only-dark){ width=200 }
&ensp;![AMD Logo](../assets/icons/amd-small.svg){ width=20 }&ensp;![Nvidia Logo](../assets/icons/nvidia.svg){ width=25 }

# Rob's Laptop PC
[Windows Docs :material-microsoft:](https://support.microsoft.com/en-us/windows){ .md-button .md-button--primary }&emsp;[ASUS Support :material-lifebuoy:](https://account.asus.com/us/){ .md-button }

---
## :material-information-outline: Device Overview

#### :material-toolbox: Role: 
+ Rob's laptop PC for work and gaming

#### :symbols-host: Hostname(s):
+ `ems1`

#### :material-map-marker-outline: Location: 
+ Mobile

#### :material-memory: OS / Firmware: 
+ [:material-microsoft:&nbsp;Windows 11 Home](https://microsoft.com/windows)

#### :material-key-chain: Credentials:
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"PIN - Rob's Laptop PC"

#### :symbols-monitor-heart: Core Specs:

| CPU                                            | Cores / Threads | CPU Freq. | RAM                      | GPU                                              | GPU Freq. | VRAM       | 
| :--------------------------------------------- | :-------------- | :-------- | :----------------------- | :----------------------------------------------- | :-------- | :--------- |
| :brands-amd:&nbsp;Ryzen(r) 9 7940HS *(x86-64)* | 8C / 16T        | 4.0 GHz   | 16 GB DDR5 *(4800 MT/s)* | :brands-amd:&nbsp;Radeon(r) 780M                 | 2700 MHz  | *Shared*   |
|                                                |                 |           |                          | :simple-nvidia:&nbsp;GeForce RTX 4070 *(mobile)* | 2175 MHz  | 8 GB GDDR6 |

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address         | Connected To                                                                                             |
| :-------: | :--------- | :------------------ | :------------------------------------------------------------------------------------------------------- |
| Ethernet  | `DHCP`     | `E8:9C:25:90:8B:11` | :material-switch:&nbsp;[Ugreen Switch](../02_Hardware/Ugreen_Switch.md) *(Port-1)*, Temporary connection |
| Wi-Fi     | `DHCP`     | `F8:54:F6:C1:88:D2` | :material-wifi:&nbsp;Home *(VLAN50)*                                                                     |

#### :material-ip-network: IP Configuration:

| VLAN                            | Hostname(s)     | DNS Servers                   | Gateway        |
| :-----------------------------: | :-------------- | :---------------------------- | :------------- |
| :material-security:&nbsp;VLAN50 | `ems1.internal` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :symbols-storage: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path                                                    | File System | Encryption | 
| :---------- | :--------- | :------------- | :------------------------------------------------------------- | :---------- | :--------- |
| `C:`        | NVMe SSD   | 926 GB         | `SCSI\DISK&VEN_NVME&PROD_WD_PC_SN560_SDDP\5&194EBDF0&0&000000` | `ntfs`      | BitLocker  |

#### :material-usb: External / Attached:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `-`         | -          | -              | `-`         | `-`         | -          |

---
## :material-tools: Maintenance & Notes

--8<-- "maintenance-rob-pc.md"
