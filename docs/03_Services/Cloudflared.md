---
icon: simple/cloudflare
title: Cloudflared
subtitle: Reverse-Proxy Server
description: Secure reverse-proxy tunnel for hosting private services on the public internet.
tags:
  - Active
  - Docker
  - Remote Access
  - Network
  - Infrastructure
  - DNS
  - Service
hide:
  - toc
---
![Cloudflare Logo](../assets/icons/cloudflare.svg){ width=200 }

# Cloudflared
*Reverse-Proxy Server*

[GitHub&ensp;:simple-github:](https://github.com/cloudflare/cloudflared){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation-outline:](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/){ .md-button .md-button--primary }&emsp;[Zero-Trust Dashboard&ensp;:services-cloudflare-zero-trust:](https://dash.cloudflare.com/login){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Secure reverse-proxy tunnel for hosting private services on the public internet.

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `14333`

#### :symbols-link:&ensp;URL / Access

+ <http://storage-server.internal:14333>
+ <http://storage-server-2.internal:14333>

#### :symbols-user-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Software&ensp;:symbols-arrow-right-thin:&ensp;"Cloudflare Dashboard"
+ [:simple-github:&nbsp;GitHub OAuth](https://github.com/settings/developers)
+ 2FA / MFA:
    + :symbols-security-key:&nbsp;FIDO2 / WebAuthn
    + :symbols-clock:&nbsp;TOTP 

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                      | Method                                | Container Name      | Image                              |
| :----------------------------------------------------------------------------------------------- | :------------------------------------ | :------------------ | :--------------------------------- |
| [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :services-docker:&nbsp;Docker Compose | `cloudflare-tunnel` | `cloudflare/cloudflared:latest`    |
| [:symbols-nas-outline:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                       | :services-docker:&nbsp;Docker Compose | `cloudflared`       | `wisdomsky/cloudflared-web:latest` |

### :symbols-settings:&ensp;Configuration

```yaml title="Raspberry Pi 4B Server" linenums="1"
--8<-- "cloudflared-pi-server.yml"
```

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "cloudflared.yaml"
```
