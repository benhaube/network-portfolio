---
icon: services/beszel
tags:
  - Active
  - Service
  - Software
  - Docker
  - Monitor
  - Infrastructure
hide:
  - toc
---
![Beszel Logo](../assets/icons/beszel.svg){ width=200 }

# Beszel Agent
[GitHub :material-github:](https://github.com/henrygd/beszel){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/henrygd/beszel-docs){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Agent for [[Beszel_Hub|Beszel Hub]], a server utilization monitor.  Allows for client servers to connect to hub.

#### :symbols-settings-ethernet: Port(s): 
+ `45867`

#### :material-link-variant: URL / Access: 
+ `N/A`

#### :material-key-chain: Credentials: 
+ :material-docker:&nbsp;Docker Compose: `docker-compose.yml`

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md) | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:latest` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:latest` |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:alpine` |

### :material-cog: Configuration

#### :material-debian: Debian VM Server:

```yaml title="docker-compose.yml" linenums="1"
services:
  beszel-agent:
    healthcheck:
      test:
        - CMD
        - /agent
        - health
      interval: 120s
    image: henrygd/beszel-agent
    container_name: beszel-agent
    restart: unless-stopped
    network_mode: host
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./beszel_agent_data:/var/lib/beszel-agent
      # monitor other disks / partitions by mounting a folder in /extra-filesystems
      # - /mnt/disk/.beszel:/extra-filesystems/sda1:ro
    environment:
      LISTEN: 45876
      KEY: ssh-ed25519
        AAAAC3NzaC1lZDI1NTE5AAAAIK/q0pQSR0NXnA93R74Vdmv05DMmk+OWX36W1KFK31EI
      TOKEN: 1865d0-c55e3f8b-ef571-729963ea8
      HUB_URL: http://pi-server.internal:8090
```

#### :material-raspberry-pi: Raspberry Pi Zero Server:

```yaml title="docker-compose.yml" linenums="1"
services:
  beszel-agent:
    healthcheck:
      test:
        - CMD
        - /agent
        - health
      interval: 120s
    image: henrygd/beszel-agent
    container_name: beszel-agent
    restart: unless-stopped
    network_mode: host
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./beszel_agent_data:/var/lib/beszel-agent
      # monitor other disks / partitions by mounting a folder in /extra-filesystems
      # - /mnt/disk/.beszel:/extra-filesystems/sda1:ro
    environment:
      LISTEN: 45876
      KEY: ssh-ed25519
        AAAAC3NzaC1lZDI1NTE5AAAAIK/q0pQSR0NXnA93R74Vdmv05DMmk+OWX36W1KFK31EI
      TOKEN: 3630d-aee6185c6-f48d6-f03c1cf38
      HUB_URL: http://pi-server.internal:8090
```

#### :material-nas: ZimaOS NAS: 

```yaml title="docker-compose.yml" linenums="1"
name: beszel-agent
services:
  beszel-agent:
    cap_add:
      - SYS_RAWIO
      - SYS_ADMIN
    cpu_shares: 90
    command: []
    container_name: beszel-agent
    deploy:
      resources:
        limits:
          memory: 16508309504
        reservations:
          devices: []
    devices:
      - /dev/sda:/dev/sda
      - /dev/sdb:/dev/sdb
      - /dev/nvme0:/dev/nvme0
    environment:
      - HUB_URL=http://pi-server.internal:8090
      - KEY=ssh-ed25519
        AAAAC3NzaC1lZDI1NTE5AAAAIK/q0pQSR0NXnA93R74Vdmv05DMmk+OWX36W1KFK31EI
      - LISTEN=45876
      - TOKEN=312a40-12e3243-1faf72-8199904e
    image: henrygd/beszel-agent:alpine
    labels:
      icon: https://cdn.jsdelivr.net/gh/selfhst/icons@main/svg/beszel.svg
    restart: unless-stopped
    volumes:
      - type: bind
        source: /var/run/docker.sock
        target: /var/run/docker.sock
      - type: bind
        source: /media/nvme0n1p1/AppData/beszel_agent_data
        target: /var/lib/beszel-agent
      - type: bind
        source: /media/Quick-Storage/.beszel
        target: /extra-filesystems/md0__Quick_Storage
    ports: []
    network_mode: host
    privileged: false
x-casaos:
  author: self
  category: self
  hostname: ""
  icon: https://cdn.jsdelivr.net/gh/selfhst/icons@main/svg/beszel.svg
  index: /
  is_uncontrolled: false
  port_map: "45876"
  scheme: http
  store_app_id: beszel-agent
  title:
    custom: ""
    en_us: beszel-agent
```
