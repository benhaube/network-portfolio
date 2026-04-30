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
+ Hub:
    + `8090`
+ Agent:
    + `45867` 

#### :material-link-variant: URL / Access: 
+ <https://beszel.internal>
+ <http://pi-server.internal:8090/>

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network :material-arrow-right-thin: "Beszel Hub (Admin)"
+ :material-docker:&nbsp;Docker Compose: 
    + `compose.yml`

## :symbols-deployed-code-update: Deployment Details

### Hub

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `beszel-hub` | `henrygd/beszel:latest` |
|  | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:latest` |

### Agents

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md) | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:latest` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:latest` |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:alpine` |

### :material-cog: Configuration

#### Hub:

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

#### Agents:

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
      icon: data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xml%3Aspace%3D%22preserve%22%20viewBox%3D%220%200%20512%20512%22%3E%3ClinearGradient%20id%3D%22beszel_svg__a%22%20x1%3D%22433.391%22%20x2%3D%22-10.605%22%20y1%3D%22446.179%22%20y2%3D%2273.621%22%20gradientUnits%3D%22userSpaceOnUse%22%3E%3Cstop%20offset%3D%220%22%20style%3D%22stop-color%3A%2352cf83%22%2F%3E%3Cstop%20offset%3D%22.63%22%20style%3D%22stop-color%3A%236d98d2%22%2F%3E%3Cstop%20offset%3D%221%22%20style%3D%22stop-color%3A%237b7bfc%22%2F%3E%3C%2FlinearGradient%3E%3Cpath%20d%3D%22M307.2%20512h-256V0h256c21.5%200%2041.4%204.1%2060%2012.4%2018%207.8%2034.4%2019%2048.3%2032.9C429.6%2059%20440.6%2075%20448.4%2093.6c8.3%2019%2012.4%2039%2012.4%2060%20.1%207.9-.6%2015.7-2.2%2023.4-.4%202-.9%203.9-1.5%205.9-2.6%2010.1-6.2%2019.9-11%2029.3-4.8%209-10.7%2017.3-17.6%2024.9-5.6%206.4-12%2012.1-19%2016.8-1%20.8-1.9%201.5-2.9%202.2q12.45%207.35%2021.9%2018.3c6.8%207.8%2012.7%2016.3%2017.6%2025.6%204.8%209.3%208.5%2019.1%2011%2029.3%201.9%207.2%203.1%2014.5%203.7%2021.9.1%202.4.1%204.9%200%207.3%200%2021.5-4.1%2041.4-12.4%2060-7.8%2018-19%2034.4-32.9%2048.3-13.7%2014.1-29.7%2025.4-48.3%2033.6-18.6%207.7-38.6%2011.6-60%2011.6M153.6%20102.4v102.4h153.6c5.7.2%2011.4-.5%2016.8-2.2%201-.5%202-.9%202.9-1.5%206.3-2.4%2011.9-6.1%2016.8-11%204.7-4.6%208.4-10.1%2011-16.1%202.4-6.3%203.7-13.2%203.7-20.5%200-5.7-1-11.4-2.9-16.8-.2-1-.5-2-.7-2.9-2.9-6.3-6.6-11.9-11-16.8-4.9-4.5-10.6-7.9-16.8-10.2-5.8-2.6-12-4.1-18.3-4.4zm0%20204.8v102.4h153.6c5.7%200%2011.4-1%2016.8-2.9%201-.2%202-.5%202.9-.7%206.3-2.9%2011.9-6.6%2016.8-11%204.7-4.6%208.4-10.1%2011-16.1%202.4-6%203.7-12.5%203.7-19v-1.5c0-5.7-1-11.4-2.9-16.8-.2-1-.5-2-.7-2.9-2.9-6.3-6.6-11.9-11-16.8-4.8-4.7-10.5-8.5-16.8-11-5.8-2.6-12-4.1-18.3-4.4H153.6z%22%20style%3D%22fill%3Aurl(%23beszel_svg__a)%22%2F%3E%3C%2Fsvg%3E
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