---
icon: material/web-clock
title: Chrony
subtitle: NTP Server
description: Advanced, lightweight NTP client and server.
tags:
  - Active
  - Service
  - Software
  - Native
  - Infrastructure
hide:
  - toc
---
![Chrony Icon](../assets/icons/chrony.svg){ width=200 }

# Chrony
*NTP Server*

[Gitlab&ensp;:simple-gitlab:](https://gitlab.com/chrony/chrony){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:material-file-document-multiple:](https://chrony-project.org/documentation.html){ .md-button .md-button--primary }

---
## :material-information-outline:&ensp;Overview

#### :symbols-description:&ensp;Description

:    Advanced, lightweight NTP client and server.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `123`

#### :material-link-variant:&ensp;URL / Access

+ `192.168.50.1:123`
+ `asusrouter.internal:123`

#### :material-key-chain:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com) 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"ASUS Router"
    + SSH Key&ensp;:material-arrow-right-thin:&ensp;"admin@asusrouter"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                      | Method                             | Container Name | Image |
| :------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| [:material-router-wireless:&nbsp;ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :material-cog:&ensp;Configuration 

#### :material-server-outline:&ensp;Server

```nt title="<code>/opt/share/ntpmerlin.d/chrony.conf</code>" linenums="1"
--8<-- "chrony.conf"
```

#### :symbols-devices:&ensp;Clients

```nt title="<code>/etc/chrony.conf</code>" linenums="1"
--8<-- "chrony-client.conf"
```
