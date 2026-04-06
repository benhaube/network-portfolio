---
tags:
  - hardware
  - network
  - server
hide:
  - toc
---
![[company-logo.svg|200]]

# [[Device_Template|Device Template]]
[Button :material-icon:](https://example.com){ .md-button .md-button--primary }&emsp;[Button :material-icon:](https://example.com){ .md-button }

---
## :material-information-outline: Device Overview

* **Role:** Device role
* **Hostname(s):** `hostname`
* **Location:** 
* **OS / Firmware:** &nbsp;:os-icon:&nbsp;Operating System
* **Credentials:** &nbsp;:services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): "Credential Entry"

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| enp7s0 | `x.x.x.x` | `XX:XX:XX:XX:XX:XX` | - |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--- | :---------- | :---------- | :------ |
| vlan | `example.internal` | `x.x.x.x` `x.x.x.x` | `x.x.x.1` |

## :material-folder-open: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/mount-point` | NVMe SSD | 929 GB | `/dev/path` | `btrfs` | - |

#### :material-usb: External/Attached:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/mount-point` | NVMe SSD | 929 GB | `/dev/path` | `btrfs` | - |

## :material-web: Services / Docker Containers

#### :material-network-pos: Virtualization:

| Status | Operating System | Network Interface | Disk Image | Role / Notes |
| :----: | :--------------- | :---------------- | :--------- | :----------- |
| *Active* | :os-icon:&nbsp;[OS](https://example.com) | Virtual Network *(NAT)* | `disk-image.qcow2` | - |

#### :material-linux: Native Linux:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX` | - |

#### :material-docker: Docker:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX` | - |

---
## :material-tools: Maintenance & Notes

> [!note] Critical Configurations
> Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :material-update: Update Process:

* Update Process

#### :material-cloud-upload-outline: Backup Policy:

* Backup policy