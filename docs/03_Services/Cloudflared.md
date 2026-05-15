---
icon: simple/cloudflare
title: Cloudflared
subtitle: Reverse-Proxy Server
description: Secure reverse-proxy tunnel for hosting private services on the public internet.
tags:
  - Active
  - Service
  - Software
  - Docker
  - Remote Access
  - Network
  - Infrastructure
  - DNS
hide:
  - toc
---
![Cloudflare Logo](../assets/icons/cloudflare.svg){ width=200 }

# Cloudflared
*Reverse-Proxy Server*

[GitHub :material-github:](https://github.com/cloudflare/cloudflared){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/){ .md-button .md-button--primary }&emsp;[Cloudflare :simple-cloudflare:](https://dash.cloudflare.com/login){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 

:    Secure reverse-proxy tunnel for hosting private services on the public internet.

#### :symbols-settings-ethernet: Port(s): 

+ `14333`

#### :material-link-variant: URL / Access: 

+ <http://storage-server.internal:14333>

#### :material-key-chain: Credentials: 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Software&ensp;:material-arrow-right-thin:&ensp;"Cloudflare Dashboard"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                                |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :----------------------------------- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `cloudflared`  | `wisdomsky/cloudflared-web:2026.3.0` |

### :material-cog: Configuration

```yaml title="<code>compose.yml</code>" linenums="1"
--8<-- "cloudflared.yaml"
```
