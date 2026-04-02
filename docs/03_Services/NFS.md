---
tags:
  - active
  - service
  - software
  - native
  - file-share
  - network
  - infrastructure
  - backup
hide:
  - toc
---
![[folder-network.svg|200]]

# [[NFS|NFS (Network File System)]]
[Documentation :material-file-document-multiple:](https://docs.kernel.org/admin-guide/nfs/index.html){ .md-button .md-button--primary }

---
## :material-information-outline: Overview
* **Purpose:** Remote file system access
* **Port(s):** `2049`
* **URL / Access:** 
    * `192.168.50.4:/media/Quick-Storage`
    * `192.168.50.4:/media/nvme0n1p1`
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): "[[SSH]] keys"

## :material-package-down: Deployment Details
* **Host Device:** &nbsp;:services-zimaos:&nbsp;[[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]
* **Method:** &nbsp;:simple-linux:&nbsp;Native Service
* **Container Name:** `N/A`
* **Image:** `N/A` 

### :fontawesome-solid-gear: Configuration 

**Exports File:**

```ini title="/etc/exports" linenums="1"
/media/Quick-Storage *(rw,sync,no_subtree_check)
/media/nvme0n1p1 *(rw,sync,no_subtree_check)
```

**Command to Apply:**

```bash linenums="1"
exportfs -a
```

**or**

```bash linenums="1"
systemctl restart nfs-server
```
