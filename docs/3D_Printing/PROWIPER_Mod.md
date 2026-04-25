---
icon: devices/prowiper
title: PROWIPER&copy; Mod
hide:
  - toc
---
![Custom PROWIPER^&copy;^ Mod Icon I made with Inkscape](../assets/icons/prowiper.svg){ width=400 }

# PROWIPER^&copy;^ Mod

> [!info] PROWIPER^&copy;^ Info
> [Creality^&copy;^ K1C :devices-creality:](../02_Hardware/Kacey_3D-printer.md){ .md-button .md-button--primary }
>
> **Modifications:** 
> 1. Upgraded bed leveling kit with aluminum spacers. 
> 2. PROWIPER^&copy;^ V5 Mount
> 
> **Hardware Required:**
> 1. Printed `v5-k1c-brush-mount-for-a1-brushes.stl` and `1mm-z-spacer-to-lift-the-wiper-mount.stl` *(in high-temp filament like ASA / ABS)*
>
>     [Printables :simple-printables:](https://printables.com/model/1023575-prowiper-for-creality-k1-series){ .md-button } 
>
> 2. **Bambu A1** Silicone Brushes
>
>     [Amazon :fontawesome-brands-amazon:](https://www.amazon.com/dp/B0DRBZK7RZ){ .md-button }
>
> 3. 2x **M3x16mm** self-tapping screws
>
>     [Amazon :fontawesome-brands-amazon:](https://www.amazon.com/dp/B0D9BBT81N){ .md-button }

---
## :material-file-document-edit: Phase 1: Configuration File Edits

> [!warning inline end] Important
> Before uploading the macro, modify `3DPHUB_PROWIPER.CFG` to account for the custom bed height and safe testing speeds.

#### Set the Mount Type: 
  + [ ] Ensure `variable_brush_mount` is set to `"V5K1C"`.
#### Adjust for the Bed Spacer:
  + [ ] Change `variable_spacer_height` to match the Z-height of the spacer being used. *(e.g., `4`)*
#### Tweak Testing Speeds:
  + [ ] Change `variable_speed` from the default `7500` to a safer `4000` or `5000`.
#### Disable Phantom Bed Fans:
  + [ ] Change `variable_bed_fans_installed` to `"FALSE"` *(unless a specific `bed_fans` pin is defined in your main printer config)*.
#### Verify Bottom Clearance:
  + [ ] Review `variable_bot_clearance` *(default `20`)* and `variable_drop_distance` *(default `15`)*. 

## :services-klipper: Phase 2: Klipper Integration

> [!note inline end] Integration Note
> The script automatically intercepts the stock `CX_NOZZLE_CLEAR` command, meaning standard print starts will natively utilize the new wiping sequence without further macro edits.

1. [ ] Establish an SSH connection to the printer and navigate to `/usr/data/printer_data/config`.
2. [ ] Upload the newly edited `3DPHUB_PROWIPER.CFG` into this directory.
3. [ ] Open `printer.cfg` and add the following line: `[include 3DPHUB_PROWIPER.cfg]`.
4. [ ] Save and restart Klipper. 

## :material-chip: Phase 3: Slicer & Firmware Clearances

> [!info inline end] Clearance Info 
> Because the **V5 mount** is utilized instead of the low-profile **LPF2 mount**, a 10mm clearance zone is required to prevent the toolhead from striking the mount during printing or probing.

#### :services-klipper: Klipper Mesh Clearance:
  + [ ] In `printer.cfg`, locate the `[bed_mesh]` section. Reduce the Y-axis value of `mesh_max` by 10 *(e.g., change `220` to `210`)*.
#### :services-orca-slicer: Slicer Clearance:
  + [ ] In the slicer's printer settings, change the **Excluded bed area** to: `70x210, 150x210, 150x220, 70x220`.

      ![Excluded Bed Area](../assets/screenshots/excluded-bed-area-light.png#only-light){ .on-glb }
      ![Excluded Bed Area](../assets/screenshots/excluded-bed-area-dark.png#only-dark){ .on-glb }

## :material-toggle-switch-outline: Phase 4: Dry Run *(Critical Safety Step)*

> [!warning inline end] Caution
> **Do not install the physical hardware yet.**

1. [ ] Ensure the build plate is completely empty.
2. [ ] Trigger the `WIPE_NOZZLE` macro via Fluidd or Guppy Screen.
3. [ ] Observe the toolhead to verify it moves to the correct coordinates safely without risking a collision.

## :material-tools: Phase 5: Physical Installation

1. [ ] Lower the build plate halfway down the Z-axis to create working room.
2. [ ] Drop the A1 brush into the slot
3. [ ] Using a **2mm hex driver** and the **M3x12mm** self-tapping screws, install the spacer and the V5 brush mount into the two existing holes at the back of the Z-axis.

#### :material-check-decagram: Final Verification:

+ [ ] Use a ruler to visually confirm there is exactly a 1mm gap between the bottom of the printed wiper mount and the build plate. 

## :material-file-code-outline: PROWIPER^&copy;^ Mod G-Code File

```gcode title="3DPHUB_PROWIPER.cfg" linenums="1" hl_lines="43 58"
#################################################################
# _____ ____  ____    _   _ _   _ ____        _   _ _____ _____ #
#|___ /|  _ \|  _ \  | | | | | | | __ )      | \ | | ____|_   _|#
#  |_ \| | | | |_) | | |_| | | | |  _ \      |  \| |  _|   | |  #
# ___) | |_| |  __/  |  _  | |_| | |_) |  _  | |\  | |___  | |  #
#|____/|____/|_|     |_| |_|\___/|____/  (_) |_| \_|_____| |_|  #
#################################################################                                                               
# PROWIPER BY DAWSON PURCELL @ 3 D P H U B . N E T              #
# Free website for finding parts, tutorials and tuning tools    #
#################################################################

# If you found this tool useful, you can donate to support future development at
# https://3dphub.net/contribute

# EVERY PRINTER IS DIFFERENT. SOME PRESETS ARE INCLUDED, BUT YOU MAY NEED TO TWEAK.
# NOZZLE WIPING IS COMPLETELY DISABLED UNTIL YOU CONFIGURE IT. THIS IS TO PREVENT DAMAGE.
# CHANGE THE BRUSH MOUNT VARIABLE BELOW. THE REST WILL AUTO DETECT WHEN RUNNING THE MACRO
# SET PRINTER VERSION TO CUSTOM TO OVERRIDE AUTOCONFIG. YOU MUST MANUALLY SET ALL VARIABLES USING CUSTOM.
# START_Z SETS THE DISTANCE BETWEEN THE NOZZLE AND THE -BED- WHILE WIPING. MEASURE AND VERIFY A SAFE HEIGHT.
# RUN THE MACRO WITH AN EMPTY BUILD PLATE BEFORE INSTALLING THE BRUSH MOUNT TO VERIFY SAFE SETTINGS.
# USE THE PRINTABLE TOOLS AND MEASUREMENT MACRO IF YOU NEED TO DIAL IN CUSTOM SETTINGS TO SUIT YOUR SETUP


# COMMENT OUT THE FOLLOWING 3 LINES IF YOU ARE GETTING A VIRTUAL PINS ERROR
# COMMENT OUT THE RELATED 3 LINES IN THE GCODE SECTION TOO
[output_pin 3DPHUB_PROWIPER]
 pin: virtual_pin:3DPHUB_PROWIPER_pin
 value: 1

[gcode_macro CX_NOZZLE_CLEAR]
rename_existing: _CX_NOZZLE_CLEAR
gcode:
  WIPE_NOZZLE

[gcode_macro WIPE_NOZZLE]
description: PROWIPER Version 5 beta (27-11-2025)

# ___________________________________________________________________________________

# MAKE SURE THE BRUSH MOUNT MATCHES YOUR SETUP. THE REST SHOULD AUTO ADJUST. USE CUSTOM PRINTER IF YOU WANT TO CHANGE Z
# ___________________________________________________________________________________

variable_brush_mount        : "V5K1C"  # <------- CHANGE TO A1, V5K1C, OGK1C, A1MINI, V4MINI, LPF, LPF2, LIBRA, LIBRA2, MOLDED, CFSA, CFSZ, NONE
variable_printer_version    : "K1C"        # <------- AUTO DETECTS K1, K1C, K1SE, K1MAX. SET TO CUSTOM TO CHANGE VARIABLES MANUALLY
variable_start_z            : 8.5          # <------- AUTOMATICALLY CHANGES BASED ON BRUSH IF NOT USING CUSTOM
variable_wipe_pattern       : "ZIGZAG"     # <------- STRAIGHT / ZIGZAG / DISABLED. ONLY STRAIGHT IS SUPPORTED FOR LPF MOUNTS
variable_x_offset     	    : 0            # <------- THIS IS USED BY MOUNTS WHICH AREN'T CENTERED


# START_Z WILL DEFAULT TO 4 FOR LPF2, 5 FOR LPF, 0.05 FOR NONE AND 8.5 FOR OLDER MOUNTS
# "NONE" WILL SCRAPE THE NOZZLE ON THE BUILD PLATE LIKE THE FACTORY K1 MAX (WORST OPTION)
# THE ZIGZAG WIPE PATTERN WILL AUTOMATICALLY SWITCH TO STRAIGHT IF THERE ISN'T ENOUGH TRAVEL AREA AVAILABLE

# ___________________________________________________________________________________

# OPTIONS 

variable_speed              : 5000      # THIS CHANGES HOW FAST IT WIPES. I RECOMMEND 1000-5000.
variable_wipe_qty           : 5         # AMOUNT OF WIPE SEQUENCES. 1 FOR PURE SPEED, MORE RECOMMENDED TO AVOID LEAKS
variable_nozzle_temp_pad    : 10        # NOZZLE WILL HEAT TO THE PRINT TEMP MINUS THE SAFE TEMP TO AVOID LEAKS
variable_nozzle_temp_limit  : 240       # TO PREVENT LEAKS, THE NOZZLE WILL NOT EXCEED THIS TEMP
variable_preheat            : "ON"      # KEEPS THE NOZZLE WARM TO HELP PREHEAT THE CHAMBER BEFORE PRINTING
variable_hot_wipe           : "ON"      # WAIT UNTIL THE NOZZLE IS HEATED BEFORE WIPING. REQUIRED FOR EXTRUDE / RETRACT
variable_ensure_cooling     : "ON"      # ADDS EXTRA WIPES TO GIVE THE NOZZLE TIME TO COOL. HELPS AVOID LEAKS
variable_extrude_amount     : "OFF"     # VALUE / OFF. EXTRUDE BEFORE WIPING. MUST INCREASE FIRST LAYER TEMP TO USE
variable_retract_amount     : "2.5"     # VALUE / OFF. RETRACT AFTER EXTRUDING BEFORE WIPING TO AVOID LEAKS
variable_console_output     : "ON"      # ON, OFF. ENABLES OR DISABLES EXTRA INFO IN CONSOLE FOR DIAGNOSTIC PURPOSES
variable_bot_clearance      : 20        # HOW MUCH CLEARANCE YOU NEED UNDER THE BED FOR MODS OR STORAGE.
variable_drop_distance      : 15        # LOWERS THE BED BY THIS MUCH BEFORE MOVING TO AVOID COLLISIONS.
variable_bed_fans_installed : "FALSE"   # SET TO TRUE IF YOU HAVE BED FANS DEFINED AS bed_fans (case sensitive) IN PRINTER.CFG
variable_preheat_bed_temp   : 60        # AFTER WIPING, PREHEATS THE BED TO THIS TEMP IF PREHEAT IS ON
variable_preheat_nozzle_temp: 60        # AFTER WIPING, PREHEATS THE NOZZLE TO THIS TEMP IF PREHEAT IS ON
variable_fan_speed          : 175       # 0-255. AFTER WIPING, SETS FANS TO THIS SPEED IF PREHEAT IS ON
variable_scrape_position    : "FRONT"   # FRONT / SIDE / REAR - SCRAPES IN THIS POSITION IF BRUSH MOUNT IS NONE
variable_scrape_z_height    : 0.05      # ADJUSTS THE Z POSITION WHEN WIPING WITHOUT A BRUSH
variable_first_layer_temp   : 220       # HEATS NOZZLE TO THIS TEMP BEFORE WIPING
variable_placed             : "NO"      # FORCES START Z TO 2.5 TO USE A BRUSH PLACED WITHOUT A MOUNT
variable_spacer_height      : 0         # MODIFIES THE Z OFFSET TO ACCOUNT FOR A SPACER FOR MODIFIED BED ONLY

# ___________________________________________________________________________________

#VARIABLES BELOW WILL CHANGE AUTOMATICALLY IF PRINTER VERSION AND  ARE NOT SET TO CUSTOM

variable_start_x            : 121       # CHANGES AUTOMATICALLY DEPENDING ON BRUSH AND PRINTER TYPE
variable_start_y            : 222.5     # CHANGES AUTOMATICALLY DEPENDING ON BRUSH AND PRINTER TYPE
variable_brush_length       : 50        # CHANGES AUTOMATICALLY DEPENDING ON BRUSH TYPE. ADD 3 FOR CUSTOM LENGTHS
variable_wipe_distance      : 50        # CHANGES AUTOMATICALLY BASED ON BRUSH LENGTH
variable_top_clearance      : 20        # THE BED WILL LOWER BY THE DROP DISTANCE IF IT IS ABOVE THIS VALUE
variable_limit_z            : 250       # CHANGES AUTOMATICALLY TO REFLECT YOUR -FACTORY- BUILD VOLUME
variable_limit_x            : 220       # CHANGES AUTOMATICALLY TO REFLECT YOUR -FACTORY- BUILD VOLUME
variable_limit_y            : 220       # CHANGES AUTOMATICALLY TO REFLECT YOUR -FACTORY- BUILD VOLUME
variable_target_temp        : 140       # COOLS TO THIS TEMP WHILE WIPING TO AVOID LEAKS


variable_config_version: "V5 beta (27-11-2025)" 

# ___________________________________________________________________________________

gcode:
  # TOGGLE BUTTON IN FLUIDD AND SAFETY FEATURE TO PROTECT AGAINST DAMAGE FROM MISCONFIGURATION. 
  # COMMENT THIS OUT IF YOU ARE GETTING A VIRTUAL PINS ERROR
  {% if printer['output_pin 3DPHUB_PROWIPER'].value == 0 %}
  {% set wipe_pattern = "DISABLED" %}
  {% endif %}
  
  {% if wipe_pattern not in ["OFF", "DISABLED"] %}
  # SAFETY CHECK
    {% if brush_mount == "CHANGE ME" %}
    RESPOND PREFIX="You need to set the [brush_mount] type in  [3DPHUB_PROWIPER.cfg]"
    {% set wipe_pattern = "DISABLED" %}
    {% endif %}
  
  
        #{% if 'SPEED' in params %}
        #{% set speed = params.SPEED|default(speed)|int %}
        #{% endif %}
    {% if 'BED_TEMP' in params|upper and (params.BED_TEMP|float) %}
  {% set preheat_bed_temp = params.BED_TEMP|float %}
  {% endif %}

  {% if 'EXTRUDER_TEMP' in params|upper and (params.EXTRUDER_TEMP|float) %}
    {% set first_layer_temp = params.EXTRUDER_TEMP|float %}
  {% endif %}

  {% if printer_version != "CUSTOM" and printer.configfile.settings.stepper_x.position_max > 250 %}
    {% set printer_version = "K1MAX" %}
    {% set limit_x = 300 %}
    {% set limit_y = 300 %}
    {% set limit_z = 300 %}
  {% endif %}
  {% if variable_printer_version != "CUSTOM" and printer.configfile.settings.stepper_x.position_max < 250 %}
    {% set limit_x = 220 %}
    {% set limit_y = 220 %}
    {% set limit_z = 250 %}
  {% endif %}	

    # INITIALIZATION
    #{% set start_x = (limit_x / 2) - (brush_length / 2) %} # -1.5
    {% if brush_mount not in ["LPF", "LPF1", "LPF2", "CUSTOM"] %}
              {% set start_y = (printer.configfile.settings.stepper_y.position_max - 2.6) %}
    {% endif %}
    
    # START HEATING NOZZLE
    M104 S{target_temp} 


    # WIPING DIRECTLY ON PLATE       
    {% if brush_mount == "NONE" and scrape_position in ["FRONT", "SIDE"] %}
        {% set wipe_pattern = "STRAIGHT" %}
    {% endif %}   

    # A1 MINI / MOLDED 
    {% if brush_mount in ["A1MINI", "MOLDED"] and printer_version != "CUSTOM" %}
        {% set brush_length = 61 %}
        {% set start_z = 8.5 %}
        {% elif brush_mount in ["A1", "K1", "LPF"] and printer_version != "CUSTOM" %}
        {% set brush_length = 38 %}
    {% endif %}

    # V4MINI                       
    {% if brush_mount == "V4MINI" and printer_version != "CUSTOM" %}
        {% set start_z = 6.5 %}
        {% set brush_length = 31 %}
    {% endif %}

    # STOCK K1C                   
    {% if brush_mount == "OGK1C" and printer_version != "CUSTOM" %}
        {% set start_z = 2.25 %}
        {% set brush_length = 51 %}
    {% endif %}      
    # ORIGINAL K1C                   
    {% if brush_mount == "V5K1C" and printer_version != "CUSTOM" %}
        {% set start_z = 4.5 %}
        {% set brush_length = 38 %}
    {% endif %}          

    # LPF / LPF1    
     {% if brush_mount in ["LPF", "LPF1"] and printer_version != "CUSTOM" %}
        {% set start_y = (printer.configfile.settings.stepper_y.position_max - 2.6) %}
        {% set start_z = 4 %} 
        {% set brush_length = 38 %}
       {% set wipe_pattern = "STRAIGHT" %}
     {% endif %} 

    # LPF2 - ONLY USES STRAIGHT WIPE PATTERN TO GIVE MAXIMUM CLEARANCE
     {% if brush_mount == "LPF2" and printer_version != "CUSTOM" %}
        {% set start_y = (printer.configfile.settings.stepper_y.position_max - 0.1) %}
        {% set start_z = 4 %} 
        {% set brush_length = 38 %}
       {% set wipe_pattern = "STRAIGHT" %}
     {% endif %} 

    # LIBRA
          {% if brush_mount in ["LIBRA", "LIBRA1"] and printer_version != "CUSTOM" %}
        {% set start_y = (printer.configfile.settings.stepper_y.position_max - 2.6) %}
            {% set start_z = 4 %}  
            {% set brush_length = 38 %}
            #   {% set wipe_pattern = "STRAIGHT" %}
     {% endif %} 

    # LIBRA2
               {% if brush_mount == "LIBRA2" and printer_version != "CUSTOM" %}
        {% set start_y = (printer.configfile.settings.stepper_y.position_max - 2.6) %}
            {% set start_z = 5 %}  
            {% set brush_length = 38 %}
      {% endif %} 
    # CFSA - Thanks to Andrés López for designing this mount
               {% if brush_mount == "CFSA" and printer_version != "CUSTOM" %}
        {% set start_y = (printer.configfile.settings.stepper_y.position_max - 2.6) %}
            {% set start_z = 5 %} 
            {% set x_offset = -15 %} 
            {% set brush_length = 38 %}
      {% endif %} 
    # CFSZ - Thanks to Zeyrox__0 for designing this mount
               {% if brush_mount == "CFSZ" and printer_version != "CUSTOM" %}
        {% set start_y = (printer.configfile.settings.stepper_y.position_max - 2.6) %}
            {% set start_z = 5 %} 
            {% set x_offset = -39 %} 
            {% set brush_length = 38 %}
      {% endif %}     
 
    #BRUSHLESS WIPING
  {% if brush_mount == "NONE" %}
    {% set start_z = scrape_z_height %}
    {% if scrape_position == "FRONT" %}
    {% set wipe_pattern = "STRAIGHT" %}
      {% set start_y = 0 %}     
    {% elif scrape_position == "REAR" %} 
      {% set start_y = (printer.configfile.settings.stepper_y.position_max - 2.6) %}
    {% else %}
      {% set start_y = 25 %}
      {% set start_x = (limit_x - 2.5) %}
    {% endif %}
  {% endif %}

  # INITIALIZATION START X
    {% set start_x = ((limit_x / 2) - (brush_length / 2)) + x_offset %}
    {% set start_z = (start_z) + (spacer_height) %} # ACCOUNTS FOR A SPACER FOR MODIFIED BEDS

 
  {% if console_output == "ON" %}
    {% if printer_version == "CUSTOM" %}
    RESPOND PREFIX="PROWIPER: {config_version} initiated using [CUSTOM] settings: [{brush_mount}][{wipe_pattern}][{start_z}mm][{speed}]"
    {% else %}
    {% if brush_mount != "NONE" %}
    RESPOND PREFIX="PROWIPER: {config_version} auto configured with [{printer_version}] settings using the [{brush_mount}] brush mount and the [{wipe_pattern}] wipe pattern at a height of [{start_z}mm] with a speed of [{speed}]."
    {% endif %}
        {% if brush_mount == "NONE" %}
    RESPOND PREFIX="PROWIPER: {config_version} auto configured with [{printer_version}] settings without a brush mount, using the [{wipe_pattern}] wipe pattern at the [{scrape_position}] with a height of [{start_z}mm] with a speed of [{speed}]"
    {% endif %}
        {% endif %}
         {% endif %}
        
         
      {% if placed == "YES" %} # FORCES THE WIPE HEIGHT TO 2.5 FOR USING A1 BRUSHES PLACED WITHOUT A MOUNT
          {% set start_z = 2.5 %} 
      {% endif %}
         
   {% if "xyz" not in printer.toolhead.homed_axes %}
   {% if console_output == "ON" %}
     RESPOND PREFIX="PROWIPER: Homing before wipe sequence"
     {% endif %}
     HOME_SAFELY
   {% endif %}

  
 # SET_VELOCITY_LIMIT VELOCITY={printer.configfile.settings.printer.max_velocity} ACCEL={printer.configfile.settings.printer.max_accel}

      {% set target_temp = (first_layer_temp - nozzle_temp_pad) %} # Set target temperature lower than the first layer temperature to avoid leaks
      {% if target_temp > nozzle_temp_limit %}
        {% set target_temp = nozzle_temp_limit %} # Nozzle won't exceed the temp limit
      {% endif %}
      {% set current_temp = printer.extruder.temperature %} # Get the current extruder temperature
        M104 S{target_temp} 
        {% if console_output == "ON" %}
          RESPOND PREFIX="PROWIPER: Heating extruder to [{target_temp}C] to soften gunk before wiping."
        {% endif %}
  
     {% set current_z_pos = printer.toolhead.position.z %} 
     {% set target_z = current_z_pos + (drop_distance) %}   
 G90
     {% if target_z > (limit_z - bot_clearance) %} #V5
        G1 Z{limit_z - bot_clearance} F1500 #V5
    {% else %}
        G1 Z{target_z} F1500 
    {% endif %}
  M400   

 G1 X{start_x} Y{start_y} F6000
 M400
 G1 Z{start_z} F1000

  {% if hot_wipe == "ON" and current_temp < target_temp %}
    M109 S{target_temp}
  {% endif %}

  {% if extrude_amount not in ["OFF", 0, "DISABLED", "NONE"] and hot_wipe != "OFF" %}
    G1 E{extrude_amount} F300
  {% endif %}
  {% if retract_amount not in ["OFF", 0, "DISABLED", "NONE"] and hot_wipe != "OFF" %}
    G1 E-{retract_amount} F300
  {% endif %}
 
 M106 P0 S255
 M104 S0
 
 {% if console_output == "ON" and brush_mount in ["LPF", "LPF1", "NONE"] %}
    RESPOND PREFIX="PROWIPER: Wipe sequence started, using the [STRAIGHT] pattern. (There is not enough travel room to use ZIGZAG)"
 {% endif %}

 {% if console_output == "ON" and brush_mount not in ["LPF", "LPF1", "NONE"] %}
    RESPOND PREFIX="PROWIPER: Wipe sequence started, using the [{wipe_pattern}] wipe pattern.."
 {% endif %}

    # SIDE WIPE SEQUENCE NO BRUSH
  {% if brush_mount == "NONE" and scrape_position == "SIDE" %}
    {% for wipes in range(1, (wipe_qty + 1)) %}
        G1 Y{start_y + (brush_length)} F{speed}
        G1 Y{start_y} F{speed}
        G1 Y{start_y + (brush_length)} F{speed}
        G1 Y{start_y} F{speed}
        G1 Y{start_y + (brush_length)} F{speed}
        G1 Y{start_y} F{speed}
        G1 Y{start_y + (brush_length)} F{speed}
        G1 Y{start_y} F{speed}
        G1 Y{start_y + (brush_length)} F{speed}
     {% endfor %}
    {% endif %}
# ZIGZAG SEQUENCE STANDARD
  {% if wipe_pattern == "ZIGZAG" and brush_mount not in ["LPF2", "NONE"] %}
    {% for wipes in range(1, (wipe_qty + 1)) %}
        G1 X{start_x + (brush_length)} F{speed}
        G1 X{start_x} F{speed}
        G1 X{start_x + (brush_length * 0.1)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.2)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.3)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.4)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.5)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.6)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.7)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.8)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.9)} Y{start_y + 2.5} F{speed} 
        G1 X{start_x + brush_length} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.9)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.8)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.7)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.6)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.5)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.4)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.3)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.2)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.1)} Y{start_y + 2.5} F{speed}
        G1 X{start_x} Y{start_y} F{speed}
    {% endfor %}
    {% endif %}
     {% set current_temp = printer.extruder.temperature %}
     # EXTRA WIPE TO ENSURE COOLDOWN
     {% if wipe_pattern == "ZIGZAG" and brush_mount not in ["LPF2", "NONE"] and ensure_cooling == "ON" and current_temp > 180 %}
        G1 X{start_x + (brush_length)} F{speed}
        G1 X{start_x} F{speed}
        G1 X{start_x + (brush_length * 0.1)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.2)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.3)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.4)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.5)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.6)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.7)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.8)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.9)} Y{start_y + 2.5} F{speed} 
        G1 X{start_x + brush_length} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.9)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.8)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.7)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.6)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.5)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.4)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.3)} Y{start_y + 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.2)} Y{start_y - 2.5} F{speed}
        G1 X{start_x + (brush_length * 0.1)} Y{start_y + 2.5} F{speed}
        G1 X{start_x} Y{start_y} F{speed}
    {% endif %}
 #STRAIGHT PATTERN STANDARD   
 {% if wipe_pattern == "STRAIGHT" and brush_mount != "LPF2" and scrape_position != "SIDE" %}
    {% for wipes in range(1, (wipe_qty + 1)) %}
        G1 X{start_x + brush_length} F{speed}
        G1 X{start_x} F{speed}
        G1 Y{start_y - 1} F{speed}
        G1 X{start_x + brush_length} F{speed}
        G1 X{start_x} F{speed}
        G1 Y{start_y} F{speed}
        G1 X{start_x + brush_length} F{speed}
        G1 X{start_x} F{speed}
        G1 Y{start_y + 1} F{speed}
        G1 X{start_x + brush_length} F{speed}
        G1 X{start_x} F{speed}
        G1 Y{start_y} F{speed}
        G1 X{start_x + brush_length} F{speed}
        G1 X{start_x} Y{start_y} F{speed}
    {% endfor %}
    {% endif %}  
    # LPF2 STRAIGHT SEQUENCE
    {% if brush_mount == "LPF2" %}
     {% for wipes in range(1, (wipe_qty + 1)) %}
        G1 X{start_x + brush_length} F{speed}
        G1 X{start_x} F{speed}
        G1 X{start_x + brush_length} F{speed}
        G1 X{start_x} F{speed}
        G1 X{start_x + brush_length} F{speed}
        G1 X{start_x} F{speed}
     {% endfor %}
    {% endif %}

 # EXTRA WIPE TO ENSURE COOLDOWN
    {% if ensure_cooling == "ON" and hot_wipe != "OFF" and scrape_position != "SIDE" %}
    {% if console_output == "ON" %}
        RESPOND PREFIX="PROWIPER: Continuing to wipe until cool - [COOLING] is ON."
        {% endif %}
        M104 S0
        M106 P0 S255
        G1 X{start_x + brush_length} F5000
        G1 X{start_x} F5000
        G1 X{start_x + brush_length} F4500
        G1 X{start_x} F4500
        G1 X{start_x + brush_length} F4000
        G1 X{start_x} F4000
        G1 X{start_x + brush_length} F3000
        G1 X{start_x} F13000
        G1 X{start_x + brush_length} F2500
        G1 X{start_x} F2500
        G1 X{start_x + brush_length} F2500
        G1 X{start_x} F2500
        G1 X{start_x + brush_length} F3000
        G1 X{start_x} F3000
        G1 X{start_x + brush_length} F3500
        G1 X{start_x} F3500
        G1 X{start_x + brush_length} F4000
        G1 X{start_x} F4000
        G1 X{start_x + brush_length} F4500
        G1 X{start_x} F4500
        G1 X{start_x + brush_length} F5000
        G1 X{start_x} F5000                 
        M106 P0 S0
        M104 S150
        
    {% endif %}

  G1 Z{printer.toolhead.position.z + top_clearance} F1000
  # PREHEAT  
 {% if printer.print_stats.filename is none or printer.print_stats.filename == "" %}
    {% if preheat == "ON" %}
       {% if console_output == "ON" %}
           RESPOND PREFIX="PROWIPER: Cleaning sequence complete. [PREHEAT] is ON."
        {% endif %}
        PREHEAT
         
    {% else %}
        {% if console_output == "ON" %}
             RESPOND PREFIX="PROWIPER: Cleaning sequence complete. Cooling extruder"
        {% endif %}
        M104 S0
        M106 S0
    {% endif %}
 {% else %}
    {% if preheat == "ON" and printer.print_stats.filename != "" %}
        M104 S140
        M106 S0
        {% if console_output == "ON" %}
            RESPOND PREFIX="PROWIPER: Cleaning sequence complete."
        {% endif %}
        {% endif %}
 {% endif %}

       {% if console_output == "ON" %}
             RESPOND PREFIX="3DPHUB PROWIPER: If you found this tool useful, you can donate at https://3dphub.net/contribute to support continued development"
        {% endif %}
 
   {% else %}
   RESPOND PREFIX="Nozzle wiping [DISABLED] - Click the toggle button under Fans & Outputs to enable."
   {% endif %}
  

#__________________________________________________________________________________________________  
[gcode_macro VIEW_NOZZLE] 

description: Make sure the build plate is empty!
variable_limit_x: 220
gcode:

  {% if printer.configfile.settings.stepper_x.position_max > 250 %}
    {% set limit_x = 300 %}
  {% endif %}
  HOME_SAFELY 
  G1 X{limit_x -5} Y50 F3000
#__________________________________________________________________________________________________ 
[gcode_macro COOL_NOZZLE] 
description: Make sure the build plate is empty!

variable_cool_nozzle_fan: 255
variable_cool_nozzle_temp: 0
variable_limit_x: 220
gcode:

  
  {% if printer.configfile.settings.stepper_x.position_max > 250 %}
    {% set limit_x = 300 %}
  {% endif %}
  
  {% if 'NOZZLE_TEMP' in params %}
    {% set cool_nozzle_temp = (params.NOZZLE_TEMP | default(cool_nozzle_temp)) | int %}
  {% endif %}

  {% if 'FAN_SPEED' in params %}
    {% set cool_nozzle_fan = (params.FAN_SPEED | default(cool_nozzle_fan)) | int %}
  {% endif %}
  
        M104 S{cool_nozzle_temp}
        M140 S{cool_nozzle_temp}
        M106 P0 S{cool_nozzle_fan}
        M106 P2 S{cool_nozzle_fan}
        M106 P1 S{cool_nozzle_fan}

  HOME_SAFELY 
     
        M104 S0
        M140 S0
        M106 P0 S{cool_nozzle_fan}
        M106 P2 S{cool_nozzle_fan}
        M106 P1 S{cool_nozzle_fan}

  G1 X{limit_x -5} Y{limit_x * 0.5} F3000
#__________________________________________________________________________________________________ 


[gcode_macro PREHEAT]
description: Make sure the build plate is empty!
gcode:
  
  HOME_SAFELY   
    
  {% if printer["gcode_macro WIPE_NOZZLE"].bed_fans_installed == "TRUE" %}
    SET_PIN PIN=bed_fans VALUE={printer["gcode_macro WIPE_NOZZLE"].fan_speed}
  {% endif %}   
 
  M104 S{printer["gcode_macro WIPE_NOZZLE"].preheat_nozzle_temp}
  M140 S{printer["gcode_macro WIPE_NOZZLE"].preheat_bed_temp}
  SET_PIN PIN=fan2 VALUE={printer["gcode_macro WIPE_NOZZLE"].fan_speed}
  SET_PIN PIN=fan0 VALUE={printer["gcode_macro WIPE_NOZZLE"].fan_speed}
  SET_PIN PIN=fan1 VALUE=0
  G1 X{printer.configfile.settings.stepper_x.position_max - 10} Y{printer.configfile.settings.stepper_y.position_max * 0.5} F5000
  G1 Z5
  {% if console_output == "ON" %}
  RESPOND PREFIX="Preheat skipped - print is in progress"
  {% endif %}


 #__________________________________________________________________________________________________      
 
[gcode_macro HOME_SAFELY]
description: Safely lowers the bed by a chosen amount and helps before homing
# SAFER HOMING TO PREVENT CRASHES AND GETTING STUCK
variable_safe_home_z_amount: 15

gcode:
  {% if 'LOWER_BED_BY' in params %}
  {% set safe_home_z_amount = (params.LOWER_BED_BY|default(safe_home_z_amount))|int %}
  {% endif %}
  {% if safe_home_z_amount < 0 %}
  {% set safe_home_z_amount =15 %}
  {% elif safe_home_z_amount > 200 %}
    {% set safe_home_z_amount =15 %}
  {% endif %}
    {% if "xyz" not in printer.toolhead.homed_axes %}
      RESPOND PREFIX="Homing safely with a clearance of {safe_home_z_amount}mm"
      SET_KINEMATIC_POSITION Z=0
      G1 Z{safe_home_z_amount}
      M400
      G28 Y
      G28 X 
      G28 Z
    {% endif %}      
  
#__________________________________________________________________________________________________   
[gcode_macro MEASURE_WIPER]
description: Use this to find your custom nozzle wiper length using the measuring tool.
variable_buildvol: 220
variable_zheight: 0.76
gcode:

  {% if printer.configfile.settings.stepper_x.position_max > 250 %}
    {% set buildvol = 300 %}
    {% set zheight = 1.75 %}
  {% endif %}

    RESPOND PREFIX="Measuring custom nozzle wiper distance."  

  HOME_SAFELY       
  
    M104 S200  
    G1 Z30
    M400
    G1 X{buildvol * 0.5 - 10} F5000
    G1 Y{printer.configfile.settings.stepper_y.position_max} F5000
    M109 S200
    G1 E-0.4 F300
    G1 Z{zheight}
    M400
    G1 X{buildvol * 0.5 + 10} F500  
    G1 X{buildvol * 0.5 - 10} F500
    M400 
    G1 Z6
    M400
    G1 Y{printer.configfile.settings.stepper_y.position_max - 2.5}
    M400
    G1 Z{zheight}
    M400
    G1 X{buildvol * 0.5 + 10} F500  
    G1 X{buildvol * 0.5 - 10} F500
    M400 
    G1 Z6
    M400
    G1 Y{printer.configfile.settings.stepper_y.position_max - 5} 
    M400
    G1 Z{zheight}
    M400
    G1 X{buildvol * 0.5 + 10} F500  
    G1 X{buildvol * 0.5 - 10} F500
    M400 
    G1 Z30
    M104 S0
```

---