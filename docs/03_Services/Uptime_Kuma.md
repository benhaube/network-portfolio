---
tags:
  - active
  - service
  - software
  - docker
  - monitor
  - network
hide:
  - toc
---
![[uptime-kuma.svg|200]]

# [[Uptime_Kuma|Uptime Kuma]]
[GitHub :material-github:](https://github.com/louislam/uptime-kuma){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/louislam/uptime-kuma/wiki){ .md-button }

---
## :material-information-outline: Overview
* **Purpose:** A fancy self-hosted service monitoring tool.
* **Port(s):** `3001`
* **URL / Access:** 
    * :material-lan:&nbsp;LAN Access
        * <https://uptime.internal>
        * <http://pi-server.internal:3001>
    * :material-wan:&nbsp;WAN Access
        * <https://uptime.rac3r4life.online>
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): "Uptime Kuma @ pi-server"

## :material-package-down: Deployment Details 
* **Host Device:** &nbsp;:simple-raspberrypi:&nbsp;[[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]
* **Method:** &nbsp;:material-docker:&nbsp;Docker Compose
* **Container Name:** `uptime-kuma`
* **Image:** `louislam/uptime-kuma:2`

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
services:
  uptime-kuma:
    image: louislam/uptime-kuma:2
    container_name: uptime-kuma
    restart: unless-stopped
    volumes:
      - ./data:/app/data
      - /var/run/docker.sock:/var/run/docker.sock:ro
    environment:
      - PUID=1000
      - PGID=110
    ports:
      - "3001:3001"
    dns:
      - 192.168.50.6
      - 192.168.50.2
```
