---
icon: material/router-wireless
title: ASUS RT-BE92U
tags:
  - hardware
  - network
  - router
  - infrastructure
  - remote-access
  - dns
  - IoT
  - living-room
hide:
  - toc
---
![ASUS Router Icon](../assets/icons/asus-router-light.svg#only-light){ width=200 }
![ASUS Router Icon](../assets/icons/asus-router.svg#only-dark){ width=200 }

# ASUS RT-BE92U
[Docs :material-file-document-multiple:](https://github.com/RMerl/asuswrt-merlin.ng/wiki){ .md-button .md-button--primary }&emsp;[Support :material-lifebuoy:](https://account.asus.com/us/myproductedit.aspx?rowguid=d50535eb-570b-44c6-87c6-e77cd9e5eb09&sn=T5IG7L216442EU5&from=Myproducts){ .md-button }

---
## :material-information-outline: Device Overview

#### :material-toolbox: Role: 
+ Main Router

#### :symbols-host: Hostname(s):
+ `asusrouter`

#### :material-map-marker-outline: Location: 
+ Living-Room

#### :material-memory: OS / Firmware: 
+ [:material-wizard-hat:&nbsp;asuswrt-merlin](https://www.asuswrt-merlin.net/) *(3006.102.7_2)*

#### :material-key-chain: Credentials:
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "Asus Router"

## :material-lan: Network Configuration

#### :material-wan: WAN Connection:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| WAN0 | `DHCP` | `60:CF:84:51:FA:F0` | :material-ethernet:&nbsp;2.5 Gb/s WAN / LAN (Port 1) |
| WAN1 | `disabled` | `xx:xx:xx:xx:xx:xx` | - |

#### :material-lan: Local Networks:

| VLAN | Domain | DNS Server(s) | Gateway | Subnet | Subnet Mask | Broadcast | DHCP Range |
| :--: | :----- | :------------ | :------ | :----- | :---------- | :-------- | :--------- |
| :material-security:&nbsp;*vlan50* | internal | `192.168.50.6` `192.168.50.2` | `192.168.50.1` | `192.168.50.0/24` | `255.255.255.0` | `192.168.50.255` | `.6` to `.254` |
| :material-account-multiple:&nbsp;*vlan52* | - | `9.9.9.9` `149.112.112.112` | `192.168.52.1` | `192.168.52.0/24` | `255.255.255.0` | `192.168.52.255` | `.2` to `.254` |
| :material-home-automation:&nbsp;*vlan53* | - | `9.9.9.9` `149.112.112.112` | `192.168.53.1` | `192.168.53.0/24` | `255.255.255.0` | `192.168.53.255` | `.2` to `.254` |

#### :material-wifi: Wi-Fi Networks:

| SSID | VLAN | WAN Access | IP Address | Frequency | Notes |  
| :--: | :--: | :--------: | :--------- | :-------- | :---- |
| *Home* | *vlan50* | :material-check: | `192.168.50.0/24` | 2.4 GHz, 5 GHz, 6 GHz | :material-security:&nbsp;Trusted VLAN |
| *Home_Guest* | *vlan52* | :material-check: | `192.168.52.0/24` | 2.4 GHz, 5 GHz | :material-account-multiple:&nbsp;Guest VLAN |
| *2G_IoT* | *vlan53* | :material-close: | `192.168.53.0/24` | 2.4 GHz | :material-home-automation:&nbsp;IoT VLAN |

#### :material-ethernet: Physical Ethernet Ports:

| Port # | Connected Device | Color / Type | Notes |
| :----: | :--------------- | :----------- | :---- |
| 10 Gb WAN / LAN 1 | :material-switch:&nbsp;[Ugreen Switch](../02_Hardware/Ugreen_Switch.md) | Black Cat6a | 10 Gb/s Uplink |
| 2.5 Gb WAN / LAN 2 | :material-wan:&nbsp;[Hitron Modem](../02_Hardware/Hitron_Modem.md) | Black Cat6a | WAN Connection |
| 2.5 Gb LAN 1 | :devices-10-inch-rack:&nbsp;Mini-Rack | Black Cat6a | Spare Keystone Jack |
| 2.5 Gb LAN 2 | :material-ethernet:&nbsp;*Empty* | - | - |
| 2.5 Gb LAN 3 | :material-ethernet:&nbsp;*Empty* | - | - |
| 2.5 Gb LAN 4 | :material-ethernet:&nbsp;*Empty* | - | - |

## :symbols-storage: Storage & Mounts

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

#### :material-linux: Native:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :material-web-clock:&nbsp;[Chrony *(NTP Server)*](../03_Services/Chrony.md) | `123` | Advanced, lightweight NTP client and server. |
| *Active* | :material-console-network:&nbsp;[SSH](../03_Services/SSH.md) | `22` | Remote terminal access. |
| *Active* | :simple-wireguard:&nbsp;[WireGuard](../03_Services/Wireguard_Server.md) | `41820` | Remote access VPN server. |

---
## :material-tools: Maintenance & Notes

> [!note inline] Critical Configurations
> Do not restore regular ASUS settings backup. Use `backupmon` over SSH instead. 
> 
> **Documentation:**
>
> [asuswrt-merlin Docs :material-file-document-multiple:](https://github.com/RMerl/asuswrt-merlin.ng/wiki){ .md-button }

#### :material-update: Update Process:

+ Automatic firmware and script update email notifications enabled. 
+ For Entware packages use the command, `opkg update`, or update with `amtm` script.

#### :material-cloud-upload-outline: Backup Policy:

+ Firmware and settings backed up automatically to [[ZimaBoard_2_NAS|ZimaOS NAS]] and [[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]].
