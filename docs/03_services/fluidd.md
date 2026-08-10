---
icon: services/fluidd
title: Fluidd
subtitle: The Klipper UI
description: A free and open-source Klipper web interface for managing your 3D-printer.
tags:
  - 3D-Printer
  - Active
  - Native
  - Service
hide:
  - toc
---

![Fluidd Icon](../assets/icons/fluidd.svg){ width=200 }

# Fluidd

_The Klipper UI_

[GitHub&ensp;:brands-github:](https://github.com/fluidd-core/fluidd){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.fluidd.xyz/){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A free and open-source Klipper web interface for managing your 3D-printer.

#### :symbols-hash:&ensp;Port(s) 

- `80` 
{ .no-bullets }
- `4408`
{ .no-bullets }

#### :symbols-link-2:&ensp;URL / Access 

:    <http://kacey.internal>

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Fluidd (Creality K1C)"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                                             | Method                          | Container Name | Image |
| :-------------------------------------------------------------------------------------- | :------------------------------ | :------------- | :---- |
| [:symbols-printer-3d-nozzle:&nbsp;Kacey 3D-Printer](../02_hardware/kacey_3d-printer.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

#### :symbols-monitor-arrow-down-corner:&ensp;Install

``` bash title="Setup Creality Helper Script" linenums="1"
--8<-- "install-helper-script.sh"
```

1. Enter the following command to download the Creality-Helper-Script to the `/usr/data/helper-script` directory.
2. Enter this command to run the Creality Helper Script.
3. If you encounter an issue to clone Helper Script repository, enter this command before cloning.

#### :symbols-cloud-upload:&ensp;Config File Backup

``` json { .wrap-code .mono-title title="backup-fluidd.json" linenums="1" }
--8<-- "fluidd.json"
```
