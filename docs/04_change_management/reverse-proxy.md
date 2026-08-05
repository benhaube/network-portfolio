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
*Domain Names for Local Services*

!!! info "Goal"

    Route human-readable domain names *(e.g., `immich.internal`)* to internal services without needing to specify port numbers.

---

## :symbols-info:&ensp;Architecture Overview

#### DNS Servers

* Technitium Cluster Primary:&ensp;[:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md)
* Technitium Cluster Secondary:&ensp;[:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)

#### Reverse Proxy

* Caddy:&ensp;[:symbols-server:&nbsp;Pi Zero 2W Server](../02_hardware/pi_zero_2w_server.md)

#### Application Hosts

* [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)
* [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)

## :symbols-file-search-corner:&ensp;Technitium DNS Records

!!! note

    Instead of pointing every service to the proxy's IP address directly, we use a single `A` record for the proxy hardware, and `CNAME` aliases for the services. This makes IP migrations easier in the future.

| Domain / Alias     | Record Type | Target / Value {data-sort-method="none"} |  PTR {data-sort-method="none"} | Description {data-sort-method="none"}   |
| :----------------- | :---------- | :--------------------------------------- | :----------------------------: | :-------------------------------------- |
| `pi-zero.internal` | **A**       | `192.168.50.3`                           |         :symbols-check:        | The dedicated Caddy reverse proxy host. |
| `immich.internal`  | **CNAME**   | `pi-zero.internal`                       |           :symbols-x:          | Points the Immich domain to the proxy.  |

## :symbols-file-cog:&ensp;Caddy Configuration

#### File Location 

+ `/etc/caddy/Caddyfile` 

#### Commands 

+ `#!bash sudo nano /etc/caddy/Caddyfile` *(Open config file in `nano`)*  
+ `#!bash sudo systemctl reload caddy` *(Apply changes)*

#### Example Caddyfile

```nginx {title="/etc/caddy/Caddyfile" linenums="1" .mono-title}
# Immich Photo Server
immich.internal {
    reverse_proxy [192.168.50.4]:2283
}
```

---

## :symbols-traffic:&ensp;Traffic Flow

```mermaid { .pz-ignore }
--8<-- "traffic_flow.mmd"
```