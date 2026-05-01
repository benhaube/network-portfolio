---
icon: material/cog-sync
title: Nebula-Sync
status: deprecated
tags:
  - Inactive
  - Service
  - Software
  - Docker
  - DNS
  - Infrastructure
  - Network
hide:
  - toc
---
![Nebula Sync Icon](../assets/icons/nebula-sync.svg){ width=200 }

# Nebula-Sync
[GitHub :material-github:](https://github.com/lovelaze/nebula-sync){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Synchronize settings between [[Pi-hole]] instances.

#### :symbols-settings-ethernet: Port(s):
+ `N/A`

#### :material-link-variant: URL / Access: 
+ N/A

#### :material-key-chain: Credentials: 
+ :material-docker:&nbsp;Docker Compose: `compose.yml`

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;~~[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)~~ | :material-docker:&nbsp;Docker Compose | `nebula-sync` | `ghcr.io/lovelaze/nebula-sync:latest` |

### :material-cog: Configuration 

```yaml title="compose.yml" linenums="1"
--8<-- "nebula-sync.yml"
```

1. Configuration synchronization options.
2. Gravity synchronization options.
3. Synchronization exclusion filters.