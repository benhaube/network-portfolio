---
icon: services/spoolman
tags:
  - Active
  - Service
  - Software
  - Docker
  - 3D-Printer
hide:
  - toc
---
![Spoolman logo](../assets/icons/spoolman.svg){ width=200 }

# Spoolman
[GitHub :material-github:](https://github.com/Donkie/Spoolman){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/Donkie/Spoolman/wiki/Installation){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Manage 3D-printer filament inventory, and actively track filament usage.

#### :symbols-settings-ethernet: Port(s):
+ `7912`

#### :material-link-variant: URL / Access:   
+ <http://storage-server.internal:7912/>
+ <https://spoolman.internal>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `spoolman` | `ghcr.io/donkie/spoolman:0.22.1` |

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
services:
  app:
    cpu_shares: 90
    container_name: spoolman
    deploy:
      resources:
        limits:
          memory: 16508235776
        reservations:
    environment:
      - SPOOLMAN_AUTOMATIC_BACKUP=TRUE
      - SPOOLMAN_DB_TYPE=sqlite
      - SPOOLMAN_LOGGING_LEVEL=INFO
      - TZ=America/New_York
    image: ghcr.io/donkie/spoolman:latest
    labels:
      icon: https://cdn.jsdelivr.net/gh/selfhst/icons/png/spoolman.png
    ports:
      - mode: ingress
        target: 8000
        published: "7912"
        protocol: tcp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/big-bear-spoolman/data
        target: /home/app/.local/share/spoolman
        bind:
          create_host_path: true
```
