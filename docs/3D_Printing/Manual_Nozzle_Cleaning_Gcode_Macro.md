---
icon: devices/toothbrush-nozzle
title: Manual Nozzle Cleaning Macro
hide:
  - toc
---
![Toothbrush Nozzle Icon](../assets/icons/toothbrush-nozzle.svg){ width=300 }

# Interactive Manual Nozzle Cleaning Macro

> [!info] 
> [Creality^&copy;^ K1C :devices-creality:](../02_Hardware/Kacey_3D-printer.md){ .md-button .md-button--primary }
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

## :material-tools: Installation & Klipper Integration

1. [ ] Establish an SSH connection to the printer and navigate to `/usr/data/printer_data/config`.
2. [ ] Open `gcode_macro.cfg` *(or your dedicated macro configuration file)*.
3. [ ] Paste both `[gcode_macro]` blocks into the file.
4. [ ] Save the configuration and restart Klipper to apply the changes.

## :material-toggle-switch-outline: Trigger / Usage

  > [!note inline end] Custom Temperature 
  > Useful if you are switching between PLA and higher-temp materials like ABS / ASA.

#### Default Cleaning:
  + [ ] Trigger `CLEAN_NOZZLE` from your Fluidd dashboard or Guppy Screen macros list. 
  + [ ] The nozzle will heat to the default temperature *(**150&deg;C**)*.

#### Custom Temperature Cleaning:
  + [ ] You can specify a different temperature through the console by running `CLEAN_NOZZLE TEMP=200`

  > [!note inline end] Completion
  > The `DONE_CLEANING` macro turns off the heater and parks the toolhead safely out of the way.
  >
  > The `DONE_CLEANING_COOL` macro turns off the heater, parks the toolhead safely out of the way, and cools the nozzle.

#### Completion: 
  + [ ] Wait for the [[Fluidd]] UI prompt to appear. 
  + [ ] Scrub the nozzle with your silicone brush. 
  + [ ] Click the **"Park"** button to automatically trigger the `DONE_CLEANING` macro. 
  + [ ] Click the **"Park & Cool"** button to automatically trigger the `DONE_CLEANING_COOL` macro. 

<figure markdown="span">
![Manual Nozzle Cleaning Macro Dialog](../assets/screenshots/nozzle-cleaning-macro-light.png#only-light){ width=500 .on-glb data-title="Manual Nozzle Cleaning Macro" data-description=".nozzle-clean-desc" }
![Manual Nozzle Cleaning Macro Dialog](../assets/screenshots/nozzle-cleaning-macro-dark.png#only-dark){ width=500 .on-glb data-title="Manual Nozzle Cleaning Macro" data-description=".nozzle-clean-desc" }
<figcaption>The <a href="/03_Services/Fluidd.html">Fluidd</a> UI prompt will appear when the nozzle has reached the specified temperature. Click the <b>"Park"</b> or <b>"Park & Cool"</b> button to dismiss the prompt when you are done cleaning.</figcaption>
</figure>

<div class="glightbox-desc nozzle-clean-desc">
<p>The Fluidd UI prompt will appear when the nozzle has reached the specified temperature.</p>
<p>Click the <b>"Park"</b> or <b>"Park & Cool"</b> button to dismiss the prompt when you are done cleaning.</p>
</div>

## :material-file-code-outline: G-code Macro

```cfg title="manual-nozzle-clean.cfg" linenums="1"
--8<-- "manual-nozzle-clean.cfg"
```