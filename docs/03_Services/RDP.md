---
icon: material/remote-desktop
title: RDP
subtitle: Remote Desktop Protocol
description: Remote desktop access over the local network
tags:
  - Active
  - Native
  - Remote Access
hide:
  - toc
---
![Material Design remote-desktop icon](../assets/icons/remote-desktop.svg){ width=200 }

# RDP
*Remote Desktop Protocol*

[Gitlab&ensp;:simple-gitlab:](https://invent.kde.org/plasma/krdp){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://deepwiki.com/KDE/krdp){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-description:&ensp;Description 

:    Remote desktop access over the local network *(not publicly exposed)*

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `3389`

#### :symbols-link:&ensp;URL / Access  

+ [rdp://192.168.50.67:3389](rdp://192.168.50.67:3389)
+ [rdp://bens-workstation.internal:3389](rdp://192.168.50.67:3389)

#### :symbols-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com):  
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Local User @ Ben's-Workstation"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                        | Method                             | Container Name | Image |
| :--------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| [:symbols-desktop-pc-outline:&nbsp;Ben's Desktop](../02_Hardware/Ben's_Desktop.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

```ini title="<code>~/.config/krdpserverrc</code>" linenums="1"
--8<-- "krdpserverrc"
```
