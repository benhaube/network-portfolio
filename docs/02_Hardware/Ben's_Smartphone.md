---
icon: symbols/mobile
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

[Android Help&ensp;:brands-android-robot:](https://support.google.com/android/?hl=en#topic=7313011){ .md-button .md-button--primary }&emsp;[Device Support&ensp;:symbols-mobile-question:](https://store.google.com/us/my-devices?hl=en-US){ .md-button .md-button--primary }&emsp;[Pixel Care+&ensp;:symbols-shield-heart:](https://store.google.com/us/pixel-care?hl=en-US){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-toolbox-outline:&ensp;Role 

:    Ben's main mobile device. A Google Pixel 9 Pro connected to the Trusted Wi-Fi network (SSID: `Home`).

#### :symbols-host-outline:&ensp;Hostname 

+ `ben-s-phone`

#### :symbols-location-outline:&ensp;Location

+ Mobile

#### :symbols-memory:&ensp;OS / Firmware

+ [:brands-android-robot:&nbsp;Android 16](https://www.android.com/)

#### :symbols-user-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Email&ensp;:symbols-arrow-right-thin:&ensp;"Google"

#### :symbols-security:&ensp;Device Security

+ :symbols-security-key:&nbsp;Titan M2 security chip *(FIDO2 / WebAuthn)*
+ :symbols-encrypted-outline:&nbsp;Full-disk encryption
+ :symbols-password-alt:&nbsp;8-digit PIN
+ Biometric:
    + :symbols-fingerprint-pattern:&nbsp;Fingerprint Scan
    + :symbols-scan-face:&nbsp;Face Scan

## :symbols-monitor-heart-outline:&ensp;Core Specs

| CPU                                                        | Cores / Threads       | CPU Freq.                                                                     | RAM           | GPU                                   | GPU Freq. | VRAM   |
| :--------------------------------------------------------- | :-------------------- | :---------------------------------------------------------------------------- | :------------ | :------------------------------------ | :-------- | :----- |
| :brands-google-tensor:&nbsp;Google Tensor G4 *(arm64-v8a)* | 8C / 8T<br>3-Clusters | **Cluster-1:** 1950 MHz<br>**Cluster-2:** 2600 MHz<br>**Cluster-3:** 3105 MHz | 16 GB LPDDR5X | :brands-google-tensor:&nbsp;Mali-G715 | -         | Shared |

## :symbols-lan-outline:&ensp;Network Configuration

| Interface | IP Address | MAC Address         | Connected To                                                                          |
| :-------: | :--------- | :------------------ | :------------------------------------------------------------------------------------ |
|   Wi-Fi   | `DHCP`     | `08:8B:C8:4E:19:7B` | [:symbols-android-wifi-lock:&nbsp;Home](./ASUS_RT-BE92U.md#wi-fi-networks) *(VLAN50)* |

| Interface | VLAN                           | FQDN  | DNS Servers                   | Gateway        |
| :-------: | :----------------------------- | :---- | :---------------------------- | :------------- |
|   Wi-Fi   | :symbols-security:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :symbols-folder-open-outline:&ensp;Storage & Mounts

#### :symbols-hard-drive-outline:&ensp;Internal Drive(s)

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption             |
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------------------- |
| `N/A`       | UFS 3.1    | 128 GB         | `N/A`       | `N/A`       | Full Device Encryption |

#### :symbols-usb:&ensp;External/Attached

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption |
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `-`         | -          | -              | `-`         | `-`         | -          |

## :symbols-web:&ensp;Services / Docker Containers

#### :symbols-layers:&ensp;Virtualization

|  Status  | OS                                                      | Virtual NIC | Virtual Disk Image | Role / Notes                       |
| :------: | :------------------------------------------------------ | :---------- | :----------------- | :--------------------------------- |
| *Active* | [:symbols-debian:&nbsp;Debian](https://www.debian.org/) | NAT         | `-`                | Android Virtualization Environment |

#### :brands-android-robot:&ensp;Native Android

|  Status  | Service                                                          |        Port(s)         | Role / Notes                             |
| :------: | :--------------------------------------------------------------- | :--------------------: | :--------------------------------------- |
| *Active* | [:simple-syncthing:&nbsp;Syncthing](../03_Services/Syncthing.md) | `8384` `22000` `21027` | Open decentralized file synchronization. |

---
## :symbols-note-stack:&ensp;Maintenance & Notes

!!! config inline end "Critical Configurations"

    :symbols-vpn-outline:&ensp;**VPN:**

    + The [WireGuard](../03_Services/Wireguard_Server.md) VPN is used for remote access to the LAN.
    + [ASUS RT-BE92U](./ASUS_RT-BE92U.md) is the primary server, and [ZimaOS NAS](./ZimaBoard_2_NAS.md) is the secondary / backup server.
    + The VPN is configured through the WireGuard application, and has both profiles loaded. The default profile connects to the ASUS router

    :services-gotify-notification:&ensp;**Gotify:**

    + The [Gotify](../03_Services/Gotify.md) application is installed for instant push notifications regarding the essential network infrastructure.
    + Log into the app with the "admin" user. 

    :symbols-mail:&ensp;**Email Client:**

    + The standard Gmail app has been disabled and replaced with [Thunderbird:symbols-external-link-small:](https://www.thunderbird.net/en-US/mobile/) *(formerly K9-Mail)* on this mobile device. 
    + Account and app settings are backed up to the [ZimaOS NAS](./ZimaBoard_2_NAS.md) with [Syncthing](../03_Services/Syncthing.md)

    :symbols-calendar-event:&ensp;**Calendar & Tasks:**
 
    + The standard Google Calendar and Tasks applications are disabled and replaced with [Fossify Calendar:symbols-external-link-small:](https://github.com/FossifyOrg/Calendar) and [Tasks.org:symbols-external-link-small:](https://tasks.org/) *(Installed via F-Droid)*. 
    + Calendar and tasks synchronization is handled with the [DAVx5:symbols-external-link-small:](https://www.davx5.com/) application.
    + The calendar and tasks service is hosted by [Fastmail:symbols-external-link-small:](https://fastmail.com). 

#### :symbols-update:&ensp;Update Process

##### Android OS

+ Android updates are automatic, but can also be performed manually through the system settings or via ADB.
+ Google releases monthly security updates, quarterly feature updates, and yearly major version updates.

##### Applications

+ Most applications are installed / updated via the [Google Play Store:symbols-external-link-small:](https://play.google.com/store/apps).
+ Other FOSS applications are installed / updated via the [F-Droid:symbols-external-link-small:](https://f-droid.org/) app store and the [Obtainium:symbols-external-link-small:](https://obtainium.imranr.dev/) application.

#### :symbols-backup:&ensp;Backup Policy

##### Cloud Backup

+ Google's cloud backup service is used to back up **device settings** and **apps & app data** for applications installed via the Google Play Store. 
+ Other backup services provided by Google, like photos, call history, and SMS / MMS & RCS messages are disabled to maintain privacy and control of sensitive data.
+ Backups of the user files stored on the **ZimaOS NAS** are then backed up to the cloud storage provider, [Backblaze B2:symbols-external-link-small:](https://www.backblaze.com/cloud-storage), to maintain the [3-2-1 Backup Strategy](../01_Infrastructure/Disaster_Recovery_Plan.md#backup-strategy).

##### Photos & Videos

+ Photos and videos are backed up to the [ZimaOS NAS](./ZimaBoard_2_NAS.md).
+ The [Immich](../03_Services/Immich.md) application handles backup for photos and videos. The Google Photos application is disabled.

##### SMS / MMS & RCS

+ The [SMS Backup & Restore Pro:symbols-external-link-small:](https://www.synctech.com.au/sms-backup-restore/) application is responsible for backing up messages daily.
+ The application creates a compressed archive of the messages in the directory, `/backups/SMS_Backup`, and [Syncthing](../03_Services/Syncthing.md) transfers them to the **ZimaOS NAS**.

##### Other Apps

+ Other applications that allow exporting settings / data are backed up to the **ZimaOS NAS** via **Syncthing**.
+ Local directory: `/backups`
+ NAS directory: `/media/Quick-Storage/Backup/Pixel-9-Pro` 