---
tags:
  - hardware
  - pc
  - desktop
hide:
  - toc
---
![[asus-full.svg|300]]

# [[Ben's_Desktop|Ben's Desktop PC]]
[Fedora Discussion :material-chat-question:](https://discussion.fedoraproject.org){ .md-button .md-button--primary }&emsp;[Fedora Docs :material-file-document-multiple:](https://docs.fedoraproject.org//en-US/docs/){ .md-button }&emsp;[ASUS Support :material-lifebuoy:](https://account.asus.com/us/myproductedit.aspx?rowguid=4b12aa6c-2687-4e62-b1f5-3f68820bb06c&sn=L8M0CS003053JKW&from=Myproducts){ .md-button }

---
## :material-information-outline: Device Overview
* **Role:** Personal workstation PC
* **Hostname(s):** `bens-workstation`
* **Location:** 
    * Office 
    * Desk
* **OS / Firmware:** &nbsp;:material-fedora:&nbsp;[Fedora Linux 43](https://fedoraproject.org) *(KDE Plasma Desktop Edition)*
* **Credentials:** &nbsp;:services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): "Local User @ Ben's-Workstation"

## :material-lan: Network Configuration

#### :material-ethernet: Network Interface:

| Interface | IP Address | MAC Address | Connected To |
| :-------: | :--------- | :---------- | :----------- |
| enp7s0 | `192.168.50.61` | `3C:7C:3F:0D:A9:CD` | [TP-Link Switch](../02_Hardware/TP-Link_Switch.md) (Port 1) |
| wlp6s0 | `DHCP` | `F2:1E:02:CD:11:10` | SSID: *Home (vlan50)* |

#### :material-ip-network: IP Configuration:

| VLAN | Hostname(s) | DNS Servers | Gateway |
| :--- | :---------- | :---------- | :------ |
| vlan50 | `bens-workstation.internal` | `192.168.50.6` `192.168.50.2` | `192.168.50.1` |

## :material-folder-open: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path | File System | Encryption | 
| :---------- | :--------- | :------------- | :---------- | :---------- | :--------- |
| `/`, `/home` | NVMe SSD | 929 GB | `/dev/dm-0` | `btrfs` | LUKS2 |
| `/mnt/1TB_HDD` | SATA HDD | 1 TB | `/dev/mapper/1TB_HDD_crypt` | `btrfs` | LUKS2 |

#### :material-usb: External/Attached:

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
| *Active* | :simple-kalilinux:&nbsp;[Kali Linux](https://kali.org) | Virtual Network *(NAT)* | `kali-linux-2025.4-qemu-amd64.qcow2` | Network security and penetration testing tools. | 
| *Active* | :material-microsoft:&nbsp;[Windows 11](https://microsoft.com/windows) | Virtual Network *(NAT)* | `Windows_11.qcow2` | Windows environment to run Windows software that won't run with WINE. |

#### :simple-linux: Native Linux:

| Status | Service | Port(s) | Role / Notes |
| :----: | :------ | :-----: | :----------- |
| *Active* | :material-remote-desktop:&nbsp;[RDP (Remote Desktop Protocol)](../03_Services/RDP.md) | `3389` | Remote desktop protocol for accessing the desktop over the local network. |

---
## :material-tools: Maintenance & Notes

> [!NOTE]+ Critical Configurations
> 1. **:material-clock-outline: Chrony:** 
>     + Time synchronizes with local time server running on main router, [[ASUS_RT-BE92U|ASUS RT-BE92U]], using `chrony`.
> 
> 2. **:material-cloud-upload-outline: Backup:** 
>     + Home directory backed up every weekday at `18:00` using custom `rsync` script, `home-bkp-nas.sh`. The script is triggered by `systemd` user timer, `home-bkp-nas.timer` which starts `home-bkp-nas.service`. The timer is persistent, so if the PC is asleep at the backup time the backup will start the next time the PC wakes up.
> 
> 3. **:material-lock-open: LUKS Unlocking:** 
>     + The LUKS encrypted boot drive is configured to use the onboard `TPM2` chip for drive encryption. Kernel and firmware upgrades require clearing the registered PCRs and enrolling the new ones. This can be done with a custom script I wrote, `update-pcrs`, which is located in the `/usr/local/bin` directory.
> 
>     + The proper command format is: 
>         ```bash linenums="1"
>         sudo update-pcrs /dev/nvme0n1p3
>         ```
>     + More information about the configuration process can be found at: [[Unlock_LUKS_TPM2|Unlock LUKS w/ TPM2]]

#### :material-update: Update Process:

* `sudo dnf upgrade -y --offline` 
* `sudo dnf offline reboot`
* `flatpak update`

#### :material-cloud-upload-outline: Backup Policy:

 * `/home` directory backed up every weekday at `18:00` to [[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]

#### :material-backup-restore: Backup Script Config
1. Place `home-bkp-nas.sh` in the `~/.local/bin` directory.

```bash title="home-bkp-nas.sh" linenums="1"
#!/bin/bash

# Backup the /home/ directory to the ZimaOS NAS
# GOAL: Pure data backup (No symlinks, no ownership retention)
# Exclusions defined in: /home/bhaube/.bkp-exclude-nas

# --- Configuration ---
SOURCE_DIR="$HOME/"
DEST_DIR="/mnt/storage_server/Quick_Storage/Backup/bens-workstation/"
MOUNT_POINT="/mnt/storage_server/Quick_Storage"
EXCLUDE_FILE="$HOME/.bkp-exclude-nas"
LOG_FILE="$HOME/.var/log/backup_log.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# --- Environment Validation ---
# Ensure log rotation is configured to prevent infinite log growth
LOGROTATE_CONF="/etc/logrotate.d/home-backup"
if [ ! -f "$LOGROTATE_CONF" ]; then
    echo "[$TIMESTAMP] WARNING: Logrotate config not found at $LOGROTATE_CONF." | tee -a "$LOG_FILE"
    echo "[$TIMESTAMP] Logs will grow indefinitely until this is fixed." | tee -a "$LOG_FILE"
fi

# --- Safety Check: Trigger Automount & Verify ---
# Access the mount point to wake up systemd automount
ls "$MOUNT_POINT" > /dev/null 2>&1

# Check if it is actually a mount point
if ! mountpoint -q "$MOUNT_POINT"; then
    echo "[$TIMESTAMP] CRITICAL: NAS is not mounted at $MOUNT_POINT. Backup aborted." | tee -a "$LOG_FILE"
    exit 1
fi

# Ensure the sub-directory exists on the NAS
mkdir -p "$DEST_DIR"

# Print status to terminal & log
echo "[$TIMESTAMP] Starting home directory backup..." | tee -a "$LOG_FILE"

# --- The Rsync Command ---
# -av: Archive mode + increase verbosity
# --progress: Show progress during transfer
# --timeout=60: Sets IO timeout to 60s
# --delete: Remove files on NAS that were deleted from Source
rsync -av --progress --timeout=60 --delete --exclude-from="$EXCLUDE_FILE" "$SOURCE_DIR" "$DEST_DIR" >> "$LOG_FILE" 2>&1

# Capture the exit code immediately
EXIT_CODE=$?

# Update the TIMESTAMP variable
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Report Status based on captured code
if [ $EXIT_CODE -eq 0 ]; then
    MSG="[$TIMESTAMP] Backup completed successfully."
else
    MSG="[$TIMESTAMP] Backup **FAILED** with exit code $EXIT_CODE."
fi

# Print to terminal and append to log
echo "$MSG"
echo "$MSG" >> "$LOG_FILE"
```

2. Place `.bkp-exclude-nas` in the `~/` directory. 

```ini title=".bkp-exclude-nas" linenums="1"
# Common system/temp/cache directories
.cache/
.local/
.thumbnails/
*/.DS_Store
lost+found

# Application-specific caches
.android/
.antigravity/
.cargo/
.conda/
.docker/
.gemini/
.gitlab/
.gradle/
.Heaven/
.icons/
.java/
.kde/
.lmstudio/
.mcop/
.net/
.npm/
.ollama/
.pki/
.putty/
.qt/
.redhat/
.skiko/
.starship/
.steam/
.Superposition/
.themes/
.var/
.vscode-oss/
.vscode/
node_modules/

# Virtualization & Containers
.docker/volumes/
.vagrant.d/
*.qcow2
*.vdi
*.vmdk

# Cybersecurity & Development
.msf4/history/
.msf4/logs/
.terraform/ 
**/__pycache__/
**/target/

# Linux system noise
.dbus/
.gvfs/
.xsession-errors
**/.Trash-*/

# DIY & 3D-printing
**/_cache/
**/temp_gcode/

# Others
.admin-smbcredentials
.bitwarden-ssh-agent.sock
.gitconfig
.gtkrc-2.0
.lmstudio-home-pointer
.packettracer
.pwsafe.dat
.python_history
.rnd
.smbcredentials
.steampath
.trash
.viminfo
.wget-hsts
Android/
Desktop/
Downloads/
Encrypted-Documents/
Google-Drive/
Music/
Public/
Syncthing/
Templates/
Vaults/
```

3. Run the command `mkdir -p ~/.var/log` to create the log directory. 
4. Run the command `touch ~/.var/log/backup_log.log` to create the empty log file. 
5. Place `home-backup` in the `/etc/logrotate.d/` directory.

```ini title="/etc/logrotate.d/home-backup" linenums="1"
/home/bhaube/.var/log/backup_log.log {
    weekly
    rotate 4
    compress
    delaycompress
    missingok
    notifempty
    copytruncate
}
```

6. Place `home-bkp-nas.timer` and `home-bkp-nas.service` in the `~/.config/systemd/user/` directory.

```systemd title="home-bkp-nas.timer" linenums="1"
[Unit]
Description=Run NAS Backup Weekdays at 6PM

[Timer]
# Mon-Fri at 18:00 (6 PM)
OnCalendar=Mon..Fri 18:00:00
# If the computer is off/asleep at 6pm, run immediately when it wakes up
Persistent=true
# Randomize delay by 5 mins to prevent exact-second spikes (optional but good practice)
RandomizedDelaySec=5m

[Install]
WantedBy=timers.target
```

```systemd title="home-bkp-nas.service" linenums="1"
[Unit]
Description=Daily NAS Backup for Home Directory
# Verify network is up before starting (checks the system mount)
ConditionPathIsMountPoint=/mnt/storage_server/Quick_Storage

[Service]
Type=oneshot
# Adjust this path if you saved the script somewhere else
ExecStart=/home/bhaube/.local/bin/home-bkp-nas.sh
# Nice behavior: runs with lower CPU/IO priority so it doesn't slow down your PC
Nice=19
IOSchedulingClass=idle

[Install]
WantedBy=default.target
```

7. Run the command `systemctl --user daemon-reload`
8. Run the command `systemctl --user enable home-bkp-nas.timer`

#### :material-folder-network: Systemd Files for ZimaOS NAS Mounts (NFS)

```systemd title="mnt-storage_server-NVMe.mount" linenums="1"
[Unit]  
Description=Mount ZimaOS Quick-Storage  
After=network-online.target  
Wants=network-online.target  
  
[Mount]  
# The remote share  
What=192.168.50.4:/media/nvme0n1p1  
# The local path  
Where=/mnt/storage_server/NVMe  
Type=nfs  
# Standard NFS options for performance  
Options=defaults,noatime,nodiratime,rsize=1048576,wsize=1048576,timeo=14,soft  
  
[Install]  
WantedBy=multi-user.target
```

```systemd title="mnt-storage_server-NVMe.automount" linenums="1"
[Unit]  
Description=Automount for ZimaOS Quick-Storage  
  
[Automount]  
Where=/mnt/storage_server/NVMe  
# Unmount if idle for 10 minutes (optional, saves resources)  
TimeoutIdleSec=600  
  
[Install]  
WantedBy=multi-user.target
```

```systemd title="mnt-storage_server-Quick_Storage.mount" linenums="1"
[Unit]  
Description=Mount ZimaOS Quick-Storage via NFS  
After=network-online.target  
Wants=network-online.target  
  
[Mount]  
# The remote share  
What=192.168.50.4:/media/Quick-Storage  
# The local path  
Where=/mnt/storage_server/Quick_Storage  
Type=nfs  
# Standard NFS options for performance  
Options=defaults,noatime,nodiratime,rsize=1048576,wsize=1048576,timeo=14,soft  
  
[Install]  
WantedBy=multi-user.target
```

```systemd title="mnt-storage_server-Quick_Storage.automount" linenums="1"
[Unit]  
Description=Automount for ZimaOS NAS Quick-Storage  
  
[Automount]  
Where=/mnt/storage_server/Quick_Storage  
# Unmount if idle for 10 minutes (optional, saves resources)  
TimeoutIdleSec=600  
  
[Install]  
WantedBy=multi-user.target
```

#### :material-folder-lock: Encrypted-Documents Config
1. Open `kdewallet`, create a folder named `Passwords`, create an entry called `gocryptfspass`, and type in the password.
2. Place the `.desktop` file in the `~/.config/autostart` directory. 

```toml title="mount-gocryptfs.desktop" linenums="1"
[Desktop Entry]
Exec=gocryptfs --extpass="kwallet-query -f Passwords -r gocryptfspass kdewallet" ~/.cipher ~/Encrypted-Documents
Name=mountgocryptfs
Icon=plasmavault
Type=Application
```

#### :material-google-drive: Rclone Google Drive Config
1. Place the`rclone.conf` file in the `~/.config/rclone` directory.

```toml title="rclone.conf" linenums="1"
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

```toml title="mount-rclone.desktop" linenums="1"
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
