---
icon: symbols/tornado
title: Disaster Recovery Plan
subtitle: Maintaining High Availability
description: Ensuring HA for critical network services and providing a clear path to data restoration for stateful services in the event of hardware failure or data corruption.
tags:
  - Backup
  - DNS
  - Monitor
  - Policy
  - Security
  - Service
---

![Lucide 'tornado' icon](../assets/icons/tornado.svg){ width=200 }

# Disaster Recovery Plan

_Maintaining High Availability_

!!! info "Objective"

    The goal of this **DR** plan is to ensure **HA** for critical network services _(DNS, Routing, Security)_ and to provide a clear path to data restoration for stateful services _(Immich, Home Assistant, SMB Shares)_ in the event of hardware failure or data corruption.

---

## :symbols-list-start:&ensp;Service Priority Levels

| Priority | Service                                                                                                                                       | Impact of Failure { data-sort-method="none" }   | RTO { data-sort-method="none" }    |
| :------- | :-------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------- | :--------------------------------- |
| Critical | [:services-technitium:&nbsp;Technitium](../03_services/technitium.md) DNS Cluster                                                             | Total loss of Internet / LAN connectivity.      | < 5 Minutes _(Automatic Failover)_ |
| High     | [:services-caddy:&nbsp;Caddy](../03_services/caddy.md) / [:services-cloudflare:&nbsp;Cloudflare](../03_services/cloudflared.md) Reverse Proxy | Loss of remote access and SSL termination.      | < 1 Hour                           |
| Medium   | [:services-home-assistant:&nbsp;Home Assistant](../03_services/home_assistant.md) / IoT                                                       | Loss of automation and physical device control. | < 4 Hours                          |
| Standard | [:services-immich:&nbsp;Immich](../03_services/immich.md) / Media                                                                             | Loss of access to personal archives.            | < 24 Hours                         |

---

## :symbols-cloud-upload:&ensp;Backup Strategy

!!! info inline end "3-2-1 Backup Strategy"

    To prevent data loss, the **"3-2-1" backup strategy** is applied across the infrastructure.

    **Three** copies of the data...

    - This includes the production copy and two backups

    **Two** media types...

    - Data is stored on local drives and a NAS.

    **One** off-site copy...

    - The most important data has a copy stored off-site with Backblaze B2.

### On-Site Synchronization

