---
icon: symbols/mobile
title: Ben's Smartphone
tags:
  - Hardware
  - Mobile
  - Android
  - Remote Access
hide:
  - toc
---
![Material smartphone icon](../assets/icons/smartphone.svg){ width=200 }![Android Robot logo](../assets/icons/android-robot.svg){ width=75 }

# Ben's Smartphone (Pixel 9 Pro)
[Android Help :brands-android-robot:](https://support.google.com/android/?hl=en#topic=7313011){ .md-button .md-button--primary }&emsp;[Pixel Care+ :symbols-shield-heart:](https://store.google.com/us/my-devices?hl=en-US){ .md-button }

---
## :material-information-outline: Overview

#### :material-toolbox: Role: 
+ Ben's primary mobile device.

#### :symbols-host: Hostname(s): 
+ `bens-phone`

#### :material-map-marker-outline: Location: 
+ Mobile

#### :material-memory: OS / Firmware:
+ [:brands-android-robot:&nbsp;Android 16](https://www.android.com/)

#### :material-key-chain: Credentials:
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Email&ensp;:material-arrow-right-thin:&ensp;"Google"

#### :material-security: Device Security:
+ 8-digit PIN
+ Biometric:
    + :material-fingerprint:&nbsp;Fingerprint
    + :material-face-recognition:&nbsp;Facial Recognition

## :symbols-monitor-heart: Core Specs

| CPU                                                   | Cores / Threads      | CPU Freq.                             | RAM           | GPU                              | GPU Freq. | VRAM   |
| :---------------------------------------------------- | :------------------- | :------------------------------------ | :------------ | :------------------------------- | :-------- | :----- |
| :material-memory:&nbsp;Google Tensor G4 *(arm64-v8a)* | 8C / 8T / 3-Clusters | C1 1950 MHz, C2 2600 MHz, C3 3105 MHz | 16 GB LPDDR5X | :material-memory:&nbsp;Mali-G715 | -         | Shared |

## :material-lan: Network Configuration

| Interface | IP Address | MAC Address         | Connected To                         |
| :-------: | :--------- | :------------------ | :----------------------------------- |
|   Wi-Fi   | `DHCP`     | `08:8B:C8:4E:19:7B` | :material-wifi:&nbsp;Home *(VLAN50)* |

| Interface | VLAN                            | FQDN | DNS Servers                   | Gateway        |
| :-------: | :------------------------------ | :--- | :---------------------------- | :------------- |
|   Wi-Fi   | :material-security:&nbsp;VLAN50 | `-`  | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :symbols-storage: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption             |
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------------------- |
| `N/A`       | UFS 3.1    | 128 GB         | `N/A`       | `N/A`       | Full Device Encryption |

#### :material-usb: External/Attached:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption |
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `-`         | -          | -              | `-`         | `-`         | -          |

## :material-web: Services / Docker Containers

#### :material-network-pos: Virtualization:

|  Status  | OS                                                       | Virtual NIC             | Virtual Disk Image | Role / Notes                       |
| :------: | :------------------------------------------------------- | :---------------------- | :----------------- | :--------------------------------- |
| *Active* | :material-debian:&nbsp;[Debian](https://www.debian.org/) | Virtual Network *(NAT)* | `-`                | Android Virtualization Environment |

---
## :material-tools: Maintenance & Notes

> [!config] Critical Configurations
> Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :material-update: Update Process:

+ Update Process

#### :material-cloud-upload-outline: Backup Policy:

+ Backup policy