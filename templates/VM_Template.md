---
tags:
  - hardware
  - virtual_machine
  - server
hide:
  - toc
---
![[os-logo.svg|200]]

# [[VM_Template|VM Template]]
[OS :os-icon:](https://example.com){ .md-button .md-button--primary }&emsp;[OS Docs :material-file-document-multiple:](https://example.com){ .md-button }

---
## :material-information-outline: Overview

* **Role:** 
* **Hostname(s):** `hostname`
* **Hypervisor:** (e.g., KVM / QEMU)
* **Operating System:** 
    * :os-icon:&nbsp;[Operating System](https://example.com)
* **Host Node:** 
    * :device-icon:&nbsp;[[Device_Template|Device Template]]
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): ""

## :material-cpu-64-bit: Resource Allocation

* **vCPU:** (# Cores)
* **RAM:** (# GB)
* **Storage:** (# GB) Virtual Disk Image
    * *Disk Location on Host:* `/path/to/image.qcow2` 

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address | Notes |
| :-------: | :--------- | :---------- | :---- |
| enp1s0 | `x.x.x.x` | `XX:XX:XX:XX:XX:XX` | - |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--- | :---------- | :---------- | :------ |
| vlan | `hostname.internal` | `0.0.0.0` | `x.x.x.1` |

## :material-web: Services / Docker Containers

#### :material-linux: Native Linux:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX` | - |

#### :material-docker: Docker:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :service-icon:&nbsp;[Service](../03_Services/Service.md) | `XXXX` | - |

---
## :material-tools: Maintenance & Snapshots

> [!important]+ Critical Configurations
> Note any special tweaks here (e.g., "Do not update kernel," "SMB Multichannel enabled via conf file").

#### :material-update: Update Policy:

* Update Policy

#### :material-camera: Snapshot Policy:

* Snapshot Policy

#### :material-backup-restore: Recovery:

* Recovery Policy