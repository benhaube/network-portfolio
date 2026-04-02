---
tags: [hardware, pc, desktop]
hide:
  - toc
---
![[asus-full.svg|300]]

# [[Rob's_Desktop|Rob's Desktop PC]]
[Windows :fontawesome-brands-windows:](https://microsoft.com/windows){ .md-button .md-button--primary }&emsp;[Windows Docs :material-file-document-multiple:](https://support.microsoft.com/en-us/windows){ .md-button }&emsp;[ASUS Support :material-lifebuoy:](https://account.asus.com/us/myproductedit.aspx?rowguid=dc554ee0-d7d2-4018-992d-7267ebccf458&sn=MCM0KK06J149GK4&from=Myproducts){ .md-button }

---
## Device Overview
* **Role:** Rob's main workstation PC
* **Hostname(s):** `rob-desktop`
* **Location:** 
    * Office 
    * Desk 
* **OS / Firmware:** &nbsp;:material-microsoft:&nbsp;[Windows 11 Pro](https://microsoft.com/windows)
* **Credentials:** &nbsp;:services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): Secure Notes - "PIN - Rob's Desktop PC"

## Network Configuration
**:material-ethernet: Network Interface:**

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| Ethernet | `DHCP` | `50:EB:F6:59:74:C3` | Port 2: [TP-Link Switch](../02_Hardware/TP-Link_Switch.md) |
| Wi-Fi | `DHCP` | `70:A6:CC:B5:F5:4A` | SSID: *Home (vlan50)* |

**:material-ip-network: IP Configuration:**

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--: | :---------- | :---------- | :------ |
| vlan50 | `rob-desktop.internal` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## Storage & Mounts
**:material-harddisk: Internal Drive(s):**

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `C:` | NVMe SSD | 464 GB | `SCSI\DISK&VEN_NVME&PROD_SAMSUNG_SSD_970\5&345CC925&0&000000` | `ntfs` | BitLocker |
| `D:` | SATA HDD | 1.81 TB | `SCSI\DISK&VEN_WDC&PROD_WD2003FZEX-00SRL\4&E91BE7&0&050000` | `ntfs` | - |
| `G:` | NVMe SSD | 931 GB | `SCSI\DISK&VEN_NVME&PROD_SAMSUNG_SSD_980\5&EBD909B&0&000000` | `ntfs` | - |

**:material-usb: External/Attached:**

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `-` | - | - | `-` | `-` | - |

---
## Maintenance & Notes
> [!NOTE] Critical Configurations
> 1. **:material-clock-outline: Chrony:** 
>     + Time synchronizes with local time server running on main router, [[ASUS_RT-BE92U|ASUS RT-BE92U]], using `chrony`.

**:material-update: Update Process:** Automatic OS, software, firmware, and driver updates enabled with Windows Update.

**:material-cloud-upload-outline: Backup Policy:** File backup is handled with Window's built-in backup tool. Files in the user's directory are sent to the [[ZimaBoard_2_NAS|NAS]] via [[SMB]].
