---
icon: symbols/desktop-pc-outline
title: Ben's Workstation
subtitle: High-Performance Desktop PC
tags:
  - PC
  - Desktop
  - Docker Host
  - Virtual Host
  - Office
  - Linux
  - Hardware
hide:
  - toc
---
![ASUS Logo](../assets/icons/asus-full.svg){ width=250 }&ensp;![AMD Logo](../assets/icons/amd-small.svg){ width=25 }

# Ben's Workstation
*High-Performance Desktop PC*

[Fedora Docs&ensp;:symbols-fedora:](https://docs.fedoraproject.org//en-US/docs/){ .md-button .md-button--primary }&emsp;[User Manual&ensp;:symbols-notebook-text:](../assets/manuals/ASUS_B550-PLUS_User_Manual.pdf){ .md-button .md-button--primary }&emsp;[UEFI Manual&ensp;:symbols-notebook-text:](../assets/manuals/ASUS_B550_Series_UEFI_Manual.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox-outline:&ensp;Role

:    Ben's main workstation PC located at his desk in the office upstairs. Connected to the local network through the [TP-Link Switch](./TP-Link_Switch.md).

#### :symbols-host-outline:&ensp;Hostname

+ `bens-workstation`

#### :symbols-location-outline:&ensp;Location

+ Office 
+ Desk

#### :symbols-memory:&ensp;OS / Firmware

+ [:symbols-fedora:&nbsp;Fedora Linux 44](https://fedoraproject.org/kde/) *(KDE Plasma Desktop Edition)*

#### :symbols-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Local User @ Ben's-Workstation"

#### :symbols-security:&ensp;Device Security

+ HSI-1
+ Firmware:
    + IOMMU
    + Linux kernel lockdown
    + Pre-boot DMA protection
    + SMAP
    + SMM locked down
    + TPM v2.0
    + UEFI Secure Boot
+ Software:
    + Linux swap encryption
    + LUKS2 drive encryption
    + FIDO2-based MFA for local user  

## :symbols-monitor-heart-outline:&ensp;Core Specs

| CPU                                           | Cores / Threads | CPU Freq. | RAM                     | GPU                                | GPU Freq. | VRAM       |
| :-------------------------------------------- | :-------------- | :-------- | :---------------------- | :--------------------------------- | :-------- | :--------- |
| :brands-amd:&nbsp;Ryzen(r) 7 5800X *(x86-64)* | 8C / 16T        | 4.7 GHz   | 32 GB DDR4 *(3600 MHz)* | :brands-amd:&nbsp;Radeon(r) 6600XT | 2581 MHz  | 8 GB GDDR6 |

## :symbols-lan:&ensp;Network Configuration

| Interface | IP Address      | MAC Address         | Connected To                                                                                       |
| :-------: | :-------------- | :------------------ | :------------------------------------------------------------------------------------------------- |
| `enp7s0`  | `192.168.50.10` | `3C:7C:3F:0D:A9:CD` | [:symbols-ethernet-port-outline:&nbsp;TP-Link Switch](../02_Hardware/TP-Link_Switch.md) *(Port 1)* |
| `wlp6s0`  | `DHCP`          | `F2:1E:02:CD:11:10` | [:symbols-android-wifi-lock:&nbsp;Home](./ASUS_RT-BE92U.md#wi-fi-networks) *(VLAN50)*              |

| Interface | VLAN                           | FQDN                        | DNS Servers                   | Gateway        |
| :-------: | :----------------------------- | :-------------------------- | :---------------------------- | :------------- |
| `enp7s0`  | :symbols-security:&nbsp;VLAN50 | `bens-workstation.internal` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |
| `wlp6s0`  | :symbols-security:&nbsp;VLAN50 | `-`                         | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :symbols-folder-open-outline:&ensp;Storage & Mounts

#### :symbols-hard-drive-outline:&ensp;Internal Drive(s)

| Mount Point    | Drive Type | Drive Capacity | Device Path                 | File System | Encryption |
| :------------- | :--------- | :------------- | :-------------------------- | :---------- | :--------- |
| `/`, `/home`   | NVMe SSD   | 929 GB         | `/dev/dm-0`                 | `btrfs`     | LUKS2      |
| `/mnt/1TB_HDD` | SATA HDD   | 1 TB           | `/dev/mapper/1TB_HDD_crypt` | `btrfs`     | LUKS2      |

#### :symbols-usb:&ensp;External / Attached

| Mount Point                         | Drive Type    | Drive Capacity | Device Path                         | File System      | Encryption  |
| :---------------------------------- | :------------ | :------------- | :---------------------------------- | :--------------- | :---------- |
| `/run/media/bhaube/External_SSD`    | NVMe SSD      | 916 GB         | `/dev/dm-2`                         | `ext4`           | LUKS2       |
| `/home/bhaube/Encrypted-Documents`  | Encrypted Dir | -              | `/home/bhaube/.cipher`              | `fuse.gocryptfs` | `gocryptfs` |
| `/home/bhaube/Google-Drive`         | Cloud Storage | 2 TB           | -                                   | `fuse.rclone`    | -           |
| `/mnt/storage_server/Quick_Storage` | NFS           | 1.9 TB         | `192.168.50.4:/media/Quick-Storage` | `nfs4`           | -           |
| `/mnt/storage_server/NVMe`          | NFS           | 234 GB         | `192.168.50.4:/media/nvme0n1p1`     | `nfs4`           | -           |

## :symbols-web:&ensp;Services / Docker Containers

#### :symbols-layers:&ensp;Virtualization

|  Status  | OS                                                                        | Virtual NIC | Virtual Disk Image    | Role / Notes                                                          |
| :------: | :------------------------------------------------------------------------ | :---------- | :-------------------- | :-------------------------------------------------------------------- |
| *Active* | [:services-fedora-coreos:&nbsp;CoreOS](https://fedoraproject.org/coreos/) | NAT         | `fedora-coreos.qcow2` | Learning and experimenting with Fedora's immutable server OS          |
| *Active* | [:services-kali:&nbsp;Kali Linux](https://kali.org)                       | NAT         | `kali-linux.qcow2`    | Network security and penetration testing tools.                       |
| *Active* | [:brands-microsoft:&nbsp;Windows 11](https://microsoft.com/windows)       | NAT         | `Windows_11.qcow2`    | Windows environment to run Windows software that won't run with WINE. |

#### :symbols-linux:&ensp;Native Linux

|  Status  | Service                                                          |        Port(s)         | Role / Notes                                                              |
| :------: | :--------------------------------------------------------------- | :--------------------: | :------------------------------------------------------------------------ |
| *Active* | [:symbols-remote-desktop:&nbsp;RDP](../03_Services/RDP.md)       |         `3389`         | Remote desktop protocol for accessing the desktop over the local network. |
| *Active* | [:simple-syncthing:&nbsp;Syncthing](../03_Services/Syncthing.md) | `8384` `22000` `21027` | Open decentralized file synchronization.                                  |

---
## :symbols-note-stack:&ensp;Maintenance & Notes

--8<-- "critical-conf-ben-pc.md"

#### :symbols-update:&ensp;Update Process

##### Automatic Updates

+ Automatic offline updates for OS packages and firmware are enabled through the KDE Plasma desktop environment, and will be applied weekly. When OS updates need to reboot the system, a notification will appear in the system tray.
+ Flatpak applications will also update automatically through KDE Discover, and they do not require a system reboot.
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

#### :symbols-backup:&ensp;Backup Policy

+ The `/home` directory backed up every weekday at `18:00` to [ZimaOS NAS](./ZimaBoard_2_NAS.md) with a custom [backup script](#backup-script) triggered by Systemd.
+ With the `Persistent=true` value set in the Systemd `.timer` unit file, the backup script will run the next time the system is running if the system is powered off or sleeping at the scheduled backup time.
+ Backups of the user files stored on the **ZimaOS NAS** are then backed up to the cloud storage provider, [Backblaze B2](https://www.backblaze.com/cloud-storage), to maintain the [3-2-1 Backup Strategy](../01_Infrastructure/Disaster_Recovery_Plan.md#backup-strategy).

#### :symbols-terminal:&ensp;SSH Client

##### Bitwarden Key Agent

+ Bitwarden is utilized to securely store SSH keys. 
+ To enable the agent you need to install the Bitwarden desktop application and edit the `.bashrc` file.
+ See ["Bitwarden SSH Key Agent"](../03_Services/SSH.md#bitwarden-ssh-key-agent) for documentation.

##### Config File

+ Key-based authentication is enabled for [SSH](../03_Services/SSH.md) sessions on all servers on the network, and password authentication is disabled. 
+ To avoid getting the error, `too many authentication attempts`, when attempting to log in; the servers need to be added to a configuration file in the `~/.ssh` directory.
+ See ["SSH Config File"](../03_Services/SSH.md#ssh-config-file_1) for documentation.  

#### :symbols-smb-share-outline:&ensp;ZimaOS NAS Mounts

+ On 2026/02/09 we implemented a protocol change from SMB to NFS for remote file system mounts due to slow transfers for small files. *(e.g., photos / code)* 
    + Other benefits from the switch to NFS include: Full compatibility for file ownership and permissions, and compatibility for sym-links. The `rsync` command in the backup script has been modified to reflect this change.
    + This change only applies to PCs using the Linux OS. The Windows and Android clients still utilize SMB with multi-chanel enabled.
+ See the ["Clients"](../03_Services/NFS.md#clients) section on the NFS service documentation page for the Systemd unit files and configuration details.

#### :symbols-file-terminal:&ensp;Backup Script

1. Place `home-bkp-nas.sh` in the `~/.local/bin` directory.

    ```bash {title="home-bkp-nas.sh" linenums="1" hl_lines="5 40 61 62" .mono-title}
    --8<-- "home-bkp-nas.sh"
    ```

    1. Double check that `DEST_DIR` is set to the correct directory for the client. Risk of overwriting another client's data!
    2. Replace the `GOTIFY_TOKEN` and `GOTIFY_URL` variables with your actual Gotify App token and URL. 

2. Place `.bkp-exclude-nas` in the `~/` directory. 

    ```kconfig {title=".bkp-exclude-nas" linenums="1" .mono-title}
    --8<-- "bkp-exclude-nas"
    ```

3. Run the command `#!bash mkdir -p ~/.var/log` to create the log directory. 
4. Run the command `#!bash touch ~/.var/log/backup_log.log` to create the empty log file. 
5. Place `home-backup` in the `/etc/logrotate.d/` directory.

    ```nginx {title="/etc/logrotate.d/home-backup" linenums="1" .mono-title}
    --8<-- "logrotate-home-backup"
    ```

6. Place `home-bkp-nas.timer` and `home-bkp-nas.service` in the `~/.config/systemd/user/` directory.

    ```systemd {title="home-bkp-nas.timer" linenums="1" .mono-title}
    --8<-- "home-bkp-nas.timer"
    ```

    ```systemd {title="home-bkp-nas.service" linenums="1" .mono-title}
    --8<-- "home-bkp-nas.service"
    ```

7. Run the following commands to reload the systemd daemons and enable the timer:

    ```bash linenums="1"
    systemctl --user daemon-reload
    systemctl --user enable home-bkp-nas.timer
    ```

#### :symbols-folder-key:&ensp;Encrypted-Documents

1. Open `kdewallet`, create a folder named `Passwords`, create an entry called `gocryptfspass`, and type in the password.
2. Place the `.desktop` file in the `~/.config/autostart` directory. 

    ```desktop {title="mount-gocryptfs.desktop" linenums="1" .mono-title}
    --8<-- "mount-gocryptfs.desktop"
    ```

#### :symbols-google-drive:&ensp;Rclone Google Drive Mount
1. Place the`rclone.conf` file in the `~/.config/rclone` directory.

    ```ini {title="rclone.conf" linenums="1" .mono-title}
    --8<-- "rclone.conf"
    ```

2. Place the `.desktop` file in the `~/.config/autostart` directory. 

    ```desktop {title="mount-rclone.desktop" linenums="1" .mono-title}
    --8<-- "mount-rclone.desktop"
    ```

--8<-- "nerd-fonts.md"

#### :symbols-rocket-launch:&ensp;Starship Terminal Prompt

The Starship terminal prompt is a cross-platform, cross-shell application that replaces the standard shell prompt on your Android, BSD, Windows, Linux, or MacOS computer. It is compatible with Bash, Cmd, Elvish, Fish, Ion, Nutshell, Powershell, Tcsh, Xonsh, and Zsh. 

1. Install the latest version:

    ```bash linenums="1"
    curl -sS https://starship.rs/install.sh | sh
    ```

2. Add init script to shell's config file: 

    ```bash linenums="1"
    eval "$(starship init bash)"
    ```

3. Place the custom config file in the `~/.config` directory:

    ```toml {title="starship.toml" linenums="1" .mono-title}
    --8<-- "starship-desktop.toml"
    ```

#### :symbols-login:&ensp;Fastfetch Login Preset

The Fastfetch Login Preset prints a customized Fastfetch output with relevant information every time a new terminal session is started. I have all variants of the preset hosted in a code repository on [GitHub](https://github.com/benhaube/fastfetch-login-preset).

1. Install Fastfetch: 

    ```bash linenums="1"
    sudo dnf upgrade
    sudo dnf install fastfetch
    ```

2. Copy the `login.jsonc` preset file into the presets directory:

    ```bash linenums="1"
    sudo cp login.jsonc /usr/share/fastfetch/presets
    ```

3. Add the `fastfetch` command to the `~/.bashrc.d/env` file: 

    ```bash linenums="1"
    fastfetch -c login
    ```

##### Fastfetch Preset File

```json {title="/usr/share/fastfetch/presets/login.jsonc" linenums="1" .mono-title}
--8<-- "fastfetch-login-desktop.jsonc"
```