---
icon: services/pi-hole
title: Pi-hole
subtitle: A DNS Sinkhole
description: A DNS sinkhole that protects your devices from unwanted content without installing any client-side software.
status: deprecated
tags:
  - Deprecated
  - DNS
  - Infrastructure
  - Native
  - Network
  - Service
hide:
  - toc
---

![Pi-hole Logo](../assets/icons/pi-hole.svg){ width=200 }

# Pi-hole

_A DNS Sinkhole_

[GitHub&ensp;:brands-github:](https://github.com/pi-hole/pi-hole){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.pi-hole.net/){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description:

:    A DNS sinkhole that protects your devices from unwanted content without installing any client-side software.

#### :symbols-hash:&ensp;Port(s)

-   Web:
{ .no-bullets }
    - `80`
    - `443`
-   DNS:
{ .no-bullets }
    - `53`

#### :symbols-link-2:&ensp;URL / Access

- ~~<https://pi-server.internal/admin/login>~~
{ .no-bullets }
- ~~<https://pi-hole.internal/admin/login>~~
{ .no-bullets }

#### :symbols-user-key:&ensp;Credentials 

- [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Pihole Admin @ pi-zero"
    - Local Network&ensp;:symbols-move-right:&ensp;"Pihole Admin @ pi-server"
- 2FA / MFA
{ .no-bullets }
    - :symbols-clock:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                                        | Method                          | Container Name | Image |
| :--------------------------------------------------------------------------------- | :------------------------------ | :------------- | :---- |
| [:symbols-server:&nbsp;~~Pi 4B Server~~](../02_hardware/pi_4b_server.md)           | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server:&nbsp;~~Pi Zero 2W Server~~](../02_hardware/pi_zero_2w_server.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

!!! tip

    **Configure DoH / DoT with Pi-hole:**
    :    For secure, encrypted recursive DNS queries, configure `dnscrypt-proxy`.

        - [Pi-hole w/ dnscrypt-proxy](https://docs.pi-hole.net/guides/dns/dnscrypt-proxy/){ external-link }

    **Synchronize Pi-hole Settings:**
    :    To synchronize the settings from the primary Pi-hole instance to a second instance use [Nebula-Sync](nebula-sync.md).

#### :symbols-monitor-arrow-down-corner:&ensp;Install

``` bash linenums="1"
curl -sSL https://install.pi-hole.net | bash
```

#### :symbols-file-cog:&ensp;Pi-hole Config File

``` toml { .mono-title title="/etc/pihole/pihole.toml" linenums="1" }
--8<-- "pihole.toml"
```