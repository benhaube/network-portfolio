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

---
## :material-tools: Maintenance & Notes

> [!config] Critical Configurations
> **:material-web-clock: Chrony:** 
> + Time synchronizes with local time server running on main router, [[ASUS_RT-BE92U|ASUS RT-BE92U]], using `chrony`.
> 
> **:material-cloud-upload-outline: Backup:** 
> + Home directory backed up every weekday at `18:00` using custom `rsync` script, `home-bkp-nas.sh`. The script is triggered by `systemd` user timer, `home-bkp-nas.timer` which starts `home-bkp-nas.service`. The timer is persistent, so if the PC is asleep at the backup time the backup will start the next time the PC wakes up.
> 
> **:material-lock-open: LUKS Unlocking:** 
> + The LUKS encrypted boot drive is configured to use the onboard `TPM2` chip for drive encryption. Kernel and firmware upgrades require clearing the registered PCRs and enrolling the new ones. This can be done with a custom script I wrote, `update-pcrs`, which is located in the `/usr/local/bin` directory.
> 
> + The proper command format is:
>  
>     ```bash linenums="1"
>     sudo update-pcrs /dev/nvme0n1p3
>     ```
>
> + More information about the configuration process can be found at: [[Unlock_LUKS_TPM2|Unlock LUKS w/ TPM2]] 

#### :material-update: Update Process:

* `#!bash sudo dnf offline-upgrade download` 
* `#!bash sudo dnf offline reboot`
* `#!bash flatpak update`

#### :material-cloud-upload-outline: Backup Policy:

* `/home` directory backed up every weekday at `18:00` to [[ZimaBoard_2_NAS|ZimaOS NAS]]

#### :material-file-code-outline: Backup Script Config
1. Place `home-bkp-nas.sh` in the `~/.local/bin` directory.

```bash title="home-bkp-nas.sh" linenums="1" hl_lines="44"
--8<-- "home-bkp-nas.sh"
```

1. Double check that `DEST_DIR` is set to the correct directory for the client. Risk of overwriting another client's data!

2. Place `.bkp-exclude-nas` in the `~/` directory.

```kconfig title=".bkp-exclude-nas" linenums="1"
--8<-- ".bkp-exclude-nas"
```

3. Run the command `#!bash mkdir -p ~/.var/log` to create the log directory.
4. Run the command `#!bash touch ~/.var/log/backup_log.log` to create the empty log file.
5. Place `home-backup` in the `/etc/logrotate.d/` directory.

```nginx title="/etc/logrotate.d/home-backup" linenums="1"
--8<-- "logrotate-home-backup"
```

6. Place `home-bkp-nas.timer` and `home-bkp-nas.service` in the `~/.config/systemd/user/` directory.

```systemd title="home-bkp-nas.timer" linenums="1"
--8<-- "home-bkp-nas.timer"
```

```systemd title="home-bkp-nas.service" linenums="1"
--8<-- "home-bkp-nas.service"
```

7. Run the command `#!bash systemctl --user daemon-reload`
8. Run the command `#!bash systemctl --user enable home-bkp-nas.timer`

#### :material-folder-network: Systemd Files for ZimaOS NAS Mounts *(NFS)*

```systemd title="mnt-storage_server-NVMe.mount" linenums="1"
--8<-- "mnt-storage_server-NVMe.mount"
```

```systemd title="mnt-storage_server-NVMe.automount" linenums="1"
--8<-- "mnt-storage_server-NVMe.automount"
```

```systemd title="mnt-storage_server-Quick_Storage.mount" linenums="1"
--8<-- "mnt-storage_server-Quick_Storage.mount"
```

```systemd title="mnt-storage_server-Quick_Storage.automount" linenums="1"
--8<-- "mnt-storage_server-Quick_Storage.automount"
```

#### :material-folder-lock: Encrypted-Documents Config

1. Open `kdewallet`, create a folder named `Passwords`, create an entry called `gocryptfspass`, and type in the password.
2. Place the `.desktop` file in the `~/.config/autostart` directory. 

```desktop title="mount-gocryptfs.desktop" linenums="1"
--8<-- "mount-gocryptfs.desktop"
```

#### :material-google-drive: Rclone Google Drive Config

1. Place the`rclone.conf` file in the `~/.config/rclone` directory.

```ini title="rclone.conf" linenums="1"
--8<-- "rclone.conf"
```

2. Place the `.desktop` file in the `~/.config/autostart` directory. 

```desktop title="mount-rclone.desktop" linenums="1"
--8<-- "mount-rclone.desktop"
```

#### :material-console-line: Starship.rs Terminal Prompt

1. Install the latest version.

```bash linenums="1"
curl -sS https://starship.rs/install.sh | sh
```

2. Add init script to shell's config file. 

```bash linenums="1"
eval "$(starship init bash)"
```

3. Move custom config file to `~/.config/starship.toml`.

```toml title="starship.toml" linenums="1"
--8<-- "starship-laptop.toml"
```
