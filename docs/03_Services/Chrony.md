---
icon: symbols/web-clock
title: Chrony
subtitle: NTP Server
description: Advanced, lightweight NTP client and server.
tags:
  - Active
  - Native
  - Infrastructure
hide:
  - toc
---
![Chrony Icon](../assets/icons/chrony.svg){ width=200 }

# Chrony
*NTP Server*

[Gitlab&ensp;:brands-gitlab:](https://gitlab.com/chrony/chrony){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://chrony-project.org/documentation.html){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Advanced, lightweight NTP client and server.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `123`

#### :symbols-link:&ensp;URL / Access

+ `192.168.50.1:123`
+ `asusrouter.internal:123`

#### :symbols-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com) 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"ASUS Router"
    + SSH Key&ensp;:symbols-arrow-right-thin:&ensp;"admin@asusrouter"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                    | Method                             | Container Name | Image |
| :----------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| [:symbols-router-outline:&nbsp;ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | :symbols-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration 

#### :symbols-server:&ensp;Server

```nt {title="/opt/share/ntpmerlin.d/chrony.conf" linenums="1" .mono-title}
--8<-- "chrony.conf"
```

#### :symbols-devices:&ensp;Clients

```nt {title="/etc/chrony.conf" linenums="1" .mono-title}
--8<-- "chrony-client.conf"
```
