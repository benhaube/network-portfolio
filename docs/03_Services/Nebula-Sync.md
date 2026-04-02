---
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
![[nebula-sync.svg|200]]

# [[Nebula-Sync]]&emsp;*(Inactive)*
[GitHub :material-github:](https://github.com/lovelaze/nebula-sync){ .md-button .md-button--primary }

---
## :material-information-outline: Overview
* **Purpose:** Synchronize settings between [[Pi-hole]] instances.
* **Port(s):** `N/A`
* **URL / Access:** N/A
* **Credentials:** 
    * :simple-docker:&nbsp;Docker Compose: `docker-compose.yml`

## :material-package-down: Deployment Details 
* **Host Device:** &nbsp;~~:simple-raspberrypi:&nbsp;[[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]~~
* **Method:** &nbsp;:simple-docker:&nbsp;Docker Compose
* **Container Name:** `nebula-sync`
* **Image:** `ghcr.io/lovelaze/nebula-sync:latest` 

### :fontawesome-solid-gear: Configuration 

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
