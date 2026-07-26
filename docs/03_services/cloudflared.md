---
icon: services/cloudflare
title: Cloudflared
subtitle: Reverse-Proxy Server
description: Secure reverse-proxy tunnel for hosting private services on the public internet.
tags:
  - Active
  - Container
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

[GitHub&ensp;:brands-github:](https://github.com/cloudflare/cloudflared){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/){ .md-button .md-button--primary }&emsp;[Zero-Trust Dashboard&ensp;:services-cloudflare-zero-trust:](https://dash.cloudflare.com/login){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Secure reverse-proxy tunnel for hosting private services on the public internet.

#### :symbols-chevrons-left-right-ellipsis:&ensp;Port(s) 

:    `14333`

#### :symbols-link:&ensp;URL / Access

:    <http://storage-server.internal:14333>

:    <http://storage-server-2.internal:14333>

#### :symbols-user-key:&ensp;Credentials 

:    [:brands-github:&ensp;GitHub OAuth](https://github.com/settings/developers){ external-link }

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Software&ensp;:symbols-move-right:&ensp;"Cloudflare Dashboard"

:    2FA / MFA:
      
      + :symbols-key-fido2:&ensp;FIDO2 / WebAuthn
      + :symbols-clock:&ensp;TOTP 

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name      | Image                              |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------------ | :--------------------------------- |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `cloudflare-tunnel` | `cloudflare/cloudflared:latest`    |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `cloudflared`       | `wisdomsky/cloudflared-web:latest` |

### :symbols-settings:&ensp;Configuration

```yaml title="Pi 4B Server" linenums="1"
--8<-- "cloudflared-pi-server.yml"
```

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "cloudflared.yaml"
```
