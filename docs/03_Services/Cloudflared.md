---
icon: simple/cloudflare
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
[GitHub :material-github:](https://github.com/cloudflare/cloudflared){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/){ .md-button }&emsp;[Cloudflare :simple-cloudflare:](https://dash.cloudflare.com/login){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Secure reverse-proxy tunnel for hosting private services on the public internet.

#### :symbols-settings-ethernet: Port(s): 
+ `14333`

#### :material-link-variant: URL / Access: 
+ <http://storage-server.internal:14333>

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "Cloudflare Dashboard"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                                |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :----------------------------------- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `cloudflared`  | `wisdomsky/cloudflared-web:2026.3.0` |

### :material-cog: Configuration

```yaml title="compose.yml" linenums="1"
--8<-- "cloudflared.yaml"
```
