---
tags:
  - active
  - service
  - software
  - docker
hide:
  - toc
---
![[nginx.svg|200]]

# [[Nginx|Nginx (Network Portfolio)]]
[GitHub :material-github:](https://github.com/nginx/nginx){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://nginx.org/en/docs/){ .md-button }

---
## :material-information-outline: Overview
* **Purpose:** The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.
* **Port(s):** `8080`
* **URL / Access:** 
    * <http://storage-server.internal:8080>
    * <https://portfolio.rac3r4life.online>
* **Credentials:** N/A

## :material-package-down: Deployment Details 
* **Host Device:** 
    * :services-zimaos:&nbsp;[[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]
* **Method:** &nbsp;:simple-docker:&nbsp;Docker Compose
* **Container Name:** `network-portfolio`
* **Image:** `nginx:alpine` 

### :material-cog: Configuration

```yaml title="docker-compose.yml" linenums="1"
services:
  portfolio:
    image: nginx:alpine
    container_name: network-portfolio
    restart: unless-stopped
    ports:
      # Maps port 8080 on the VM to port 80 inside the container
      - "8080:80"
    volumes:
      # Mounts your site folder as read-only (ro) for extra security
      - /media/nvme0n1p1/AppData/Network-Portfolio/site:/usr/share/nginx/html:ro
```
