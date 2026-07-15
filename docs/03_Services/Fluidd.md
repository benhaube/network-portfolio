---
icon: services/fluidd
title: Fluidd
subtitle: The Klipper UI
description: A free and open-source Klipper web interface for managing your 3D-printer.
tags:
  - Active
  - 3D-Printer
  - Native
  - Service
hide:
  - toc
---
![Fluidd Icon](../assets/icons/fluidd.svg){ width=200 }

# Fluidd
*The Klipper UI*

[GitHub&ensp;:brands-github:](https://github.com/fluidd-core/fluidd){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.fluidd.xyz/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A free and open-source Klipper web interface for managing your 3D-printer.

#### :symbols-settings-ethernet:&ensp;Port(s) 

:    `80`&emsp;`4408`

#### :symbols-link:&ensp;URL / Access

:    <http://kacey.internal>

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"Fluidd (Creality K1C)"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                                             | Method                              | Container Name | Image |
| :-------------------------------------------------------------------------------------- | :---------------------------------- | :------------- | :---- |
| [:symbols-printer-3d-nozzle:&nbsp;Kacey 3D-Printer](../02_Hardware/Kacey_3D-printer.md) | :symbols-penguin:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

#### :symbols-install-desktop:&ensp;Install

```bash title="Setup Creality Helper Script" linenums="1"
--8<-- "install-helper-script.sh"
```

1. Enter the following command to download the Creality-Helper-Script to the `/usr/data/helper-script` directory.
2. Enter this command to run the Creality Helper Script.
3. If you encounter an issue to clone Helper Script repository, enter this command before cloning.

#### :symbols-cloud-upload:&ensp;Config File Backup

```json {title="backup-fluidd.json" linenums="1" .wrap-code .mono-title}
--8<-- "fluidd.json"
```
