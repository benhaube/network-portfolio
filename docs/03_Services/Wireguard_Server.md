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
![WireGuard Icon](../assets/icons/wireguard-rounded-square-light.svg#only-light){ width=200 }
![WireGuard Icon](../assets/icons/wireguard-rounded-square.svg#only-dark){ width=200 }

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
services:
  big-bear-wg-easy-v15:
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    cpu_shares: 90
    container_name: big-bear-wg-easy-v15
    deploy:
      resources:
        limits:
          memory: 16508235776
    environment:
      - INIT_DNS=9.9.9.9,149.112.112.112
      - INIT_ENABLED=true
      - INIT_HOST=https://remote-access-home-34.asuscomm.com
      - INIT_IPV4_CIDR=10.8.0.0/24
      - INIT_IPV6_CIDR=fd42:42:42::/64
      - INIT_PASSWORD=password  # (1)!
      - INIT_PORT=51820
      - INIT_USERNAME=admin
      - INSECURE=true
    image: ghcr.io/wg-easy/wg-easy:15.2
    labels:
      icon: https://cdn.jsdelivr.net/gh/bigbeartechworld/big-bear-universal-apps/apps/wg-easy-v15/logo.png
    ports:
      - mode: ingress
        target: 51820
        published: "51820"
        protocol: udp
      - mode: ingress
        target: 51821
        published: "51821"
        protocol: tcp
    restart: unless-stopped
    sysctls:
      net.ipv4.conf.all.src_valid_mark: "1"
      net.ipv4.ip_forward: "1"
      net.ipv6.conf.all.disable_ipv6: "0"
      net.ipv6.conf.all.forwarding: "1"
      net.ipv6.conf.default.forwarding: "1"
    volumes:
      - type: bind
        source: /DATA/AppData/big-bear-wg-easy-v15/data
        target: /etc/wireguard
        bind:
          create_host_path: true
    networks:
      - big-bear-wg-easy-v15
    privileged: false
networks:
  big-bear-wg-easy-v15:
    name: big-bear-wg-easy-v15
```

1. Setting your password here is **NOT** recommended. Leave as the default, and change the password from the Web UI. 