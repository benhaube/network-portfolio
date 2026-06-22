---
icon: symbols/smb-share
title: SMB
subtitle: Server Message Block
description: Remote file system access.
tags:
  - Active
  - Service
  - Software
  - Native
  - File Share
  - Remote Access
  - Backup
hide:
  - toc
---
![Material Design SMB icon](../assets/icons/smb-share.svg){ width=200 }

# SMB
*Server Message Block*

[Documentation&ensp;:symbols-documentation:](https://wiki.samba.org/index.php/Main_Page){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-description:&ensp;Description 

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
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"ZimaOS NAS (admin)"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"ZimaOS NAS (bhaube)" 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"ZimaOS NAS (rpereira)" 

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                     | Method                             | Container Name | Image |
| :---------------------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| [:material-raspberry-pi:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                             | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration  

#### :material-raspberry-pi:&ensp;Raspberry Pi 4B Server

```linuxconfig title="<code>/etc/samba/smb.conf</code>" linenums="1"
--8<-- "smb-pi-4b.conf"
```

#### :material-nas:&ensp;ZimaOS NAS

```linuxconfig title="<code>/etc/samba/smb.conf</code>" linenums="1"
--8<-- "smb-zima.conf"
```

##### User Configuration Files

```linuxconfig title="<code>/etc/samba/casa.admin.conf</code>" linenums="1"
--8<-- "casa.admin.conf"
```
    
```linuxconfig title="<code>/etc/samba/casa.bhaube.conf</code>" linenums="1"
--8<-- "casa.bhaube.conf"
```
    
```linuxconfig title="<code>/etc/samba/casa.rpereira.conf</code>" linenums="1"    
--8<-- "casa.rpereira.conf"
```
