---
icon: services/beszel
title: Beszel
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

# Beszel (Hub & Agent)
[GitHub :material-github:](https://github.com/henrygd/beszel){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/henrygd/beszel-docs){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A lightweight server monitoring hub with historical data, docker stats, and alerts. Includes the **"Hub"** container *(the main server)* and **"Agent"** containers for connecting other servers to the hub.

#### :symbols-settings-ethernet: Port(s):
+ :material-hub:&nbsp;Hub:
    + `8090`
+ :material-console-network:&nbsp;Agent:
    + `45867` 

#### :material-link-variant: URL / Access: 
+ <https://beszel.internal>
+ <http://pi-server.internal:8090/>

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network :material-arrow-right-thin: "Beszel Hub (Admin)"
+ :material-docker:&nbsp;Docker Compose: 
    + `docker-compose.yml`

## :symbols-deployed-code-update: Deployment Details

### :material-hub: Hub

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `beszel-hub` | `henrygd/beszel:latest` |
|  | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:latest` |

### :material-console-network: Agents

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md) | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:latest` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:latest` |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:alpine` |

### :material-cog: Configuration

#### :material-hub: Hub:

```yaml title="Raspberry Pi 4B Server" linenums="1"
services:
  beszel:
    image: henrygd/beszel:latest
    container_name: beszel-hub
    restart: unless-stopped
    ports:
      - 8090:8090
    volumes:
      - ./beszel_data:/beszel_data
      - ./beszel_socket:/beszel_socket
    dns:
      - 192.168.50.6
      - 192.168.50.2

  beszel-agent:
    image: henrygd/beszel-agent
    container_name: beszel-agent
    restart: unless-stopped
    network_mode: host
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./beszel_agent_data:/var/lib/beszel-agent
      # - /mnt/disk/.beszel:/extra-filesystems/sda1:ro  (1)
      - /mnt/usb-drive/.beszel:/extra-filesystems/sda1__usb-drive:ro
    environment:
      LISTEN: /beszel_socket/beszel.sock
      KEY: 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK/q0pQSR0NXnA93R74Vdmv05DMmk+OWX36W1KFK31EI'
      TOKEN: 879-279c30f663-5ff-f7ca42f129c
      HUB_URL: http://pi-server.internal:8090
    dns:
      - 192.168.50.6
      - 192.168.50.2
```

1. Monitor other disks / partitions by mounting a folder in /extra-filesystems.

#### :material-console-network: Agents:

```yaml title="Debian Server VM" linenums="1"
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
      # - /mnt/disk/.beszel:/extra-filesystems/sda1:ro  (1)
    environment:
      LISTEN: 45876
      KEY: ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK/q0pQSR0NXnA93R74Vdmv05DMmk+OWX36W1KFK31EI
      TOKEN: 1865d0-c55e3f8b-ef571-729963ea8
      HUB_URL: http://pi-server.internal:8090
```

1. Monitor other disks / partitions by mounting a folder in /extra-filesystems.

```yaml title="Raspberry Pi Zero Server" linenums="1"
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
      # - /mnt/disk/.beszel:/extra-filesystems/sda1:ro  (1)
    environment:
      LISTEN: 45876
      KEY: ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK/q0pQSR0NXnA93R74Vdmv05DMmk+OWX36W1KFK31EI
      TOKEN: 3630d-aee6185c6-f48d6-f03c1cf38
      HUB_URL: http://pi-server.internal:8090
```

1. Monitor other disks / partitions by mounting a folder in /extra-filesystems.

```yaml title="ZimaOS NAS" linenums="1"
name: beszel-agent
services:
  beszel-agent:
    cap_add:
      - SYS_RAWIO
      - SYS_ADMIN
    cpu_shares: 90
    container_name: beszel-agent
    deploy:
      resources:
        limits:
          memory: 16508309504
    devices:
      - /dev/sda:/dev/sda
      - /dev/sdb:/dev/sdb
      - /dev/nvme0:/dev/nvme0
    environment:
      - HUB_URL=http://pi-server.internal:8090
      - KEY=ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK/q0pQSR0NXnA93R74Vdmv05DMmk+OWX36W1KFK31EI
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
    network_mode: host
    privileged: false
```