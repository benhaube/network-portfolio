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
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"ZimaOS NAS (admin)"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"ZimaOS NAS (bhaube)" 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"ZimaOS NAS (rpereira)" 

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                     | Method                             | Container Name | Image |
| :---------------------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                             | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :material-cog: Configuration  

#### :material-raspberry-pi: [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) Config:

```linuxconfig title="<code>/etc/samba/smb.conf</code>" linenums="1"
--8<-- "smb-pi-4b.conf"
```

#### :material-nas: [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) Config:

```linuxconfig title="<code>/etc/samba/smb.conf</code>" linenums="1"
--8<-- "smb-zima.conf"
```

**:material-account-outline: Individual User Configuration Files:**

```linuxconfig title="<code>/etc/samba/casa.admin.conf</code>" linenums="1"
--8<-- "casa.admin.conf"
```
    
```linuxconfig title="<code>/etc/samba/casa.bhaube.conf</code>" linenums="1"
--8<-- "casa.bhaube.conf"
```
    
```linuxconfig title="<code>/etc/samba/casa.rpereira.conf</code>" linenums="1"    
--8<-- "casa.rpereira.conf"
```
