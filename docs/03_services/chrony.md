---
icon: symbols/refresh-cw-clock
title: Chrony
subtitle: NTP Server
description: Advanced, lightweight NTP client and server.
tags:
  - Active
  - Infrastructure
  - Native
  - Service
hide:
  - toc
---

![Chrony Icon](../assets/icons/clock-refresh-cw-color.svg){ width=200 }

# Chrony

_NTP Server_

[Gitlab&ensp;:brands-gitlab:](https://gitlab.com/chrony/chrony){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://chrony-project.org/documentation.html){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Advanced, lightweight NTP client and server.

#### :symbols-hash:&ensp;Port(s)

:    `123`

#### :symbols-link-2:&ensp;URL / Access 

- `192.168.50.1:123`
{ .no-bullets }
- `asusrouter.internal:123`
{ .no-bullets }

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"ASUS Router"
      - SSH Key&ensp;:symbols-move-right:&ensp;"admin@asusrouter"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                            | Method                          | Container Name | Image |
| :--------------------------------------------------------------------- | :------------------------------ | :------------- | :---- |
| [:symbols-router:&nbsp;ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

#### :symbols-server:&ensp;Server

``` nt { .mono-title title="/opt/share/ntpmerlin.d/chrony.conf" linenums="1" }
--8<-- "chrony.conf"
```

#### :symbols-monitor-smartphone:&ensp;Clients

``` nt { .mono-title title="/etc/chrony.conf" linenums="1" }
--8<-- "chrony-client.conf"
```
