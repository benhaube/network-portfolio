---
hide:
  - toc
---
![[caddy.svg|200]]

# [[Caddy_Reverse-Proxy|Reverse Proxy & DNS Routing]]

> [!info] Goal
> Route human-readable domain names *(e.g., `immich.internal`)* to internal services without needing to specify port numbers.

---
## :material-information-outline: Architecture Overview
* **DNS Servers:** 
    * Technitium Cluster Primary: *[[Debian_Server_VM|Debian VM]]*
    * Technitium Cluster Secondary: *[[Raspberry_Pi_4B_Server|Raspberry Pi 4B]]*
* **Reverse Proxy:** 
    * Caddy *([[Raspberry_Pi_Zero_2_W|Raspberry Pi Zero 2 W]] - Native `apt` Install)*
* **Application Hosts:** 
    * :services-zimaos:&nbsp;[[ZimaBoard_2_NAS|ZimaBoard NAS]]
    * :simple-raspberrypi:&nbsp;[[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]

---
## :material-file-cloud: 1. Technitium DNS Records

Instead of pointing every service to the proxy's IP address directly, we use a single `A` record for the proxy hardware, and `CNAME` aliases for the services. This makes IP migrations easier in the future.

| Domain / Alias | Record Type | Target / Value | PTR | Description |
| :--- | :--- | :--- | :---: | :--- |
| `pi-zero.internal` | **A** | `192.168.50.3` | ✅ | The dedicated Caddy reverse proxy host. |
| `immich.internal` | **CNAME** | `pi-zero.internal` | ❌ | Points the Immich domain to the proxy. |

---
## :material-cloud-cog: 2. Caddy Configuration

**File Location:** 

+ `/etc/caddy/Caddyfile` 

**Commands:** 

+ `sudo nano /etc/caddy/Caddyfile` *(Open config file in `nano`)*  
+ `sudo systemctl reload caddy` *(Apply changes)*

```nginx linenums="1"
# Immich Photo Server
immich.internal {
    reverse_proxy [192.168.50.4]:2283
}
```

---
## :material-traffic-light: 3. Traffic Flow

```mermaid
graph TD
	%% --- Class definitions ---
	classDef box fill:#255425,stroke:#4cae4f,stroke-width:2px;

    User[Client Browser]:::box -- "DNS Query: immich.internal" --> DNS[Technitium DNS]:::box
    DNS -- "Returns CNAME: proxy IP" --> User
    User -- "HTTP/S Request port 80/443" --> Proxy[Caddy: Pi Zero 2 W]:::box
    Proxy -- "Forwards Traffic" --> App[Immich: port 2283]:::box
```