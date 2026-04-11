---
hide:
  - toc
---
![Manual Nozzle Cleaning Macro Dialog](../assets/screenshots/nozzle-cleaning-macro-light.png#only-light){ width=500 }
![Manual Nozzle Cleaning Macro Dialog](../assets/screenshots/nozzle-cleaning-macro-dark.png#only-dark){ width=500 }

# [[Manual_Nozzle_Cleaning_Gcode_Macro|Interactive Manual Nozzle Cleaning Macro]]

> [!info] 
> [Creality K1C :devices-creality:](../02_Hardware/Kacey_3D-printer.md){ .md-button .md-button--primary }
> 
> **Date Implemented:** 
> + March 2026
> 
> **Overview:**
> + This custom macro set *(`CLEAN_NOZZLE`, `DONE_CLEANING`, and `DONE_CLEANING_COOL`)* creates an interactive, semi-automated workflow for manual nozzle maintenance. 
> + It safely homes the axes, moves the toolhead to an accessible front-center position, and heats the nozzle to soften plastic debris. 
> + It utilizes Klipper's `RESPOND` action commands to spawn a custom UI prompt in [[Fluidd]], pausing the workflow until the nozzle is physically cleaned with a silicone brush. 
> + Once acknowledged via the UI, it safely cools the heater and parks the toolhead.

---
## :material-file-code-outline: G-code Macro

```gcode title="manual-nozzle-clean.cfg" linenums="1"
################################
##  Manual-Nozzle-Clean v2.0  ##
##   Now with more options!   ##
################################

# Custom G-Code macros for manual nozzle cleaning with a silicone brush.
# Updated 'manual-nozzle-clean-v2.cfg' includes separate macros 'DONE_CLEANING' and 'DONE_CLEANING_COOL'.
  # Adds a message to the UI prompt to explain the function of each button.
  # 'DONE_CLEANING' parks the toolhead and turns off the heater.
  # 'DONE_CLEANING_COOL' parks the toolhead, turns off the heater, and cools the nozzle.

[gcode_macro CLEAN_NOZZLE]
description: Parks the toolhead, heats up, and shows a prompt.
gcode:
  {% set CLEAN_TEMP = params.TEMP|default(150)|float %}

  {% if "xyz" not in printer.toolhead.homed_axes %}
    G28
  {% endif %}

  G90
  G1 Z100 F600
  G1 X110 Y10 F6000

  M109 S{CLEAN_TEMP}

  # Spawn the Fluidd UI Prompt
  RESPOND TYPE=command MSG="action:prompt_begin Nozzle Cleaning"
  RESPOND TYPE=command MSG="action:prompt_text The nozzle is at {CLEAN_TEMP}°C. Grab your silicone brush!"
  RESPOND TYPE=command MSG="action:prompt_text Click 'Park' to park the toolhead and turn off the heater."
  RESPOND TYPE=command MSG="action:prompt_text Click 'Park & Cool' to park the toolhead and cool the nozzle."
  RESPOND TYPE=command MSG="action:prompt_button Park|DONE_CLEANING"
  RESPOND TYPE=command MSG="action:prompt_button Park & Cool|DONE_CLEANING_COOL"
  RESPOND TYPE=command MSG="action:prompt_show"


[gcode_macro DONE_CLEANING]
description: Closes the prompt, turns off the heater, and parks on the right side.
gcode:
  # Close the UI prompt
  RESPOND TYPE=command MSG="action:prompt_end"

  # Turn off the heater
  M104 S0

  # Move to your specified parking spot
  G90
  G1 X215 Y110 F6000
  {action_respond_info("Heater off and toolhead parked.")}


[gcode_macro DONE_CLEANING_COOL]
description: Closes the prompt, turns off the heater, parks on the right side, and cools the nozzle.
gcode:
  # Close the UI prompt
  RESPOND TYPE=command MSG="action:prompt_end"

  # Turn off the heater
  M104 S0

  # Move to your specified parking spot
  G90
  G1 X215 Y110 F6000
  {action_respond_info("Heater off and toolhead parked. Cooling nozzle...")}

  # Cool the nozzle to 40 degrees
  WAIT_TEMP_START
```

## :material-tools: Installation & Klipper Integration

1. Establish an SSH connection to the printer and navigate to `/usr/data/printer_data/config`.
2. Open `gcode_macro.cfg` *(or your dedicated macro configuration file)*.
3. Paste both `[gcode_macro]` blocks into the file.
4. Save the configuration and restart Klipper to apply the changes.

## :material-toggle-switch-outline: Trigger / Usage

  > [!note inline end] Custom Temperature 
  > Useful if you are switching between PLA and higher-temp materials like ABS / ASA.

+ **Default Cleaning:** 
    + Trigger `CLEAN_NOZZLE` from your Fluidd dashboard or Guppy Screen macros list. 
    + The nozzle will heat to the default temperature *(**150°C**)*.

+ **Custom Temperature Cleaning:** 
    + You can specify a different temperature through the console by running `CLEAN_NOZZLE TEMP=200`

  > [!note inline end] Completion
  > The `DONE_CLEANING` macro turns off the heater and parks the toolhead safely out of the way.
  >
  > The `DONE_CLEANING_COOL` macro turns off the heater, parks the toolhead safely out of the way, and cools the nozzle.

+ **Completion:** 
    + Wait for the [[Fluidd]] UI prompt to appear. 
    + Scrub the nozzle with your silicone brush. 
    + Click the **"Park"** button to automatically trigger the `DONE_CLEANING` macro. 
    + Click the **"Park & Cool"** button to automatically trigger the `DONE_CLEANING_COOL` macro. 
