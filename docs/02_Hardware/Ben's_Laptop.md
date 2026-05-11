---
icon: material/laptop
title: Ben's Laptop PC
tags:
  - Hardware
  - PC
  - Laptop
  - Mobile
  - Remote Access
  - Linux
  - Podman Host
hide:
  - toc
---
![Lenovo Logo](../assets/icons/lenovo-light.svg#only-light){ width=250 }
![Lenovo Logo](../assets/icons/lenovo-dark.svg#only-dark){ width=250 }
&nbsp;![Intel Logo](../assets/icons/intel.svg){ width=50 }

# Ben's Laptop PC
[Fedora Discussion :material-forum:](https://discussion.fedoraproject.org){ .md-button .md-button--primary }&emsp;[Fedora Docs :material-fedora:](https://docs.fedoraproject.org//en-US/docs/){ .md-button }&emsp;[Lenovo Support :material-lifebuoy:](https://account.lenovo.com/us/en/signin?returnurl=https%3A%2F%2Fsupport.lenovo.com%2Fus%2Fen%2F&source=b2cuser&linkTrack=account:support:home){ .md-button }

---
## :material-information-outline: Device Overview

#### :material-toolbox: Role: 
+ My laptop PC

#### :symbols-host: Hostname(s):
+ `ben-laptop`

#### :material-map-marker-outline: Location: 
+ Mobile

#### :material-memory: OS / Firmware:  
+ [:material-fedora:&nbsp;Fedora Linux 43](https://fedoraproject.org) *(KDE Plasma Desktop Edition)*

#### :material-key-chain: Credentials:
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Local User @ Ben's-Laptop"

#### :symbols-monitor-heart: Core Specs:

| CPU                                              | Cores / Threads | CPU Freq.                 | RAM     | GPU                            | GPU Freq. | VRAM     |
| :----------------------------------------------- | :-------------- | :------------------------ | :------ | :----------------------------- | :-------- | :------- |
| :brands-intel:&nbsp;Core(r) i5 1135G7 *(x86-64)* | 4C / 8T         | 8 GB LPDDR4 *(4267 MT/s)* | 4.2 GHz | :brands-intel:&nbsp;Iris(r) Xe | 1.3 GHz   | *Shared* |

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

|  Interface  | IP Address | MAC Address         | Connected To                         |
| :---------: | :--------- | :------------------ | :----------------------------------- |
| `wlp0s20f3` | `DHCP`     | `A6:97:E3:D2:F1:C4` | :material-wifi:&nbsp;Home *(VLAN50)* |

#### :material-ip-network: IP Configuration:

| VLAN                            | Hostname(s)           | DNS Servers                   | Gateway        |
| :------------------------------ | :-------------------- | :---------------------------- | :------------- |
| :material-security:&nbsp;VLAN50 | `ben-laptop.internal` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :symbols-storage: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point  | Drive Type | Drive Capacity | Device Path | File System | Encryption |
| :----------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/`, `/home` | NVMe SSD   | 929 GB         | `/dev/dm-0` | `btrfs`     | LUKS2      |

#### :material-usb: External / Attached:

| Mount Point                         | Drive Type    | Drive Capacity | Device Path                         | File System      | Encryption  |
| :---------------------------------- | :------------ | :------------- | :---------------------------------- | :--------------- | :---------- |
| `/home/bhaube/Encrypted-Documents`  | Encrypted Dir | -              | `/home/bhaube/.cipher`              | `fuse.gocryptfs` | `gocryptfs` |
| `/home/bhaube/Google-Drive`         | Cloud Storage | 2 TB           | -                                   | `fuse.rclone`    | -           |
| `/mnt/storage_server/Quick_Storage` | NFS           | 1.9 TB         | `192.168.50.4:/media/Quick-Storage` | `nfs4`           | -           |
| `/mnt/storage_server/NVMe`          | NFS           | 234 GB         | `192.168.50.4:/media/nvme0n1p1`     | `nfs4`           | -           |

## :material-web: Services / Docker Containers

#### :material-network-pos: Virtualization:

|  Status  | OS                                                  | Virtual NIC             | Virtual Disk Image                   | Role / Notes                                    |
| :------: | :-------------------------------------------------- | :---------------------- | :----------------------------------- | :---------------------------------------------- |
| *Active* | :services-kali:&nbsp;[Kali Linux](https://kali.org) | Virtual Network *(NAT)* | `kali-linux-2025.4-qemu-amd64.qcow2` | Network security and penetration testing tools. |

#### :material-linux: Native Linux:

|  Status  | Service                                                          |        Port(s)         | Role / Notes                             |
| :------: | :--------------------------------------------------------------- | :--------------------: | :--------------------------------------- |
| *Active* | :simple-syncthing:&nbsp;[Syncthing](../03_Services/Syncthing.md) | `8384` `22000` `21027` | Open decentralized file synchronization. |

---
## :material-tools: Maintenance & Notes

--8<-- "critical-conf-ben-pc.md"

#### :material-update: Update Process:

##### Automatic Updates

+ Automatic offline updates for OS packages and firmware are enabled through the KDE Plasma desktop environment, and will be applied weekly. When OS updates need to reboot the system, a notification will appear in the system tray.
+ Flatpak applications will also update automatically through KDE Discover, and they do not requrie a system reboot.
+ To perform manual updates for the OS packages, firmware, and Flatpak applications you can use the CLI.

##### Manual Updates

+ To update Fedora RPM packages manually with the CLI run the following commands:

    ```bash linenums="1"
    sudo dnf upgrade -y --refresh --offline
    sudo dnf offline reboot -y
    ```

+ To update firmware manually with the CLI run the following commands:

    ```bash linenums="1"
    sudo fwupdmgr get-updates
    sudo fwupdmgr update
    ```

+ To update Flatpak apps manually with the CLI run the following command:

    ```bash linenums="1"
    sudo flatpak update -y
    ```

#### :material-cloud-upload-outline: Backup Policy:

+ `/home` directory backed up every weekday at `18:00` to [ZimaOS NAS](./ZimaBoard_2_NAS.md) with a custom [backup script](#backup-script) triggerd by Systemd.
+ With the `Persistent=true` value set in the Systemd `.timer` unit file, the backup script will run the next time the system is running if the system is powered off or sleeping at the scheduled backup time.

#### :material-console-network: SSH Client:

##### Bitwarden Key Agent

+ Bitwarden is utilized to securely store SSH keys. 
+ To enable the agent you need to install the Bitwarden desktop application and edit the `.bashrc` file.
+ See ["Bitwarden SSH Key Agent"](../03_Services/SSH.md#bitwarden-ssh-key-agent) for documentation.

##### Config File

+ Key-based authentication is enabled for [SSH](../03_Services/SSH.md) sessions on all servers on the network, and password authentication is disabled. 
+ To avoid getting the error, `too many authentication attempts`, when attempting to log in; the servers need to be added to a configuration file in the `~/.ssh` directory.
+ See ["SSH Config File"](../03_Services/SSH.md#ssh-config-file_1) for documentation.  

#### :material-folder-network: ZimaOS NAS Mounts:

+ On 2026/02/09 we implemented a protocol change from SMB to NFS for remote file system mounts due to slow transfers for small files. *(e.g., photos / code)* 
    + Other benefits from the switch to NFS include: Full compatibility for file ownership and permissions, and compatibility for sym-links. The `rsync` command in the backup script has been modified to reflect this change.  
    + This change only applies to PCs using the Linux OS. The Windows and Android clients still utilize SMB with multi-chanel enabled.
+ See the ["Clients"](../03_Services/NFS.md#clients) section on the NFS service documentation page for the Systemd unit files and configuration details.

#### :material-file-code-outline: Backup Script:

1. Place `home-bkp-nas.sh` in the `~/.local/bin` directory.

    ```bash title="<code>home-bkp-nas.sh</code>" linenums="1" hl_lines="9 44 65 66"
    --8<-- "home-bkp-nas.sh"
    ```

    1. Double check that `DEST_DIR` is set to the correct directory for the client. Risk of overwriting another client's data!
    2. Replace the `GOTIFY_TOKEN` and `GOTIFY_URL` variables with your actual Gotify App token and URL.

2. Place `.bkp-exclude-nas` in the `~/` directory.

    ```kconfig title="<code>.bkp-exclude-nas</code>" linenums="1"
    --8<-- ".bkp-exclude-nas"
    ```

3. Run the command `#!bash mkdir -p ~/.var/log` to create the log directory.
4. Run the command `#!bash touch ~/.var/log/backup_log.log` to create the empty log file.
5. Place `home-backup` in the `/etc/logrotate.d/` directory.

    ```nginx title="<code>/etc/logrotate.d/home-backup</code>" linenums="1"
    --8<-- "logrotate-home-backup"
    ```

6. Place `home-bkp-nas.timer` and `home-bkp-nas.service` in the `~/.config/systemd/user/` directory.

    ```systemd title="<code>home-bkp-nas.timer</code>" linenums="1"
    --8<-- "home-bkp-nas.timer"
    ```

    ```systemd title="<code>home-bkp-nas.service</code>" linenums="1"
    --8<-- "home-bkp-nas.service"
    ```

7. Run the following commands to reload the systemd daemons and enable the timer:

    ```bash linenums="1"
    systemctl --user daemon-reload
    systemctl --user enable home-bkp-nas.timer
    ```

#### :material-folder-lock: Encrypted-Documents:

1. Open `kdewallet`, create a folder named `Passwords`, create an entry called `gocryptfspass`, and type in the password.
2. Place the `.desktop` file in the `~/.config/autostart` directory. 

    ```desktop title="<code>mount-gocryptfs.desktop</code>" linenums="1"
    --8<-- "mount-gocryptfs.desktop"
    ```

#### :material-google-drive: Rclone Google Drive Mount:

1. Place the`rclone.conf` file in the `~/.config/rclone` directory.

    ```ini title="<code>rclone.conf</code>" linenums="1"
    --8<-- "rclone.conf"
    ```

2. Place the `.desktop` file in the `~/.config/autostart` directory. 

    ```desktop title="<code>mount-rclone.desktop</code>" linenums="1"
    --8<-- "mount-rclone.desktop"
    ```

#### :material-console-line: Starship Terminal Prompt:

--8<-- "starship-note.md"

1. Install the latest version.

    ```bash linenums="1"
    curl -sS https://starship.rs/install.sh | sh
    ```

2. Add init script to shell's config file. 

    ```bash linenums="1"
    eval "$(starship init bash)"
    ```

3. Place the custom config file in the `~/.config` directory.

    ```toml title="<code>starship.toml</code>" linenums="1"
    --8<-- "starship-laptop.toml"
    ```
