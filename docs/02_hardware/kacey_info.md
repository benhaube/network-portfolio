---
icon: symbols/printer-3d-nozzle
title: More Kacey Info
subtitle: Detailed Configuration Info
description: The Creality K1C 3D-printer located in the office upstairs, and connected to the LAN through 2.4 GHz Wi-Fi. Affectionately, named 'Kacey' as a play on the model name, K1C.
tags:
  - 3D-Printer
  - Hardware
  - Linux
  - Network
  - Office
  - Server
hide:
  - toc
---

![Custom 3D-printer nozzle icon using Lucide design guidelines](../assets/icons/printer-3d-nozzle.svg){ width=200 }

# More Kacey Info

_Detailed Configuration Info_

[Creality Docs&ensp;:brands-creality-v2:](https://wiki.creality.com/en/k1-flagship-series){ .md-button .md-button--primary }&emsp;[Helper Script&ensp;:symbols-file-terminal:](https://guilouz.github.io/Creality-Helper-Script-Wiki/){ .md-button .md-button--primary }&emsp;[OrcaSlicer&ensp;:services-orca-slicer:](https://www.orcaslicer.com/){ .md-button .md-button--primary }

---

![Creality K1C — 3D printer](../assets/images/creality-k1c-3d-printer.png){ width=400 align=right .no-shadow }

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

##### Nozzle

- _Chip:_ `GD32F303CBT6`
{ .no-bullets }
- _Version:_ `CR-K1-MAX-NOZZLE-V1.2.0`
{ .no-bullets }

##### Leveling

- _Chip:_ `GD32E230F8P6`
{ .no-bullets }
- _Version:_ `CR-K1-MAX-LEVELING-V1.1.0`
{ .no-bullets }

##### Main

- _Chip:_ `GD32F303RET6`
{ .no-bullets }
- _Version:_ `CR4CU220812S12`
{ .no-bullets }

## :symbols-network:&ensp;Network

#### :symbols-api:&ensp;Moonraker

##### URL

:    <http://kacey.internal:7125>

##### API Key

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Fluidd (Creality K1C)"

#### :services-fluidd:&ensp;Fluidd

##### URL

- <http://kacey.internal>
{ .no-bullets }
- <http://kacey.internal:4408>
{ .no-bullets }

## :symbols-webcam:&ensp;Camera

#### :symbols-api:&ensp;Moonraker

##### Snapshot URL

- <http://kacey.internal:8080/?action=snapshot>
{ .no-bullets }
- <http://localhost:8080/?action=snapshot>
{ .no-bullets }
- <http://127.0.0.1:8080/?action=snapshot>
{ .no-bullets }

#### :services-fluidd:&ensp;Fluidd

##### Snapshot URL

- <http://kacey.internal:8080/?action=snapshot>
{ .no-bullets }

##### Stream URL

- <http://kacey.internal/webcam/?action=stream>
{ .no-bullets }

---

## :symbols-code-xml:&ensp;Machine G-code

#### :services-orca-slicer:&ensp;OrcaSlicer

``` gcode title="Machine Start" linenums="1"
SET_PRINT_STATS_INFO TOTAL_LAYER=[total_layer_count]
M140 S0
M104 S0 
START_PRINT EXTRUDER_TEMP=[nozzle_temperature_initial_layer] BED_TEMP=[bed_temperature_initial_layer_single] MATERIAL=[filament_type]
```

``` gcode title="Machine End" linenums="1"
END_PRINT
```

``` gcode title="Before Layer Change" linenums="1"
;BEFORE_LAYER_CHANGE
;[layer_z]
G92 E0
```

``` gcode title="Layer Change" linenums="1"
SET_PRINT_STATS_INFO CURRENT_LAYER={layer_num + 1}
;AFTER_LAYER_CHANGE
;[layer_z]
```

``` gcode title="Timelapse" linenums="1"
TIMELAPSE_TAKE_FRAME
```

``` gcode title="Change Filament" linenums="1"
M600
```

``` gcode title="Pause" linenums="1"
M600
```

#### :symbols-file-cog:&ensp;Klipper Configuration Files

``` cfg { .mono-title title="printer.cfg" linenums="1" }
--8<-- "printer.cfg"
```

``` cfg { .mono-title title="printer_params.cfg" linenums="1" }
--8<-- "printer_params.cfg"
```

``` cfg { .mono-title title="moonraker.conf" linenums="1" }
--8<-- "moonraker.conf"
```

``` cfg { .mono-title title="octoeverywhere-system.cfg" linenums="1" }
--8<-- "octoeverywhere-system.cfg"
```

``` cfg { .mono-title title="M600-custom.cfg" linenums="1" }
--8<-- "m600_custom.cfg"
```

``` cfg { .mono-title title="sensorless.cfg" linenums="1" }
--8<-- "sensorless.cfg"
```

``` cfg { .mono-title title="spoolman.cfg" linenums="1" }
--8<-- "spoolman.cfg"
```

``` cfg { .mono-title title="gcode-macros.cfg" linenums="1" }
--8<-- "gcode-macros.cfg"
```