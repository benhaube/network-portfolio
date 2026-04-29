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

```yaml title="compose.yml" linenums="1"
services:
  database:
    cpu_shares: 90
    container_name: immich-postgres
    environment:
      - POSTGRES_DB=immich
      - POSTGRES_INITDB_ARGS=--data-checksums
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_USER=postgres
    hostname: immich-postgres
    image: ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0
    labels:
      icon: data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xml%3Aspace%3D%22preserve%22%20viewBox%3D%220%200%20512%20512%22%3E%3Cpath%20d%3D%22M238.8%20155.5c33.5%2029.7%2060.5%2061.5%2077.9%2091.5%2029.9-53.4%2049.8-116.9%2050.1-157.3v-.8c0-59.8-59.7-83.1-111.1-83.1S144.6%2029%20144.6%2088.8V92c28.7%2012.8%2062.6%2035.6%2094.2%2063.5%22%20style%3D%22fill%3A%23fa2921%22%2F%3E%3Cpath%20d%3D%22M55.9%20318.6c21-23.3%2053.1-48.6%2089.4-69.9%2038.6-22.7%2077.2-38.6%20111.1-45.8-41.6-44.9-95.8-83.5-134.1-96.2-.3-.1-.5-.2-.7-.2-57-18.7-97.6%2030.9-113.5%2079.8S-4.1%20299.1%2052.8%20317.6c.8.2%201.8.6%203.1%201%22%20style%3D%22fill%3A%23ed79b5%22%2F%3E%3Cpath%20d%3D%22M503.9%20185.4C488%20136.6%20447.4%2087%20390.5%20105.5c-.8.3-1.8.6-3.1%201-3.3%2031.2-14.4%2070.5-31.2%20109.1-17.9%2041.1-39.8%2076.6-62.9%20102.4%2060%2011.9%20126.5%2011.3%20165.1-1%20.3-.1.5-.2.7-.2%2057-18.6%2060.6-82.5%2044.8-131.4%22%20style%3D%22fill%3A%23ffb400%22%2F%3E%3Cpath%20d%3D%22M205%20366.3c-9.7-43.7-12.8-85.3-9.3-119.8-55.5%2025.7-109%2065.3-133%2097.8-.2.2-.3.4-.5.6-35.2%2048.4-.6%20102.3%2041%20132.5s103.5%2046.4%20138.7-1.9c.5-.7%201.1-1.5%201.9-2.6-15.6-27.1-29.7-65.5-38.8-106.6%22%20style%3D%22fill%3A%231e83f7%22%2F%3E%3Cpath%20d%3D%22M448.8%20341.9c-30.7%206.5-71.5%208.1-113.4%204-44.6-4.3-85.1-14.2-116.8-28.2%207.2%2060.8%2028.4%20123.8%2051.9%20156.7.2.2.3.4.5.6%2035.2%2048.4%2097.1%2032.2%20138.7%201.9%2041.6-30.2%2076.2-84.1%2041-132.5-.5-.6-1.1-1.4-1.9-2.5%22%20style%3D%22fill%3A%2318c249%22%2F%3E%3C%2Fsvg%3E
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