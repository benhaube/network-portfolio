---
icon: services/technitium
title: Technitium
subtitle: Authoritative & Recursive DNS
description: An open-source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.
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

![Technitium dashboard](../assets/screenshots/technitium-dashboard-light.png#only-light){ width=400 align=right .on-glb }
![Technitium dashboard](../assets/screenshots/technitium-dashboard-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

**Description**

:   An open-source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.

**Port(s)**

- `53`
{ .no-bullets }
- `443`
{ .no-bullets }
- `5380`
{ .no-bullets }

**URL / Access**

-   :symbols-layers:&ensp;Debian Server
{ .no-bullets }
    - `192.168.50.6` &mdash; Primary server
    - <http://debian-vm.internal:5380>
-   :symbols-server:&ensp;Pi 4B Server
{ .no-bullets }
    - `192.168.50.2` &mdash; Secondary server
    - <http://pi-server.internal:5380>

**Credentials**

- [:services-authentik:&ensp;Authentik OAuth](https://auth.rac3r4life.online){ external-link }
{ .no-bullets }
- [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Technitium"
- 2FA / MFA
{ .no-bullets }
    - :symbols-clock-key:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                            | Method                          | Container Name | Image | Port(s)                     |
| :--------------------------------------------------------------------- | :------------------------------ | :------------- | :---- | :-------------------------- |
| [:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` | `53`&ensp;`443`&ensp;`5380` |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)   | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` | `53`&ensp;`443`&ensp;`5380` |

---

## :symbols-settings:&ensp;Configuration

### :symbols-monitor-arrow-down-corner:&ensp;Install

1. Use the following command to download and run the install script on each server:

    ``` bash linenums="1"
    curl -sSL https://download.technitium.com/dns/install.sh | sudo bash
    ```

#### Missing ICU Package

Most distributions include the `libicu` package by default, but in some instances it may be missing with a minimal install. Since the package is required after `v13.4`, it will need to be installed manually if it is missing.

1. Search with the APT package manager for the correct `libicu` package:

    ``` bash
    sudo apt search libicu
    ```

    ``` shell-session title="Example Output" hl_lines="13"
    icu-devtools/stable 76.1-4 arm64
      Development utilities for International Components for Unicode

    libicu-dev/stable 76.1-4 arm64
      Development files for International Components for Unicode

    libicu4j-4.4-java/stable,stable 4.4.2.2-4 all
      Library for Unicode support and internationalization

    libicu4j-java/stable,stable 73.2-1 all
      Library for Unicode support and internationalization

    libicu76/stable,now 76.1-4 arm64 [installed]
      International Components for Unicode
    ```

2. If the search output does not show `[installed]` next to the package name, then install the correct `libicu` package:

    ``` bash
    sudo apt install libicu76
    ```

### :symbols-rotate-cw-clock:&ensp;Update

!!! tip inline end

    For a **clustered** setup with multiple nodes, make sure to update all secondary nodes before updating the primary node.

1. Download the install script to the `/opt/scripts` directory, and give it the name `technituim-update.sh`:

    ``` bash
    sudo curl -sSL https://download.technitium.com/dns/install.sh -o /opt/scripts/technitium-update.sh
    ```

2. Give the `root` user read, write, and execute permissions:

    ``` bash
    sudo chmod 700 /opt/scripts/technitium-update.sh
    ```

3. Run the install script as the `root` user to update Technitium:

    ``` bash 
    sudo bash /opt/scripts/technitium-update.sh
    ```

### :symbols-cloud-upload:&ensp;Settings Backup

The settings for both Technitium DNS server nodes are backed up in `.tar.gz` archives and stored on the [ZimaOS NAS](../02_hardware/zimaos_nas.md#device-overview){ data-preview }. Listed below are the directories where each settings backup archive are located. Each archive name has the server's FQDN and the date & time of the settings export. *(e.g., `pi-server.internal_<time>_<date>_backup.tar.gz`)*

``` text title="Debian Server (primary node)"
/DATA/Quick_Storage/Backup/debian-vm/Technituim/
```

``` text title="Pi 4B Server (secondary node)"
/DATA/Quick_Storage/Backup/pi-server/Technitium/
```

### :symbols-file-cog:&ensp;Zone Files

``` zone { .mono-title title="50.168.192.in-addr.arpa.zone" linenums="1" }
--8<-- "50.168.192.in-addr.arpa.zone"
```

``` zone { .mono-title title="cluster-catalog.internal.zone" linenums="1" }
--8<-- "cluster-catalog.internal.zone"
```

``` zone { .mono-title title="internal.zone" linenums="1" }
--8<-- "internal.zone"
```
