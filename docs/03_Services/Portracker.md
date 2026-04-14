---
icon: services/portracker
tags:
  - active
  - service
  - software
  - docker
  - monitor
  - network
  - infrastructure
hide:
  - toc
---
![Portracker Icon](../assets/icons/portracker-light.svg#only-light){ width=200 }
![Portracker Icon](../assets/icons/portracker-dark.svg#only-dark){ width=200 }

# [[Portracker]]
[GitHub :material-github:](https://github.com/mostafa-wahied/portracker){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### Purpose:
+ A self-hosted, real-time port monitoring and discovery tool.

#### Port(s):
+ `4999`

#### URL / Access: 
+ <http://192.168.50.4:4999>
+ <http://storage-server.internal:4999>

#### Credentials:
+ N/A

## :material-package-down: Deployment Details 

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :services-zimaos:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `portracker` | `mostafawahied/portracker:latest` |
| :simple-raspberrypi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `portracker` | `mostafawahied/portracker:latest` |
| :simple-raspberrypi:&nbsp;~~[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md)~~ | :material-docker:&nbsp;Docker Compose | `portracker` | `mostafawahied/portracker:latest` |

### :material-cog: Configuration  

#### ZimaOS NAS:

```yaml title="docker-compose.yml" linenums="1"
name: big-bear-portracker
services:
  big-bear-portracker:
    cpu_shares: 90
    command: []
    container_name: big-bear-portracker
    deploy:
      resources:
        limits:
          memory: 16508252160
        reservations:
          devices: []
    environment:
      - CACHE_TIMEOUT_MS=30000
      - DATABASE_PATH=/data/portracker.db
      - DEBUG=false
      - DISABLE_CACHE=false
      - INCLUDE_UDP=false
      - PORT=4999
      - TRUSTED_LOCAL_EMAIL=your@email.com
    image: mostafawahied/portracker:latest
    labels:
      icon: https://cdn.jsdelivr.net/gh/selfhst/icons/png/portracker.png
    ports:
      - mode: ingress
        target: 4999
        published: "4999"
        protocol: tcp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/big-bear-portracker/data
        target: /data
        bind:
          create_host_path: true
      - type: bind
        source: /var/run/docker.sock
        target: /var/run/docker.sock
        bind:
          create_host_path: true
    x-casaos:
      envs:
        - container: PORT
          description:
            en_us: "Container Variable: PORT"
        - container: DATABASE_PATH
          description:
            en_us: "Container Variable: DATABASE_PATH"
        - container: TRUSTED_LOCAL_EMAIL
          description:
            en_us: "Container Variable: TRUSTED_LOCAL_EMAIL"
        - container: CACHE_TIMEOUT_MS
          description:
            en_us: "Container Variable: CACHE_TIMEOUT_MS"
        - container: DISABLE_CACHE
          description:
            en_us: "Container Variable: DISABLE_CACHE"
        - container: INCLUDE_UDP
          description:
            en_us: "Container Variable: INCLUDE_UDP"
        - container: DEBUG
          description:
            en_us: "Container Variable: DEBUG"
      ports:
        - container: "4999"
          description:
            en_us: "Container Port: 4999"
      volumes:
        - container: /data
          description:
            en_us: "Container Path: /data"
        - container: /var/run/docker.sock
          description:
            en_us: "Container Path: /var/run/docker.sock"
    devices: []
    cap_add: []
    networks:
      - default
    privileged: false
networks:
  default:
    name: big-bear-portracker_default
x-casaos:
  architectures:
    - amd64
    - arm64
  author: BigBearTechWorld
  category: BigBearCasaOS
  description:
    en_us: A self-hosted, real-time port monitoring and discovery tool that
      automatically discovers and maps network services across systems.
  developer: Mostafa-Wahied
  hostname: ""
  icon: https://cdn.jsdelivr.net/gh/selfhst/icons/png/portracker.png
  index: /
  is_uncontrolled: false
  main: big-bear-portracker
  port_map: "4999"
  scheme: http
  screenshot_link:
    - https://cdn.jsdelivr.net/gh/bigbeartechworld/big-bear-universal-apps@main/apps/portracker/screenshots/screenshot-1.png
    - https://cdn.jsdelivr.net/gh/bigbeartechworld/big-bear-universal-apps@main/apps/portracker/screenshots/screenshot-2.png
    - https://cdn.jsdelivr.net/gh/bigbeartechworld/big-bear-universal-apps@main/apps/portracker/screenshots/screenshot-3.png
    - https://cdn.jsdelivr.net/gh/bigbeartechworld/big-bear-universal-apps@main/apps/portracker/screenshots/screenshot-4.png
  store_app_id: big-bear-portracker
  tagline:
    en_us: Real-time Port Monitoring Tool
  thumbnail: ""
  tips:
    before_install:
      en_us: >-
        Portracker is a self-hosted port monitoring tool that automatically
        discovers network services.
                        
        Read this before installing: https://community.bigbeartechworld.com/t/added-portracker-to-bigbearcasaos/5003?u=dragonfire1119
  title:
    custom: ""
    en_us: Portracker
```

#### Raspberry Pi 4B Server:

```yaml title="docker-compose.yml" linenums="1"
services:
  portracker:
    image: mostafawahied/portracker:latest
    container_name: portracker
    restart: unless-stopped
    pid: "host"  # Required for port detection
    # Required permissions for system ports service namespace access
    cap_add:
      - SYS_PTRACE     # Linux hosts: read other PIDs' /proc entries
      - SYS_ADMIN      # Docker Desktop: allow namespace access for host ports (required for MacOS)
    security_opt:
      - apparmor:unconfined # Required for system ports
    volumes:
      # Required for data persistence
      - ./portracker-data:/data
      # Required for discovering services running in Docker
      - /var/run/docker.sock:/var/run/docker.sock:ro
    ports:
      - "4999:4999"
    # environment:
      # Optional: For enhanced TrueNAS features
      # - TRUENAS_API_KEY=your-api-key-here
```

#### ~~Raspberry Pi Zero Server:~~

```yaml title="docker-compose.yml" linenums="1"
services:
  portracker:
    image: mostafawahied/portracker:latest
    container_name: portracker
    restart: unless-stopped
    pid: "host"  # Required for port detection
    # Required permissions for system ports service namespace access
    cap_add:
      - SYS_PTRACE     # Linux hosts: read other PIDs' /proc entries
      - SYS_ADMIN      # Docker Desktop: allow namespace access for host ports (required for MacOS)
    security_opt:
      - apparmor:unconfined # Required for system ports
    volumes:
      # Required for data persistence
      - ./portracker-data:/data
      # Required for discovering services running in Docker
      - /var/run/docker.sock:/var/run/docker.sock:ro
    ports:
      - "4999:4999"
    # environment:
      # Optional: For enhanced TrueNAS features
      # - TRUENAS_API_KEY=your-api-key-here
```
