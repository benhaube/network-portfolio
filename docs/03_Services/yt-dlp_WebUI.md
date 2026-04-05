---
tags:
  - active
  - service
  - software
  - docker
  - video
  - download
hide:
  - toc
---
![[youtube-dl.svg|200]]

# [[yt-dlp_WebUI|yt-dlp WebUI]]
[GitHub :material-github:](https://github.com/marcopiovanello/yt-dlp-web-ui){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/marcopiovanello/yt-dlp-web-ui/wiki){ .md-button }

---
## :material-information-outline: Overview
* **Purpose:** A Web UI and RPC server for `yt-dlp`.
* **Port(s):** `3033`
* **URL / Access:** 
    * <http://storage-server.internal:3033>
    * <https://yt-dlp.internal>
* **Credentials:** N/A

## :material-package-down: Deployment Details 
* **Host Device:** &nbsp;:services-zimaos:&nbsp;[[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]
* **Method:** :simple-docker:&nbsp;Docker Compose
* **Container Name:** `yt-dlp-webui`
* **Image:** `marcobaobao/yt-dlp-webui:latest` 

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
services:
  yt-dlp-webui:
    image: marcobaobao/yt-dlp-webui:latest
    ports:
      - 3033:3033
    volumes:
      - /DATA/Downloads/yt-dlp:/downloads # replace <your dir> with a directory on your host system
    healthcheck:
      test: curl -f http://localhost:3033 || exit 1
    restart: unless-stopped
```
