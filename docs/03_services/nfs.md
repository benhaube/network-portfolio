---
icon: symbols/cloud-sync
title: NFS
subtitle: Network File System
description: Remote file system access for Linux.
tags:
  - Active
  - Native
  - File Share
  - Network
  - Infrastructure
  - Backup
  - Service
hide:
  - toc
---
![Lucide cloud-sync icon](../assets/icons/cloud-sync.svg){ width=200 }

# NFS
*Network File System*

[Documentation&ensp;:symbols-files:](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/7/html/storage_administration_guide/ch-nfs){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Remote file system access for Linux.

#### :symbols-chevrons-left-right-ellipsis:&ensp;Port(s)

:    `2049`

#### :symbols-link:&ensp;URL / Access 

:    :symbols-folder-tree:&nbsp;Network Storage:

      + `192.168.50.4:/media/Quick-Storage`

:    :symbols-folder-git-2:&nbsp;Application Data:

      + `192.168.50.4:/media/nvme0n1p1`

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
      
      + SSH Keys&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (admin)"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                              | Container Name | Image |
| :------------------------------------------------------------------- | :---------------------------------- | :------------- | :---- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-penguin:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration 

#### :symbols-server:&ensp;Server

##### Enable Service

!!! zima "ZimaOS&ensp;&ge;&ensp;v1.6.2"

    After upgrading to [ZimaOS v1.6.2](https://github.com/IceWhaleTech/ZimaOS/releases/tag/1.6.2){ external-link } the NFS service needs to be enabled manually with the following commands. All newer versions have the NFS server disabled by default to prevent unwanted file system access.

```bash linenums="1"
sudo systemctl enable nfs-server
sudo systemctl start nfs-server
```

##### Exports Entry

```linuxconfig {title="/etc/exports" linenums="1" .mono-title}
--8<-- "exports"
```

1. Open the `/etc/exports` configuration file in a text editor and add the two lines shown above:

    ```bash linenums="1"
    sudo nano /etc/exports/
    ```

2. Save and close the file.
3. Run one of the following commands to apply the configuration:

    ```bash linenums="1"
    exportfs -a
    # or 
    systemctl restart nfs-server
    ```

##### Check Status

1. Run this command to check the status of `nfs-server.service`:

    ```bash linenums="1"
    systemctl status nfs-server
    ```

    ```shell-session title="Expected Output" linenums="1"
    ● nfs-server.service - NFS server and services
          Loaded: loaded (/usr/lib/systemd/system/nfs-server.service; enabled; preset: disabled)
         Drop-In: /run/systemd/generator/nfs-server.service.d
                  └─order-with-mounts.conf
          Active: active (exited) since Tue 2026-07-14 10:32:31 EDT; 3 days ago
      Invocation: 081a72bf1f954c7f8ca46a9e92d9a610
            Docs: man:rpc.nfsd(8)
                  man:exportfs(8)
        Main PID: 28634 (code=exited, status=0/SUCCESS)
        Mem peak: 2.3M
             CPU: 19ms
    ```

#### :symbols-monitor-smartphone:&ensp;Clients

##### Systemd Unit Files

1. Systemd `.mount` unit files:
    + Place files in the `/etc/systemd/system` directory.

    ```systemd {title="mnt-storage_server-NVMe.mount" linenums="1" .mono-title}
    --8<-- "mnt-storage_server-NVMe.mount"
    ```

    ```systemd {title="mnt-storage_server-Quick_Storage.mount" linenums="1" .mono-title}
    --8<-- "mnt-storage_server-Quick_Storage.mount"
    ```

2. Systemd `.automount` unit files:
    + Place files in the `/etc/systemd/system` directory.

    ```systemd {title="mnt-storage_server-NVMe.automount" linenums="1" .mono-title}
    --8<-- "mnt-storage_server-NVMe.automount"
    ```

    ```systemd {title="mnt-storage_server-Quick_Storage.automount" linenums="1" .mono-title}
    --8<-- "mnt-storage_server-Quick_Storage.automount"
    ```

##### Command to Apply

1. Run the Systemd daemon-reload command to apply the configuration files.

    ```bash linenums="1"
    sudo systemctl daemon-reload
    ```

2. Add a shortcut to the `/mnt/storage_server` directory in the "Places" pane in the Dolphin file manager for quick GUI access. The remote file systems will mount automatically when you visit the directory.
    + Running the CLI command, `ls /mnt/storage-server`, will also trigger the auto-mount. 