---
icon: simple/caddy
title: Reverse Proxy & DNS Routing
subtitle: Domain Names for Local Services
tags:
  - Infrastructure
  - Server
  - Service
  - Domain
  - DNS
hide:
  - toc
---
![Caddy Logo](../assets/icons/caddy.svg){ width=200 }

# Reverse Proxy & DNS Routing
*Domain Names for Local Services*

!!! info

    **Goal:**
    :   Route human-readable domain names *(e.g., `immich.internal`)* to internal services without needing to specify port numbers.

---

## :symbols-info:&ensp;Architecture Overview

#### DNS Servers

* Technitium Cluster Primary:&ensp;[:material-debian:&nbsp;Debian Server VM](../02_Hardware/Debian_Server_VM.md)
* Technitium Cluster Secondary:&ensp;[:brands-raspberry-pi:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)

#### Reverse Proxy

* Caddy:&ensp;[:brands-raspberry-pi:&nbsp;Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) &mdash; *(Native `apt` Install)*

#### Application Hosts

* [:symbols-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)
* [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)

## :symbols-cloud-sync:&ensp;Technitium DNS Records

!!! note

    Instead of pointing every service to the proxy's IP address directly, we use a single `A` record for the proxy hardware, and `CNAME` aliases for the services. This makes IP migrations easier in the future.

| Domain / Alias     | Record Type | Target / Value     |       PTR       | Description                             |
| :----------------- | :---------- | :----------------- | :-------------: | :-------------------------------------- |
| `pi-zero.internal` | **A**       | `192.168.50.3`     | :symbols-check: | The dedicated Caddy reverse proxy host. |
| `immich.internal`  | **CNAME**   | `pi-zero.internal` | :symbols-close: | Points the Immich domain to the proxy.  |

## :symbols-cogs:&ensp;Caddy Configuration

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