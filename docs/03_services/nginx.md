---
icon: services/nginx
title: Nginx
subtitle: Network Documentation
description: The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.
tags:
  - Active
  - Container
  - Service
  - Web Host
hide:
  - toc
---
![Nginx Icon](../assets/icons/nginx.svg){ width=200 }

# Nginx
*Network Documentation*

[GitHub&ensp;:brands-github:](https://github.com/nginx/nginx){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://nginx.org/en/docs/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.

#### :symbols-hash:&ensp;Port(s) 

:    `8080`

#### :symbols-link:&ensp;URL / Access

:    :symbols-lan:&nbsp;Local Access:

      + <http://storage-server.internal:8080>
      + <http://storage-server-2.internal:8080>

:    :symbols-globe-arrow:&nbsp;Remote Access:

      + <https://portfolio.rac3r4life.online>

#### :symbols-user-key:&ensp;Credentials 

:    N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name          | Image          |
| :------------------------------------------------------------------- | :---------------------------------------- | :---------------------- | :------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `network-documentation` | `nginx:alpine` |

### :symbols-settings:&ensp;Configuration

#### :symbols-file-code-corner:&ensp;Docker Compose File

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "nginx.yml"
```

1. Maps port `8080` on the VM to port `80` inside the container.
2. Mounts your site folder as read-only (ro) for extra security.
3. Mounts your site folder as read-only (ro) for extra security.

#### :symbols-file-config:&ensp;Config File

```nginx {title="/DATA/AppData/Network-Portfolio/default.conf" linenums="1" .mono-title}
--8<-- "nginx.conf"
```

1. Pull in standard MIME types, then explicitly define `.mjs`
2. Redirect server error pages to the static page `/50x.html`