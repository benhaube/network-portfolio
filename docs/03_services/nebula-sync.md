---
icon: symbols/refresh-cw
title: Nebula-Sync
subtitle: Synchronize Pi-hole
description: Synchronize configuration between multiple Pi-hole instances.
status: deprecated
tags:
  - Deprecated
  - Container
  - DNS
  - Infrastructure
  - Network
  - Service
  - Sync
hide:
  - toc
---
![Nebula Sync Icon](../assets/icons/refresh-cw.svg){ width=200 }

# Nebula-Sync
*Synchronize Pi-hole*

[GitHub&ensp;:brands-github:](https://github.com/lovelaze/nebula-sync){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://deepwiki.com/lovelaze/nebula-sync){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Synchronize configuration between multiple [Pi-hole](pi-hole.md) instances.

#### :symbols-settings-ethernet:&ensp;Port(s)

:    `N/A`

#### :symbols-link:&ensp;URL / Access

:    N/A

#### :symbols-user-key:&ensp;Credentials 

:    :services-docker:&nbsp;Docker Compose: 
    
      + `compose.yml`

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                              | Method                                | Container Name | Image                                 |
| :----------------------------------------------------------------------- | :------------------------------------ | :------------- | :------------------------------------ |
| [:symbols-server:&nbsp;~~Pi 4B Server~~](../02_hardware/pi_4b_server.md) | :services-docker:&nbsp;Docker Compose | `nebula-sync`  | `ghcr.io/lovelaze/nebula-sync:latest` |

### :symbols-settings:&ensp;Configuration 

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "nebula-sync.yml"
```

1. Configuration synchronization options.
2. Gravity synchronization options.
3. Synchronization exclusion filters.