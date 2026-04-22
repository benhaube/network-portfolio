---
icon: services/nextcloud
status: deprecated
tags:
  - Inactive
  - Service
  - Software
  - Docker
  - File Share
hide:
  - toc
---
![Nextcloud Icon](../assets/icons/nextcloud-light.svg#only-light){ width=200 }
![Nextcloud Icon](../assets/icons/nextcloud.svg#only-dark){ width=200 }

# Nextcloud
[GitHub :material-github:](https://github.com/nextcloud/documentation){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.nextcloud.com/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Self-hosted cloud storage and collaboration platform.

#### :symbols-settings-ethernet: Port(s):
+ `10081`

#### :material-link-variant: URL / Access: 
+ ~~[[http://storage-server.internal:10081]]~~

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "storage-server (admin)"

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;~~[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)~~ | :material-docker:&nbsp;Docker Compose | `nextcloud` | `nextcloud:32.0` |

### :material-cog: Configuration

```yaml title="docker-compose.yml" linenums="1"
services:
  nextcloud:
    cpu_shares: 90
    container_name: nextcloud
    deploy:
      resources:
        limits:
          memory: 16508317696
        reservations:
          memory: "536870912"
    image: nextcloud:32.0
    labels:
      icon: https://cdn.jsdelivr.net/gh/IceWhaleTech/CasaOS-AppStore@main/Apps/Nextcloud/icon.png
    ports:
      - target: 80
        published: "10081"
        protocol: tcp
      - target: 443
        published: "10443"
        protocol: tcp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/nextcloud/var/www/html
        target: /var/www/html
    network_mode: bridge
    privileged: false
```
