---
tags:
  - hardware
  - network
  - router
  - infrastructure
  - remote-access
  - dns
  - InternetofThings
hide:
  - toc
---
![[asus-router.svg|200]]

# [[ASUS_RT-BE92U|ASUS RT-BE92U]]
[Docs :material-file-document-multiple:](https://github.com/RMerl/asuswrt-merlin.ng/wiki){ .md-button .md-button--primary }&emsp;[Support :material-lifebuoy:](https://account.asus.com/us/myproductedit.aspx?rowguid=d50535eb-570b-44c6-87c6-e77cd9e5eb09&sn=T5IG7L216442EU5&from=Myproducts){ .md-button }

---
## :material-information-outline: Device Overview

* **Role:** Main Router
* **Hostname(s):** `asusrouter`
* **Location:** 
    * Living-Room
* **OS / Firmware:** 
    * :material-router-network-wireless:&nbsp;[asuswrt-merlin](https://www.asuswrt-merlin.net/) *(3006.102.7_2)*
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): "Asus Router"

## :material-lan: Network Configuration

#### :material-wan: WAN Connection:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| WAN0 | `DHCP` | `60:CF:84:51:FA:F0` | 2.5Gb/s WAN/LAN (Port 1) |
| WAN1 | `disabled` | `xx:xx:xx:xx:xx:xx` | - |

#### :material-lan: Local Networks:

| VLAN | Domain | DNS Server(s) | Gateway | Subnet | Subnet Mask | Broadcast | DHCP Range |
| :--: | :----- | :------------ | :------ | :----- | :---------- | :-------- | :--------- |
| *vlan50* | internal | `192.168.50.6` `192.168.50.2` | `192.168.50.1` | `192.168.50.0/24` | `255.255.255.0` | `192.168.50.255` | `.6` to `.254` |
| *vlan52* | - | `9.9.9.9` `149.112.112.112` | `192.168.52.1` | `192.168.52.0/24` | `255.255.255.0` | `192.168.52.255` | `.2` to `.254` |
| *vlan53* | - | `9.9.9.9` `149.112.112.112` | `192.168.53.1` | `192.168.53.0/24` | `255.255.255.0` | `192.168.53.255` | `.2` to `.254` |

#### :material-wifi: Wi-Fi Networks:

| SSID | VLAN | IP Address | Frequency | Notes |  
| :--: | :--: | :--------- | :-------- | :---- |
| *Home* | *vlan50* | `192.168.50.0/24` | 2.4GHz, 5GHz, 6GHz | Main Wi-Fi Network |
| *Home_Guest* | *vlan52* | `192.168.52.0/24` | 2.4GHz, 5GHz | Guest Wi-Fi Network |
| *2G_IoT* | *vlan53* | `192.168.53.0/24` | 2.4GHz | Main IoT Network |

#### :material-ethernet: Physical Ethernet Ports:

> [!info]-
> *Use this table to track physical cabling.*

| Port # | Connected Device | Color / Type | Notes |
| :----: | :--------------- | :----------- | :---- |
| 10Gb WAN/LAN 1 | :material-switch: [Ugreen Switch](../02_Hardware/Ugreen_Switch.md) | Black Cat6a | 10Gb/s Uplink |
| 2.5Gb WAN/LAN 2 | :material-wan: [Hitron Modem](../02_Hardware/Hitron_Modem.md) | Black Cat6a | WAN Connection |
| 2.5Gb LAN 1 | :material-ethernet: Mini-Rack | Black Cat6a | Spare Keystone Jack |
| 2.5Gb LAN 2 | :material-ethernet: *Empty* | - | - |
| 2.5Gb LAN 3 | :material-ethernet: *Empty* | - | - |
| 2.5Gb LAN 4 | :material-ethernet: *Empty* | - | - |

## :material-folder-open: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/` | eMMC | 49.1 MB | `/dev/root` | `squashfs` | - |
| `/jffs` | - | 44.5 MB | `ubi:jffs2` | `ubifs` | - |
| `/data` | - | 16.8 MB | `bui:data` | `ubifs` | - |

#### :material-usb: External/Attached:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/tmp/mnt/router-usb` | USB Flash Drive | 28.3 GB | `/dev/sda1` | `ext4` | - |

## :material-web: Services / Docker Containers

#### :simple-linux: Native:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :material-clock-outline: Chrony | `123` | Network time server. |
| *Active* | :material-console-network: [SSH (Secure Shell)](../03_Services/SSH.md) | `22` | Remote terminal access. |
| *Active* | :simple-wireguard: [WireGuard](../03_Services/Wireguard_Server.md) | `41820` | Remote access VPN server. |

---
## :material-tools: Maintenance & Notes

> [!note] Critical Configurations
> Do not restore regular ASUS settings backup. Use `backupmon` over SSH instead. 
> 
> [Documentation](https://github.com/RMerl/asuswrt-merlin.ng/wiki) for asuswrt-merlin.

#### :material-update: Update Process:

+ Automatic firmware and script update email notifications enabled. 
+ For Entware packages use the command, `opkg update`, or update with `amtm` script.

#### :material-cloud-upload-outline: Backup Policy:

+ Firmware and settings backed up automatically to [[ZimaBoard_2_NAS|ZimaBoard 2 NAS]] and [[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]].
