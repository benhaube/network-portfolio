---
icon: symbols/smartphone
title: Ben's Smartphone
subtitle: Google Pixel 9 Pro
tags:
  - Mobile
  - Android
  - Remote Access
  - Hardware
hide:
  - toc
---
![Google Material (new) 'mobile' icon](../assets/icons/smartphone.svg){ width=200 }

# Ben's Smartphone
*Google Pixel 9 Pro*

[Android Help&ensp;:symbols-circle-question-mark:](https://support.google.com/android/?hl=en#topic=7313011){ .md-button .md-button--primary }&emsp;[Device Support&ensp;:symbols-life-buoy:](https://store.google.com/us/my-devices?hl=en-US){ .md-button .md-button--primary }&emsp;[Pixel Care+&ensp;:symbols-shield-plus:](https://store.google.com/us/pixel-care?hl=en-US){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-toolbox:&ensp;Role 

:    Ben's main mobile device. A Google Pixel 9 Pro connected to the Trusted Wi-Fi network (SSID: `Home`).

#### :symbols-host:&ensp;Hostname 

:    `ben-s-phone`

#### :symbols-map-pin:&ensp;Location

:    Mobile

#### :symbols-cpu:&ensp;OS / Firmware

:    [:brands-android:&ensp;Android 17](https://www.android.com/){ external-link }

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Email&ensp;:symbols-move-right:&ensp;"Google"

#### :symbols-brick-wall-shield:&ensp;Device Security

:    Software:

      + :symbols-key-fido2:&nbsp;Titan M2 security chip *(FIDO2 / WebAuthn)*
      + :symbols-shield:&nbsp;Full-disk encryption
      + :symbols-rectangle-ellipsis:&nbsp;8-digit PIN

:    Biometric:
    
      + :symbols-fingerprint-pattern:&nbsp;Fingerprint Scan
      + :symbols-scan-face:&nbsp;Face Scan

## :symbols-circuit-board:&ensp;Core Specs

| CPU                                                        | Cores / Threads       | CPU Freq.                                                                     | RAM           | GPU                                   | GPU Freq. | VRAM   |
| :--------------------------------------------------------- | :-------------------- | :---------------------------------------------------------------------------- | :------------ | :------------------------------------ | :-------- | :----- |
| :brands-google-tensor:&nbsp;Google Tensor G4 *(arm64-v8a)* | 8C / 8T<br>3-Clusters | **Cluster-1:** 1950 MHz<br>**Cluster-2:** 2600 MHz<br>**Cluster-3:** 3105 MHz | 16 GB LPDDR5X | :brands-google-tensor:&nbsp;Mali-G715 | -         | Shared |

## :symbols-lan:&ensp;Network Configuration

| Interface | IP Address {data-sort-method='dotsep'} | MAC Address         | Connected To                                                                               |
| :-------: | :------------------------------------- | :------------------ | :----------------------------------------------------------------------------------------- |
|   Wi-Fi   | `DHCP`                                 | `08:8B:C8:4E:19:7B` | [:symbols-wifi-cog:&nbsp;Home](asus_rt-be92u.md#wi-fi-networks){ data-preview } *(VLAN50)* |

| Interface | VLAN                                 | FQDN  | DNS Servers {data-sort-method='none'} | Gateway {data-sort-method='dotsep'} |
| :-------: | :----------------------------------- | :---- | :------------------------------------ | :---------------------------------- |
|   Wi-Fi   | :symbols-shield-quarter:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2`         | `192.168.50.1`                      |

## :symbols-folder-tree:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point | Drive Type | Drive Capacity {data-sort-method='filesize'} | Device Path | File System | Encryption             |
| :---------- | :--------- | :------------------------------------------- | :---------- | :---------- | :--------------------- |
| `N/A`       | UFS 3.1    | 128 GB                                       | `N/A`       | `N/A`       | Full Device Encryption |

#### :symbols-usb:&ensp;External/Attached

| Mount Point | Drive Type | Drive Capacity {data-sort-method='filesize'} | Device Path | File System | Encryption |
| :---------- | :--------- | :------------------------------------------- | :---------- | :---------- | :--------- |
| `-`         | -          | -                                            | `-`         | `-`         | -          |

## :symbols-monitor-cloud:&ensp;Services / Containers

#### :symbols-layers:&ensp;Virtualization

|  Status  | OS                                                                       | Virtual NIC | Virtual Disk Image | Role / Notes {data-sort-method='none'} |
| :------: | :----------------------------------------------------------------------- | :---------- | :----------------- | :------------------------------------- |
| *Active* | [:symbols-debian:&nbsp;Debian](https://www.debian.org/){ external-link } | NAT         | `-`                | Android Virtualization Environment     |

#### :brands-android:&ensp;Native Android

|  Status  | Service                                                                | Port(s) {data-sort-method='number'} | Role / Notes {data-sort-method='none'}   |
| :------: | :--------------------------------------------------------------------- | :---------------------------------: | :--------------------------------------- |
| *Active* | [:services-syncthing-alt:&nbsp;Syncthing](../03_services/syncthing.md) |       `8384` `22000` `21027`        | Open decentralized file synchronization. |

---
## :symbols-sticky-notes:&ensp;Maintenance & Notes

!!! config inline end "Critical Configurations"

    :symbols-waypoints:&ensp;**VPN:**

    + The [WireGuard](../03_services/wireguard_server.md) VPN is used for remote access to the LAN.
    + [ASUS RT-BE92U](asus_rt-be92u.md) is the primary server, and [ZimaOS NAS](zimaos_nas.md) is the secondary / backup server.
    + The VPN is configured through the WireGuard application, and has both profiles loaded. The default profile connects to the ASUS router

    :services-gotify-notification:&ensp;**Gotify:**

    + The [Gotify](../03_services/gotify.md) application is installed for instant push notifications regarding the essential network infrastructure.
    + Log into the app with the "admin" user. 

    :symbols-mail:&ensp;**Email Client:**

    + The standard Gmail app has been disabled and replaced with [Thunderbird](https://www.thunderbird.net/en-US/mobile/){ external-link } *(formerly K9-Mail)* on this mobile device. 
    + Account and app settings are backed up to the [ZimaOS NAS](zimaos_nas.md) with [Syncthing](../03_services/syncthing.md)

    :symbols-calendar-sync:&ensp;**Calendar & Tasks:**
 
    + The standard Google Calendar and Tasks applications are disabled and replaced with [Fossify Calendar](https://github.com/FossifyOrg/Calendar){ external-link } and [Tasks.org](https://tasks.org/){ external-link } *(Installed via F-Droid)*. 
    + Calendar and tasks synchronization is handled with the [DAVx5](https://www.davx5.com/){ external-link } application.
    + The calendar and tasks service is hosted by [Fastmail](https://fastmail.com){ external-link }. 

#### :symbols-update:&ensp;Update Process

##### Android OS

+ Android updates are automatic, but can also be performed manually through the system settings or via ADB.
+ Google releases monthly security updates, quarterly feature updates, and yearly major version updates.

##### Applications

+ Most applications are installed / updated via the [Google Play Store](https://play.google.com/store/apps){ external-link }.
+ Other FOSS applications are installed / updated via the [F-Droid](https://f-droid.org/){ external-link } app store and the [Obtainium](https://obtainium.imranr.dev/){ external-link } application.

#### :symbols-cloud-upload:&ensp;Backup Policy

##### Cloud Backup

+ Google's cloud backup service is used to back up **device settings** and **apps & app data** for applications installed via the Google Play Store. 
+ Other backup services provided by Google, like photos, call history, and SMS / MMS & RCS messages are disabled to maintain privacy and control of sensitive data.
+ Backups of the user files stored on the **ZimaOS NAS** are then backed up to the cloud storage provider, [Backblaze B2](https://www.backblaze.com/cloud-storage){ external-link }, to maintain the [3-2-1 Backup Strategy](../01_infrastructure/disaster_recovery_plan.md#backup-strategy).

##### Photos & Videos

+ Photos and videos are backed up to the [ZimaOS NAS](zimaos_nas.md).
+ The [Immich](../03_services/immich.md) application handles backup for photos and videos. The Google Photos application is disabled.

##### SMS / MMS & RCS

+ The [SMS Backup & Restore Pro](https://www.synctech.com.au/sms-backup-restore/){ external-link } application is responsible for backing up messages daily.
+ The application creates a compressed archive of the messages in the directory, `/backups/SMS_Backup`, and [Syncthing](../03_services/syncthing.md) transfers them to the **ZimaOS NAS**.

##### Other Apps

+ Other applications that allow exporting settings / data are backed up to the **ZimaOS NAS** via **Syncthing**.
+ Local directory: `/backups`
+ NAS directory: `/media/Quick-Storage/Backup/Pixel-9-Pro` 