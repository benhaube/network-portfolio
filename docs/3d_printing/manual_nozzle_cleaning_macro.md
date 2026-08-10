---
icon: symbols/printer-3d-nozzle-brush
title: Nozzle Cleaning Macro
subtitle: Manually Clean Your Nozzle
description: A custom Gcode macro for manually cleaning your 3D-printer's nozzle.
hide:
  - toc
---

![Toothbrush Nozzle Icon](../assets/icons/printer-3d-nozzle-brush.svg){ width=200 }

# Nozzle Cleaning Macro

_Manually Clean Your Nozzle_

[Creality K1C&ensp;:symbols-printer-3d-nozzle:](../02_hardware/kacey_3d-printer.md){ .md-button .md-button--primary }&emsp;[Fluidd&ensp;:services-fluidd:](../03_services/fluidd.md){ .md-button .md-button--primary }

!!! info

    :symbols-calendar-clock:&ensp;**Date Implemented**

    - March 2026

    :symbols-file-text:&ensp;**Overview**

    - This custom macro set *(`CLEAN_NOZZLE`, `DONE_CLEANING`, and `DONE_CLEANING_COOL`)* creates an interactive, semi-automated workflow for manual nozzle maintenance.
    - It safely homes the axes, moves the toolhead to an accessible front-center position, and heats the nozzle to soften plastic debris.
    - It utilizes Klipper's `RESPOND` action commands to spawn a custom UI prompt in [Fluidd](../03_services/fluidd.md), pausing the workflow until the nozzle is physically cleaned with a silicone brush.
    - Once acknowledged via the UI, it safely cools the heater and parks the toolhead.

---

## :symbols-wrench:&ensp;Installation & Klipper Integration

1.  [ ] Establish an SSH connection to the printer and navigate to `/usr/data/printer_data/config`.
2.  [ ] Upload the newly edited `manual-nozzle-clean-v2.cfg` into this directory.
3.  [ ] Open `printer.cfg` and add the following line: `[include manual-nozzle-clean-v2.cfg]`
4.  [ ] Save the configuration and restart Klipper to apply the changes.

    ``` cfg { .mono-title title="printer.cfg" linenums="12" hl_lines="20" }
    --8<-- "printer.cfg:12:31"
    ```

## :symbols-toggle-right:&ensp;Trigger / Usage

!!! note inline end "Custom Temperature"

    Useful if you are switching between PLA and higher-temp materials like ABS / ASA.

#### Default Cleaning

- [ ] Trigger `CLEAN_NOZZLE` from your Fluidd dashboard or Guppy Screen macros list.
- [ ] The nozzle will heat to the default temperature _(__150&deg;C__)_.

#### Custom Temperature Cleaning

- [ ] You can specify a different temperature through the console by running `CLEAN_NOZZLE TEMP=200`

!!! note inline end "Completion"

    The `DONE_CLEANING` macro turns off the heater and parks the toolhead safely out of the way.

    The `DONE_CLEANING_COOL` macro turns off the heater, parks the toolhead safely out of the way, and cools the nozzle.

#### Completion

- [ ] Wait for the [Fluidd](../03_services/fluidd.md) UI prompt to appear.
- [ ] Scrub the nozzle with your silicone brush.
- [ ] Click the **"Park"** button to automatically trigger the `DONE_CLEANING` macro.
- [ ] Click the **"Park & Cool"** button to automatically trigger the `DONE_CLEANING_COOL` macro.

<figure markdown="span">
  ![Manual Nozzle Cleaning Macro Dialog](../assets/screenshots/nozzle-cleaning-macro-light.png#only-light){ .on-glb data-title="Manual Nozzle Cleaning Macro" data-description=".nozzle-clean-desc" }
  ![Manual Nozzle Cleaning Macro Dialog](../assets/screenshots/nozzle-cleaning-macro-dark.png#only-dark){ .on-glb data-title="Manual Nozzle Cleaning Macro" data-description=".nozzle-clean-desc" }
  <figcaption>The <a href="/03_Services/Fluidd.html">Fluidd</a> UI prompt will appear when the nozzle has reached the specified temperature. Click the <b>"Park"</b> or <b>"Park & Cool"</b> button to dismiss the prompt when you are done cleaning.</figcaption>
</figure>

<div class="glightbox-desc nozzle-clean-desc">
  <p>The Fluidd UI prompt will appear when the nozzle has reached the specified temperature.</p>
  <p>Click the <b>"Park"</b> or <b>"Park & Cool"</b> button to dismiss the prompt when you are done cleaning.</p>
</div>

---

## :symbols-file-code-corner:&ensp;G-code Macro

``` cfg { .mono-title title="manual-nozzle-clean-v2.cfg" linenums="1" }
--8<-- "manual-nozzle-clean.cfg"
```