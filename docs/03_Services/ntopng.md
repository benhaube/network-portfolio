---
icon: services/ntop
title: ntopng
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
![ntop Logo](../assets/icons/ntop.svg){ width=250 }&ensp;![ntopng logo](../assets/icons/ntopng.png){ width=50 }

# ntopng (Traffic Probe)
[GitHub :material-github:](https://github.com/ntop/ntopng){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://www.ntop.org/guides/ntopng/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description:  
+ Network traffic probe

#### :symbols-settings-ethernet: Port(s):
+ `3000`
+ `5556`

#### :material-link-variant: URL / Access: 
+ <http://192.168.50.4:3000>
+ <http://storage-server.internal:3000>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `ntop` | `ntop/ntopng:latest` |

### :material-cog: Configuration

```yaml title="compose.yml" linenums="1"
services:
  ntopng:
    image: ntop/ntopng:latest
    hostname: ntop
    container_name: ntop
    restart: always
    network_mode: host
    volumes:
      - ntopng_redis:/var/lib/redis
    # (1)!
    command: [ '-i', 'eth0', '-i', 'eth1', '-i', 'tcp://*:5556c', '-F', 'clickhouse', '--disable-login', '1', '--community' ]
    depends_on:
      - clickhouse
  clickhouse:
    image: clickhouse/clickhouse-server:latest
    hostname: clickhouse
    container_name: clickhouse
    restart: always
    network_mode: host
    volumes:
      - clickhouse_data:/var/lib/clickhouse
      - clickhouse_logs:/var/log/clickhouse-server
volumes:
  clickhouse_data:
  clickhouse_logs:
  ntopng_redis:
```

1. Updated to include `eth0` and `eth1` while keeping the `--community` flag.