- [Syncthing](../03_services/syncthing.md) is utilized across the [Pi 4B Server](../02_hardware/pi_4b_server.md#role){ data-preview }, [Pi Zero 2W Server](../02_hardware/pi_zero_2w_server.md#role){ data-preview }, [Debian Server](../02_hardware/debian_server.md#role){ data-preview } and [ZimaOS NAS](../02_hardware/zimaos_nas.md#role){ data-preview } nodes to ensure configuration files and Docker volumes are mirrored in real-time.
- Linux PCs, [<code>bens-workstation</code>](../02_hardware/bens_desktop.md#role){ data-preview } and [<code>ben-laptop</code>](../02_hardware/bens_laptop.md#role){ data-preview }, have the `/home` directory backed up to the [ZimaOS NAS](../02_hardware/zimaos_nas.md#data){ data-preview } every weekday at 18:00 and 19:00 UTC-5 using a custom script, `home-bkp-nas.sh`, that utilizes [NFS](../03_services/nfs.md) and `rsync`.
- Windows PCs use [SMB](../03_services/smb.md) and the built-in backup utility in Windows 11 to back up personal data to the ZimaOS NAS.
- Obsidian vaults are synchronized in real-time with a [CouchDB](../03_services/obsidian_livesync.md) database hosted on the ZimaOS NAS, and to a private GitHub repository.
- Android smartphones have **SMS / MMS & RCS** messages and critical application configurations backed up while charging to the ZimaOS NAS via Syncthing. The backup archives for messages are created locally on the device with the [SMS Backup & Restore Pro](https://www.synctech.com.au/sms-backup-restore/){ external-link } application.

### Cold Storage

- Critical database dumps _([Home Assistant](../03_services/home_assistant.md), [Immich](../03_services/immich.md) PostgreSQL)_ are exported weekly to the **USB Storage** _(32GB)_ attached to the Pi 4B Server and the **NVMe Storage** _(500GB)_ on the ZimaOS NAS.
- The configuration of the [ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md#role){ data-preview } wireless router is exported weekly _(Sundays @ 1:00 UTC-5)_ to the **USB Storage** _(32GB)_ attached to the Pi 4B Server and the **Quick-Storage** _(2TB)_ on the ZimaOS NAS via the `backupmon` utility included with the [Asuswrt-merlin](https://www.asuswrt-merlin.net/){ external-link } firmware.

### Off-Site / Cloud

- Encrypted backups of the Obsidian vaults, application data, and key configuration files are synced to the secure cloud provider _([Backblaze B2](https://www.backblaze.com/cloud-storage){ external-link })_.

## :symbols-refresh-ccw-dot:&ensp;Recovery Procedures

### Node Failure &mdash; Primary DNS

##### Automated Failover

- The [Technitium](../03_services/technitium.md) DNS Node _([Pi 4B Server](../02_hardware/pi_4b_server.md))_ is configured as a secondary resolver in the [ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md#virtual-local-networks){ data-preview } DHCP settings. Clients will automatically fallback to the Pi 4B.  

##### Re-provisioning

- If the Debian Server or ZimaOS host is lost, the Debian Server is restored from the last known good snapshot stored on the [NFS](../03_services/nfs.md) / [SMB](../03_services/smb.md) Share.

### Node Failure &mdash; Reverse Proxy

##### Traffic Rerouting

- Since the **Pi Zero 2W Server** handles external entries via Caddy, a failure here breaks external URLs.

##### Intervention

- Deploy a temporary Caddy Docker container on the **ZimaOS NAS** using the synced configuration files from [Syncthing](../03_services/syncthing.md).

##### Update DNS

- Point the Cloudflare tunnel or local DNS records to the **ZimaOS NAS** IP.

## :symbols-wrench:&ensp;Testing & Maintenance

### Quarterly "Pull the Plug" Test

- Physically disconnect the **ZimaOS NAS** to verify the **Pi 4B Server** picks up all DNS traffic without user intervention.

### Backup Verification

- Monthly check of the [Immich](../03_services/immich.md) library integrity and a trial restoration of a single Docker container from [Syncthing](../03_services/syncthing.md) data.
- Weekly check of client backup logs for backup errors.

### Monitoring

-   Server status and service uptime is monitored by [Beszel Hub](../03_services/beszel.md) and [Uptime Kuma](../03_services/uptime_kuma.md) instances.
    - Email notifications and push notifications with [Gotify](../03_services/gotify.md#notifications){ data-preview } are enabled on both instances. Notifications are sent when a server has an issue or a service is inaccessible
-   The ASUS router utilizing the Asuswrt-merlin firmware also has email notifications enabled for firmware / script updates, critical firewall messages, WAN connection quality degradation / dropouts, and router reboots.
-   All three Debian-based servers send **email & push** notifications when new [SSH](../03_services/ssh.md) sessions are started, and when `unattended-upgrades` completes a package upgrade.
-   The [ZimaOS NAS](../02_hardware/zimaos_nas.md) sends push notifications with [Gotify](../03_services/gotify.md#notifications){ data-preview } when new SSH sessions are successfully established.
-   The email address, [admin@haube-pereira.com](mailto:admin@haube-pereira.com){ mailto-link }, is dedicated to automated notifications from the monitoring software.

---

<div class="grid cards" markdown>

-   :symbols-hash:{ .lg .middle }&emsp;**MAC Addresses**

    ---

    [MAC Address Tables](mac_address_tables.md){ .md-button }

-   :symbols-sitemap:{ .lg .middle }&emsp;**Network Diagrams**

    ---

    [Logical Diagram](logical_diagram.md){ .md-button }&emsp;[Physical Diagram](physical_diagram.md){ .md-button }

</div>

<div class="grid cards" markdown>

-   :symbols-binary:{ .lg .middle }&emsp;**IP Addresses**

    ---

    [IP Address Management](ip_address_mangement.md){ .md-button }

-   :symbols-shield-keyhole:{ .lg .middle }&emsp;**Network Security**

    ---

    [Network Security Policy](network_security_policy.md){ .md-button }

</div>