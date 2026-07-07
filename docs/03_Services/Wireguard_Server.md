---
icon: simple/wireguard
title: WireGuard
subtitle: A Simple, Modern VPN
description: An extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography.
tags:
  - Active
  - Docker
  - Remote Access
  - VPN
  - Network
  - Native
hide:
  - toc
---
![WireGuard Icon](../assets/icons/wireguard.svg){ width=200 }

# WireGuard
*A Simple, Modern VPN*

[GitHub&ensp;:simple-github:](https://github.com/wg-easy/wg-easy){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://wg-easy.github.io/wg-easy/latest/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    An extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography.

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `41820`
+ `51820`
+ `51821` *(for [configuration WebUI](http://storage-server.internal:51821) on :symbols-nas-outline:&nbsp;ZimaOS NAS)*

#### :symbols-link:&ensp;URL / Access 

+ :symbols-vpn-outline:&nbsp;Server Endpoint:
    + `rac3r4life.myaddr.dev:41820` *(for :symbols-router-outline:&nbsp;ASUS RT-BE92U)*
    + `rac3r4life.myaddr.dev:51820` *(for :symbols-nas-outline:&nbsp;ZimaOS NAS)*
+ :symbols-cogs:&nbsp;Web UI Admin: 
    + <http://storage-server.internal:51821/>
    + <http://storage-server-2.internal:51821/>

#### :symbols-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"WireGuard Admin"
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"WireGuard Metrics"

#### :symbols-devices:&ensp;Clients

+ :symbols-router-outline:&nbsp;ASUS RT-BE92U:
    + `Ben's-Phone`
    + `Ben's-Laptop`
    + `Rob's-Phone`
    + `Rob's-Laptop`
+ :symbols-nas-outline:&nbsp;ZimaOS NAS:
    + `ben-laptop`
    + `ben-pixel`
    + `rob-laptop`
    + `rob-phone`

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                    | Method                                | Container Name         | Image                        |
| :----------------------------------------------------------------------------- | :------------------------------------ | :--------------------- | :--------------------------- |
| [:symbols-router-outline:&nbsp;ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | :symbols-linux:&nbsp;Native Linux     | `N/A`                  | `N/A`                        |
| [:symbols-nas-outline:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)     | :services-docker:&nbsp;Docker Compose | `big-bear-wg-easy-v15` | `ghcr.io/wg-easy/wg-easy:15` |

### :symbols-settings:&ensp;Configuration 

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "wireguard.yml"
```

1. Setting your password here is **NOT** recommended. Leave as the default, and change the password from the Web UI. 