---
icon: material/folder-network
title: SMB (Server Message Block)
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
![Material Design folder-network icon](../assets/icons/folder-network.svg){ width=200 }

# SMB (Server Message Block)
[Documentation :material-file-document-multiple:](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb/f210069c-7086-4dc2-885e-861d837df688){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Remote file system access.

#### :symbols-settings-ethernet: Port(s):
+ `445`

#### :material-link-variant: URL / Access:  
+ `\\storage-server.internal\nvme0n1p1`
+ `\\storage-server.internal\Quick-Storage`
+ `\\pi-server.internal\smb-share`
+ `\\asusrouter.internal\`

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com)
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"storage-server (Admin)"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"storage-server (bhaube)" 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"storage-server (rpereira)" 

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                     | Method                             | Container Name | Image |
| :---------------------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                             | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :material-cog: Configuration  

#### :material-raspberry-pi: [[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]] Config:

```linuxconfig title="/etc/samba/smb.conf" linenums="1"
--8<-- "smb-pi-4b.conf"
```

#### :material-nas: [[ZimaBoard_2_NAS|ZimaOS NAS]] Config:

```linuxconfig title="/etc/samba/smb.conf" linenums="1"
--8<-- "smb-zima.conf"
```

**:material-account-outline: Individual User Configuration Files:**

```linuxconfig title="/etc/samba/casa.admin.conf" linenums="1"
--8<-- "casa.admin.conf"
```
    
```linuxconfig title="/etc/samba/casa.bhaube.conf" linenums="1"
--8<-- "casa.bhaube.conf"
```
    
```linuxconfig title="/etc/samba/casa.rpereira.conf" linenums="1"    
--8<-- "casa.rpereira.conf"
```
