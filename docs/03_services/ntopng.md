---
icon: services/ntop
status: inactive
title: ntopng
subtitle: Network Traffic Probe
description: Web-based traffic and security network traffic monitoring.
tags:
  - Container
  - Inactive
  - Infrastructure
  - Monitor
  - Network
  - Service
hide:
  - toc
---

![ntop Logo](../assets/icons/ntop.svg){ width=200 }

# ntopng

_Network Traffic Probe_

[GitHub&ensp;:brands-github:](https://github.com/ntop/ntopng){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://www.ntop.org/guides/ntopng/){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Web-based traffic and security network traffic monitoring.

#### :symbols-hash:&ensp;Port(s)

- `3000`
{ .no-bullets }
- `5556`
{ .no-bullets }

#### :symbols-link-2:&ensp;URL / Access 

- <http://storage-server.internal:3000>
{ .no-bullets }
- <http://storage-server-2.internal:3000>
{ .no-bullets }

#### :symbols-user-key:&ensp;Credentials 

:    N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `ntop`         | `ntop/ntopng:latest` |

### :symbols-settings:&ensp;Configuration

``` yaml { .mono-title title="~/.casaos/apps/ntopng/docker-compose.yml" linenums="1" }
--8<-- "ntopng.yml"
```

1. Updated to include `eth0` and `eth1` while keeping the `--community` flag.