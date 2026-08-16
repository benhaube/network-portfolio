---
icon: services/technitium
title: Technitium
subtitle: authoritative & Recursive DNS
description: An open-source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.
status: new
tags:
  - Active
  - DNS
  - Infrastructure
  - Native
  - Network
  - New
  - Service
hide:
  - toc
---

![Technitium Icon](../assets/icons/technitium.svg){ width=200 }

# Technitium

_Authoritative & Recursive DNS_

[GitHub&ensp;:brands-github:](https://github.com/TechnitiumSoftware/DnsServer){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://deepwiki.com/TechnitiumSoftware/DnsServer){ .md-button .md-button--primary }

---

![Technitium dashboard](../assets/screenshots/technitium-dashboard-light.png#only-light){ width=400 align=right }
![Technitium dashboard](../assets/screenshots/technitium-dashboard-dark.png#only-dark){ width=400 align=right }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

: An open-source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.

#### :symbols-hash:&ensp;Port(s)

- `53`
{ .no-bullets }
- `443`
{ .no-bullets }
- `5380`
{ .no-bullets }

#### :symbols-link-2:&ensp;URL / Access

-   :symbols-layers:&ensp;Debian Server
{ .no-bullets }
    - `192.168.50.6` &mdash; Primary server
    - <http://debian-vm.internal:5380>
-   :symbols-server:&ensp;Pi 4B Server
{ .no-bullets }
    - `192.168.50.2` &mdash; Secondary server
    - <http://pi-server.internal:5380>

#### :symbols-user-key:&ensp;Credentials

- [:brands-github:&ensp;GitHub OAuth](https://github.com/settings/developers){ external-link }
{ .no-bullets }
- [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Technitium"
- 2FA / MFA
{ .no-bullets }
    - :symbols-clock:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                            | Method                          | Container Name | Image |
| :--------------------------------------------------------------------- | :------------------------------ | :------------- | :---- |
| [:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)   | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

#### :symbols-monitor-arrow-down-corner:&ensp;Install

``` bash title="Command to install & update Technitium" linenums="1"
curl -sSL https://download.technitium.com/dns/install.sh | sudo bash
```

#### :symbols-cloud-upload:&ensp;Settings Backup

:    The settings for both Technitium DNS server nodes are backed up in `.tar.gz` archives and stored on the [ZimaOS NAS](../02_hardware/zimaos_nas.md#role){ data-preview }. Listed below are the directories where each settings backup archive are located. Each archive name has the server's FQDN and the date & time of the settings export. *(e.g., `pi-server.internal_<time>_<date>_backup.tar.gz`)*

    ``` text title="Debian Server (primary node)"
    /DATA/Quick_Storage/Backup/debian-vm/Technituim/
    ```

    ``` text title="Pi 4B Server (secondary node)"
    /DATA/Quick_Storage/Backup/pi-server/Technitium/
    ```

#### :symbols-file-cog:&ensp;Zone Files

``` zone { .mono-title title="50.168.192.in-addr.arpa.zone" linenums="1" }
--8<-- "50.168.192.in-addr.arpa.zone"
```

``` zone { .mono-title title="cluster-catalog.internal.zone" linenums="1" }
--8<-- "cluster-catalog.internal.zone"
```

``` zone { .mono-title title="internal.zone" linenums="1" }
--8<-- "internal.zone"
```
