---
icon: symbols/printer-3d-nozzle
title: More Kacey Info
subtitle: Detailed Configuration Info
description: The Creality K1C 3D-printer located in the office upstairs, and connected to the LAN through 2.4 GHz Wi-Fi. Affectionately, named 'Kacey' as a play on the model name, K1C.
tags:
  - Network
  - Server
  - 3D-Printer
  - Office
  - Linux
  - Hardware
hide:
  - toc
---
![Custom 3D-printer nozzle icon using Lucide design guidelines](../assets/icons/printer-3d-nozzle.svg){ width=200 }

# More Kacey Info
*Detailed Configuration Info*

[Creality Docs&ensp;:brands-creality-v2:](https://wiki.creality.com/en/k1-flagship-series){ .md-button .md-button--primary }&emsp;[Helper Script&ensp;:symbols-file-terminal:](https://guilouz.github.io/Creality-Helper-Script-Wiki/){ .md-button .md-button--primary }&emsp;[OrcaSlicer&ensp;:services-orca-slicer:](https://www.orcaslicer.com/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Basic Information

#### :symbols-hash:&ensp;Model 

:    Creality^&copy;^ K1C

#### :symbols-box:&ensp;Build Volume

:    `220x220x250`

#### :symbols-git-commit-vertical:&ensp;Revision

:    v2.0.5    

#### :symbols-calendar-1:&ensp;Create Date

:    2023/09/05

#### :symbols-circuit-board:&ensp;Printer MCU

:    Nozzle:
    
      + *Chip:* `GD32F303CBT6`
      + *Version:* `CR-K1-MAX-NOZZLE-V1.2.0`

:    Leveling:
    
      + *Chip:* `GD32E230F8P6`
      + *Version:* `CR-K1-MAX-LEVELING-V1.1.0`

:    Main:
    
      + *Chip:* `GD32F303RET6`
      + *Version:* `CR4CU220812S12`

## :symbols-network:&ensp;Network

#### Moonraker

:    URL: 
    
      + <http://kacey.internal:7125>

:    API Key: 
    
      + [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
          + Local Network&ensp;:symbols-move-right:&ensp;"Fluidd (Creality K1C)" 

#### Fluidd

:    URL:
    
      + <http://kacey.internal>
      + <http://kacey.internal:4408>

## :symbols-webcam:&ensp;Camera

#### Moonraker

:    Snapshot URL:
    
      + <http://kacey.internal:8080/?action=snapshot>
      + <http://localhost:8080/?action=snapshot>
      + <http://127.0.0.1:8080/?action=snapshot>

#### Fluidd

:    Snapshot URL:
    
      + <http://kacey.internal:8080/?action=snapshot>

:    Stream URL: 
    
      + <http://kacey.internal/webcam/?action=stream>

---
## :symbols-code-xml:&ensp;Machine G-code 

#### :services-orca-slicer:&ensp;OrcaSlicer

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

#### :symbols-file-cog:&ensp;Klipper Configuration Files

```cfg {title="printer.cfg" linenums="1" .mono-title}
--8<-- "printer.cfg"
```

```cfg {title="printer_params.cfg" linenums="1" .mono-title}
--8<-- "printer_params.cfg"
```

```cfg {title="moonraker.conf" linenums="1" .mono-title}
--8<-- "moonraker.conf"
```

```cfg {title="octoeverywhere-system.cfg" linenums="1" .mono-title}
--8<-- "octoeverywhere-system.cfg"
```

```cfg {title="M600-custom.cfg" linenums="1" .mono-title}
--8<-- "m600_custom.cfg"
```

```cfg {title="sensorless.cfg" linenums="1" .mono-title}
--8<-- "sensorless.cfg"
```

```cfg {title="spoolman.cfg" linenums="1" .mono-title}
--8<-- "spoolman.cfg"
```

```cfg {title="gcode-macros.cfg" linenums="1" .mono-title}
--8<-- "gcode-macros.cfg"
```