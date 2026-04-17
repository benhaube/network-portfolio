---
icon: material/desktop-tower
tags: [hardware, pc, desktop, office]
hide:
  - toc
---
![ASUS Logo](../assets/icons/asus-full.svg){ width=300 }&ensp;![Nvidia Logo](../assets/icons/nvidia.svg){ width=30 }&ensp;![Intel Logo](../assets/icons/intel.svg){ width=50 }

# Rob's Desktop PC
[Windows :fontawesome-brands-windows:](https://microsoft.com/windows){ .md-button .md-button--primary }&emsp;[Windows Docs :material-file-document-multiple:](https://support.microsoft.com/en-us/windows){ .md-button }&emsp;[ASUS Support :material-lifebuoy:](https://account.asus.com/us/myproductedit.aspx?rowguid=dc554ee0-d7d2-4018-992d-7267ebccf458&sn=MCM0KK06J149GK4&from=Myproducts){ .md-button }

---
## :material-information-outline: Device Overview

#### :material-toolbox: Role: 

* Rob's main workstation PC

#### :symbols-host: Hostname(s):

* `rob-desktop`

#### :material-map-marker-outline: Location: 

* Office 
* Desk 

#### :material-memory: OS / Firmware: 

* [:material-microsoft:&nbsp;Windows 11 Pro](https://microsoft.com/windows)

#### :material-key-chain: Credentials:

* [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): Secure Notes - "PIN - Rob's Desktop PC"

#### :symbols-monitor-heart: Core Specs:

| CPU | Cores / Threads | CPU Freq. | GPU | GPU Freq. | RAM |
| :-- | :-------------- | :-------- | :-- | :-------- | :-- |
| :brands-intel:&nbsp;Core(r) i7 12700K *(x86-64)* | 12C / 20T | 5.0 GHz | :simple-nvidia:&nbsp;GeForce(r) RTX 3070 | 1725 MHz | 32 GB DDR4 *(3600 MT/s)* |

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| Ethernet | `DHCP` | `50:EB:F6:59:74:C3` | :material-switch:&nbsp;[TP-Link Switch](../02_Hardware/TP-Link_Switch.md) *(Port2)* |
| Wi-Fi | `DHCP` | `70:A6:CC:B5:F5:4A` | :material-wifi:&nbsp;Home *(vlan50)* |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--: | :---------- | :---------- | :------ |
| :material-security:&nbsp;vlan50 | `rob-desktop.internal` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :material-folder-open: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `C:` | NVMe SSD | 464 GB | `SCSI\DISK&VEN_NVME&PROD_SAMSUNG_SSD_970\5&345CC925&0&000000` | `ntfs` | BitLocker |
| `D:` | SATA HDD | 1.81 TB | `SCSI\DISK&VEN_WDC&PROD_WD2003FZEX-00SRL\4&E91BE7&0&050000` | `ntfs` | - |
| `G:` | NVMe SSD | 931 GB | `SCSI\DISK&VEN_NVME&PROD_SAMSUNG_SSD_980\5&EBD909B&0&000000` | `ntfs` | - |

#### :material-usb: External/Attached:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `-` | - | - | `-` | `-` | - |

---
## :material-tools: Maintenance & Notes

> [!note inline] Critical Configurations
> **:material-web-clock: Chrony:**
> + Time synchronizes with local time server running on main router, [[ASUS_RT-BE92U|ASUS RT-BE92U]], using `chrony`.

#### :material-update: Update Process: 

+ Automatic OS, software, firmware, and driver updates enabled with Windows Update.

#### :material-cloud-upload-outline: Backup Policy: 

+ File backup is handled with Window's built-in backup tool. Files in the user's directory are sent to the [[ZimaBoard_2_NAS|ZimaOS NAS]] via [[SMB]].
