---
icon: services/ntop
status: inactive
title: ntopng
subtitle: Network Traffic Probe
description: Web-based traffic and security network traffic monitoring.
tags:
  - Inactive
  - Container
  - Monitor
  - Network
  - Service
  - Infrastructure
hide:
  - toc
---
![ntop Logo](../assets/icons/ntop.svg){ width=200 }

# ntopng
*Network Traffic Probe*

[GitHub&ensp;:brands-github:](https://github.com/ntop/ntopng){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://www.ntop.org/guides/ntopng/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description  

:    Web-based traffic and security network traffic monitoring. 

#### :symbols-settings-ethernet:&ensp;Port(s)

:    `3000`&emsp;`5556`

#### :symbols-link:&ensp;URL / Access

:    <http://storage-server.internal:3000>

:    <http://storage-server-2.internal:3000>

#### :symbols-user-key:&ensp;Credentials 

:    N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                | Container Name | Image                |
| :------------------------------------------------------------------- | :------------------------------------ | :------------- | :------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :services-docker:&nbsp;Docker Compose | `ntop`         | `ntop/ntopng:latest` |

### :symbols-settings:&ensp;Configuration

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "ntopng.yml"
```

1. Updated to include `eth0` and `eth1` while keeping the `--community` flag.