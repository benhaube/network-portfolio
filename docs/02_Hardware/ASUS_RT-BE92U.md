---
icon: material/router-wireless
title: ASUS RT-BE92U
subtitle: Wireless Router
tags:
  - Hardware
  - Network
  - Router
  - Infrastructure
  - Remote Access
  - DNS
  - IoT
  - Living Room
hide:
  - toc
---
![ASUS Router Icon](../assets/icons/asus-router-light.svg#only-light){ width=200 }
![ASUS Router Icon](../assets/icons/asus-router.svg#only-dark){ width=200 }

# ASUS RT-BE92U
*Wireless Router*

[Router Web-UI :material-application-cog:](https://asusrouter.internal:8443/Main_Login.asp){ .md-button .md-button--primary }&emsp;[Asuswrt-Merlin :material-wizard-hat:](https://github.com/RMerl/asuswrt-merlin.ng/wiki){ .md-button .md-button--primary }&emsp;[ASUS Support :material-lifebuoy:](https://account.asus.com/us/myproductedit.aspx?rowguid=d50535eb-570b-44c6-87c6-e77cd9e5eb09&sn=T5IG7L216442EU5&from=Myproducts){ .md-button .md-button--primary }

---
## :material-information-outline: Device Overview

#### :material-toolbox: Role: 
+ The main wireless router and firewall for the local network.

#### :symbols-host: Hostname(s):
+ `asusrouter`

#### :material-map-marker-outline: Location: 
+ Living-Room

#### :material-memory: OS / Firmware: 
+ [:material-wizard-hat:&nbsp;Asuswrt-Merlin](https://www.asuswrt-merlin.net/) *(3006.102.7_2)*

#### :material-key-chain: Credentials:
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Asus Router"
    + SSH Keys&ensp;:material-arrow-right-thin:&ensp;"Admin@asusrouter"

## :material-lan: Network Configuration

#### :material-wan: WAN Connection:

| Interface | IP Address | MAC Address         | Connected To                                         |
| :-------: | :--------- | :------------------ | :--------------------------------------------------- |
|   WAN0    | `DHCP`     | `60:CF:84:51:FA:F0` | :material-ethernet:&nbsp;2.5 Gb/s WAN / LAN (Port 1) |
|   WAN1    | `Disabled` | `xx:xx:xx:xx:xx:xx` | -                                                    |

#### :material-lan: Virtual Local Networks:

|                   VLAN                   | Domain   | DNS Server(s)                 | Gateway        | Subnet            | Subnet Mask     | Broadcast        | DHCP Range     |
| :--------------------------------------: | :------- | :---------------------------- | :------------- | :---------------- | :-------------- | :--------------- | :------------- |
|     :material-security:&nbsp;VLAN50      | internal | `192.168.50.6` `192.168.50.2` | `192.168.50.1` | `192.168.50.0/24` | `255.255.255.0` | `192.168.50.255` | `.6` to `.254` |
| :symbols-shield-person-fill:&nbsp;VLAN52 | -        | `9.9.9.9` `149.112.112.112`   | `192.168.52.1` | `192.168.52.0/24` | `255.255.255.0` | `192.168.52.255` | `.2` to `.254` |
| :symbols-shield-house-fill:&nbsp;VLAN53  | -        | `9.9.9.9` `149.112.112.112`   | `192.168.53.1` | `192.168.53.0/24` | `255.255.255.0` | `192.168.53.255` | `.2` to `.254` |

#### :material-wifi: Wi-Fi Networks:

|     SSID     |  VLAN  |    WAN Access    | IP Address        | Frequency             | Notes                                        |
| :----------: | :----: | :--------------: | :---------------- | :-------------------- | :------------------------------------------- |
|    *Home*    | VLAN50 | :material-check: | `192.168.50.0/24` | 2.4 GHz, 5 GHz, 6 GHz | :material-security:&nbsp;Trusted VLAN        |
| *Home_Guest* | VLAN52 | :material-check: | `192.168.52.0/24` | 2.4 GHz, 5 GHz        | :symbols-shield-person-fill:&nbsp;Guest VLAN |
|   *2G_IoT*   | VLAN53 | :material-close: | `192.168.53.0/24` | 2.4 GHz               | :symbols-shield-house-fill:&nbsp;IoT VLAN    |

#### :material-ethernet: Physical Ethernet Ports:

|       Port #       | Connected Device                                                        | Color / Type | Notes               |
| :----------------: | :---------------------------------------------------------------------- | :----------- | :------------------ |
| 10 Gb WAN / LAN 1  | :material-switch:&nbsp;[Ugreen Switch](../02_Hardware/Ugreen_Switch.md) | Black Cat6a  | 10 Gb/s Uplink      |
| 2.5 Gb WAN / LAN 2 | :material-wan:&nbsp;[Hitron Modem](../02_Hardware/Hitron_Modem.md)      | Black Cat6a  | WAN Connection      |
|    2.5 Gb LAN 1    | :devices-10-inch-rack:&nbsp;Mini-Rack                                   | Black Cat6a  | Spare Keystone Jack |
|    2.5 Gb LAN 2    | :material-ethernet:&nbsp;*Empty*                                        | -            | -                   |
|    2.5 Gb LAN 3    | :material-ethernet:&nbsp;*Empty*                                        | -            | -                   |
|    2.5 Gb LAN 4    | :material-ethernet:&nbsp;*Empty*                                        | -            | -                   |

## :symbols-storage: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption |
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/`         | eMMC       | 49.1 MB        | `/dev/root` | `squashfs`  | -          |
| `/jffs`     | -          | 44.5 MB        | `ubi:jffs2` | `ubifs`     | -          |
| `/data`     | -          | 16.8 MB        | `bui:data`  | `ubifs`     | -          |

#### :material-usb: External / Attached:

| Mount Point           | Drive Type      | Drive Capacity | Device Path | File System | Encryption |
| :-------------------- | :-------------- | :------------- | :---------- | :---------- | :--------- |
| `/tmp/mnt/router-usb` | USB Flash Drive | 28.3 GB        | `/dev/sda1` | `ext4`      | -          |

## :material-web: Services / Docker Containers

#### :material-linux: Native:

|  Status  | Service                                                                 | Port(s) | Role / Notes                                                                                   |
| :------: | :---------------------------------------------------------------------- | :-----: | :--------------------------------------------------------------------------------------------- |
| *Active* | :material-web-clock:&nbsp;[Chrony](../03_Services/Chrony.md)            |  `123`  | Advanced, lightweight NTP client and server.                                                   |
| *Active* | :material-console-network:&nbsp;[SSH](../03_Services/SSH.md)            |  `22`   | Provides secure encrypted communications between two untrusted hosts over an insecure network. |
| *Active* | :simple-wireguard:&nbsp;[WireGuard](../03_Services/Wireguard_Server.md) | `41820` | An extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography.       |

---
## :material-tools: Maintenance & Notes

> [!config inline end] Critical Configurations
> **:material-backup-restore:&nbsp;Backup Restore:**
> :    Do not restore regular ASUS settings backup. Use `backupmon` over SSH instead. This backup / restore utility does a much more comprehensive backup than the ASUS tool. It backs up the NVRAM, JFFS partition, and the external USB drive. The backups are stored on the [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) and the [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md). 
>
> **:material-web-clock:&nbsp;NTP Server:**
> :    The router acts as the NTP server for the entire network. The "NTP-Director" feature is used to capture all NTP packets and redirect them to its own **Chrony** server, so devices that do not have their own NTP settings are still using the router to update their time. 

#### :material-update: Update Process:

+ Automatic **Asuswrt-Merlin** firmware updates with the [MerlinAU](https://github.com/ExtremeFiretop/MerlinAutoUpdate-Router) tool.
+ Email notifications enabled for [AMTM](https://github.com/RMerl/asuswrt-merlin.ng/wiki/AMTM) and script updates.
    + Notification emails are sent to: <mailto:admin@haube-pereira.com> 
+ For Entware packages use the command, `opkg update`, or update with **AMTM** script.

#### :material-cloud-upload-outline: Backup Policy:

+ The NVRAM, JFFS, and external USB drive are backed up automatically once a week on Sundays *(at 3:00 UTC-5)* to [ZimaOS NAS](./ZimaBoard_2_NAS.md) and [Raspberry Pi 4B Server](./Raspberry_Pi_4B_Server.md) using the [BACKUPMON](https://github.com/ViktorJp/BACKUPMON) script.
+ **Backup Directory:**
    + ZimaOS NAS: `/media/Quick-Storage/Backup/router`
    + Pi 4B Server: `/mnt/usb-drive/smb-share/router`

#### :services-gotify-notification: Gotify Push Notifications:

+ While most automated notifications from the router are sent via email, there are a few services that utilize the [Gotify](../03_Services/Gotify.md) server to send instant push notifications for events that may require an urgent response.

##### SSH Session Alerts

+ A custom script is used to send a push notification through the Gotify server whenever a new SSH session is successfully established with the router. The notification reports the user, hostname, and cliet IP address.
+ To see the script and detailed configuration information, see the ["SSH Session Alerts"](../03_Services/Gotify.md#ssh-session-alerts) section on the Gotify service documentation page.

##### WAN IP Change

+ Whenever the WAN IP address changes or the WAN connection drops then reconnets; a push notification is sent through the Gotify server. 
+ To see the script and detailed configuration information, see the ["WAN IP Change"](../03_Services/Gotify.md#wan-ip-change) section of the Gotify service documentation page.  

##### BACKUPMON Alerts

+ Every time the BACKUPMON utility completes a backup of the router's NVRAM, JFFS partition, and external USB drive an alert is sent to the Gotify server. The push notification details the success or failure of the backup.
+ To see the script and detailed configuration information, see the ["BACKUPMON Alerts"](../03_Services/Gotify.md#backupmon-alerts) section of the Gotify service documentation page.

##### Connmon Alerts

+ The Connmon utility monitors the router's WAN connection by measuring the ping, jitter, and line quality. Whenever the tests fail *(lost connection)* or the measured values are greater than the set threshold an alert is sent to the Gotify server.
+ To see the script and detailed configuration information, see the ["Conmon Alerts"](../03_Services/Gotify.md#connmon-alerts) section of the Gotify service documentation page.