---
icon: material/printer-3d
title: More Kacey (Creality K1C) Info
tags:
  - hardware
  - network
  - server
  - 3D-printer
  - office
hide:
  - toc
---
![Creality Logo](../assets/icons/creality.svg){ width=200 }

# More Kacey (Creality^&copy;^ K1C) Info
[Creality Docs :material-file-document-multiple:](https://wiki.creality.com/en/k1-flagship-series){ .md-button .md-button--primary }&emsp;[Creality Helper Script :octicons-terminal-16:](https://guilouz.github.io/Creality-Helper-Script-Wiki/){ .md-button }

---
## :material-information-outline: Basic Information

+ **Model:** 
  + Creality^&copy;^ K1C
+ **Build Volume:** 
  + `220x220x250`
+ **Version:**
  + v2.0.5    
+ **Create Date:** 
  + 2023/09/05
+ **Nozzle MCU:** 
  + *Chip:* GD32F303CBT6
  + *Version:* CR-K1-MAX-NOZZLE-V1.2.0    
+ **Leveling MCU:** 
  + *Chip:* GD32E230F8P6
  + *Version:* CR-K1-MAX-LEVELING-V1.1.0
+ **MCU:** 
  + *Chip:* GD32F303RET6
  + *Version:* CR4CU220812S12

## :material-lan: Network

#### :material-printer-3d: Moonraker:

+ **URL**
    + <http://k1c-a71e.internal:7125>
+ **API Key**
    + Check [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "Fluidd" 

#### :services-fluidd: Fluidd:

+ **URL**
    + <http://k1c-a71e.internal>
    + <http://k1c-a71e.internal:4408>

## :material-camera: Camera

#### :material-printer-3d: Moonraker:

+ **Snapshot URL**
    + <http://k1c-a71e.internal:8080/?action=snapshot>
    + <http://localhost:8080/?action=snapshot>
    + <http://127.0.0.1:8080/?action=snapshot>

#### :services-fluidd: Fluidd:

+ **Snapshot URL**
    + <http://k1c-a71e.internal:8080/?action=snapshot>
+ **Stream URL**
    + <http://k1c-a71e.internal/webcam/?action=stream>

---
## :material-code-block-brackets: Machine G-code 

**:services-orca-slicer:&nbsp;OrcaSlicer**

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
