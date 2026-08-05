---
icon: services/wireguard
title: WireGuard
subtitle: A Simple, Modern VPN
description: An extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography.
tags:
  - Active
  - Infrastructure
  - Native
  - Network
  - Remote Access
  - Service
  - VPN
hide:
  - toc
---
![WireGuard Icon](../assets/icons/wireguard.svg){ width=200 }

# WireGuard
*A Simple, Modern VPN*

[GitHub&ensp;:brands-github:](https://github.com/wg-easy/wg-easy){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://wg-easy.github.io/wg-easy/latest/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    An extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography.

#### :symbols-hash:&ensp;Port(s) 

:    `41820`

#### :symbols-link-2:&ensp;URL / Access  

:    :symbols-waypoints:&nbsp;Server Endpoint:
    
      + `rac3r4life.myaddr.dev:41820` 

:    :symbols-monitor-cog:&nbsp;Web UI Admin: 
    
      + <https://asusrouter.internal:8443/Advanced_VPNServer_Content.asp>

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
      
      + Local Network&ensp;:symbols-move-right:&ensp;"ASUS Router" 

#### :symbols-monitor-smartphone:&ensp;Client Profiles

:    :symbols-router:&nbsp;ASUS RT-BE92U:
    
      + `Ben's-Phone`
      + `Ben's-Laptop`
      + `Rob's-Phone`
      + `Rob's-Laptop`

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                            | Method                                | Container Name | Image |
| :--------------------------------------------------------------------- | :------------------------------------ | :------------- | :---- |
| [:symbols-router:&nbsp;ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md) | :symbols-tux:&nbsp;Native Linux       | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration 

1. Log into the [ASUS Router's Web UI](https://asusrouter.internal:8443){ external-link } and navigate to the **"Advanced VPN Server Content"** page.

      <figure markdown="span">
            ![ASUS Router navigation to VPN settings](../assets/screenshots/asus_router_advanced_vpn_server_content.png){ width=600 }
      </figure>

2. Select **"General"** in the drop-down menu to add / remove / edit clients, change the tunnel IP address, change the listening port, or turn on / off intranet access.

      <figure markdown="span">
            ![ASUS Router WireGuard "General" settings](../assets/screenshots/asus_router_wireguard_general.png){ width=600 }
      </figure>

3. Select **"Advanced Settings"** in the drop-down menu to configure DNS, IPv6 NAT, persistent keepalive, and change the server's pre-shared key. 

      <figure markdown="span">
            ![ASUS Router WireGuard "Advanced" settings](../assets/screenshots/asus_router_wireguard_advanced.png){ width=600 }
      </figure>