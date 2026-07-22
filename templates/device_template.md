---
icon: symbols/monitor-smartphone
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

#### :symbols-toolbox: Role

:    Device role

#### :symbols-host: Hostname

:    `hostname`

#### :symbols-map-pin: Location

:    Location 

#### :symbols-cpu: OS / Firmware

:    :os-icon:&nbsp;Operating System

#### :symbols-user-key: Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Folder&ensp;:symbols-move-right:&ensp;"Credential Entry"

#### :symbols-brick-wall-shield: Device Security

:    Hardware / Software security features (e.g., TPM2)

## :symbols-square-activity: Core Specs

| CPU                  | Cores / Threads | CPU Freq. | RAM  | GPU  | GPU Freq. | VRAM |
| :------------------- | :-------------- | :-------- | :--- | :--- | :-------- | :--- |
| CPU *(architecture)* | #C / #T         | # GHz     | # GB | GPU  | # MHz     | # GB |

## :symbols-lan: Network Configuration

| Interface | IP Address | MAC Address         | Connected To                  |
| :-------: | :--------- | :------------------ | :---------------------------- |
|  enp7s0   | `x.x.x.x`  | `XX:XX:XX:XX:XX:XX` | :symbols-ethernet-port:&nbsp; |

| Interface | VLAN   | FQDN               | DNS Servers         | Gateway   |
| :-------: | :----- | :----------------- | :------------------ | :-------- |
|  enp7s0   | VLAN50 | `example.internal` | `x.x.x.x` `x.x.x.x` | `x.x.x.1` |

## :symbols-folders: Storage & Mounts

#### :symbols-hard-drive: Internal Drive(s)

| Mount Point    | Drive Type | Drive Capacity | Device Path | File System | Encryption |
| :------------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/mount-point` | NVMe SSD   | 929 GB         | `/dev/path` | `btrfs`     | -          |

#### :symbols-usb: External/Attached

| Mount Point    | Drive Type | Drive Capacity | Device Path | File System | Encryption |
| :------------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/mount-point` | NVMe SSD   | 929 GB         | `/dev/path` | `btrfs`     | -          |

## :symbols-monitor-cloud: Services / Docker Containers

#### :symbols-layers: Virtualization

|  Status  | OS                                       | Virtual NIC             | Virtual Disk Image | Role / Notes |
| :------: | :--------------------------------------- | :---------------------- | :----------------- | :----------- |
| *Active* | :os-icon:&nbsp;[OS](https://example.com) | Virtual Network *(NAT)* | `disk-image.qcow2` | -            |

#### :symbols-penguin: Native Linux

|  Status  | Service                                                   | Port(s) | Role / Notes |
| :------: | :-------------------------------------------------------- | :-----: | :----------- |
| *Active* | :services-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

#### :services-docker: Docker

|  Status  | Service                                                   | Port(s) | Role / Notes |
| :------: | :-------------------------------------------------------- | :-----: | :----------- |
| *Active* | :services-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX`  | -            |

---
## :symbols-sticky-notes: Maintenance & Notes

!!! config "Critical Configurations"

    Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :symbols-update: Update Process

+ Update Process

#### :symbols-cloud-upload: Backup Policy

+ Backup policy