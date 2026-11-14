---
icon: services/docker
title: Docker Proxy
subtitle: Proxy Over Docker Socket
description: Proxy over your Docker socket to restrict which requests it accepts.
tags:
  - Active
  - Container
  - Infrastructure
  - Security
  - Service
hide:
  - toc
---

![Docker icon](../assets/icons/docker.svg){ width=200 }

# Docker Proxy

_Proxy Over Docker Socket_

[GitHub&ensp;:brands-github:](https://github.com/Tecnativa/docker-socket-proxy){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.docker.com/reference/api/engine/){ .md-button .md-button--primary }

---

![Lucide 'waypoints' icon](../assets/images/docker-proxy.png){ width=350 align=right .no-shadow }

## :symbols-info:&ensp;Overview

This is a security-enhanced proxy for the Docker Socket. Giving access to your Docker socket could mean giving root access to your host, or even to your whole swarm, but some services require hooking into that socket to react to events, etc. Using this proxy lets you block anything you consider those services should not do.

![status badge](https://uptime.rac3r4life.online/api/badge/183/status)&ensp;![uptime badge](https://uptime.rac3r4life.online/api/badge/183/uptime)&ensp;![Docker image version](https://img.shields.io/docker/v/tecnativa/docker-socket-proxy/latest?label=Release&color=2396ed)

**Port(s)**

- `2375`
{ .no-bullets }

**URL / Access**

- `tcp://debian-vm.internal:2375`
{ .no-bullets }
- `tcp://pi-server.internal:2375`
{ .no-bullets }
- `tcp://pi-zero.internal:2375`
{ .no-bullets }
- `tcp://storage-server.internal:2375`
{ .no-bullets }

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                                 | Method                                    | Container Name | Image                                  | Status                                                                                                           | Port(s) |
| :-------------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------------- | :--------------------------------------------------------------------------------------------------------------- | :------ |
| [:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md)      | :symbols-container:&nbsp;Docker Container | `docker-proxy` | `tecnativa/docker-socket-proxy:latest` | ![status badge](https://uptime.rac3r4life.online/api/badge/186/status?label=){ style='vertical-align: middle;' } | `2375`  |
| [:symbols-layers:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)        | :symbols-container:&nbsp;Docker Container | `docker-proxy` | `tecnativa/docker-socket-proxy:latest` | ![status badge](https://uptime.rac3r4life.online/api/badge/178/status?label=){ style='vertical-align: middle;' } | `2375`  |
| [:symbols-layers:&nbsp;Pi Zero Server](../02_hardware/pi_zero_2w_server.md) | :symbols-container:&nbsp;Docker Container | `docker-proxy` | `tecnativa/docker-socket-proxy:latest` | ![status badge](https://uptime.rac3r4life.online/api/badge/185/status?label=){ style='vertical-align: middle;' } | `2375`  |
| [:symbols-layers:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)            | :symbols-container:&nbsp;Docker Container | `docker-proxy` | `tecnativa/docker-socket-proxy:latest` | ![status badge](https://uptime.rac3r4life.online/api/badge/184/status?label=){ style='vertical-align: middle;' } | `2375`  |

---

## :symbols-settings:&ensp;Configuration

--8<-- "managed-by-arcane.md"

### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="/opt/stacks/docker-proxy/compose.yaml" }
--8<-- "docker-proxy.yaml"
```
