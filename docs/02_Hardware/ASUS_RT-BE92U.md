---
icon: symbols/router
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
![Material Design 'router-wireless' icon](../assets/icons/router-wireless-merlin.svg){ width=200 }

# ASUS RT-BE92U
*Wireless Router*

[Asuswrt-Merlin Docs&ensp;:symbols-wizard-hat:](https://github.com/RMerl/asuswrt-merlin.ng/wiki){ .md-button .md-button--primary }&emsp;[Router Settings&ensp;:symbols-settings:](https://asusrouter.internal:8443/Main_Login.asp){ .md-button .md-button--primary }&emsp;[Manual&ensp;:symbols-notebook-text:](../assets/manuals/RT-BE92U_Manual.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role

:    The main wireless router and firewall for the local network. Located next to the 10-inch mini-rack in the living room on the main floor. The standard firmware has been replaced with [Asuswrt-Merlin](https://www.asuswrt-merlin.net/), a more powerful option that retains the standard ASUS features / UI and adds a lot of great features and capabilities.

#### :symbols-host:&ensp;Hostname

+ `RT-BE92U-FAF0`

#### :symbols-location:&ensp;Location 

+ Living-Room

#### :symbols-memory:&ensp;OS / Firmware

+ [:symbols-wizard-hat:&nbsp;Asuswrt-Merlin](https://www.asuswrt-merlin.net/) *(3006.102.7_2)*

#### :symbols-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Asus Router"
    + SSH Keys&ensp;:material-arrow-right-thin:&ensp;"ASUS RT-BE91U (Admin)"

## :symbols-lan:&ensp;Network Configuration

#### :material-wan:&ensp;WAN Connection

| Interface | IP Address | MAC Address         | Connected To                                           |
| :-------: | :--------- | :------------------ | :----------------------------------------------------- |
|   WAN0    | `DHCP`     | `60:CF:84:51:FA:F0` | :material-ethernet:&nbsp;2.5 Gb/s WAN / LAN *(port 1)* |
|   WAN1    | `Disabled` | `xx:xx:xx:xx:xx:xx` | -                                                      |

#### :symbols-lan-outline:&ensp;Virtual Local Networks

|                   VLAN                   | Domain   | DNS Server(s)                 | CIDR              | Gateway        | Broadcast        | DHCP Range      |
| :--------------------------------------: | :------- | :---------------------------- | :---------------- | :------------- | :--------------- | :-------------- |
|      :symbols-security:&nbsp;VLAN50      | internal | `192.168.50.6` `192.168.50.2` | `192.168.50.0/24` | `192.168.50.1` | `192.168.50.255` | `.22` to `.254` |
| :symbols-shield-person-fill:&nbsp;VLAN52 | -        | `9.9.9.9` `149.112.112.112`   | `192.168.52.0/24` | `192.168.52.1` | `192.168.52.255` | `.2` to `.254`  |
| :symbols-shield-house-fill:&nbsp;VLAN53  | -        | `9.9.9.9` `149.112.112.112`   | `192.168.53.0/24` | `192.168.53.1` | `192.168.53.255` | `.3` to `.254`  |

#### :symbols-android-wifi-lock:&ensp;Wi-Fi Networks

|     SSID     |  VLAN  |   WAN Access    | CIDR              | Frequency             | Notes                                        |
| :----------: | :----: | :-------------: | :---------------- | :-------------------- | :------------------------------------------- |
|    *Home*    | VLAN50 | :symbols-check: | `192.168.50.0/24` | 2.4 GHz, 5 GHz, 6 GHz | :symbols-security:&nbsp;Trusted VLAN         |
| *Home_Guest* | VLAN52 | :symbols-check: | `192.168.52.0/24` | 2.4 GHz, 5 GHz        | :symbols-shield-person-fill:&nbsp;Guest VLAN |
|   *2G_IoT*   | VLAN53 | :symbols-close: | `192.168.53.0/24` | 2.4 GHz               | :symbols-shield-house-fill:&nbsp;IoT VLAN    |

#### :material-ethernet:&ensp;Physical Ethernet Ports

|       Port #       | Connected Device                                                               | Color / Type  | Notes               |
| :----------------: | :----------------------------------------------------------------------------- | :------------ | :------------------ |
| 10 Gb WAN / LAN 1  | [:material-switch:&nbsp;Ugreen Switch](./Ugreen_Switch.md)                     | Black / Cat6a | 10 Gb/s Uplink      |
| 2.5 Gb WAN / LAN 2 | [:material-wan:&nbsp;Hitron Modem](./Hitron_Modem.md)                          | Black / Cat6a | WAN Connection      |
|    2.5 Gb LAN 1    | <a href="./tags.html#tag:mini-rack">:symbols-10-inch-rack:&nbsp;Mini-Rack</a>  | Black / Cat6a | Spare Keystone Jack |
|    2.5 Gb LAN 2    | [:material-switch:&nbsp;TP-Link LiteWave Switch](./TP-Link_LiteWave_Switch.md) | White / Cat6  | 1 Gb/s Uplink       |
|    2.5 Gb LAN 3    | :material-ethernet:&nbsp;*Empty*                                               | -             | -                   |
|    2.5 Gb LAN 4    | :material-ethernet:&nbsp;*Empty*                                               | -             | -                   |

## :symbols-storage:&ensp;Storage & Mounts

#### :material-harddisk:&ensp;Internal Drive(s)

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption |
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/`         | eMMC       | 49.1 MB        | `/dev/root` | `squashfs`  | -          |
| `/jffs`     | -          | 44.5 MB        | `ubi:jffs2` | `ubifs`     | -          |
| `/data`     | -          | 16.8 MB        | `bui:data`  | `ubifs`     | -          |

#### :symbols-usb:&ensp;External / Attached

| Mount Point           | Drive Type      | Drive Capacity | Device Path | File System | Encryption |
| :-------------------- | :-------------- | :------------- | :---------- | :---------- | :--------- |
| `/tmp/mnt/router-usb` | USB Flash Drive | 28.3 GB        | `/dev/sda1` | `ext4`      | -          |

## :symbols-web:&ensp;Services / Docker Containers

#### :material-linux:&ensp;Native

|  Status  | Service                                                                 | Port(s) | Role / Notes                                                                                                                                                                                            |
| :------: | :---------------------------------------------------------------------- | :-----: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| *Active* | [:material-web-clock:&nbsp;Chrony](../03_Services/Chrony.md)            |  `123`  | Advanced, lightweight NTP client and server.                                                                                                                                                            |
| *Active* | [:material-web-refresh:&nbsp;DDNS](../03_Services/DDNS.md)              |  `N/A`  | A networking service that automatically maps a static domain name *(hostname)* to a dynamic public IP address. On this local network, the DDNS service is provided by [addr.tools](https://addr.tools). |
| *Active* | [:material-console-network:&nbsp;SSH](../03_Services/SSH.md)            |  `22`   | Provides secure encrypted communications between two untrusted hosts over an insecure network.                                                                                                          |
| *Active* | [:simple-wireguard:&nbsp;WireGuard](../03_Services/Wireguard_Server.md) | `41820` | An extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography.                                                                                                                |

---
## :symbols-note-stack-fill:&ensp;Maintenance & Notes

!!! config inline end "Critical Configurations"

    **:symbols-restore:&ensp;Backup Restore:**
    :    Do not restore regular ASUS settings backup. Use `backupmon` over SSH instead. This backup / restore utility does a much more comprehensive backup than the ASUS tool. It backs up the NVRAM, JFFS partition, and the external USB drive. The backups are stored on the [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) and the [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md). 

    **:material-web-clock:&ensp;NTP Server:**
    :    The router acts as the NTP server for the entire network. The "NTP-Director" feature is used to capture all NTP packets and redirect them to its own **Chrony** server, so devices that do not have their own NTP settings are still using the router to update their time. 

#### :symbols-update:&ensp;Update Process

+ Automatic **Asuswrt-Merlin** firmware updates with the [MerlinAU](https://github.com/ExtremeFiretop/MerlinAutoUpdate-Router) tool.
+ Email notifications enabled for [AMTM](https://github.com/RMerl/asuswrt-merlin.ng/wiki/AMTM) and script updates.
    + Notification emails are sent to: <mailto:admin@haube-pereira.com> 
+ For Entware packages use the command, `opkg update`, or update with **AMTM** script.

#### :symbols-backup:&ensp;Backup Policy

+ The NVRAM, JFFS, and external USB drive are backed up automatically once a week on Sundays *(at 3:00 UTC-5)* to [ZimaOS NAS](./ZimaBoard_2_NAS.md) and [Raspberry Pi 4B Server](./Raspberry_Pi_4B_Server.md) using the [BACKUPMON](https://github.com/ViktorJp/BACKUPMON) script.
+ **Backup Directory:**
    + ZimaOS NAS: `/media/Quick-Storage/Backup/router`
    + Pi 4B Server: `/mnt/usb-drive/smb-share/router`
+ Backups of the router settings stored on the **ZimaOS NAS** are then backed up to the cloud storage provider, [Backblaze B2](https://www.backblaze.com/cloud-storage), to maintain the [3-2-1 Backup Strategy](../01_Infrastructure/Disaster_Recovery_Plan.md#backup-strategy).

#### :services-gotify-notification:&ensp;Gotify Push Notifications

:    While most automated notifications from the router are sent via email, there are a few services that utilize the [Gotify](../03_Services/Gotify.md) server to send instant push notifications for events that may require an urgent response.

##### SSH Session Alerts

+ A custom script is used to send a push notification through the Gotify server whenever a new SSH session is successfully established with the router. The notification reports the user, hostname, and client IP address.
+ To see the script and detailed configuration information, see the ["SSH Session Alerts"](../03_Services/Gotify.md#ssh-alerts) section on the Gotify service documentation page.

##### WAN IP Change

+ Whenever the WAN IP address changes or the WAN connection drops then reconnects; a push notification is sent through the Gotify server. 
+ To see the script and detailed configuration information, see the ["WAN IP Change"](../03_Services/Gotify.md#wan-ip-change) section of the Gotify service documentation page.  

##### BACKUPMON Alerts

+ Every time the BACKUPMON utility completes a backup of the router's NVRAM, JFFS partition, and external USB drive an alert is sent to the Gotify server. The push notification details the success or failure of the backup.
+ To see the script and detailed configuration information, see the ["BACKUPMON Alerts"](../03_Services/Gotify.md#backupmon-alerts) section of the Gotify service documentation page.

##### Connmon Alerts

+ The Connmon utility monitors the router's WAN connection by measuring the ping, jitter, and line quality. Whenever the tests fail *(lost connection)* or the measured values are greater than the set threshold an alert is sent to the Gotify server.
+ To see the script and detailed configuration information, see the ["Connmon Alerts"](../03_Services/Gotify.md#connmon-alerts) section of the Gotify service documentation page.

##### DHCP Event Alerts

+ The router's DHCP server assigns IP addresses to all devices that connect to the local network using the `dnsmasq` service. This service has a native `dhcp-script` configuration flag that triggers exactly when a lease is created, renewed, or deleted. The catch is that Asuswrt-Merlin already uses this flag to run its own internal script *(`/sbin/dhcpc_lease`)*, which populates the router's UI Network Map. If you simply overwrite the flag with a standard custom config, you'll break Asuswrt's internal tracking.
+ The logical workaround is to use the `dnsmasq.postconf` script to seamlessly hijack the configuration and point it to a custom wrapper script, `dhcp-event.sh`. This wrapper will execute the router's default script first, and then fire off your Gotify `curl` command.
+ To see these scripts and detailed configuration information, see the ["DHCP Event Alerts"](../03_Services/Gotify.md#dhcp-event-alerts) section of the Gotify service documentation page.

#### :material-web-check:&ensp;WAN Check Script

##### About

The `ChkWAN.sh` script can monitor the connection status of the WAN interface, and if the status is found to be unacceptable, can perform one of the following:

+ Report the status of the WAN connection.
+ Attempt to restart the WAN interface.
+ Reboot the router.

On this router the `ChkWAN.sh` script is configured to PING the following IP addresses and restart the WAN interface if no ICMP echo reply is received from ANY of the addresses. 

+ `9.9.9.9` *(Quad9)*
+ `149.112.112.112` *(Quad9)*
+ `8.8.8.8` *(Google)*
+ `1.1.1.1` *(Cloudflare)*

##### Configure

1. Download the `ChkWAN.sh` script to the router and give it permission to execute:

    ```sh linenums="1"
    curl --retry 3 "https://raw.githubusercontent.com/MartineauUK/Chk-WAN/master/ChkWAN.sh" -o "/jffs/scripts/ChkWAN.sh" && chmod 755 "/jffs/scripts/ChkWAN.sh"
    ```

2. Manually test the script with the default PING method, and the script will simply passively report the status, rather proactively restart the WAN or reboot:

    ```sh linenums="1"
    ./ChkWAN.sh noaction once nowait
    ```

3. Add the following code to the `wan-event` script contained in the `/jffs/scripts` directory: 

    ```sh title="<code>/jffs/scripts/wan-event</code>" linenums="1"
    if [ "$2" == "connected" ]; then
      # Manually create the cron job to preserve custom arguments
      cru a WAN_Check "*/5 * * * * /jffs/scripts/ChkWAN.sh wan ping=9.9.9.9,149.112.112.112,8.8.8.8,1.1.1.1"
    fi
    ```

    !!! note

        This code adds an entry to the crontab that runs the `ChkWAN.sh` script every five minutes. It will PING the five listed IP addresses, and if none of the PING requests get a reply the script restarts the WAN interface. The reason for adding this code to the `wan-event` script is to ensure the schedule is added to the crontab every time the router reboots or the WAN re-connects.

4. Trigger the `wan-event` script to add the crontab entry:

    ```sh linenums="1"
    sh /jffs/scripts/wan-event wan0 connected
    ```

5. Check the crontab for the `ChkWAN.sh` entry:

    ```sh linenums="1"
    cru l
    ```

    You should see the following line in the crontab:

    ```text linenums="1"
    */5 * * * * /jffs/scripts/ChkWAN.sh wan ping=9.9.9.9,149.112.112.112,8.8.8.8,1.1.1.1 #WAN_Check#
    ```