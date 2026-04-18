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

# Beszel Hub
[GitHub :material-github:](https://github.com/henrygd/beszel){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/henrygd/beszel-docs){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A lightweight server utilization monitor.

#### :symbols-settings-ethernet: Port(s):
+ `8090`

#### :material-link-variant: URL / Access: 
+ <https://beszel.internal>
+ <http://pi-server.internal:8090/>

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "Beszel Hub (Admin)"

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `beszel-hub` | `henrygd/beszel:latest` |
|  | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent:latest` |

### :material-cog: Configuration

```yaml title="docker-compose.yml" linenums="1"
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
      # monitor other disks / partitions by mounting a folder in /extra-filesystems
      # - /mnt/disk/.beszel:/extra-filesystems/sda1:ro
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
