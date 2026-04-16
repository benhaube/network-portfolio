---
icon: material/cog-sync
title: Nebula-Sync
status: deprecated
tags:
  - inactive
  - service
  - software
  - docker
  - dns
  - infrastructure
  - network
hide:
  - toc
---
![Nebula Sync Icon](../assets/icons/nebula-sync.svg){ width=200 }

# Nebula-Sync
[GitHub :material-github:](https://github.com/lovelaze/nebula-sync){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Synchronize settings between [[Pi-hole]] instances.

#### :symbols-settings-ethernet: Port(s):
+ `N/A`

#### :material-link-variant: URL / Access: 
+ N/A

#### :material-key-chain: Credentials: 
+ :material-docker:&nbsp;Docker Compose: `docker-compose.yml`

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;~~[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)~~ | :material-docker:&nbsp;Docker Compose | `nebula-sync` | `ghcr.io/lovelaze/nebula-sync:latest` |

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
services:
  nebula-sync:
    image: ghcr.io/lovelaze/nebula-sync:latest
    container_name: nebula-sync
    environment:
      - PRIMARY=https://192.168.50.2|QD25^t1!z5*L#DfFt%^bGpM3f1lK#8
      - REPLICAS=https://192.168.50.3|F2f#FbcVgzW77r9H&@hIH^we4cu3qw
      - FULL_SYNC=false
      - RUN_GRAVITY=false
      - CRON=*/15 * * * *
      - TZ=America/New_York
      - CLIENT_SKIP_TLS_VERIFICATION=true

      # Sync configuration options
      - SYNC_CONFIG_DNS=true
      - SYNC_CONFIG_DHCP=false
      - SYNC_CONFIG_NTP=true
      - SYNC_CONFIG_RESOLVER=true
      - SYNC_CONFIG_DATABASE=true
      - SYNC_CONFIG_MISC=false
      - SYNC_CONFIG_DEBUG=false

      # Sync gravity options
      - SYNC_GRAVITY_DHCP_LEASES=false
      - SYNC_GRAVITY_GROUP=true
      - SYNC_GRAVITY_AD_LIST=true
      - SYNC_GRAVITY_AD_LIST_BY_GROUP=true
      - SYNC_GRAVITY_DOMAIN_LIST=true
      - SYNC_GRAVITY_DOMAIN_LIST_BY_GROUP=true
      - SYNC_GRAVITY_CLIENT=true
      - SYNC_GRAVITY_CLIENT_BY_GROUP=true

      # Config filters
      - SYNC_CONFIG_DNS_EXCLUDE=interface,hostRecord,reply.host.force4,reply.host.IPv4,reply.host.force6,reply.host.IPv6
      # - SYNC_CONFIG_NTP_EXCLUDE=ipv4.address,ipv6.address
      - SYNC_CONFIG_DATABASE_EXCLUDE=maxDBdays,network.expire

    restart: always
```
