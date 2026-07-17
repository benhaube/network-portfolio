---
icon: services/pi-hole
title: Pi-hole
subtitle: A DNS Sinkhole
description: A DNS sinkhole that protects your devices from unwanted content without installing any client-side software.
status: deprecated
tags:
  - Deprecated
  - DNS
  - Network
  - Infrastructure
  - Native
  - Service
hide:
  - toc
---
![Pi-hole Logo](../assets/icons/pi-hole.svg){ width=200 }

# Pi-hole
*A DNS Sinkhole*

[GitHub&ensp;:brands-github:](https://github.com/pi-hole/pi-hole){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.pi-hole.net/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description:  

:    A DNS sinkhole that protects your devices from unwanted content without installing any client-side software.

#### :symbols-settings-ethernet:&ensp;Port(s)

:    Web: 

      + `80` 
      + `443`

:    DNS: 

      + `53`

#### :symbols-link:&ensp;URL / Access  

:    ~~<https://pi-server.internal/admin/login>~~

:    ~~<https://pi-hole.internal/admin/login>~~

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"Pihole Admin @ pi-zero"
      + Local Network&ensp;:symbols-move-right:&ensp;"Pihole Admin @ pi-server"

:    2FA / MFA:
    
      + :symbols-clock:&nbsp;TOTP 

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                                        | Method                              | Container Name | Image |
| :--------------------------------------------------------------------------------- | :---------------------------------- | :------------- | :---- |
| [:symbols-server:&nbsp;~~Pi 4B Server~~](../02_hardware/pi_4b_server.md)           | :symbols-penguin:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server:&nbsp;~~Pi Zero 2W Server~~](../02_hardware/pi_zero_2w_server.md) | :symbols-penguin:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

!!! tip

    **Configure DoH / DoT with Pi-hole:**
    :    For secure, encrypted recursive DNS queries, configure `dnscrypt-proxy`. 

        * [Pi-hole w/ dnscrypt-proxy:symbols-external-link-small:](https://docs.pi-hole.net/guides/dns/dnscrypt-proxy/)

    **Synchronize Pi-hole Settings:**
    :    To synchronize the settings from the primary Pi-hole instance to a second instance use [Nebula-Sync](nebula-sync.md). 

#### :symbols-install-desktop:&ensp;Install

```bash linenums="1"
curl -sSL https://install.pi-hole.net | bash
```

#### :symbols-file-config:&ensp;Pi-hole Config File

```toml {title="/etc/pihole/pihole.toml" linenums="1" .mono-title}
--8<-- "pihole.toml"
```