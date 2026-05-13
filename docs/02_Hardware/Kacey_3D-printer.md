---
icon: material/printer-3d-nozzle
title: Kacey 3D-Printer
subtitle: Modified Creality K1C
tags:
  - Hardware
  - Network
  - Server
  - 3D-Printer
  - Office
  - Linux
hide:
  - toc
---
![Material Design printer-3d-nozzle icon](../assets/icons/printer-3d-nozzle.svg){ width=200 }![Creality Logo](../assets/icons/creality.svg){ width=50 }

# Kacey 3D-Printer
*Modified Creality^&copy;^ K1C*

[Creality Docs :devices-creality:](https://wiki.creality.com/en/k1-flagship-series){ .md-button .md-button--primary }&emsp;[Creality Helper Script :material-console:](https://guilouz.github.io/Creality-Helper-Script-Wiki/){ .md-button }

---
## :material-information-outline: Device Overview

> [!links inline end]+ More K1C Info
> See more detailed information about the Creality^&copy;^ K1C hardware:
>
> [More Kacey Info :devices-creality:](Kacey_Info.md){ .md-button }

#### :material-toolbox: Role: 
+ 3D-Printer

#### :symbols-host: Hostname(s):
+ `k1c-a71e`

#### :material-map-marker-outline: Location:  
+ Office

#### :material-memory: OS / Firmware: 
+ [:devices-creality:&nbsp;Creality^&copy;^ FW Version: 1.3.3.46](https://www.creality.com/download/k1c-carbon-3d-printer)
+ [:material-linux:&nbsp;Buildroot 2020.02.1](https://buildroot.org/)
+ [:services-klipper:&nbsp;Klipper 0.13.0](https://www.klipper3d.org/Releases.html#klipper-0130)

#### :material-key-chain: Credentials:
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Fluidd (Creality K1C)" 
    + SSH Keys&ensp;:material-arrow-right-thin:&ensp;"root@k1c-a71e"

## :material-lan: Network Configuration

| Interface | IP Address       | MAC Address         | Connected To                         |
| :-------: | :--------------- | :------------------ | :----------------------------------- |
|  `wlan0`  | `192.168.50.153` | `FC:EE:28:09:A7:1E` | :material-wifi:&nbsp;Home *(VLAN50)* |

| Interface |              VLAN               | FQDN                | DNS Servers                    | Gateway        |
| :-------: | :-----------------------------: | :------------------ | :----------------------------- | :------------- |
|  `wlan0`  | :material-security:&nbsp;VLAN50 | `k1c-a71e.internal` | `192.168.50.6`, `192.168.50.2` | `192.168.50.1` |

## :symbols-storage: Storage & Mounts

#### :material-harddisk: Internal Drive(s):

| Mount Point | Drive Type | Drive Capacity | Device Path       | File System | Encryption |
| :---------- | :--------- | :------------- | :---------------- | :---------- | :--------- |
| `/usr/data` | eMMC       | 6.5 GB         | `/dev/mmcblk0p10` | `ext4`      | -          |
| `/overlay`  | eMMC       | 96.8 MB        | `/dev/mmcblk0p9`  | `ext4`      | -          |
| `/rom`      | ROM        | 126.8 MB       | `/dev/root`       | `squashfs`  | -          |

#### :material-usb: External / Attached:

| Mount Point       | Drive Type      | Drive Capacity | Device Path | File System | Encryption |
| :---------------- | :-------------- | :------------- | :---------- | :---------- | :--------- |
| `/tmp/udisk/sda1` | USB Flash Drive | 14.5 GB        | `/dev/sda1` | `vfat`      | -          |

## :material-web: Services / Docker Containers

#### :material-linux: Native Linux:

|  Status  | Service                                                          |   Port(s)   | Role / Notes                                                                                   |
| :------: | :--------------------------------------------------------------- | :---------: | :--------------------------------------------------------------------------------------------- |
| *Active* | :services-fluidd:&nbsp;[Fluidd](../03_Services/Fluidd.md)        | `80` `4408` | A free and open-source Klipper web interface for managing your 3D-printer.                     |
| *Active* | :services-klipper:&nbsp;[Moonraker](../03_Services/Moonraker.md) |   `7125`    | Web API server for [Klipper](https://www.klipper3d.org/).                                      |
| *Active* | :material-console-network:&nbsp;[SSH](../03_Services/SSH.md)     |    `22`     | Provides secure encrypted communications between two untrusted hosts over an insecure network. |

---
## :material-tools: Maintenance & Notes

> [!config]+ Modifications
> **:material-chip: Firmware:**
> + The standard firmware from Creality is heavily modified with the [Creality Helper Script](https://guilouz.github.io/Creality-Helper-Script-Wiki/).  See [documentation](https://guilouz.github.io/Creality-Helper-Script-Wiki/) for configuration issues.
> 
> **:material-application-brackets: Software:**
> 
> + :services-fluidd: Fluidd / Moonraker
>     + For information regarding the [Fluidd](../03_Services/Fluidd.md) Web UI see the [documentation](https://guilouz.github.io/Creality-Helper-Script-Wiki/configurations/access-to-web-interface/).
>     + Moonraker is an API that allows Fluidd to communicate with Klipper. See Moonraker [documentation](https://moonraker.readthedocs.io/en/latest/).
> + :services-klipper: Klipper
>     + For information regarding Klipper configuration see the [documentation](https://www.klipper3d.org/).
> 
> **:material-printer-3d-nozzle: Hardware:**
> 
> + [:material-cog:&nbsp;Bed Leveling Knobs](../3D_Printing/K1_Bed_Level_Knobs_Tutorial.md)
>     + Changes from a fixed bed to an adjustable bed with aluminum knobs. 
> + [:devices-prowiper:&nbsp;PROWIPER^&copy;^ Mod](../3D_Printing/PROWIPER_Mod.md)
>     + Replaces the standard nozzle wiping brush at the back of the build plate.
> 
> **:material-code-block-tags: Custom G-Code Macros:**
> 
> + [:devices-toothbrush-nozzle:&nbsp;Manual Nozzle Cleaning Macro](../3D_Printing/Manual_Nozzle_Cleaning_Gcode_Macro.md)
>     + This custom macro set *(`CLEAN_NOZZLE`, `DONE_CLEANING`, and `DONE_CLEANING_COOL`)* creates an interactive, semi-automated workflow for manual nozzle maintenance.

#### :material-update: Update Process:

* Update most software through the [Fluidd](http://k1c-a71e.internal) Web UI.
* Update Entware packages in terminal via [SSH](../03_Services/SSH.md) 

#### :material-cloud-upload-outline: Backup Policy:

* Configuration files are backed up automatically to a private [GitHub](https://github.com/benhaube/creality-K1C-klipper-backup) repository. 
