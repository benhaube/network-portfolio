---
icon: services/cloudflare
title: Cloudflared
subtitle: Reverse-Proxy Server
description: Secure reverse-proxy tunnel for hosting private services on the public internet.
tags:
  - Active
  - Container
  - DNS
  - Infrastructure
  - Network
  - Remote Access
  - Service
hide:
  - toc
---

![Cloudflare Logo](../assets/icons/cloudflare.svg){ width=200 }

# Cloudflared

_Reverse-Proxy Server_

[GitHub&ensp;:brands-github:](https://github.com/cloudflare/cloudflared){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/){ .md-button .md-button--primary }&emsp;[Zero-Trust Dashboard&ensp;:services-cloudflare-zero-trust:](https://dash.cloudflare.com/login){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Secure reverse-proxy tunnel for hosting private services on the public internet.

#### :symbols-hash:&ensp;Port(s) 

:    `14333`

#### :symbols-link-2:&ensp;URL / Access 

- <http://storage-server.internal:14333>
{ .no-bullets }
- <http://storage-server-2.internal:14333>
{ .no-bullets }

#### :symbols-user-key:&ensp;Credentials 

- [:brands-github:&ensp;GitHub OAuth](https://github.com/settings/developers){ external-link }
{ .no-bullets }
- [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }
{ .no-bullets }
    - Software&ensp;:symbols-move-right:&ensp;"Cloudflare Dashboard"
- 2FA / MFA
{ .no-bullets }
    - :symbols-key-fido2:&ensp;FIDO2 / WebAuthn
    - :symbols-clock:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name      | Image                              |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------------ | :--------------------------------- |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `cloudflare-tunnel` | `cloudflare/cloudflared:latest`    |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `cloudflared`       | `wisdomsky/cloudflared-web:latest` |

### :symbols-settings:&ensp;Configuration

#### :symbols-server:&ensp;Pi 4B Server

--8<-- "deploy_with_dockge.md"

``` yaml { .mono-title title="/opt/stacks/cloudflared/compose.yaml" linenums="1" }
--8<-- "cloudflared-pi-server.yml"
```

#### :symbols-server-nas:&ensp;ZimaOS NAS

``` yaml { .mono-title title="~/.casaos/apps/cloudflared/docker-compose.yml" linenums="1" }
--8<-- "cloudflared.yaml"
```