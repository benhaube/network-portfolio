---
icon: simple/nginx
title: Nginx (Network Portfolio)
tags:
  - Active
  - Service
  - Software
  - Docker
hide:
  - toc
---
![Nginx Icon](../assets/icons/nginx-light.svg#only-light){ width=200 }
![Nginx Icon](../assets/icons/nginx.svg#only-dark){ width=200 }

# Nginx (Network Portfolio)
[GitHub :material-github:](https://github.com/nginx/nginx){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://nginx.org/en/docs/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.

#### :symbols-settings-ethernet: Port(s): 
+ `8080`

#### :material-link-variant: URL / Access: 
+ <http://storage-server.internal:8080>
+ <https://portfolio.rac3r4life.online>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `network-portfolio` | `nginx:alpine` |

### :material-cog: Configuration

```yaml title="docker-compose.yml" linenums="1"
services:
  portfolio:
    image: nginx:alpine
    container_name: network-portfolio
    labels:
      icon: data:image/svg+xml;charset=utf-8,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%3F%3E%0A%3Csvg%20version%3D%221.1%22%20viewBox%3D%220%200%2024%2024%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%3Cpath%20d%3D%22m4%204v18h16v2h-16c-1.1%200-2-.9-2-2v-18h2%22%20fill%3D%22%234cae4f%22%2F%3E%3Cpath%20d%3D%22m15%207h5.5l-5.5-5.5v5.5m-7-7h8l6%206v12c0%201.11-.89%202-2%202h-12c-1.11%200-2-.9-2-2v-16c0-1.11.89-2%202-2m9%2016v-2h-9v2h9m3-4v-2h-12v2z%22%20fill%3D%22%230091eb%22%2F%3E%3C%2Fsvg%3E
    restart: unless-stopped
    ports:
      - "8080:80"  # (1)!
    volumes:
      - /media/nvme0n1p1/AppData/Network-Portfolio/site:/usr/share/nginx/html:ro  # (2)!
```

1. Maps port `8080` on the VM to port `80` inside the container.
2. Mounts your site folder as read-only *(ro)* for extra security.