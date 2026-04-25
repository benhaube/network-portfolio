---
icon: services/spoolman
tags:
  - Active
  - Service
  - Software
  - Docker
  - 3D-Printer
hide:
  - toc
---
![Spoolman logo](../assets/icons/spoolman.svg){ width=200 }

# Spoolman
[GitHub :material-github:](https://github.com/Donkie/Spoolman){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/Donkie/Spoolman/wiki/Installation){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Manage 3D-printer filament inventory, and actively track filament usage.

#### :symbols-settings-ethernet: Port(s):
+ `7912`

#### :material-link-variant: URL / Access:   
+ <http://storage-server.internal:7912/>
+ <https://spoolman.internal>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `spoolman` | `ghcr.io/donkie/spoolman:0.22.1` |

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
services:
  app:
    cpu_shares: 90
    container_name: spoolman
    deploy:
      resources:
        limits:
          memory: 16508235776
        reservations:
    environment:
      - SPOOLMAN_AUTOMATIC_BACKUP=TRUE
      - SPOOLMAN_DB_TYPE=sqlite
      - SPOOLMAN_LOGGING_LEVEL=INFO
      - TZ=America/New_York
    image: ghcr.io/donkie/spoolman:latest
    labels:
      icon: data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xml%3Aspace%3D%22preserve%22%20viewBox%3D%220%200%20512%20512%22%3E%3Cpath%20d%3D%22M0%20108.6C0%2048.6%2048.6%200%20108.6%200h294.8C463.4%200%20512%2048.6%20512%20108.6v294.8c0%2060-48.6%20108.6-108.6%20108.6H108.6C48.6%20512%200%20463.4%200%20403.4z%22%20style%3D%22fill%3A%23dc7734%22%20vector-effect%3D%22non-scaling-stroke%22%2F%3E%3Cpath%20d%3D%22M256%2046.5c115.6%200%20209.5%2093.8%20209.5%20209.5S371.6%20465.5%20256%20465.5%2046.5%20371.6%2046.5%20256%20140.4%2046.5%20256%2046.5%22%20style%3D%22fill%3A%23343434%22%20vector-effect%3D%22non-scaling-stroke%22%2F%3E%3Cpath%20d%3D%22M407.6%20166.7c4.1-2.3%209-2.8%2013.5-1.2%204.5%201.5%208.1%204.9%209.9%209.2%2022%2052%2022%20110.6%200%20162.6v.1c-1.8%204.3-5.4%207.7-9.9%209.2s-9.3%201.1-13.4-1.2l-88.7-50c-14.2-8-23.1-23.1-23.1-39.4s8.8-31.4%2023.1-39.4zM260.1%20433.8c-.1%204.7-2.1%209.2-5.7%2012.3s-8.3%204.6-13%204c-56-6.9-106.8-36.2-140.8-81.3v-.1c-2.8-3.8-3.9-8.5-3-13.2.9-4.6%203.7-8.6%207.8-11l87.6-51.9c14.1-8.3%2031.5-8.4%2045.7-.3%2014.1%208.2%2022.8%2023.3%2022.6%2039.7zM104.4%20170.4c-4.1-2.4-6.9-6.4-7.8-11.1-.9-4.6.2-9.4%203-13.2%2034-45.1%2084.8-74.4%20140.8-81.3h.1c4.7-.6%209.4.9%2012.9%204s5.6%207.6%205.6%2012.3l1.1%20101.8c.2%2016.3-8.5%2031.5-22.6%2039.7s-31.6%208.1-45.7-.3z%22%20style%3D%22fill%3A%23111%22%2F%3E%3Cpath%20d%3D%22m384.4%20180.2%202.9%205.4c24.3%2045%2023.8%2099.3-1.3%20143.8l-1.7%203.1-65.4-36.9c-14.2-8-23-23.1-23-39.4s8.9-31.4%2023.1-39.4zM260%20406.9l-6.1-.2c-51.1-1.5-97.9-29-123.9-73l-1.8-3%2064.6-38.2c14.1-8.3%2031.5-8.4%2045.6-.2s22.7%2023.4%2022.5%2039.7zM127.7%20183.8l3.2-5.2c26.8-43.5%2074.1-70.2%20125.2-70.8h3.5l.7%2075.1c.2%2016.3-8.5%2031.5-22.7%2039.6s-31.6%208-45.6-.3z%22%20style%3D%22fill%3A%23bebebe%22%2F%3E%3C%2Fsvg%3E
    ports:
      - mode: ingress
        target: 8000
        published: "7912"
        protocol: tcp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/big-bear-spoolman/data
        target: /home/app/.local/share/spoolman
        bind:
          create_host_path: true
```
