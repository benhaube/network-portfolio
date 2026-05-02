---
icon: devices/creality
title: More Kacey Info
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
![Material Design printer-3d-nozzle icon](../assets/icons/printer-3d.svg){ width=200 }![Creality Logo](../assets/icons/creality.svg){ width=50 }

# More Kacey Info
[Creality Docs :devices-creality:](https://wiki.creality.com/en/k1-flagship-series){ .md-button .md-button--primary }&emsp;[Creality Helper Script :material-console:](https://guilouz.github.io/Creality-Helper-Script-Wiki/){ .md-button }

---
## :material-information-outline: Basic Information

#### :symbols-description: Model: 
+ Creality^&copy;^ K1C

#### :material-cube-outline: Build Volume: 
+ `220x220x250`

#### :symbols-commit: Revision:
+ v2.0.5    

#### :material-calendar: Create Date: 
+ 2023/09/05

#### :symbols-memory-alt: Printer MCU:

+ **Nozzle**
    + *Chip:* GD32F303CBT6
    + *Version:* CR-K1-MAX-NOZZLE-V1.2.0
+ **Leveling**
    + *Chip:* GD32E230F8P6
    + *Version:* CR-K1-MAX-LEVELING-V1.1.0
+ **Main**
    + *Chip:* GD32F303RET6
    + *Version:* CR4CU220812S12

## :material-lan: Network

#### Moonraker:

+ :material-link-variant:&nbsp;URL: <http://k1c-a71e.internal:7125>
+ :material-key-chain:&nbsp;API Key: 
    + [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
        + Local Network&ensp;:material-arrow-right-thin:&ensp;"Fluidd @ K1C-A71E" 

#### Fluidd:

+ :material-link-variant:&nbsp;URL:
    + <http://k1c-a71e.internal>
    + <http://k1c-a71e.internal:4408>

## :material-camera: Camera

#### Moonraker:

+ :material-link-variant:&nbsp;Snapshot URL:
    + <http://k1c-a71e.internal:8080/?action=snapshot>
    + <http://localhost:8080/?action=snapshot>
    + <http://127.0.0.1:8080/?action=snapshot>

#### Fluidd:

+ :material-link-variant:&nbsp;Snapshot URL: <http://k1c-a71e.internal:8080/?action=snapshot>
+ :material-link-variant:&nbsp;Stream URL: <http://k1c-a71e.internal/webcam/?action=stream>

---
## :material-code-block-brackets: Machine G-code 

#### :services-orca-slicer: OrcaSlicer:

```gcode title="Machine Start" linenums="1"
SET_PRINT_STATS_INFO TOTAL_LAYER=[total_layer_count]
M140 S0
M104 S0 
START_PRINT EXTRUDER_TEMP=[nozzle_temperature_initial_layer] BED_TEMP=[bed_temperature_initial_layer_single] MATERIAL=[filament_type]
```

```gcode title="Machine End" linenums="1"
END_PRINT
```

```gcode title="Before Layer Change" linenums="1"
;BEFORE_LAYER_CHANGE
;[layer_z]
G92 E0
```

```gcode title="Layer Change" linenums="1"
SET_PRINT_STATS_INFO CURRENT_LAYER={layer_num + 1}
;AFTER_LAYER_CHANGE
;[layer_z]
```

```gcode title="Timelapse" linenums="1"
TIMELAPSE_TAKE_FRAME
```

```gcode title="Change Filament" linenums="1"
M600
```

```gcode title="Pause" linenums="1"
M600
```

## :services-klipper: Klipper Configuration Files

```cfg title="printer.cfg" linenums="1"
--8<-- "printer.cfg"
```

```cfg title="printer_params.cfg" linenums="1"
--8<-- "printer_params.cfg"
```

```cfg title="moonraker.conf" linenums="1"
--8<-- "moonraker.conf"
```

```cfg title="octoeverywhere-system.cfg" linenums="1"
--8<-- "octoeverywhere-system.cfg"
```

```gcode title="M600-custom.cfg" linenums="1"
--8<-- "M600-custom.cfg"
```

```gcode title="sesorless.cfg" linenums="1"
--8<-- "sensorless.cfg"
```

```gcode title="spoolman.cfg" linenums="1"
--8<-- "spoolman.cfg"
```

```gcode title="gcode-macros.cfg" linenums="1"
--8<-- "gcode-macros.cfg"
```