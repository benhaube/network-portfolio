---
icon: material/folder-network
tags:
  - Active
  - Service
  - Software
  - Native
  - File Share
  - Network
  - Infrastructure
  - Backup
hide:
  - toc
---
![Material Design "folder-network" icon](../assets/icons/folder-network.svg){ width=200 }

# NFS (Network File System)
[Documentation :material-file-document-multiple:](https://docs.kernel.org/admin-guide/nfs/index.html){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Remote file system access

#### :symbols-settings-ethernet: Port(s): 
+ `2049`

#### :material-link-variant: URL / Access: 
+ `192.168.50.4:/media/Quick-Storage`
+ `192.168.50.4:/media/nvme0n1p1`

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "[[SSH]] keys"

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |

### :material-cog: Configuration 

#### :material-file-cog: Exports File:

```conf title="/etc/exports" linenums="1"
/media/Quick-Storage *(rw,sync,no_subtree_check)
/media/nvme0n1p1 *(rw,sync,no_subtree_check)
```

#### :material-console-line: Command to Apply:

```bash linenums="1"
exportfs -a
```

**or**

```bash linenums="1"
systemctl restart nfs-server
```
