---
icon: services/technitium
title: Technitium
subtitle: Autoritative & Recursive DNS
description: An open-source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.
status: new
tags:
  - Active
  - Service
  - Software
  - DNS
  - Infrastructure
  - Network
  - Domain
  - Native
  - New
hide:
  - toc
---
![Technitium Icon](../assets/icons/technitium.svg){ width=200 }

# Technitium
*Autoritative & Recursive DNS*

[GitHub&ensp;:simple-github:](https://github.com/TechnitiumSoftware/DnsServer){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://deepwiki.com/TechnitiumSoftware/DnsServer){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-description:&ensp;Description 

:    An open-source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `53`
+ `443`
+ `5380`

#### :symbols-link:&ensp;URL / Access  

+ :material-debian:&nbsp;Debian Server
    + `192.168.50.6` &mdash; First DNS server
    + <http://debian-vm.internal:5380>
+ :material-raspberry-pi:&nbsp;Raspberry Pi 4B Server
    + `192.168.50.2` &mdash; Second DNS server
    + <http://pi-server.internal:5380>

#### :symbols-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Technitium"
+ [:simple-github:&nbsp;GitHub OAuth](https://github.com/settings/developers)

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                     | Method                             | Container Name | Image |
| :---------------------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| [:material-debian:&nbsp;Debian Server](../02_Hardware/Debian_Server_VM.md)                      | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:material-raspberry-pi:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration 

#### :symbols-install-desktop:&ensp;Install

```bash title="Command to install & update Technitium" linenums="1"
curl -sSL https://download.technitium.com/dns/install.sh | sudo bash
```

#### :symbols-backup:&ensp;Settings Backup

:    The settings for both Technitium DNS server nodes are backed up in `.tar.gz` archives and stored on the [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md). Listed below are the directories where each settings backup archive are located. Each archive name has the server's FQDN and the date & time of the settings export. *(e.g., `pi-server.internal_2026-05-29_16-00-14_backup.tar.gz`)*

    ```text title="Debian Server <i>(primary node)</i>"
    /DATA/Quick_Storage/Backup/debian-vm/Technituim/
    ```

    ```text title="Raspberry Pi 4B Server <i>(secondary node)</i>"
    /DATA/Quick_Storage/Backup/pi-server/Technitium/
    ```

#### :symbols-file-config:&ensp;Zones

```zone title="<code>50.168.192.in-addr.arpa.zone</code>" linenums="1"
--8<-- "50.168.192.in-addr.arpa.zone"
```

```zone title="<code>cluster-catalog.internal.zone</code>" linenums="1"
--8<-- "cluster-catalog.internal.zone"
```

```zone title="<code>internal.zone</code>" linenums="1"
--8<-- "internal.zone"
```
