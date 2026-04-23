---
icon: services/immich
tags:
  - Active
  - Service
  - Software
  - Docker
  - File Share
  - Download
  - Backup
hide:
  - toc
---
![Immich Logo](../assets/icons/immich.svg){ width=200 }

# Immich
[GitHub :material-github:](https://github.com/immich-app/immich){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.immich.app/overview/quick-start/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description:  
+ Photo gallery and backup service.

#### :symbols-settings-ethernet: Port(s): 
+ `2283`

#### :material-link-variant: URL / Access: 
+ :material-lan: LAN Access:
    + <https://immich.internal>
    + <http://storage-server.internal:2283>
+ :material-web: WAN Access:
    + <https://immich.rac3r4life.online>

#### :material-key-chain: Credentials:  
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + "Immich User"
    + "Immich Administrator"

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `immich-server` | `ghcr.io/immich-app/immich-server:v2.7.5` |
|  |  | `immich-machine-learning` | `ghcr.io/immich-app/immich-machine-learning:v2.7.5-openvino` |
|  |  | `immich-redis` | `docker.io/redis:6.2-alpine` |
|  |  | `immich-postgres` | `ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0` |

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
name: immich
services:
  database:
    cpu_shares: 90
    container_name: immich-postgres
    deploy:
      resources:
        limits:
          memory: 16508235776
    environment:
      - POSTGRES_DB=immich
      - POSTGRES_INITDB_ARGS=--data-checksums
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_USER=postgres
    hostname: immich-postgres
    image: ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0
    labels:
      icon: https://cdn.jsdelivr.net/gh/selfhst/icons@main/svg/immich.svg
    restart: unless-stopped
    shm_size: "134217728"
    volumes:
      - type: bind
        source: /DATA/AppData/immich/pgdata
        target: /var/lib/postgresql/data
        bind:
          create_host_path: true
    networks:
      - immich
    privileged: false
  immich-machine-learning:
    cpu_shares: 90
    container_name: immich-machine-learning
    deploy:
      resources:
        limits:
          memory: 16508235776
    devices:
      - /dev/dri:/dev/dri
    environment:
      - DB_DATABASE_NAME=immich
      - DB_PASSWORD=postgres
      - DB_USERNAME=postgres
    hostname: immich-machine-learning
    healthcheck: {}
    image: ghcr.io/immich-app/immich-machine-learning:v2.7.5-openvino
    labels:
      icon: https://cdn.jsdelivr.net/gh/selfhst/icons@main/svg/immich.svg
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/immich/model-cache
        target: /cache
        bind:
          create_host_path: true
    networks:
      - immich
    privileged: false
  immich-server:
    cpu_shares: 90
    container_name: immich-server
    depends_on:
      database:
        condition: service_started
        required: true
      redis:
        condition: service_started
        required: true
    deploy:
      resources:
        limits:
          memory: 16508235776
        reservations:
          memory: "1073741824"
    devices:
      - /dev/dri:/dev/dri
    environment:
      - DB_DATABASE_NAME=immich
      - DB_PASSWORD=postgres
      - DB_USERNAME=postgres
    hostname: immich-server
    healthcheck: {}
    image: ghcr.io/immich-app/immich-server:v2.7.5
    labels:
      icon: https://cdn.jsdelivr.net/gh/selfhst/icons@main/svg/immich.svg
    ports:
      - mode: ingress
        target: 2283
        published: "2283"
        protocol: tcp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/Gallery/immich
        target: /usr/src/app/upload
        bind:
          create_host_path: true
      - type: bind
        source: /etc/localtime
        target: /etc/localtime
        read_only: true
        bind:
          create_host_path: true
    networks:
      - immich
    privileged: false
  redis:
    cpu_shares: 90
    container_name: immich-redis
    deploy:
      resources:
        limits:
          memory: 16508235776
    hostname: immich-redis
    healthcheck:
      test:
        - CMD-SHELL
        - redis-cli ping || exit 1
    image: docker.io/redis:6.2-alpine@sha256:148bb5411c184abd288d9aaed139c98123eeb8824c5d3fce03cf721db58066d8
    labels:
      icon: https://cdn.jsdelivr.net/gh/selfhst/icons@main/svg/immich.svg
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/immich/redis
        target: /data
        bind:
          create_host_path: true
    networks:
      - immich
    privileged: false
networks:
  immich:
    name: immich
```