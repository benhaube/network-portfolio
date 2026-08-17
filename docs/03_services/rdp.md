---
icon: symbols/screen-share
title: RDP
subtitle: Remote Desktop Protocol
description: Remote desktop access over the local network
tags:
  - Active
  - Infrastructure
  - Native
  - Remote Access
  - Service
hide:
  - toc
---

![Lucide 'chevrons-right-left' icon](../assets/icons/screen-share.svg){ width=200 }

# RDP

_Remote Desktop Protocol_

[Gitlab&ensp;:brands-gitlab:](https://invent.kde.org/plasma/krdp){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://deepwiki.com/KDE/krdp){ .md-button .md-button--primary }

---

![KDE Plasma RDP server settings](../assets/screenshots/kde-settings-rdp.png){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Remote desktop access over the local network _(not publicly exposed)_

#### :symbols-hash:&ensp;Port(s)

:    `3389`

#### :symbols-link-2:&ensp;URL / Access   

:    [rdp://bens-workstation.internal:3389](rdp://192.168.50.67:3389)

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }  

    - Local Network&ensp;:symbols-move-right:&ensp;"Local User @ Ben's-Workstation"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                            | Method                          | Container Name | Image |
| :--------------------------------------------------------------------- | :------------------------------ | :------------- | :---- |
| [:symbols-pc-case:&nbsp;Ben's Desktop](../02_hardware/bens_desktop.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

``` ini { .mono-title title="~/.config/krdpserverrc" linenums="1" }
--8<-- "krdpserverrc"
```
