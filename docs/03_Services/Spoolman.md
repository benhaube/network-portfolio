---
icon: services/spoolman
tags:
  - active
  - service
  - software
  - docker
  - 3D-printer
hide:
  - toc
---
![Spoolman logo](../assets/icons/spoolman.svg){ width=200 }

# Spoolman
[GitHub :material-github:](https://github.com/Donkie/Spoolman){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/Donkie/Spoolman/wiki/Installation){ .md-button }

---
## :material-information-outline: Overview

#### Purpose:
+ Manage 3D-printer filament inventory, and actively track filament usage.

#### Port(s):
+ `7912`

#### URL / Access: 
+ <http://storage-server.internal:7912/>
+ <https://spoolman.internal>

#### Credentials:
+ N/A

## :material-package-down: Deployment Details 

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :services-zimaos:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `spoolman` | `ghcr.io/donkie/spoolman:0.22.1` |

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
name: big-bear-spoolman
services:
  app:
    cpu_shares: 90
    command: []
    container_name: spoolman
    deploy:
      resources:
        limits:
          memory: 16508317696
        reservations:
          devices: []
    environment:
      - SPOOLMAN_AUTOMATIC_BACKUP=TRUE
      - SPOOLMAN_DB_TYPE=sqlite
      - SPOOLMAN_LOGGING_LEVEL=INFO
      - TZ=America/New_York
    image: ghcr.io/donkie/spoolman:0.22.1
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
    x-casaos:
      envs:
        - container: TZ
          description:
            en_us: "Container Variable: TZ"
        - container: SPOOLMAN_DB_TYPE
          description:
            en_us: "Container Variable: SPOOLMAN_DB_TYPE"
        - container: SPOOLMAN_LOGGING_LEVEL
          description:
            en_us: "Container Variable: SPOOLMAN_LOGGING_LEVEL"
        - container: SPOOLMAN_AUTOMATIC_BACKUP
          description:
            en_us: "Container Variable: SPOOLMAN_AUTOMATIC_BACKUP"
      ports:
        - container: "8000"
          description:
            en_us: "Container Port: 8000"
      volumes:
        - container: /home/app/.local/share/spoolman
          description:
            en_us: "Container Path: /home/app/.local/share/spoolman"
    devices: []
    cap_add: []
    network_mode: bridge
    privileged: false
x-casaos:
  architectures:
    - amd64
    - arm64
  author: BigBearTechWorld
  category: Utilities
  description:
    en_us: Keep track of your inventory of 3D-printer filament spools. Spoolman is a
      self-hosted web service designed to help you efficiently manage your 3D
      printer filament spools and monitor their usage.
  developer: Donkie
  hostname: ""
  icon: https://cdn.jsdelivr.net/gh/selfhst/icons/png/spoolman.png
  index: /
  is_uncontrolled: false
  main: app
  port_map: "7912"
  scheme: http
  store_app_id: big-bear-spoolman
  tagline:
    en_us: Filament spool inventory management for 3D printing
  thumbnail: https://cdn.jsdelivr.net/gh/bigbeartechworld/big-bear-universal-apps@main/apps/spoolman/screenshots-1.png
  title:
    custom: ""
    en_us: Spoolman
```
