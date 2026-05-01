---
icon: simple/wireguard
title: WireGuard
tags:
  - Active
  - Service
  - Software
  - Docker
  - Remote Access
  - VPN
  - Network
  - Native
hide:
  - toc
---
![WireGuard Icon](../assets/icons/wireguard-light.svg#only-light){ width=200 }
![WireGuard Icon](../assets/icons/wireguard.svg#only-dark){ width=200 }

# WireGuard Server
[GitHub :material-github:](https://github.com/wg-easy/wg-easy){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://wg-easy.github.io/wg-easy/latest/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A lightweight, secure remote access VPN server.

#### :symbols-settings-ethernet: Port(s): 
+ `41820`
+ `51820`
+ `51821` *(for [configuration WebUI](http://storage-server.internal:51821) on :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md))*

#### :material-link-variant: URL / Access: 
+ :material-vpn:&nbsp;Server Endpoint:
    + `remote-access-home-34.asuscomm.com:41820` *(for :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md))*
    + `remote-access-home-34.asuscomm.com:51820` *(for :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md))*
+ :material-application-cog-outline:&nbsp;Web UI Admin: 
    + <http://storage-server.internal:51821/>

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "WireGuard WebUI"

#### :material-account: Clients:

+ :material-router-wireless:&nbsp;ASUS RT-BE92U:
    + `Ben's-Phone`
    + `Ben's-Laptop`
    + `Rob's-Phone`
    + `Rob's-Laptop`
+ :material-nas:&nbsp;ZimaOS NAS:
    + `ben-laptop`
    + `ben-pixel`
    + `rob-laptop`
    + `rob-phone`

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `big-bear-wg-easy-v15` | `ghcr.io/wg-easy/wg-easy:15` |

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
--8<-- "wireguard.yml"
```

1. Setting your password here is **NOT** recommended. Leave as the default, and change the password from the Web UI. 