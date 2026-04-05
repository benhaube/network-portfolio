---
tags:
  - active
  - service
  - software
  - native
  - file-share
  - remote-access
  - backup
hide:
  - toc
---
![[folder-network.svg|200]]

# [[SMB|SMB (Server Message Block)]]
[Documentation :material-file-document-multiple:](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb/f210069c-7086-4dc2-885e-861d837df688){ .md-button .md-button--primary }

---
## :material-information-outline: Overview
* **Purpose:** Remote file system access.
* **Port(s):** `445`
* **URL / Access:** 
    * `\\storage-server.internal\nvme0n1p1`
    * `\\storage-server.internal\Quick-Storage`
    * `\\pi-server.internal\smb-share`
    * `\\asusrouter.internal\`
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com)

## :material-package-down: Deployment Details  
* **Host Device:** 
    * :simple-raspberrypi:&nbsp;[[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]
    * :services-zimaos:&nbsp;[[ZimaBoard_2_NAS|ZimaBoard 2 NAS]] *(SMB multi-channel)*
* **Method:** &nbsp;:simple-linux:&nbsp;Native Service
* **Container Name:** `N/A`
* **Image:** `N/A` 

### :material-cog: Configuration  

#### [[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]] Config:

```toml title="/etc/samba/smb.conf" linenums="1"
[global]  
 workgroup = WORKGROUP  
 server string = pi-server %v  
 security = user  
  
[smb-share]  
 comment = Samba Share  
 path = /mnt/usb-drive/smb-share  
 browseable = yes  
 writeable = yes  
 read only = no  
 force user = admin
```

#### [[ZimaBoard_2_NAS|ZimaOS NAS]] Config:

```toml title="/etc/samba/smb.conf" linenums="1"
# custom config  
  
[global]  
  
server multi channel support = yes  
interfaces = "192.168.50.4;speed=2500000000,capability=RSS" "192.168.50.5;speed=2500000000,capability=RSS"  
bind interfaces only = yes  
  
## debug settings  
# log level = 10  
  
# end custom config  
  
include = /etc/samba/casa.%U.conf
```

+ **Individual User Configuration Files:**

    ```toml title="/etc/samba/casa.admin.conf" linenums="1"
    [ZimaOS-HD]  
    browseable = yes  
    guest ok = No  
    path = /media/ZimaOS-HD/  
    read only = No  
    recycle:repository = /media/ZimaOS-HD/.trash/smb  
    recycle:keeptree = yes  
    recycle:versions = yes  
    veto files = /.trash/ /.zima_encrypted_folders/  
    delete veto files = yes  
    create mask = 0777  
    directory mask = 0777  
  
    [nvme0n1p1]  
    browseable = yes  
    guest ok = No  
    path = /media/nvme0n1p1  
    read only = No  
    recycle:repository = /media/nvme0n1p1/.trash/smb  
    recycle:keeptree = yes  
    recycle:versions = yes  
    veto files = /.trash/ /.zima_encrypted_folders/  
    delete veto files = yes  
    create mask = 0777  
    directory mask = 0777  
  
    [Quick-Storage]  
    browseable = yes  
    guest ok = No  
    path = /media/Quick-Storage  
    read only = No  
    recycle:repository = /media/Quick-Storage/.trash/smb  
    recycle:keeptree = yes  
    recycle:versions = yes  
    veto files = /.trash/ /.zima_encrypted_folders/  
    delete veto files = yes  
    create mask = 0777  
    directory mask = 0777  
      
    [Downloads]  
    browseable = yes  
    guest ok = No  
    path = /media/Quick-Storage/Downloads  
    read only = No  
    recycle:repository = /media/Quick-Storage/.trash/smb/Downloads  
    recycle:keeptree = yes  
    recycle:versions = yes  
    veto files = /.trash/ /.zima_encrypted_folders/  
    delete veto files = yes  
    create mask = 0777  
    directory mask = 0777  
 
    [Documents]  
    browseable = yes  
    guest ok = No  
    path = /media/Quick-Storage/Documents  
    read only = No  
    recycle:repository = /media/Quick-Storage/.trash/smb/Documents  
    recycle:keeptree = yes  
    recycle:versions = yes  
    veto files = /.trash/ /.zima_encrypted_folders/  
    delete veto files = yes  
    create mask = 0777  
    directory mask = 0777  
  
    [Backup]  
    browseable = yes  
    guest ok = No  
    path = /media/Quick-Storage/Backup  
    read only = No  
    recycle:repository = /media/Quick-Storage/.trash/smb/Backup  
    recycle:keeptree = yes  
    recycle:versions = yes  
    veto files = /.trash/ /.zima_encrypted_folders/  
    delete veto files = yes  
    create mask = 0777  
    directory mask = 0777  
  
    [Gallery]  
    browseable = yes  
    guest ok = No  
    path = /media/Quick-Storage/Gallery  
    read only = No  
    recycle:repository = /media/Quick-Storage/.trash/smb/Gallery  
    recycle:keeptree = yes  
    recycle:versions = yes  
    veto files = /.trash/ /.zima_encrypted_folders/  
    delete veto files = yes  
    create mask = 0777  
    directory mask = 0777  
  
    [Media]  
    browseable = yes  
    guest ok = No  
    path = /media/Quick-Storage/Media  
    read only = No  
    recycle:repository = /media/Quick-Storage/.trash/smb/Media  
    recycle:keeptree = yes  
    recycle:versions = yes  
    veto files = /.trash/ /.zima_encrypted_folders/  
    delete veto files = yes  
    create mask = 0777  
    directory mask = 0777
    ```
    
    ```toml title="/etc/samba/casa.bhaube.conf" linenums="1"
    [Quick-Storage]  
    browseable = yes  
    guest ok = No  
    path = /media/Quick-Storage  
    read only = No  
    recycle:repository = /media/Quick-Storage/.trash/smb  
    recycle:keeptree = yes  
    recycle:versions = yes  
    veto files = /.trash/ /.zima_encrypted_folders/  
    delete veto files = yes  
    create mask = 0777  
    directory mask = 0777
    ```
    
    ```toml title="/etc/samba/casa.rpereira.conf" linenums="1"    
    [Quick-Storage]  
    browseable = yes  
    guest ok = No  
    path = /media/Quick-Storage  
    read only = No  
    recycle:repository = /media/Quick-Storage/.trash/smb  
    recycle:keeptree = yes  
    recycle:versions = yes  
    veto files = /.trash/ /.zima_encrypted_folders/  
    delete veto files = yes  
    create mask = 0777  
    directory mask = 0777
    ```
