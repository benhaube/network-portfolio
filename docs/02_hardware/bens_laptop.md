---
icon: symbols/laptop-minimal
title: Ben's Laptop
subtitle: ThinkPad X1 Carbon
description: Ben's main laptop PC, a ThinkPad X1 Carbon, used primarily for getting work done on-the-go.
tags:
  - Hardware
  - Laptop
  - Linux
  - Mobile
  - PC 
  - Remote Access
  - Virtual Host
hide:
  - toc
---
![Lucide 'laptop-minimal' icon](../assets/icons/laptop-minimal.svg){ width=200 }

# Ben's Laptop
*ThinkPad X1 Carbon*

[Fedora Docs&ensp;:brands-fedora:](https://docs.fedoraproject.org//en-US/docs/){ .md-button .md-button--primary }&emsp;[User Guide&ensp;:symbols-notebook-text:](../assets/manuals/x1_yoga_gen6_user_guide.pdf){ .md-button .md-button--primary }&emsp;[Maintenance Manual&ensp;:symbols-notebook-text:](../assets/manuals/x1_yoga_gen6_maintenance_manual.pdf){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Device Overview

#### :symbols-toolbox:&ensp;Role 

:    Ben's main laptop PC, a ThinkPad X1 Carbon, used primarily for getting work done on-the-go. A mobile device connected to the Trusted Wi-Fi network (SSID: `Home`).

#### :symbols-host:&ensp;Hostname

:    `ben-laptop`

#### :symbols-map-pin:&ensp;Location 

:    Mobile

#### :symbols-cpu:&ensp;OS / Firmware

:    [:brands-fedora:&ensp;Fedora Linux 44](https://fedoraproject.org/kde/){ external-link } *(KDE Plasma Desktop Edition)*

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"Local User @ Ben's-Laptop"

#### :symbols-brick-wall-shield:&ensp;Device Security

:    HSI-4

:    Firmware: 
      
      + BIOS rollback protection
      + IOMMU
      + Linux kernel lockdown
      + Pre-boot DMA protection
      + SMAP
      + Suspend-to-idle: enabled
      + Suspend-to-RAM: disabled
      + TPM v2.0
      + UEFI memory protection
      + UEFI Secure Boot

:    Software:
    
      + :symbols-arrow-right-left:&nbsp;Linux swap encryption
      + :symbols-shield-keyhole:&nbsp;LUKS2 drive encryption
      + :symbols-key-fido2:&nbsp;FIDO2-based MFA for local user 

:    Biometric:
    
      + :symbols-fingerprint-pattern:&nbsp;Fingerprint Scan
      + :symbols-scan-face:&nbsp;IR Face Scan

## :symbols-circuit-board:&ensp;Core Specs

| CPU                                              | Cores / Threads | CPU Freq.                 | RAM     | GPU                            | GPU Freq. | VRAM     |
| :----------------------------------------------- | :-------------- | :------------------------ | :------ | :----------------------------- | :-------- | :------- |
| :brands-intel:&nbsp;Core(r) i5 1135G7 *(x86-64)* | 4C / 8T         | 8 GB LPDDR4 *(4267 MT/s)* | 4.2 GHz | :brands-intel:&nbsp;Iris(r) Xe | 1.3 GHz   | *Shared* |

## :symbols-network:&ensp;Network Configuration

|  Interface  | IP Address {data-sort-method='dotsep'} | MAC Address         | Connected To                                                                                |
| :---------: | :------------------------------------- | :------------------ | :------------------------------------------------------------------------------------------ |
| `wlp0s20f3` | `DHCP`                                 | `A6:97:E3:D2:F1:C4` | [:symbols-wifi-lock:&nbsp;Home](asus_rt-be92u.md#wi-fi-networks){ data-preview } *(VLAN50)* |

|  Interface  |             VLAN             | FQDN  | DNS Servers {data-sort-method='none'} | Gateway {data-sort-method='dotsep'} |
| :---------: | :--------------------------: | :---- | :------------------------------------ | :---------------------------------- |
| `wlp0s20f3` | :symbols-shield:&nbsp;VLAN50 | `N/A` | `192.168.50.6` `192.168.50.2`         | `192.168.50.1`                      |

## :symbols-folder-tree:&ensp;Storage & Mounts

#### :symbols-hard-drive:&ensp;Internal Drive(s)

| Mount Point  | Drive Type | Drive Capacity {data-sort-method='filesize'} | Device Path | File System | Encryption                               |
| :----------- | :--------- | :------------------------------------------- | :---------- | :---------- | :--------------------------------------- |
| `/`, `/home` | NVMe SSD   | 929 GB                                       | `/dev/dm-0` | `btrfs`     | :symbols-shield-keyhole:&nbsp;LUKS2      |

#### :symbols-usb:&ensp;External / Attached

| Mount Point                         | Drive Type    | Drive Capacity {data-sort-method='filesize'} | Device Path                         | File System      | Encryption                                |
| :---------------------------------- | :------------ | :------------------------------------------- | :---------------------------------- | :--------------- | :---------------------------------------- |
| `/home/bhaube/Encrypted-Documents`  | Encrypted Dir | 929 GB                                       | `/home/bhaube/.cipher`              | `fuse.gocryptfs` | :symbols-shield-keyhole:&nbsp;`gocryptfs` |
| `/home/bhaube/Google-Drive`         | Cloud Storage | 2 TB                                         | -                                   | `fuse.rclone`    | -                                         |
| `/mnt/storage_server/Quick_Storage` | NFS           | 1.9 TB                                       | `192.168.50.4:/media/Quick-Storage` | `nfs4`           | -                                         |
| `/mnt/storage_server/NVMe`          | NFS           | 234 GB                                       | `192.168.50.4:/media/nvme0n1p1`     | `nfs4`           | -                                         |

## :symbols-monitor-cloud:&ensp;Services & Containers

#### :symbols-layers:&ensp;Virtualization

|  Status  | OS                                                  | Virtual NIC | Virtual Disk Image | Role / Notes {data-sort-method='none'}          |
| :------: | :-------------------------------------------------- | :---------- | :----------------- | :---------------------------------------------- |
| *Active* | [:services-kali:&nbsp;Kali Linux](https://kali.org) | NAT         | `kali-linux.qcow2` | Network security and penetration testing tools. |

#### :symbols-tux:&ensp;Native Linux

|  Status  | Service                                                                | Port(s) {data-sort-method='number'} | Role / Notes {data-sort-method='none'}   |
| :------: | :--------------------------------------------------------------------- | :---------------------------------: | :--------------------------------------- |
| *Active* | [:services-syncthing-alt:&nbsp;Syncthing](../03_services/syncthing.md) |     `8384`<br>`22000`<br>`21027`    | Open decentralized file synchronization. |

---
## :symbols-sticky-notes:&ensp;Maintenance & Notes

--8<-- "critical-conf-ben-pc.md"

#### :symbols-rotate-cw-clock:&ensp;Update Process

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

#### :symbols-cloud-upload:&ensp;Backup Policy

+ The `/home` directory backed up every weekday at `18:30` to [ZimaOS NAS](zimaos_nas.md) with a custom [backup script](#backup-script) triggered by Systemd.
+ With the `Persistent=true` value set in the Systemd `*.timer` unit file, the backup script will run the next time the system is running if the system is powered off or sleeping at the scheduled backup time.
+ Backups of the user files stored on the **ZimaOS NAS** are then backed up to the cloud storage provider, [Backblaze B2](https://www.backblaze.com/cloud-storage){ external-link }, to maintain the [3-2-1 Backup Strategy](../01_infrastructure/disaster_recovery_plan.md#backup-strategy).

#### :symbols-terminal:&ensp;SSH Client

##### Bitwarden Key Agent

+ Bitwarden is utilized to securely store SSH keys. 
+ To enable the agent you need to install the Bitwarden desktop application and edit the `.bashrc` file.
+ See ["Bitwarden SSH Key Agent"](../03_services/ssh.md#bitwarden-ssh-key-agent) for documentation.

##### Config File

+ Key-based authentication is enabled for [SSH](../03_services/ssh.md#credentials){ data-preview } sessions on all servers on the network, and password authentication is disabled. 
+ To avoid getting the error, `too many authentication attempts`, when attempting to log in; the servers need to be added to a configuration file in the `~/.ssh` directory.
+ See ["SSH Config File"](../03_services/ssh.md#ssh-config-file_1) for documentation.  

#### :symbols-folder-tree:&ensp;ZimaOS NAS Mounts

+ On 2026/02/09 we implemented a protocol change from SMB to NFS for remote file system mounts due to slow transfers for small files. *(e.g., photos / code)* 
    + Other benefits from the switch to NFS include: Full compatibility for file ownership and permissions, and compatibility for sym-links. The `rsync` command in the backup script has been modified to reflect this change.  
    + This change only applies to PCs using the Linux OS. The Windows and Android clients still utilize SMB with multi-chanel enabled.
+ See the ["Clients"](../03_services/nfs.md#clients) section on the NFS service documentation page for the Systemd unit files and configuration details.

#### :symbols-file-terminal:&ensp;Backup Script

1. Place `home-bkp-nas.sh` in the `~/.local/bin` directory.

    ```bash {title="home-bkp-nas.sh" linenums="1" hl_lines="5 40 61 62" .mono-title}
    --8<-- "home-bkp-nas.sh"
    ```

    1. Double check that `DEST_DIR` is set to the correct directory for the client. Risk of overwriting another client's data!
    2. Replace the `GOTIFY_TOKEN` and `GOTIFY_URL` variables with your actual Gotify App token and URL.

2. Place `.bkp-exclude-nas` in the `~/` directory.

    ```kconfig {title=".bkp-exclude-nas" linenums="1" .mono-title}
    --8<-- "bkp-exclude-nas"
    ```

3. Run the command `#!bash mkdir -p ~/.var/log` to create the log directory.
4. Run the command `#!bash touch ~/.var/log/backup_log.log` to create the empty log file.
5. Place `home-backup` in the `/etc/logrotate.d/` directory.

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

#### :brands-google-drive:&ensp;Rclone Google Drive Mount

1. Place the`rclone.conf` file in the `~/.config/rclone` directory.

    ```ini {title="rclone.conf" linenums="1" .mono-title}
    --8<-- "rclone.conf"
    ```

2. Place the `.desktop` file in the `~/.config/autostart` directory. 

    ```desktop {title="mount-rclone.desktop" linenums="1" .mono-title}
    --8<-- "mount-rclone.desktop"
    ```

--8<-- "nerd-fonts.md"

#### :symbols-rocket:&ensp;Starship Terminal Prompt

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
    --8<-- "starship-laptop.toml"
    ```

#### :symbols-log-in:&ensp;Fastfetch Login Preset

The Fastfetch Login Preset prints a customized Fastfetch output with relevant information every time a new terminal session is started. I have all variants of the preset hosted in a code repository on [GitHub](https://github.com/benhaube/fastfetch-login-preset){ external-link }.

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
--8<-- "fastfetch-login-laptop.jsonc"
```

1. Sets the width of the percentage bars.
2.     **Options:** 
       
       + `1` = number 
       + `2` = bar 
       + `3` = both 
       + `9` = colored number

3.     **Options:** 
       
       + `string`
       + `icon` 
       + `both` 
       + `none`

4. Aligns all keys to this uniform width.
5. Sets the separator symbol used between the keys and values.