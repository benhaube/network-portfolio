---
icon: material/restore-alert
title: Disaster Recovery Plan
tags:
  - Infrastructure
  - Policy
  - Security
  - Backup
  - DNS
  - Monitor
  - Service
---
![Material Design restore-alert icon](../assets/icons/restore-alert-color.svg){ width=200 }

# Disaster Recovery Plan

> [!info] Objective
> The goal of this **DR** plan is to ensure **HA** for critical network services *(DNS, Routing, Security)* and to provide a clear path to data restoration for stateful services *(Immich, Home Assistant, SMB Shares)* in the event of hardware failure or data corruption.

---
## :material-priority-high: Service Priority Levels

| Priority | Service | Impact of Failure | Recovery Time Objective *(RTO)* |
| :------- | :------ | :---------------- | :------------------------------ |
| Critical | :services-technitium:&nbsp;[[Technitium]] DNS Cluster | Total loss of internet/LAN connectivity. | < 5 Minutes *(Automatic Failover)* |
| High | :services-caddy:&nbsp;[[Caddy]] Reverse Proxy | Loss of remote access and SSL termination. | < 1 Hour |
| Medium | :simple-homeassistant:&nbsp;[Home Assistant](../03_Services/Home_Assistant.md) / IoT | Loss of automation and physical device control. | < 4 Hours |
| Standard | :services-immich:&nbsp;[[Immich]] / Media | Loss of access to personal archives. | < 24 Hours |

---
## :material-cloud-upload-outline: Backup Strategy

> [!info inline end] 3-2-1 Backup Strategy
> To prevent data loss, the **"3-2-1" backup strategy** is applied across the infrastructure.
> 
> **Three** copies of the data:
> + This includes the production copy and two backups
>
> **Two** media types:
> + Data is stored on local drives and a NAS.
>
> **One** off-site copy:
> + The most important data has a copy stored off-site with p-Cloud.

### :material-sync: On-Site Synchronization:

+ [[Syncthing]] is utilized across the [[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]], [[Raspberry_Pi_Zero_2_W|Raspberry Pi Zero Server ]], [[Debian_Server_VM|Debian Server VM]] and [[ZimaBoard_2_NAS|ZimaOS NAS]] nodes to ensure configuration files and Docker volumes are mirrored in real-time.
+ Linux PCs, [[Ben's_Desktop|ben-workstation]] and [[Ben's_Laptop|ben-laptop]], have the `/home` directory backed up to the [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) every weekday at 18:00 and 19:00 UTC-5 using a custom script, `home-bkp-nas.sh`, that utilizes [[NFS]] and `rsync`. 
+ Windows PCs use [[SMB]] and the built-in backup utility in Windows 11 to back up personal data to the ZimaOS NAS. 
+ Obsidian vaults are synchronized in real-time with a [[Obsidian_LiveSync|CouchDB]] database hosted on the ZimaOS NAS, and to a private GitHub repository.
+ Android smartphones have **SMS / MMS & RCS** messages and critical application configurations backed up while charging to the ZimaOS NAS via Syncthing. The backup archives for messages are created locally on the device with the [SMS Backup & Restore Pro](https://www.synctech.com.au/sms-backup-restore/) application.

### :material-harddisk: Cold Storage: 

+ Critical database dumps *([[Home_Assistant|Home Assistant]], [[Immich]] PostgreSQL)* are exported weekly to the **USB Storage *(32GB)*** attached to the Raspberry Pi 4B server and the **NVMe Storage *(500GB)*** on the ZimaOS NAS.
+ The configuration of the [[ASUS_RT-BE92U|ASUS RT-BE92U]] wireless router is exported weekly *(Sundays @ 1:00 UTC-5)* to the **USB Storage *(32GB)*** attached to the Raspberry Pi 4B server and the **Quick-Storage *(2TB)*** on the ZimaOS NAS via the `backupmon` utility included with the [Asuswrt-merlin](https://www.asuswrt-merlin.net/) firmware.

### :material-cloud-outline: Off-Site / Cloud: 

+ Encrypted backups of the Obsidian vaults and key configuration files are synced to a secure cloud provider *([p-Cloud](https://www.p-cloud.com))*.

## :material-restore-alert: Recovery Procedures

### :material-server-network-off: Node Failure: Primary DNS

#### Automated Failover: 

+ The [[Technitium]] DNS Node *([[Raspberry_Pi_4B_Server|Raspberry Pi 4B]])* is configured as a secondary resolver in the [[ASUS_RT-BE92U|ASUS RT-BE92U]] DHCP settings. Clients will automatically fallback to the Pi 4B.    

#### Reprovisioning:

+ If the Debian VM or ZimaOS host is lost, the Debian VM is restored from the last known good snapshot stored on the [NFS](../03_Services/NFS.md) / [SMB](../03_Services/SMB.md) Share.

### :material-server-network-off: Node Failure: Reverse Proxy

#### Traffic Rerouting:

+ Since the Pi Zero 2W handles external entries via Caddy, a failure here breaks external URLs.

#### Intervention: 

+ Deploy a temporary Caddy Docker container on the **ZimaOS NAS** using the synced configuration files from [[Syncthing]].

#### Update DNS: 

+ Point the Cloudflare tunnel or local DNS records to the ZimaOS NAS IP.

## :material-tools: Testing & Maintenance

### :material-power-plug-off: Quarterly "Pull the Plug" Test:

+ Physically disconnect the ZimaOS NAS to verify the Raspberry Pi 4B picks up all DNS traffic without user intervention.

### :material-check-decagram: Backup Verification:

+ Monthly check of the [[Immich]] library integrity and a trial restoration of a single Docker container from [[Syncthing]] data.
+ Weekly check of client backup logs for backup errors.

### :symbols-monitor-heart: Monitoring:

+ Server status and service uptime is monitored by [[Beszel_Hub|Beszel Hub]] and [[Uptime_Kuma|Uptime Kuma]] instances. 
+ Email notifications are enabled on both instances. Notifications are sent when a server has an issue or a service is inaccessible
+ The ASUS router utilizing the Asuswrt-merlin firmware also has email notifications enabled for firmware / script updates, critical firewall messages, WAN connection quality degradation / dropouts, and router reboots.
+ All three Debian-based servers send email notifications when new [SSH](../03_Services/SSH.md) sessions are started, and when `unattended-upgrades` completes a package upgrade. 
+ The email address, [admin@haube-pereira.com](mailto:admin@haube-pereira.com), is dedicated to automated notifications from the monitoring software. 

---
<div class="grid cards" markdown>

-   :material-ethernet:{ .lg .middle } **MAC Addresses**

	---

	[MAC Address Tables](../01_Infrastructure/MAC_Address_Tables.md){ .md-button }

-   :material-sitemap:{ .lg .middle } **Network Diagrams**

	---

	[Logical Map](../01_Infrastructure/Logical_Map.md){ .md-button }&emsp;[Physical Map](../01_Infrastructure/Physical_Map.md){ .md-button }

</div>

<div class="grid cards" markdown>

-   :material-ip-network:{ .lg .middle } **IP Address Management**
	
	---

	[IPAM](../01_Infrastructure/IP_Address_Management.md){ .md-button }

-   :material-server-security:{ .lg .middle } **Network Security**

	---

	[Network Security Policy](../01_Infrastructure/Network_Security_Policy.md){ .md-button }

</div>