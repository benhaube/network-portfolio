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
--8<-- "install-helper-script.sh"
```

1. Enter the following command to download the Creality-Helper-Script to the `/usr/data/helper-script` directory.
2. Enter this command to run the Creality Helper Script.
3. If you encounter an issue to clone Helper Script repository, enter this command before cloning.

#### :material-file-cog: Config File:

```ini title="moonraker.cfg" linenums="1"
--8<-- "moonraker.cfg"
```

1. Remove `#` after this line to keep Creality Helper Script up to date.
2. Remove `#` after this line to enable camera configuration with Moonraker and replace `xxx.xxx.xxx.xxx` by your IP addresses.
3. Remove `#` after this line if you use Timelapse function and replace port `4408` by `4409` in snapshoturl if you use Mainsail.
4. Remove `#` after this line if you use Fluidd.
5. Remove `#` after this line if you use Mainsail.
6. Remove `#` after this line if you use Mobileraker Companion.
7. URL to the Spoolman instance. This parameter must be provided.
8. The interval, in seconds, between sync requests with the Spoolman server. The default is 5.
