---
icon: services/openspeedtest
tags:
  - Active
  - Service
  - Software
  - Docker
  - Network
  - Infrastructure
  - Monitor
hide:
  - toc
---
![OpenSpeedTest Logo](../assets/icons/openspeedtest.svg){ width=200 }

# OpenSpeedTest
[GitHub :material-github:](https://github.com/openspeedtest/Docker-Image){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://openspeedtest.com/selfhosted-speedtest){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ HTML5 Network Speed Test Server. 

#### :symbols-settings-ethernet: Port(s):
+ `3004`

#### :material-link-variant: URL / Access:  
+ <https://openspeedtest.internal>
+ <http://storage-server.internal:3004>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `openspeedtest` | `openspeedtest/latest:v2.0.6` |

### :material-cog: Configuration

```yaml title="compose.yml" linenums="1"
--8<-- "openspeedtest.yml"
```
