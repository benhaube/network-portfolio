---
icon: symbols/smb-share
title: NFS
subtitle: Network File System
description: Remote file system access for Linux.
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
![Material Design SMB icon](../assets/icons/smb-share.svg){ width=200 }

# NFS
*Network File System*

[Documentation&ensp;:symbols-documentation:](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/7/html/storage_administration_guide/ch-nfs){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-description:&ensp;Description 

:    Remote file system access for Linux.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `2049`

#### :symbols-link:&ensp;URL / Access 

+ `192.168.50.4:/media/Quick-Storage`
+ `192.168.50.4:/media/nvme0n1p1`

#### :symbols-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + SSH Keys&ensp;:material-arrow-right-thin:&ensp;"ZimaOS NAS (admin)"
    + SSH Keys&ensp;:material-arrow-right-thin:&ensp;"ZimaOS NAS (bhaube)"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                         | Method                             | Container Name | Image |
| :------------------------------------------------------------------ | :--------------------------------- | :------------- | :---- |
| [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration 

#### :symbols-server:&ensp;Server

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

#### :symbols-devices:&ensp;Clients

##### Systemd Unit Files

1. Systemd `.mount` unit files:
    + Place files in the `/etc/systemd/system` directory.

    ```systemd title="<code>mnt-storage_server-NVMe.mount</code>" linenums="1"
    --8<-- "mnt-storage_server-NVMe.mount"
    ```

    ```systemd title="<code>mnt-storage_server-Quick_Storage.mount</code>" linenums="1"
    --8<-- "mnt-storage_server-Quick_Storage.mount"
    ```

2. Systemd `.automount` unit files:
    + Place files in the `/etc/systemd/system` directory.

    ```systemd title="<code>mnt-storage_server-NVMe.automount</code>" linenums="1"
    --8<-- "mnt-storage_server-NVMe.automount"
    ```

    ```systemd title="<code>mnt-storage_server-Quick_Storage.automount</code>" linenums="1"
    --8<-- "mnt-storage_server-Quick_Storage.automount"
    ```

##### Command to Apply

1. Run the Systemd daemon-reload command to apply the configuration files.

    ```bash linenums="1"
    sudo systemctl daemon-reload
    ```

2. Add a shortcut to the `/mnt/storage_server` directory in the "Places" pane in the Dolphin file manager for quick GUI access. The remote file systems will mount automatically when you visit the directory.
    + Running the CLI command, `ls /mnt/storage-server`, will also trigger the auto-mount. 