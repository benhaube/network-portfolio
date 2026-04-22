---
icon: services/portracker
tags:
  - Active
  - Service
  - Software
  - Docker
  - Monitor
  - Network
  - Infrastructure
hide:
  - toc
---
![Portracker Icon](../assets/icons/portracker-light.svg#only-light){ width=200 }
![Portracker Icon](../assets/icons/portracker-dark.svg#only-dark){ width=200 }

# Portracker
[GitHub :material-github:](https://github.com/mostafa-wahied/portracker){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A self-hosted, real-time port monitoring and discovery tool.

#### :symbols-settings-ethernet: Port(s):
+ `4999`

#### :material-link-variant: URL / Access:  
+ <http://192.168.50.4:4999>
+ <http://storage-server.internal:4999>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `portracker` | `mostafawahied/portracker:latest` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `portracker` | `mostafawahied/portracker:latest` |
| :material-raspberry-pi:&nbsp;~~[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md)~~ | :material-docker:&nbsp;Docker Compose | `portracker` | `mostafawahied/portracker:latest` |

### :material-cog: Configuration  

#### :material-nas: ZimaOS NAS:

```yaml title="docker-compose.yml" linenums="1"
services:
  big-bear-portracker:
    cpu_shares: 90
    container_name: big-bear-portracker
    deploy:
      resources:
        limits:
          memory: 16508235776
        reservations:
    environment:
      - CACHE_TIMEOUT_MS=30000
      - DATABASE_PATH=/data/portracker.db
      - DEBUG=false
      - DISABLE_CACHE=false
      - INCLUDE_UDP=true
      - PORT=4999
      - TRUSTED_LOCAL_EMAIL=server@haube-pereira.com
    image: mostafawahied/portracker:latest
    labels:
      icon: https://cdn.jsdelivr.net/gh/selfhst/icons/png/portracker-light.png
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
```

#### :material-raspberry-pi: Raspberry Pi 4B Server:

```yaml title="docker-compose.yml" linenums="1"
services:
  portracker:
    image: mostafawahied/portracker:latest
    container_name: portracker
    restart: unless-stopped
    pid: "host"  # (1)!
    # (2)!
    cap_add:
      - SYS_PTRACE  # (3)!
      - SYS_ADMIN  # (4)!
    security_opt:
      - apparmor:unconfined  # (5)!
    volumes:
      - ./portracker-data:/data  # (6)!
      - /var/run/docker.sock:/var/run/docker.sock:ro  # (7)!
    ports:
      - "4999:4999"
    # environment:
      # - TRUENAS_API_KEY=your-api-key-here  (8)
```

1. Required for port detection.
2. Required permissions for system ports service namespace access.
3. **Linux hosts:** read other PIDs' `/proc` entries.
4. **Docker Desktop:** allow namespace access for host ports *(required for MacOS)*.
5. Required for system ports.
6. Required for data persistence.
7. Required for discovering services running in Docker.
8. **Optional:** For enhanced TrueNAS features

#### :material-raspberry-pi: ~~Raspberry Pi Zero Server:~~

```yaml title="docker-compose.yml" linenums="1"
services:
  portracker:
    image: mostafawahied/portracker:latest
    container_name: portracker
    restart: unless-stopped
    pid: "host"  # (1)!
    # (2)!
    cap_add:
      - SYS_PTRACE  # (3)!
      - SYS_ADMIN  #(4)!
    security_opt:
      - apparmor:unconfined  # (5)!
    volumes:
      - ./portracker-data:/data  # (6)!
      - /var/run/docker.sock:/var/run/docker.sock:ro  # (7)!
    ports:
      - "4999:4999"
    # environment:
      # - TRUENAS_API_KEY=your-api-key-here  (8)
```

1. Required for port detection.
2. Required permissions for system ports service namespace access.
3. **Linux hosts:** read other PIDs' `/proc` entries.
4. **Docker Desktop:** allow namespace access for host ports *(required for MacOS)*.
5. Required for system ports.
6. Required for data persistence.
7. Required for discovering services running in Docker.
8. **Optional:** For enhanced TrueNAS features
