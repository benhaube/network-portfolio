---
tags:
  - active
  - service
  - software
  - 3D-printer
  - remote-access
hide:
  - toc
---
![[printer-3d.svg|150]] ![[printer-3d-nozzle.svg|150]]

# [[Moonraker]]
[GitHub :material-github:](https://github.com/Arksine/moonraker){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://moonraker.readthedocs.io/en/latest/){ .md-button }

---
## Overview
* **Purpose:** An API that allows applications to communicate with the 3D-printing firmware, [Klipper](https://www.klipper3d.org/). 
* **Port(s):** `7125`
* **URL / Access:** 
    * <http://k1c-a71e.internal:7125>
    * <http://192.168.50.153:7125>
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): "Fluidd @ K1C-A71E"

## Deployment Details
* **Host Device:** &nbsp;:devices-creality:&nbsp;[[Kacey_3D-printer|Kacey 3D-Printer]]
* **Method:** &nbsp;:simple-linux:&nbsp;Native Install
* **Container Name:** `N/A`
* **Image:** `N/A`

### Configuration

```bash title="Setup Creality Helper Script" linenums="1"
# Enter the following command to download the Creality-Helper-Script to the `/usr/data/helper-script` directory.
git clone --depth 1 https://github.com/Guilouz/Creality-Helper-Script.git /usr/data/helper-script

# Then enter the following command to run the helper-script:
sh /usr/data/helper-script/helper.sh

# If you encounter an issue to clone Helper Script repository, enter this command before cloning:
git config --global http.sslVerify false
```

```toml title="moonraker.cfg" linenums="1"
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

# Remove '#' after this line to keep Creality Helper Script up to date
[update_manager Creality-Helper-Script]
type: git_repo
channel: dev
path: /usr/data/helper-script
origin: https://github.com/Guilouz/Creality-Helper-Script.git
primary_branch: main
managed_services: klipper

# Remove '#' after this line to enable camera configuration with Moonraker and replace 'xxx.xxx.xxx.xxx' by your IP addresses
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

# Remove '#' after this line if you use Timelapse function and replace port '4408' by '4409' in snapshoturl if you use Mainsail
[timelapse]
output_path: /usr/data/printer_data/timelapse/
frame_path: /usr/data/printer_data/frames/
ffmpeg_binary_path: /opt/bin/ffmpeg
snapshoturl: http://localhost:8080/?action=snapshot

# Remove '#' after this line if you use Fluidd
[update_manager fluidd]
type: web
channel: beta
repo: fluidd-core/fluidd
path: /usr/data/fluidd

# Remove '#' after this line if you use Mainsail
#[update_manager mainsail]
#type: web
#channel: beta
#repo: mainsail-crew/mainsail
#path: /usr/data/mainsail

# Remove '#' after this line if you use Mobileraker Companion
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
server: http://192.168.50.4:7912
#   URL to the Spoolman instance. This parameter must be provided.
sync_rate: 5
#   The interval, in seconds, between sync requests with the
#   Spoolman server.  The default is 5.

[include octoeverywhere-system.cfg]
```
