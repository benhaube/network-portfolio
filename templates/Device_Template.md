---
icon: symbols/devices
title: Device Template
subtitle: Subtitle
tags:
  - Hardware
  - Network
  - Server
hide:
  - toc
---
![Icon](../assets/icons/<icon>.svg){ width=200 }

# Device Template
*Subtitle*

[Button :symbols-icon:](https://example.com){ .md-button .md-button--primary }&emsp;[Button :symbols-icon:](https://example.com){ .md-button .md-button--primary }

---
## :symbols-info: Device Overview

#### :symbols-toolbox-outline: Role

:    Device role

#### :symbols-host-outline: Hostname

+ `hostname`

#### :symbols-location-outline: Location

+ Location 

#### :symbols-memory: OS / Firmware

+ :os-icon:&nbsp;Operating System

#### :symbols-user-key: Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Folder&ensp;:symbols-arrow-right-thin:&ensp;"Credential Entry"

#### :symbols-security: Device Security

+ Hardware / Software security features (e.g., TPM2)

## :symbols-monitor-heart-outline: Core Specs

| CPU                  | Cores / Threads | CPU Freq. | RAM  | GPU  | GPU Freq. | VRAM |
| :------------------- | :-------------- | :-------- | :--- | :--- | :-------- | :--- |
| CPU *(architecture)* | #C / #T         | # GHz     | # GB | GPU  | # MHz     | # GB |

## :symbols-lan: Network Configuration

| Interface | IP Address | MAC Address         | Connected To                          |
| :-------: | :--------- | :------------------ | :------------------------------------ |
|  enp7s0   | `x.x.x.x`  | `XX:XX:XX:XX:XX:XX` | :symbols-ethernet-port-outline:&nbsp; |

| Interface | VLAN   | FQDN               | DNS Servers         | Gateway   |
| :-------: | :----- | :----------------- | :------------------ | :-------- |
|  enp7s0   | VLAN50 | `example.internal` | `x.x.x.x` `x.x.x.x` | `x.x.x.1` |

## :symbols-folder-open-outline: Storage & Mounts

#### :symbols-hard-drive-outline: Internal Drive(s)

| Mount Point    | Drive Type | Drive Capacity | Device Path | File System | Encryption |
| :------------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/mount-point` | NVMe SSD   | 929 GB         | `/dev/path` | `btrfs`     | -          |

#### :symbols-usb: External/Attached

| Mount Point    | Drive Type | Drive Capacity | Device Path | File System | Encryption |
| :------------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/mount-point` | NVMe SSD   | 929 GB         | `/dev/path` | `btrfs`     | -          |

## :symbols-web: Services / Docker Containers

#### :symbols-layers: Virtualization

|  Status  | OS                                       | Virtual NIC             | Virtual Disk Image | Role / Notes |
| :------: | :--------------------------------------- | :---------------------- | :----------------- | :----------- |
| *Active* | :os-icon:&nbsp;[OS](https://example.com) | Virtual Network *(NAT)* | `disk-image.qcow2` | -            |

#### :symbols-linux: Native Linux

|  Status  | Service                                                   | Port(s) | Role / Notes |
| :------: | :-------------------------------------------------------- | :-----: | :----------- |
| *Active* | :services-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

#### :services-docker: Docker

|  Status  | Service                                                   | Port(s) | Role / Notes |
| :------: | :-------------------------------------------------------- | :-----: | :----------- |
| *Active* | :services-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

---
## :symbols-note-stack: Maintenance & Notes

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :symbols-update: Update Process

+ Update Process

#### :symbols-backup: Backup Policy

+ Backup policy