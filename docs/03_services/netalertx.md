---
icon: services/netalertx
title: NetAlertX
subtitle: Centralized Network Visibility
description: Centralized network visibility and continuous asset discovery. Monitor devices, detect change, and stay aware across distributed networks.
status: new
tags:
  - Active
  - Container
  - Inventory
  - Monitor
  - Network
  - New
  - Service
  - Tools
hide:
  - toc
---

![NetAlertX logo](../assets/icons/netalertx-light.svg#only-light){ width=200 }
![NetAlertX logo](../assets/icons/netalertx-dark.svg#only-dark){ width=200 }

# NetAlertX

_Centralized Network Visibility_

[GitHub :brands-github:](https://github.com/netalertx/NetAlertX/){ .md-button .md-button--primary }&emsp;[Documentation :symbols-files:](https://docs.netalertx.com/){ .md-button .md-button--primary }

---

![NetAlertX devices table](../assets/screenshots/netalertx-devices-light.png#only-light){ width=400 align=right }
![NetAlertX devices table](../assets/screenshots/netalertx-devices-dark.png#only-dark){ width=400 align=right }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:  Centralized network visibility and continuous asset discovery. Monitor devices, detect change, and stay aware across distributed networks.

#### :symbols-hash:&ensp;Port(s)

- `20211`
{ .no-bullets }
- `20212`
{ .no-bullets }

#### :symbols-link-2:&ensp;URL / Access

:    <http://storage-server.internal:20211>

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"NetAlertX"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                      |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS-NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `netalertx`    | `jokobsk/netalertx:latest` |

### :symbols-settings:&ensp;Configuration

#### :symbols-puzzle:&ensp;Loaded Plugins

| Plugin ID   | Category       | Description { data-sort-method="none" }      | Required { data-sort-reverse } |
| :---------- | :------------- | :------------------------------------------- | :----------------------------: |
| `ARPSCAN`   | Device Scan    | Run ARP-scan on the current network          |                                |
| `ASUSWRT`   | Importer       | Import connected devices from Asuswrt        |                                |
| `AVAHISCAN` | Name Discovery | Avahi _(mDNS-based)_ name resolution         |                                |
| `CSVBCKP`   | System         | CSV devices backup                           |                                |
| `CUSTPROP`  | System         | Managing custom device property values       |    :symbols-check:&nbsp;Yes    |
| `DBCLNP`    | System         | Database cleanup                             |    :symbols-check:&nbsp;Yes    |
| `DIGSCAN`   | Name Discovery | Dig _(DNS)_ name resolution                  |                                |
| `ICMP`      | Other          | ICMP _(ping)_ status checker                 |                                |
| `INTRNT`    | Device Scan    | Internet _(WAN)_ IP address scanner          |                                |
| `MAINT`     | System         | Maintenance of logs, etc.                    |                                |
| `NEWDEV`    | System         | New device template                          |    :symbols-check:&nbsp;Yes    |
| `NBTSCAN`   | Name Discovery | Nbtscan _(NetBIOS-based)_ name resolution    |                                |
| `NMAP`      | Other          | Nmap port scanning & discovery               |                                |
| `NSLOOKUP`  | Name Discovery | NSLookup _(DNS-based)_ name resolution       |                                |
| `NTFPRCS`   | System         | Notification processing                      |    :symbols-check:&nbsp;Yes    |
| `SETPWD`    | System         | Set the service password                     |    :symbols-check:&nbsp;Yes    |
| `SMTP`      | Publisher      | Email notifications                          |                                |
| `SYNC`      | Importer       | Sync & import from other NetAlertX instances |    :symbols-check:&nbsp;Yes    |
| `UI`        | System         | User interface specific settings             |    :symbols-check:&nbsp;Yes    |
| `VNDRPDT`   | System         | MAC address vendor database update           |                                |

#### :symbols-folder-git-2:&ensp;Data Directories

##### Config

- Drive:&ensp;`/dev/nvme0n1p1`
{ .no-bullets }
- Path:&ensp;`/DATA/AppData/netalertx/config`
{ .no-bullets }
- Config file:&ensp;`app.conf`
{ .no-bullets }

##### Database

- Drive:&ensp;`/dev/nvme0n1p1`
{ .no-bullets }
- Path:&ensp;`/DATA/AppData/netalertx/db`
{ .no-bullets }
- Database file:&ensp;`app.db`
{ .no-bullets }

#### :symbols-svg:&ensp;Custom Device Icons

The NetAlertX service allows users to add custom device and property SVG icons through the settings, but they need to be base64 encoded first. Below is a file containing icons from the open-source Lucide project that are already base64 encoded.

``` toml title="Base64 Encoded Lucide Icons" linenums="1" 
--8<-- "lucide_base64_encoded.txt"
```

#### :symbols-file-code-corner:&ensp;Docker Compose File

--8<-- "deploy_with_dockge.md"

``` yaml { .mono-title title="../AppData/dockge/stacks/netalertx/compose.yaml" linenums="1" }
--8<-- "netalertx.yaml"
```