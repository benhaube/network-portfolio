---
icon: symbols/settings-sync
title: Nebula-Sync
subtitle: Synchronize Pi-hole
description: Synchronize configuration between multiple Pi-hole instances.
status: deprecated
tags:
  - Deprecated
  - Docker
  - DNS
  - Infrastructure
  - Network
  - Service
hide:
  - toc
---
![Nebula Sync Icon](../assets/icons/settings-sync.svg){ width=200 }

# Nebula-Sync
*Synchronize Pi-hole*

[GitHub&ensp;:simple-github:](https://github.com/lovelaze/nebula-sync){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation-outline:](https://deepwiki.com/lovelaze/nebula-sync){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Synchronize configuration between multiple [Pi-hole](./Pi-hole.md) instances.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `N/A`

#### :symbols-link-alt:&ensp;URL / Access

+ N/A

#### :symbols-user-key:&ensp;Credentials 

+ :services-docker:&nbsp;Docker Compose: 
    + `compose.yml`

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                          | Method                                | Container Name | Image                                 |
| :--------------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :------------------------------------ |
| [:symbols-server-outline:&nbsp;~~Raspberry Pi 4B Server~~](../02_Hardware/Raspberry_Pi_4B_Server.md) | :services-docker:&nbsp;Docker Compose | `nebula-sync`  | `ghcr.io/lovelaze/nebula-sync:latest` |

### :symbols-settings:&ensp;Configuration 

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "nebula-sync.yml"
```

1. Configuration synchronization options.
2. Gravity synchronization options.
3. Synchronization exclusion filters.