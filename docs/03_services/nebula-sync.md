---
icon: symbols/refresh-cw-cog
title: Nebula-Sync
subtitle: Synchronize Pi-hole
description: Synchronize configuration between multiple Pi-hole instances.
status: deprecated
tags:
  - Container
  - Deprecated
  - DNS
  - Infrastructure
  - Network
  - Service
  - Sync
hide:
  - toc
---
![Nebula Sync Icon](../assets/icons/refresh-cw-cog.svg){ width=200 }

# Nebula-Sync
*Synchronize Pi-hole*

[GitHub&ensp;:brands-github:](https://github.com/lovelaze/nebula-sync){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://deepwiki.com/lovelaze/nebula-sync){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Synchronize configuration between multiple [Pi-hole](pi-hole.md#description){ data-preview } instances.

#### :symbols-hash:&ensp;Port(s)

:    `N/A`

#### :symbols-link-2:&ensp;URL / Access 

:    N/A

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"Pihole Admin @ pi-zero"
      + Local Network&ensp;:symbols-move-right:&ensp;"Pihole Admin @ pi-server"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                              | Method                                    | Container Name | Image                                 |
| :----------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------------ |
| [:symbols-server:&nbsp;~~Pi 4B Server~~](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `nebula-sync`  | `ghcr.io/lovelaze/nebula-sync:latest` |

### :symbols-settings:&ensp;Configuration 

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "nebula-sync.yml"
```

1. Configuration synchronization options.
2. Gravity synchronization options.
3. Synchronization exclusion filters.