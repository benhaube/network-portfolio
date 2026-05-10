---
icon: material/folder-network
title: NFS (Network File System)
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
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + SSH Keys&ensp;:material-arrow-right-thin:&ensp;"admin@storage-server"
    + SSH Keys&ensp;:material-arrow-right-thin:&ensp;"bhaube@storage-server"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                         | Method                             | Container Name | Image |
| :------------------------------------------------------------------ | :--------------------------------- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :material-cog: Configuration 

#### :material-server-outline: Server:

##### Exports Entry

```linuxconfig title="<code>/etc/exports</code>" linenums="1"
--8<-- "exports"
```

##### Command to Apply

```bash linenums="1"
exportfs -a
```

**or**

```bash linenums="1"
systemctl restart nfs-server
```

#### :symbols-devices: Clients:

##### Systemd Unit Files

+ Systemd `.mount` unit files:
    + Place files in the `/etc/systemd/system` directory.

    ```systemd title="<code>mnt-storage_server-NVMe.mount</code>" linenums="1"
    --8<-- "mnt-storage_server-NVMe.mount"
    ```

    ```systemd title="<code>mnt-storage_server-Quick_Storage.mount</code>" linenums="1"
    --8<-- "mnt-storage_server-Quick_Storage.mount"
    ```

+ Systemd `.automount` unit files:
    + Place files in the `/etc/systemd/system` directory.

    ```systemd title="<code>mnt-storage_server-NVMe.automount</code>" linenums="1"
    --8<-- "mnt-storage_server-NVMe.automount"
    ```

    ```systemd title="<code>mnt-storage_server-Quick_Storage.automount</code>" linenums="1"
    --8<-- "mnt-storage_server-Quick_Storage.automount"
    ```

##### Command to Apply

+ Run the Systemd daemon-reload command to apply the configuration files.

    ```bash linenums="1"
    sudo systemctl daemon-reload
    ```

+ Add a shortcut to the `/mnt/storage_server` directory in the "Places" pane in the Dolphin file manager for quick GUI access. The remote file systems will mount automatically when you visit the directory.
    + Running the CLI command, `ls /mnt/storage-server`, will also trigger the auto-mount. 