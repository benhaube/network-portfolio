---
icon: material/desktop-tower
title: Ben's Desktop PC
tags:
  - Hardware
  - PC
  - Desktop
  - Virtual Host
  - Office
  - Linux
  - Podman Host
hide:
  - toc
---
![ASUS Logo](../assets/icons/asus-full.svg){ width=250 }&ensp;![AMD Logo](../assets/icons/amd-small.svg){ width=25 }

# Ben's Desktop PC
[Fedora Discussion :material-forum:](https://discussion.fedoraproject.org){ .md-button .md-button--primary }&emsp;[Fedora Docs :material-fedora:](https://docs.fedoraproject.org//en-US/docs/){ .md-button }&emsp;[ASUS Support :material-lifebuoy:](https://account.asus.com/us/myproductedit.aspx?rowguid=4b12aa6c-2687-4e62-b1f5-3f68820bb06c&sn=L8M0CS003053JKW&from=Myproducts){ .md-button }

---
## :material-information-outline: Device Overview

#### :material-toolbox: Role: 
+ My workstation PC

#### :symbols-host: Hostname(s):
+ `bens-workstation`

#### :material-map-marker-outline: Location: 
+ Office 
+ Desk

#### :material-memory: OS / Firmware:
+ [:material-fedora:&nbsp;Fedora Linux 43](https://fedoraproject.org) *(KDE Plasma Desktop Edition)*

#### :material-key-chain: Credentials:
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "Local User @ Ben's-Workstation"

#### :symbols-monitor-heart: Core Specs:

| CPU | Cores / Threads | CPU Freq. | RAM | GPU | GPU Freq. | VRAM |
| :-- | :-------------- | :-------- | :-- | :-- | :-------- | :--- |
| :brands-amd:&nbsp;Ryzen(r) 7 5800X *(x86-64)* | 8C / 16T | 4.7 GHz | 32 GB DDR4 *(3600 MHz)* | :brands-amd:&nbsp;Radeon(r) 6600XT | 2581 MHz | 8 GB GDDR6 |

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| enp7s0 | `192.168.50.61` | `3C:7C:3F:0D:A9:CD` | :material-switch:&nbsp;[TP-Link Switch](../02_Hardware/TP-Link_Switch.md) *(Port 1)* |
| wlp6s0 | `DHCP` | `F2:1E:02:CD:11:10` | :material-wifi:&nbsp;Home *(vlan50)* |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--- | :---------- | :---------- | :------ |
| :material-security:&nbsp;vlan50 | `bens-workstation.internal` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :symbols-storage: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/`, `/home` | NVMe SSD | 929 GB | `/dev/dm-0` | `btrfs` | LUKS2 |
| `/mnt/1TB_HDD` | SATA HDD | 1 TB | `/dev/mapper/1TB_HDD_crypt` | `btrfs` | LUKS2 |

#### :material-usb: External / Attached:

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/run/media/bhaube/External_SSD` | NVMe SSD | 916 GB | `/dev/dm-2` | `ext4` | LUKS2 |  
| `/home/bhaube/Encrypted-Documents` | Encrypted Dir | - | `/home/bhaube/.cipher` | `fuse.gocryptfs` | `gocryptfs` |
| `/home/bhaube/Google-Drive` | Cloud Storage | 2 TB | - | `fuse.rclone` | - |
| `/mnt/storage_server/Quick_Storage` | NFS | 1.9 TB | `192.168.50.4:/media/Quick-Storage` | `nfs4` | - |        
| `/mnt/storage_server/NVMe` | NFS | 234 GB | `192.168.50.4:/media/nvme0n1p1` | `nfs4` | - |        

## :material-web: Services / Docker Containers

#### :material-network-pos: Virtualization:

| Status | Operating System | Network Interface | Disk Image | Role / Notes |
| :----: | :--------------- | :---------------- | :--------- | :----------- |
| *Active* | :services-kali:&nbsp;[Kali Linux](https://kali.org) | Virtual Network *(NAT)* | `kali-linux-2025.4-qemu-amd64.qcow2` | Network security and penetration testing tools. | 
| *Active* | :material-microsoft:&nbsp;[Windows 11](https://microsoft.com/windows) | Virtual Network *(NAT)* | `Windows_11.qcow2` | Windows environment to run Windows software that won't run with WINE. |

#### :material-linux: Native Linux:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :material-remote-desktop:&nbsp;[RDP](../03_Services/RDP.md) | `3389` | Remote desktop protocol for accessing the desktop over the local network. |

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

* `#!bash sudo dnf upgrade -y --offline` 
* `#!bash sudo dnf offline reboot`
* `#!bash flatpak update`

#### :material-cloud-upload-outline: Backup Policy:

 * `/home` directory backed up every weekday at `18:00` to [[ZimaBoard_2_NAS|ZimaOS NAS]]

#### :material-file-code-outline: Backup Script Config
1. Place `home-bkp-nas.sh` in the `~/.local/bin` directory.

```bash title="home-bkp-nas.sh" linenums="1" hl_lines="44"
--8<-- "home-bkp-nas.sh"
```

1. Double check that `DEST_DIR` is set to the correct directory for the client. Risk of overwriting another client's data! 

2. Place `.bkp-exclude-nas` in the `~/` directory. 

```kconfig title=".bkp-exclude-nas" linenums="1"
--8<-- ".bkp-exclude-nas"
```

3. Run the command `#!bash mkdir -p ~/.var/log` to create the log directory. 
4. Run the command `#!bash touch ~/.var/log/backup_log.log` to create the empty log file. 
5. Place `home-backup` in the `/etc/logrotate.d/` directory.

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
[Desktop Entry]
Exec=gocryptfs --extpass="kwallet-query -f Passwords -r gocryptfspass kdewallet" ~/.cipher ~/Encrypted-Documents
Name=mountgocryptfs
Icon=plasmavault
Type=Application
```

#### :material-google-drive: Rclone Google Drive Config
1. Place the`rclone.conf` file in the `~/.config/rclone` directory.

```ini title="rclone.conf" linenums="1"
[Google-Drive]
type = drive
client_id = <id>.apps.googleusercontent.com
client_secret = <secret>
scope = drive
token = {token}
auth_url = https://accounts.google.com/o/oauth2/auth
token_url = https://oauth2.googleapis.com/token
metadata_owner = failok
metadata_permissions = failok
metadata_labels = failok
env_auth = false
description = rclone
team_drive = 
```

2. Place the `.desktop` file in the `~/.config/autostart` directory. 

```desktop title="mount-rclone.desktop" linenums="1"
[Desktop Entry]
Type=Application
Name=Mount Google Drive
Exec=rclone mount Google-Drive: ~/Google-Drive --vfs-cache-mode full --vfs-cache-max-size 10G --vfs-read-chunk-size 32M --daemon
Icon=google-drive
Comment=Mount Google Drive via rclone
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
# Get editor completions based on the config schema
"$schema" = 'https://starship.rs/config-schema.json'

# Inserts a blank line between shell prompts
add_newline = true

# Move the directory to the second line
# format = '$all$directory$character'

# move the rest of the prompt to the right
# right_format = """$all"""

continuation_prompt = '[❯❯ ](bright-black)'

[character]
success_symbol = '[❯](bold green)'
error_symbol = '[❯](bold red)'

[username]
style_user = 'bold white'
style_root = 'bold red'
format = '[$user]($style) '
disabled = false
show_always = true

[hostname]
ssh_only = false
ssh_symbol = " "
format = '@ [$ssh_symbol$hostname](bold cyan) '
disabled = false

[directory]
style = 'bold white'
truncation_length = 8
truncation_symbol = '…/'
read_only = " 󰌾"
read_only_style = 'bold red'

[localip]
ssh_only = true
format = '- [$localipv4](bold white) '
disabled = false

[os]
format = "on [($name) $symbol]($style)"
style = "bold cyan"
disabled = false

[cmd_duration]
style = 'bold cyan'
format = 'took [$duration]($style) '

# Disable the package module, hiding it from the prompt completely
# [package]
# disabled = true

# NerdFont Symbols Preset
[aws]
symbol = "  "

[buf]
symbol = " "

[bun]
symbol = " "

[c]
symbol = " "

[cpp]
symbol = " "

[cmake]
symbol = " "

[conda]
symbol = " "

[crystal]
symbol = " "

[dart]
symbol = " "

[deno]
symbol = " "

[docker_context]
symbol = " "

[elixir]
symbol = " "

[elm]
symbol = " "

[fennel]
symbol = " "

[fossil_branch]
symbol = " "

[gcloud]
symbol = "  "

[git_branch]
symbol = " "

[git_commit]
tag_symbol = '  '

[golang]
symbol = " "

[guix_shell]
symbol = " "

[haskell]
symbol = " "

[haxe]
symbol = " "

[hg_branch]
symbol = " "

[java]
symbol = " "

[julia]
symbol = " "

[kotlin]
symbol = " "

[lua]
symbol = " "

[memory_usage]
symbol = "󰍛 "

[meson]
symbol = "󰔷 "

[nim]
symbol = "󰆥 "

[nix_shell]
symbol = " "

[nodejs]
symbol = " "

[ocaml]
symbol = " "

[os.symbols]
Alpaquita = " "
Alpine = " "
AlmaLinux = " "
Amazon = " "
Android = " "
Arch = " "
Artix = " "
CachyOS = " "
CentOS = " "
Debian = " "
DragonFly = " "
Emscripten = " "
EndeavourOS = " "
Fedora = " "
FreeBSD = " "
Garuda = "󰛓 "
Gentoo = " "
HardenedBSD = "󰞌 "
Illumos = "󰈸 "
Kali = " "
Linux = " "
Mabox = " "
Macos = " "
Manjaro = " "
Mariner = " "
MidnightBSD = " "
Mint = " "
NetBSD = " "
NixOS = " "
Nobara = " "
OpenBSD = "󰈺 "
openSUSE = " "
OracleLinux = "󰌷 "
Pop = " "
Raspbian = " "
Redhat = " "
RedHatEnterprise = " "
RockyLinux = " "
Redox = "󰀘 "
Solus = "󰠳 "
SUSE = " "
Ubuntu = " "
Unknown = " "
Void = " "
Windows = "󰍲 "

[package]
symbol = "󰏗 "

[perl]
symbol = " "

[php]
symbol = " "

[pijul_channel]
symbol = " "

[pixi]
symbol = "󰏗 "

[python]
symbol = " "

[rlang]
symbol = "󰟔 "

[ruby]
symbol = " "

[rust]
symbol = "󱘗 "

[scala]
symbol = " "

[swift]
symbol = " "

[zig]
symbol = " "

[gradle]
symbol = " "

```
