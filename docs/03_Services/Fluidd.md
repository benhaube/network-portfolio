---
icon: services/fluidd
title: Fluidd
subtitle: The Klipper UI
description: A free and open-source Klipper web interface for managing your 3D-printer.
tags:
  - Active
  - 3D-Printer
  - Native
hide:
  - toc
---
![Fluidd Icon](../assets/icons/fluidd.svg){ width=200 }

# Fluidd
*The Klipper UI*

[GitHub&ensp;:simple-github:](https://github.com/fluidd-core/fluidd){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://docs.fluidd.xyz/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-description:&ensp;Description

:    A free and open-source Klipper web interface for managing your 3D-printer.

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `80`
+ `4408`

#### :symbols-link:&ensp;URL / Access

+ <http://kacey.internal>
+ <http://192.168.50.153>
+ <http://kacey.internal:4408>
+ <http://192.168.50.153:4408>

#### :symbols-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Fluidd (Creality K1C)"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                      | Method                             | Container Name | Image |
| :------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| [:brands-creality-v2:&nbsp;Kacey 3D-Printer](../02_Hardware/Kacey_3D-printer.md) | :symbols-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

#### :symbols-install-desktop:&ensp;Install

```bash title="Setup Creality Helper Script" linenums="1"
--8<-- "install-helper-script.sh"
```

1. Enter the following command to download the Creality-Helper-Script to the `/usr/data/helper-script` directory.
2. Enter this command to run the Creality Helper Script.
3. If you encounter an issue to clone Helper Script repository, enter this command before cloning.

#### :symbols-backup:&ensp;Config File Backup

```json {title="backup-fluidd.json" linenums="1" .wrap-code .mono-title}
--8<-- "fluidd.json"
```
