---
icon: material/web-clock
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

# Chrony (NTP Server)
[Gitlab :simple-gitlab:](https://gitlab.com/chrony/chrony){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://chrony-project.org/documentation.html){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Advanced, lightweight NTP client and server.

#### :symbols-settings-ethernet: Port(s): 
+ `123`

#### :material-link-variant: URL / Access: 
+ `asusrouter.internal:123`

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com) 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"ASUS Router"
    + SSH Key&ensp;:material-arrow-right-thin:&ensp;"Admin@asusrouter"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                      | Method                             | Container Name | Image |
| :------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :material-cog: Configuration 

#### :material-server-outline: Server:

```nt title="/opt/share/ntpmerlin.d/chrony.conf" linenums="1"
--8<-- "chrony.conf"
```

#### :material-devices: Clients:

```nt title="/etc/chrony.conf" linenums="1"
--8<-- "chrony-client.conf"
```
