---
icon: simple/nginx
title: Nginx (Network Documentation)
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

# Nginx (Network Documentation)
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
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `network-documentation` | `nginx:alpine` |

### :material-cog: Configuration

```yaml title="compose.yml" linenums="1"
--8<-- "nginx.yml"
```

1. Maps port `8080` on the VM to port `80` inside the container.
2. Mounts your site folder as read-only *(ro)* for extra security.