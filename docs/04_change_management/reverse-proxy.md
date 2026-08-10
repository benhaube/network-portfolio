---
icon: services/caddy
title: Reverse Proxy & DNS Routing
subtitle: Domain Names for Local Services
description: Set up a local reverse-proxy server using Caddy to give local services their own, unique FQDN.
tags:
  - DNS
  - Infrastructure
  - Server
  - Service
hide:
  - toc
---

![Caddy Logo](../assets/icons/caddy.svg){ width=200 }

# Reverse Proxy & DNS Routing

_Domain Names for Local Services_

!!! info "Goal"

    Route human-readable domain names _(e.g., `immich.internal`)_ to internal services without needing to specify port numbers.

---

## :symbols-info:&ensp;Architecture Overview

#### DNS Servers

- [:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md)
{ .no-bullets }
- [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)
{ .no-bullets }

#### Reverse Proxy

- [:symbols-server:&nbsp;Pi Zero 2W Server](../02_hardware/pi_zero_2w_server.md)
{ .no-bullets }

#### Application Hosts

- [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)
{ .no-bullets }
- [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)
{ .no-bullets }

## :symbols-file-search-corner:&ensp;Technitium DNS Records

!!! note

    Instead of pointing every service to the proxy's IP address directly, we use a single `A` record for the proxy hardware, and `CNAME` aliases for the services. This makes IP migrations easier in the future.

| Domain / Alias     | Record Type | Target / Value { data-sort-method="none" } | PTR { data-sort-method="none" } | Description { data-sort-method="none" } |
| :----------------- | :---------- | :----------------------------------------- | :-----------------------------: | :-------------------------------------- |
| `pi-zero.internal` | **A**       | `192.168.50.3`                             |         :symbols-check:         | The dedicated Caddy reverse proxy host. |
| `immich.internal`  | **CNAME**   | `pi-zero.internal`                         |           :symbols-x:           | Points the Immich domain to the proxy.  |

## :symbols-file-cog:&ensp;Caddy Configuration

#### File Location

- `/etc/caddy/Caddyfile`
{ .no-bullets }

#### Commands

- `#!bash sudo nano /etc/caddy/Caddyfile` _(Open config file in `nano`)_  
{ .no-bullets }
- `#!bash sudo systemctl reload caddy` _(Apply changes)_
{ .no-bullets }

#### Example Caddyfile

``` nginx { .mono-title title="/etc/caddy/Caddyfile" linenums="1" }
# Immich Photo Server
immich.internal {
    reverse_proxy [192.168.50.4]:2283
}
```

---

## :symbols-traffic:&ensp;Traffic Flow

``` mermaid { .pz-ignore }
--8<-- "traffic_flow.mmd"
```