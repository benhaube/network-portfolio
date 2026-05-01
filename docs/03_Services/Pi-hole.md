---
icon: simple/pihole
title: Pi-hole DNS Server
status: deprecated
tags:
  - Inactive
  - Service
  - Software
  - DNS
  - Network
  - Infrastructure
  - Native
hide:
  - toc
---
![Pi-hole Logo](../assets/icons/pi-hole.svg){ width=200 }

# Pi-hole DNS Server
[GitHub :material-github:](https://github.com/pi-hole/pi-hole){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.pi-hole.net/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description:  
+ DNS Blocker

#### :symbols-settings-ethernet: Port(s):
+ Web: `80`, `443`
+ DNS: `53`

#### :material-link-variant: URL / Access:  
+ ~~[[https://pi-server.internal/admin/login]]~~
+ ~~[[https://pi-hole.internal/admin/login]]~~

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + "Pi-hole Admin @ (pi-hole)"
    + "Pi-hole Admin @ (pi-server)"

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;~~[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)~~ | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |
| :material-raspberry-pi:&nbsp;~~[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md)~~ | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |

### :material-cog: Configuration

#### :symbols-install-desktop: Install:

```bash linenums="1"
curl -sSL https://install.pi-hole.net | bash
```

#### :material-file-cog: Pi-hole Config file:

```toml title="/etc/pihole/pihole.toml" linenums="1"
--8<-- "pihole.toml"
```

> [!tip]+ Configure DoH / DoT with Pi-hole
> For secure, encrypted recursive DNS queries, configure `dnscrypt-proxy`. 
> * [Pi-hole w/ dnscrypt-proxy](https://docs.pi-hole.net/guides/dns/dnscrypt-proxy/)

> [!tip]+ Synchronize Pi-hole Settings
> To synchronize the settings from the primary Pi-hole instance to a second instance use [[Nebula-Sync]]. 
