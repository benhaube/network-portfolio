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

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `cloudflared` | `wisdomsky/cloudflared-web:2026.3.0` |

### :material-cog: Configuration

```yaml title="docker-compose.yml" linenums="1"
name: cloudflared
services:
  cloudflared:
    cpu_shares: 90
    container_name: cloudflared
    deploy:
      resources:
        limits:
          memory: 16508235776
        reservations:
    image: wisdomsky/cloudflared-web:2026.3.0
    labels:
      icon: data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xml%3Aspace%3D%22preserve%22%20viewBox%3D%220%200%20512%20512%22%3E%3Cpath%20d%3D%22m404.7%20239-10.6-4.2c-49.9%20112.3-248.5%2044-260.5%2077.5-2%2022.6%20108.5%204.3%20187.4%208.1%2024.1%201.2%2036.2%2019.3%2025.9%2049l20.1.1c23.2-72.4%2097.4-35.5%20100.5-59.4-5-15.8-85.1-.1-62.8-71.1%22%20style%3D%22fill%3A%23fff%22%2F%3E%3Cpath%20d%3D%22M352.7%20356.9c3.2-10.6%202.1-21.2-3.2-27.6s-12.7-10.6-22.3-11.7l-184.8-2.1c-1.1%200-2.1-1.1-3.2-1.1-1.1-1.1-1.1-2.1%200-3.2%201.1-2.1%202.1-3.2%204.2-3.2l185.9-2.1c22.3-1.1%2045.7-19.1%2054.2-40.4l10.6-27.6c0-1.1%201.1-2.1%200-3.2-11.7-54.2-60.5-94.5-117.9-94.5-53.1%200-98.8%2034-114.7%2081.8-10.6-7.4-23.4-11.7-38.2-10.6-25.5%202.1-45.7%2023.4-48.9%2048.9-1.1%206.4%200%2012.7%201.1%2019.1-41.5%201-75.5%2035-75.5%2077.5%200%204.2%200%207.4%201.1%2011.7%200%202.1%202.1%203.2%203.2%203.2h341c2.1%200%204.3-1.1%204.3-3.2z%22%20style%3D%22fill%3A%23f4811f%22%2F%3E%3Cpath%20d%3D%22M411.1%20237.9h-5.3c-1.1%200-2.1%201.1-3.2%202.1l-7.4%2025.5c-3.2%2010.6-2.1%2021.2%203.2%2027.6s12.7%2010.6%2022.3%2011.7L460%20307c1.1%200%202.1%201.1%203.2%201.1%201.1%201.1%201.1%202.1%200%203.2-1.1%202.1-2.1%203.2-4.2%203.2l-40.4%202.1c-22.3%201.1-45.7%2019.1-54.2%2040.4l-2.1%209.6c-1.1%201.1%200%203.2%202.1%203.2h140.2c2.1%200%203.2-1.1%203.2-3.2%202.1-8.5%204.2-18.1%204.2-27.6%200-55.4-45.7-101.1-100.9-101.1%22%20style%3D%22fill%3A%23faad3f%22%2F%3E%3C%2Fsvg%3E
    ports:
      - target: 14333
        published: "14333"
        protocol: tcp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/casaos-cloudflared/config
        target: /config
    x-casaos:
      ports:
        - container: "14333"
      volumes:
        - container: /config
    network_mode: host
    privileged: false
```
