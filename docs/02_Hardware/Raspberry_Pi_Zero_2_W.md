---
tags:
  - hardware
  - server
  - dns
  - infrastructure
  - docker_host
  - network
  - office
  - printer-cart
hide:
  - toc
---
![Raspberry Pi Icon](../assets/icons/raspberry-pi-light.svg#only-light){ width=200 }
![Raspberry Pi Icon](../assets/icons/raspberry-pi-dark.svg#only-dark){ width=200 }
![Arm Logo](../assets/icons/arm.svg){ width=50 }

# [[Raspberry_Pi_Zero_2_W|Raspberry Pi Zero Server]]
[Raspberry Pi Docs :simple-raspberrypi:](https://www.raspberrypi.com/documentation){ .md-button .md-button--primary }&emsp;[Debian Docs :material-file-document-multiple:](https://www.debian.org/doc/){ .md-button }

---
## :material-information-outline: Device Overview

#### Role: 
* Tertiary DNS server *(Pi-hole w/ dnscrypt-proxy)*

#### Hostname(s):
* `pi-zero`

#### Location: 
* Office
* Printer-Cart

#### OS / Firmware:
* [:material-debian:&nbsp;Debian Linux 13](https://www.debian.org/) *(Trixie)*

#### Credentials: 
* [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com) SSH key: "admin@pi-hole"

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| wlan0 | `192.168.50.3` | `2c:cf:67:db:f5:e2` | :material-wifi:&nbsp;Home *(vlan50)* |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--: | :---------- | :---------- | :------ |
| :material-security:&nbsp;vlan50 | `proxy.pi-zero.internal` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :material-folder-open: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/` | MicroSD | 29 GB | `/dev/mmcblk0p2` | `ext4` | - |
| `/boot/firmware` | MicroSD | 512 MB | `/dev/mmcblk0p1` | `vfat` | - |
| `/var/log` | RAM | 80 MB | `log2ram` | `tmpfs` | - |

## :material-web: Services / Docker Containers

#### :material-linux: Native Linux:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :services-caddy:&nbsp;[[Caddy]] | `80` `443` | Lightweight, open-source Web server written in Go. Used as a *reverse-proxy* for creating unique domains for locally hosted services. |
| *Active* | :material-console-network:&nbsp;[SSH](../03_Services/SSH.md) | `22` | Remote terminal access. |
| *Active* | :simple-syncthing:&nbsp;[[Syncthing]] | `8384` `22000` `21027` | Open decentralized file synchronization. | 

#### :material-docker: Docker:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :services-beszel:&nbsp;[Beszel Agent](../03_Services/Beszel_Agent.md) | `45876` | Agent for [Beszel Hub](../03_Services/Beszel_Hub.md) *(hosted on [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md))*. |
| *Active* | :services-dockge:&nbsp;[[Dockge]] | `5001` | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager. |
| *Inactive* | :services-portainer:&nbsp;[Portainer Agent](../03_Services/Portainer_Agent.md) | `9001` | Agent for Portainer-EE Docker management server *(hosted on [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md))*. |

---
## :material-tools: Maintenance & Notes

> [!important inline] Critical Configurations
> #### :material-web-clock: Chrony:
> * Do not modify NTP settings or enable `systemd-timesyncd`. It has been replaced with `chrony`.
> 
> #### :material-text-long: Logs:
> * Logs are configured with `log2ram` to reduce wear on the MicroSD card.
> 
> #### :material-email-alert: Email Notifications:
> * This server has email notifications configured for new SSH sessions and `unattended-upgrades`. See [SSH Login Email Notification](../Linux_Tutorials/Setup_SSH_Login_Email_Notification.md) for documentation.

#### :material-update: Update Process:

* `#!bash apt update && apt upgrade` *(Standard Debian)*
* `unattended-upgrades` enabled for critical bug and security fixes.

#### :material-cloud-upload-outline: Backup Policy:

* Image of MicroSD card stored on [[ZimaBoard_2_NAS|ZimaBoard 2 NAS]] `/media/Quick-Storage/Backup` directory.
