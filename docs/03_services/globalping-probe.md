---
icon: services/globalping
title: Globalping Probe
subtitle: Global Network of Probes
description: A global network of probes to run network tests like ping, traceroute and DNS resolve.
tags:
  - Active
  - Container
  - Monitor
  - Network
  - Service
  - Tools
hide:
  - toc
---

![Globalping logo](../assets/icons/globalping.svg){ width=200 }

# Globalping Probe

_Global Network of Probes_

[GitHub&ensp;:brands-github:](https://github.com/jsdelivr/globalping){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://globalping.io/){ .md-button .md-button--primary }&emsp;[Dashboard&ensp;:symbols-layout-dashboard:](https://dash.globalping.io/){ .md-button .md-button--primary }

---

![Service screenshot](../assets/screenshots/globalping-dash-light.png#only-light){ width=400 align=right .on-glb }
![Service screenshot](../assets/screenshots/globalping-dash-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

Globalping allows anyone to run networking commands such as `ping`, `traceroute`, `dig`, and `mtr` on probes distributed around the globe. Gain insights into your network routing from any location in the world! Troubleshoot anycast issues, monitor CDN and DNS performance, perform uptime monitoring, and build your own network tools for personal or public use.

![status badge](https://uptime.rac3r4life.online/api/badge/79/status)&ensp;![uptime badge](https://uptime.rac3r4life.online/api/badge/79/uptime)&ensp;![Docker image version badge](https://img.shields.io/docker/v/globalping/globalping-probe/latest?color=17D4A7)

**Port(s)**

:    `N/A`

**URL / Access** 

:    <https://dash.globalping.io>

**Credentials**

-   [:brands-github:&ensp;GitHub OAuth](https://github.com/settings/developers){ external-link }
{ .no-bullets }
-   [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Globalping Token"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name     | Image                                | Status { data-sort-method="none" }                                                                              | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :----------------- | :----------------------------------- | :-------------------------------------------------------------------------------------------------------------- | :------ |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `globalping-probe` | `globalping/globalping-probe:latest` | ![status badge](https://uptime.rac3r4life.online/api/badge/79/status?label=){ style='vertical-align: middle;' } | `-`     |

---

## :symbols-settings:&ensp;Configuration

--8<-- "managed-by-arcane.md"

### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="/opt/stacks/globalping/compose.yaml" }
--8<-- "globalping-probe.yaml"
```
