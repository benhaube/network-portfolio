---
icon: services/ntop
status: inactive
title: ntopng
subtitle: Network Traffic Probe
description: A web-based network traffic monitoring application released under GPLv3. It is the new incarnation of the original ntop written in 1998, and now revamped in terms of performance, usability, and features.
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

**Description**

:   A web-based network traffic monitoring application released under GPLv3. It is the new incarnation of the original ntop written in 1998, and now revamped in terms of performance, usability, and features.

**Port(s)**

- `3000`
{ .no-bullets }
- `5556`
{ .no-bullets }

**URL / Access**

- <http://storage-server.internal:3000>
{ .no-bullets }
- <http://storage-server-2.internal:3000>
{ .no-bullets }

**Credentials**

:   N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                | Port(s)            |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------- | :----------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `ntop`         | `ntop/ntopng:latest` | `3000`&ensp;`5556` |

---

## :symbols-settings:&ensp;Configuration

``` yaml { .mono-title title="~/.casaos/apps/ntopng/docker-compose.yml" linenums="1" }
--8<-- "ntopng.yml"
```

1. Updated to include `eth0` and `eth1` while keeping the `--community` flag.
