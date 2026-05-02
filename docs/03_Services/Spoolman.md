---
icon: services/spoolman
tags:
  - Active
  - Service
  - Software
  - Docker
  - 3D-Printer
hide:
  - toc
---
![Spoolman logo](../assets/icons/spoolman.svg){ width=200 }

# Spoolman
[GitHub :material-github:](https://github.com/Donkie/Spoolman){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/Donkie/Spoolman/wiki/Installation){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Manage 3D-printer filament inventory, and actively track filament usage.

#### :symbols-settings-ethernet: Port(s):
+ `7912`

#### :material-link-variant: URL / Access:   
+ <http://storage-server.internal:7912/>
+ <https://spoolman.internal>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                            |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :------------------------------- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `spoolman`     | `ghcr.io/donkie/spoolman:latest` |

### :material-cog: Configuration 

```yaml title="compose.yml" linenums="1"
--8<-- "spoolman.yml"
```
