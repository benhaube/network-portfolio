---
icon: symbols/smb-share-outline
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
![Material Design SMB icon](../assets/icons/smb-share.svg){ width=200 }

# SMB
*Server Message Block*

[Documentation&ensp;:symbols-documentation:](https://wiki.samba.org/index.php/Main_Page){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Remote file system access.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `445`

#### :symbols-link:&ensp;URL / Access  

+ `\\storage-server.internal\nvme0n1p1`
+ `\\storage-server.internal\Quick-Storage`
+ `\\pi-server.internal\smb-share`
+ `\\asusrouter.internal\`

#### :symbols-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com)
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"ZimaOS NAS (admin)"
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"ZimaOS NAS (bhaube)" 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"ZimaOS NAS (rpereira)" 

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                      | Method                            | Container Name | Image |
| :----------------------------------------------------------------------------------------------- | :-------------------------------- | :------------- | :---- |
| [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :symbols-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-nas-outline:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                       | :symbols-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration  

#### :symbols-server-outline:&ensp;Raspberry Pi 4B Server

```linuxconfig {title="/etc/samba/smb.conf" linenums="1" .mono-title}
--8<-- "smb-pi-4b.conf"
```

#### :symbols-nas-outline:&ensp;ZimaOS NAS

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
