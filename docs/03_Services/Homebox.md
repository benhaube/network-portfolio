---
tags:
  - active
  - service
  - software
  - docker
  - inventory
hide:
  - toc
---
![[homebox.svg|200]]

# [[Homebox]]
[GitHub :material-github:](https://github.com/sysadminsmedia/homebox){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://homebox.software/en/quick-start/){ .md-button }

---
## :material-information-outline: Overview
* **Purpose:** An inventory and organization system built for the home user.
* **Port(s):** `3100`
* **URL / Access:** 
    * <http://storage-server.internal:3100>
    * <http://192.168.50.4:3100>
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): "Homebox @ storage-server"

## :material-package-down: Deployment Details
* **Host Device:** &nbsp;:services-zimaos:&nbsp;[[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]
* **Method:** &nbsp;:simple-docker:&nbsp;Docker Compose
* **Container Name:** `homebox`
* **Image:** `ghcr.io/sysadminsmedia/homebox:latest`

### :fontawesome-solid-gear: Configuration

```yaml title="docker-compose.yml" linenums="1"
services:
    homebox:
        image: ghcr.io/sysadminsmedia/homebox:latest
        restart: always
        environment:
            - HBOX_LOG_LEVEL=info
            - HBOX_LOG_FORMAT=text
            - HBOX_WEB_MAX_UPLOAD_SIZE=10
            # Please consider allowing analytics to help us improve Homebox (basic computer information, no personal data)
            - HBOX_OPTIONS_ALLOW_ANALYTICS=true
        volumes:
            - /media/nvme0n1p1/AppData/homebox-data:/data/
        ports:
            - 3100:7745

volumes:
    homebox-data:
        driver: local
```
