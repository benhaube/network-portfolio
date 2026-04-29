---
icon: services/klipper
tags:
  - Active
  - Service
  - Software
  - 3D-Printer
  - Remote Access
  - Native
hide:
  - toc
---
![Klipper logo](../assets/icons/klipper.svg){ width=250 }

# Moonraker
[GitHub :material-github:](https://github.com/Arksine/moonraker){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://moonraker.readthedocs.io/en/latest/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description:  
+ An API that allows applications to communicate with the 3D-printing firmware, [Klipper](https://www.klipper3d.org/). 

#### :symbols-settings-ethernet: Port(s):
+ `7125`

#### :material-link-variant: URL / Access:  
+ <http://k1c-a71e.internal:7125>
+ <http://192.168.50.153:7125>

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "Fluidd @ K1C-A71E"

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-printer-3d-nozzle:&nbsp;[Kacey (Creality^&copy;^ K1C) 3D-Printer](../02_Hardware/Kacey_3D-printer.md) | :material-linux:&nbsp;Native Liux | `N/A` | `N/A` |

### :material-cog: Configuration

#### :symbols-install-desktop: Install:

```bash title="Setup Creality Helper Script" linenums="1"
git clone --depth 1 https://github.com/Guilouz/Creality-Helper-Script.git /usr/data/helper-script  # (1)!
sh /usr/data/helper-script/helper.sh  # (2)!
 
git config --global http.sslVerify false  # (3)!
```

1. Enter the following command to download the Creality-Helper-Script to the `/usr/data/helper-script` directory.
2. Enter this command to run the Creality Helper Script.
3. If you encounter an issue to clone Helper Script repository, enter this command before cloning.

#### :material-file-cog: Config File:

```ini title="moonraker.cfg" linenums="1"
[server]
host: 0.0.0.0
port: 7125
klippy_uds_address: /tmp/klippy_uds
max_upload_size: 2048

[file_manager]
queue_gcode_uploads: False
enable_object_processing: True

[database]

[data_store]
temperature_store_size: 600
gcode_store_size: 1000

[machine]
provider: supervisord_cli
validate_service: False
validate_config: True

[authorization]
force_logins: False
cors_domains:
  *.internal
  *.lan
  *.local
  *://localhost
  *://localhost:*
  *://my.mainsail.xyz
  *://app.fluidd.xyz

trusted_clients:
  127.0.0.0/8

[octoprint_compat]

[history]

[update_manager]
enable_auto_refresh: True
refresh_interval: 24
enable_system_updates: False

# (1)!
[update_manager Creality-Helper-Script]
type: git_repo
channel: dev
path: /usr/data/helper-script
origin: https://github.com/Guilouz/Creality-Helper-Script.git
primary_branch: main
managed_services: klipper

# (2)!
# [webcam Camera]
# location: printer
# enabled: True
# service: mjpegstreamer
# target_fps: 15
# target_fps_idle: 5
# stream_url: http://192.168.50.153:8080/?action=stream
# snapshot_url: http://192.168.50.153:8080/?action=snapshot
# flip_horizontal: False
# flip_vertical: False
# rotation: 0
#aspect_ratio: 4:3

# (3)!
[timelapse]
output_path: /usr/data/printer_data/timelapse/
frame_path: /usr/data/printer_data/frames/
ffmpeg_binary_path: /opt/bin/ffmpeg
snapshoturl: http://localhost:8080/?action=snapshot

# (4)!
[update_manager fluidd]
type: web
channel: beta
repo: fluidd-core/fluidd
path: /usr/data/fluidd

# (5)!
#[update_manager mainsail]
#type: web
#channel: beta
#repo: mainsail-crew/mainsail
#path: /usr/data/mainsail

# (6)!
[update_manager mobileraker]
type: git_repo
path: /usr/data/mobileraker_companion
origin: https://github.com/Clon1998/mobileraker_companion.git
virtualenv: /usr/data/mobileraker-env
primary_branch:main
requirements: scripts/mobileraker-requirements.txt
install_script: scripts/install.sh
managed_services: mobileraker

[spoolman]
server: http://192.168.50.4:7912  # (7)!
sync_rate: 5  # (8)!

[include octoeverywhere-system.cfg]
```

1. Remove `#` after this line to keep Creality Helper Script up to date.
2. Remove `#` after this line to enable camera configuration with Moonraker and replace `xxx.xxx.xxx.xxx` by your IP addresses.
3. Remove `#` after this line if you use Timelapse function and replace port `4408` by `4409` in snapshoturl if you use Mainsail.
4. Remove `#` after this line if you use Fluidd.
5. Remove `#` after this line if you use Mainsail.
6. Remove `#` after this line if you use Mobileraker Companion.
7. URL to the Spoolman instance. This parameter must be provided.
8. The interval, in seconds, between sync requests with the Spoolman server. The default is 5.
