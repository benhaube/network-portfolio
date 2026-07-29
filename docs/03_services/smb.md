---
icon: symbols/cloud-sync
title: SMB
subtitle: Server Message Block
description: Remote file system access.
tags:
  - Active
  - Native
  - File Share
  - Remote Access
  - Backup
  - Service
hide:
  - toc
---
![Lucide cloud-sync icon](../assets/icons/cloud-sync.svg){ width=200 }

# SMB
*Server Message Block*

[Documentation&ensp;:symbols-files:](https://wiki.samba.org/index.php/Main_Page){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Remote file system access.

#### :symbols-hash:&ensp;Port(s)

:    `445`

#### :symbols-link-2:&ensp;URL / Access   

:    :symbols-router:&nbsp;ASUS RT-BE92U:

      + `\\asusrouter.internal\`

:    :symbols-server:&nbsp;Pi 4B Server:

      + `\\pi-server.internal\smb-share`

:    :symbols-server-nas:&nbsp;ZimaOS NAS:

      + `\\storage-server.internal\nvme0n1p1`
      + `\\storage-server.internal\Quick-Storage`

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }
    
      + Local Network&ensp;:symbols-move-right:&ensp;"Asus Router"
      + Local Network&ensp;:symbols-move-right:&ensp;"pi-server (admin)"
      + Local Network&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (admin)"
      + Local Network&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (bhaube)" 
      + Local Network&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (rpereira)" 

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                            | Method                          | Container Name | Image |
| :--------------------------------------------------------------------- | :------------------------------ | :------------- | :---- |
| [:symbols-router:&nbsp;ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)   | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)   | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration  

#### :symbols-server:&ensp;Pi 4B Server

```linuxconfig {title="/etc/samba/smb.conf" linenums="1" .mono-title}
--8<-- "smb-pi-4b.conf"
```

#### :symbols-server-nas:&ensp;ZimaOS NAS

```linuxconfig {title="/etc/samba/smb.conf" linenums="1" .mono-title}
--8<-- "smb-zima.conf"
```

##### User Configuration Files

```linuxconfig {title="/etc/samba/casa.admin.conf" linenums="1" .mono-title}
--8<-- "casa.admin.conf"
```
    
```linuxconfig {title="/etc/samba/casa.bhaube.conf" linenums="1" .mono-title}
--8<-- "casa.bhaube.conf"
```
    
```linuxconfig {title="/etc/samba/casa.rpereira.conf" linenums="1" .mono-title}    
--8<-- "casa.rpereira.conf"
```
