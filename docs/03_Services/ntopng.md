---
icon: services/ntop
status: inactive
title: ntopng
subtitle: Network Traffic Probe
description: Web-based traffic and security network traffic monitoring.
tags:
  - Inactive
  - Service
  - Software
  - Docker
  - Monitor
  - Network
  - Infrastructure
hide:
  - toc
---
![ntop Logo](../assets/icons/ntop.svg){ width=250 }

# ntopng
*Network Traffic Probe*

[GitHub&ensp;:simple-github:](https://github.com/ntop/ntopng){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:material-file-document-multiple:](https://www.ntop.org/guides/ntopng/){ .md-button .md-button--primary }

---
## :material-information-outline:&ensp;Overview

#### :symbols-description:&ensp;Description  

:    Web-based traffic and security network traffic monitoring. 

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `3000`
+ `5556`

#### :material-link-variant:&ensp;URL / Access

+ <http://192.168.50.4:3000>
+ <http://storage-server.internal:3000>
+ <http://storage-server-2.internal:3000>

#### :material-key-chain:&ensp;Credentials 

+ N/A

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :------------------- |
| [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `ntop`         | `ntop/ntopng:latest` |

### :material-cog:&ensp;Configuration

```yaml title="<code>compose.yml</code>" linenums="1"
--8<-- "ntopng.yml"
```

1. Updated to include `eth0` and `eth1` while keeping the `--community` flag.