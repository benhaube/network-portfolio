---
icon: simple/nginx
title: Nginx
subtitle: Network Documentation
description: The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.
tags:
  - Active
  - Docker
  - Service
hide:
  - toc
---
![Nginx Icon](../assets/icons/nginx.svg){ width=200 }

# Nginx
*Network Documentation*

[GitHub&ensp;:brands-github:](https://github.com/nginx/nginx){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation-outline:](https://nginx.org/en/docs/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `8080`

#### :symbols-link-alt:&ensp;URL / Access

+ <http://storage-server.internal:8080>
+ <http://storage-server-2.internal:8080>
+ <https://portfolio.rac3r4life.online>

#### :symbols-user-key:&ensp;Credentials 

+ N/A

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                               | Method                                | Container Name          | Image          |
| :------------------------------------------------------------------------ | :------------------------------------ | :---------------------- | :------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :services-docker:&nbsp;Docker Compose | `network-documentation` | `nginx:alpine` |

### :symbols-settings:&ensp;Configuration

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "nginx.yml"
```

1. Maps port `8080` on the VM to port `80` inside the container.
2. Mounts your site folder as read-only (ro) for extra security.
3. Mounts your site folder as read-only (ro) for extra security.

```nginx {title="default.conf" linenums="1" .mono-title}
--8<-- "nginx.conf"
```