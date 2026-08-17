---
icon: symbols/folder-tree
title: SMB
subtitle: Server Message Block
description: Remote file system access.
tags:
  - Active
  - Backup
  - File Share
  - Native
  - Remote Access
  - Service
hide:
  - toc
---

![Lucide 'folder-tree' icon](../assets/icons/folder-tree.svg){ width=200 }

# SMB

_Server Message Block_

[Documentation&ensp;:symbols-files:](https://wiki.samba.org/index.php/Main_Page){ .md-button .md-button--primary }

---

![ZimaOS Files SMB shares](../assets/screenshots/zimaos-files-smb-light.png#only-light){ width=400 align=right .on-glb }
![ZimaOS Files SMB shares](../assets/screenshots/zimaos-files-smb-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Remote file system access.

#### :symbols-hash:&ensp;Port(s)

:    `445`

#### :symbols-link-2:&ensp;URL / Access

-   :symbols-router:&ensp;ASUS RT-BE92U:
{ .no-bullets }
    - `\\asusrouter.internal\`
-   :symbols-server:&ensp;Pi 4B Server:
{ .no-bullets }
    - `\\pi-server.internal\smb-share`
-   :symbols-server-nas:&ensp;ZimaOS NAS:
{ .no-bullets }
    - `\\storage-server.internal\nvme0n1p1`
    - `\\storage-server.internal\Quick-Storage`

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Asus Router"
    - Local Network&ensp;:symbols-move-right:&ensp;"pi-server (admin)"
    - Local Network&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (admin)"
    - Local Network&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (bhaube)"
    - Local Network&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (rpereira)"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                            | Method                          | Container Name | Image |
| :--------------------------------------------------------------------- | :------------------------------ | :------------- | :---- |
| [:symbols-router:&nbsp;ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)   | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)   | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

#### :symbols-server:&ensp;Pi 4B Server

``` linuxconfig { .mono-title title="/etc/samba/smb.conf" linenums="1" }
--8<-- "smb-pi-4b.conf"
```

#### :symbols-server-nas:&ensp;ZimaOS NAS

``` linuxconfig { .mono-title title="/etc/samba/smb.conf" linenums="1" }
--8<-- "smb-zima.conf"
```

##### User Configuration Files

``` linuxconfig { .mono-title title="/etc/samba/casa.admin.conf" linenums="1" }
--8<-- "casa.admin.conf"
```

``` linuxconfig { .mono-title title="/etc/samba/casa.bhaube.conf" linenums="1" }
--8<-- "casa.bhaube.conf"
```

``` linuxconfig { .mono-title title="/etc/samba/casa.rpereira.conf" linenums="1" }    
--8<-- "casa.rpereira.conf"
```
