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

_Network Documentation_

[GitHub&ensp;:brands-github:](https://github.com/nginx/nginx){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://nginx.org/en/docs/){ .md-button .md-button--primary }

---

![Network Documentation index page](../assets/screenshots/network-docs-light.png#only-light){ width=400 align=right .on-glb }
![Network Documentation index page](../assets/screenshots/network-docs-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.

#### :symbols-hash:&ensp;Port(s) 

:    `8080`

#### :symbols-link-2:&ensp;URL / Access

-   :symbols-network:&ensp;Local Access:
{ .no-bullets }
    - <http://storage-server.internal:8080>
    - <http://storage-server-2.internal:8080>
-   :symbols-globe-arrow:&ensp;Remote Access:
{ .no-bullets }
    - <https://portfolio.rac3r4life.online>

#### :symbols-user-key:&ensp;Credentials

:  N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name          | Image          | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :---------------------- | :------------- | :------ |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `network-documentation` | `nginx:alpine` | `8080`  |

### :symbols-settings:&ensp;Configuration

#### :symbols-folder-git-2:&ensp;Data Directories

##### Docker Deploy

- `../AppData/dockge/stacks/network-documentation-portfolio`
{ .no-bullets }

##### Nginx Server Config

- `../AppData/Network-Portfolio/default.conf`
{ .no-bullets }

##### Site Data

- `../AppData/Network-Portfolio/site`
{ .no-bullets }

#### :symbols-file-cog:&ensp;Config File

``` nginx { .mono-title title="../AppData/Network-Portfolio/default.conf" linenums="1" }
--8<-- "nginx.conf"
```

1. Pull in standard MIME types, then explicitly define `.mjs`
2. Redirect server error pages to the static page `/50x.html`

#### :symbols-file-code-corner:&ensp;Docker Compose File

--8<-- "includes/managed_by_dockge.md"

``` yaml { .mono-title title="../AppData/dockge/stacks/network-documentation-portfolio/compose.yaml" linenums="1" }
--8<-- "nginx.yml"
```

1. Maps port `8080` on the VM to port `80` inside the container.
2. Mounts your site folder as read-only (ro) for extra security.
3. Mounts your site folder as read-only (ro) for extra security.