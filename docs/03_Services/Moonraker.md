---
icon: services/klipper
title: Moonraker
subtitle: The Klipper Web API
description: Web API server for Klipper. 
tags:
  - Active
  - 3D-Printer
  - Remote Access
  - Native
  - Service
hide:
  - toc
---
![Klipper logo](../assets/icons/klipper-light.svg#only-light){ width=250 }
![Klipper logo](../assets/icons/klipper.svg#only-dark){ width=250 }

# Moonraker
*The Klipper Web API*

[GitHub&ensp;:simple-github:](https://github.com/Arksine/moonraker){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://moonraker.readthedocs.io/en/latest/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description  

:    Web API server for [Klipper](https://www.klipper3d.org/). 

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `7125`

#### :symbols-link:&ensp;URL / Access  

+ <http://kacey.internal:7125>
+ <http://192.168.50.153:7125>

#### :symbols-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Fluidd (Creality K1C)"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                      | Method                            | Container Name | Image |
| :------------------------------------------------------------------------------- | :-------------------------------- | :------------- | :---- |
| [:brands-creality-v2:&nbsp;Kacey 3D-Printer](../02_Hardware/Kacey_3D-printer.md) | :symbols-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

#### :symbols-install-desktop:&ensp;Install

```bash title="Setup Creality Helper Script" linenums="1"
--8<-- "install-helper-script.sh"
```

1. Enter the following command to download the Creality-Helper-Script to the `/usr/data/helper-script` directory.
2. Enter this command to run the Creality Helper Script.
3. If you encounter an issue to clone Helper Script repository, enter this command before cloning.

#### :symbols-file-config:&ensp;Config File

```ini {title="moonraker.cfg" linenums="1" .mono-title}
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
