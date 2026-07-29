---
icon: symbols/api
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
![Custom 'api' icon made with the Lucide design guidelines](../assets/icons/api.svg){ width=200 }

# Moonraker
*The Klipper Web API*

[GitHub&ensp;:brands-github:](https://github.com/Arksine/moonraker){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://moonraker.readthedocs.io/en/latest/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description  

:    Web API server for [Klipper](https://www.klipper3d.org/){ external-link }. 

#### :symbols-hash:&ensp;Port(s)

:    `7125`

#### :symbols-link-2:&ensp;URL / Access   

:    <http://kacey.internal:7125>

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"Fluidd (Creality K1C)"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                                             | Method                          | Container Name | Image |
| :-------------------------------------------------------------------------------------- | :------------------------------ | :------------- | :---- |
| [:symbols-printer-3d-nozzle:&nbsp;Kacey 3D-Printer](../02_hardware/kacey_3d-printer.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

#### :symbols-install-desktop:&ensp;Install

```bash title="Setup Creality Helper Script" linenums="1"
--8<-- "install-helper-script.sh"
```

1. Enter the following command to download the Creality-Helper-Script to the `/usr/data/helper-script` directory.
2. Enter this command to run the Creality Helper Script.
3. If you encounter an issue to clone Helper Script repository, enter this command before cloning.

#### :symbols-file-cog:&ensp;Config File

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
