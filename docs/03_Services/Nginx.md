---
icon: simple/nginx
title: Nginx (Network Portfolio)
tags:
  - active
  - service
  - software
  - docker
hide:
  - toc
---
![Nginx Icon](../assets/icons/nginx-light.svg#only-light){ width=200 }
![Nginx Icon](../assets/icons/nginx.svg#only-dark){ width=200 }

# Nginx (Network Portfolio)
[GitHub :material-github:](https://github.com/nginx/nginx){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://nginx.org/en/docs/){ .md-button }

---
## :material-information-outline: Overview

#### :material-comment-eye-outline: Description: 
+ The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.

#### :symbols-settings-ethernet: Port(s): 
+ `8080`

#### :material-protocol: URL / Access: 
+ <http://storage-server.internal:8080>
+ <https://portfolio.rac3r4life.online>

#### :material-key-chain: Credentials: 
+ N/A

## :material-package-down: Deployment Details 

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `network-portfolio` | `nginx:alpine` |

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
