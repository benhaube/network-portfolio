---
icon: symbols/prowiper
title: PROWIPER Mod
subtitle: Improved Nozzle Brush Routine
hide:
  - toc
---
![Custom PROWIPER Mod Icon I made with Inkscape](../assets/icons/prowiper.svg){ width=200 }

# PROWIPER Mod
*Improved Nozzle Brush Routine*

[Creality K1C&ensp;:symbols-printer-3d-nozzle:](../02_hardware/kacey_3d-printer.md){ .md-button .md-button--primary }&emsp;[Fluidd&ensp;:services-fluidd:](../03_services/fluidd.md){ .md-button .md-button--primary }&emsp;[3DPHUB.net&ensp;:brands-3dphub:](https://3dphub.net){ .md-button .md-button--primary }

!!! info "PROWIPER Info"

    **Modifications:** 

    1. Upgraded bed leveling kit with aluminum spacers. 
    2. PROWIPER V5 Mount
 
    **Hardware Required:**

    3. Printed `v5-k1c-brush-mount-for-a1-brushes.stl` and `1mm-z-spacer-to-lift-the-wiper-mount.stl` *(in high-temp filament like ASA / ABS)*
   
        [Printables&ensp;:brands-printables:](https://printables.com/model/1023575-prowiper-for-creality-k1-series){ .md-button } 

    4. **Bambu A1** Silicone Brushes

        [Amazon&ensp;:brands-amazon:](https://www.amazon.com/dp/B0DRBZK7RZ){ .md-button }

    5. 2x **M3x16mm** self-tapping screws

        [Amazon&ensp;:brands-amazon:](https://www.amazon.com/dp/B0D9BBT81N){ .md-button }

---
## :symbols-file-pen:&ensp;Configuration File Edits

!!! warning inline end "Important"

    Before uploading the macro, modify `3DPHUB_PROWIPER.CFG` to account for the custom bed height and safe testing speeds.

#### Set the Mount Type 
  + [ ] Ensure `variable_brush_mount` is set to `"V5K1C"`.
#### Adjust for the Bed Spacer
  + [ ] Change `variable_spacer_height` to match the Z-height of the spacer being used. *(e.g., `4`)*
#### Tweak Testing Speeds:
  + [ ] Change `variable_speed` from the default `7500` to a safer `4000` or `5000`.
#### Disable Phantom Bed Fans
  + [ ] Change `variable_bed_fans_installed` to `"FALSE"` *(unless a specific `bed_fans` pin is defined in your main printer config)*.
#### Verify Bottom Clearance
  + [ ] Review `variable_bot_clearance` *(default `20`)* and `variable_drop_distance` *(default `15`)*. 

## :services-klipper:&ensp;Klipper Integration

!!! note inline end "Integration Note"

    The script automatically intercepts the stock `CX_NOZZLE_CLEAR` command, meaning standard print starts will natively utilize the new wiping sequence without further macro edits.

1. [ ] Establish an SSH connection to the printer and navigate to `/usr/data/printer_data/config`.
2. [ ] Upload the newly edited `3DPHUB_PROWIPER.CFG` into this directory.
3. [ ] Open `printer.cfg` and add the following line: `[include 3DPHUB_PROWIPER.cfg]`
4. [ ] Save and restart Klipper. 

    ```cfg {title="printer.cfg" linenums="12" hl_lines="19" .mono-title}
    --8<-- "printer.cfg:12:31"
    ```

## :symbols-ruler:&ensp;Slicer & Firmware Clearances

!!! info inline end "Clearance Info"

    Because the **V5 mount** is utilized instead of the low-profile **LPF2 mount**, a 10mm clearance zone is required to prevent the toolhead from striking the mount during printing or probing.

#### Klipper Mesh Clearance
  + [ ] In `printer.cfg`, locate the `[bed_mesh]` section. Reduce the Y-axis value of `mesh_max` by 10 *(e.g., change `220` to `210`)*.

    ```cfg {title="printer.cfg" linenums="350" hl_lines="4" .mono-title}
    --8<-- "printer.cfg:350:356"
    ```

#### Slicer Clearance
  + [ ] In the slicer's printer settings, change the **Excluded bed area** to: `70x210, 150x210, 150x220, 70x220`.

<figure markdown="span">
![Excluded Bed Area](../assets/screenshots/printable-area-light.png#only-light){ .on-glb width=700 data-title="Printable Area Settings" data-description=".printable-area-desc" }
![Excluded Bed Area](../assets/screenshots/printable-area-dark.png#only-dark){ .on-glb width=700 data-title="Printable Area Settings" data-description=".printable-area-desc" }
<figcaption><b>OrcaSlicer v2.3.2:</b> printer settings screenshot, showing the "Excluded bed area" setting field.</figcaption>
</figure>
      
<div class="glightbox-desc printable-area-desc">
<p><b>OrcaSlicer v2.3.2:</b> printer settings screenshot, showing the "Excluded bed area" setting field.</p>
</div>

## :symbols-toggle-right:&ensp;Dry Run 
&emsp;&emsp;&ensp;*Critical Safety Step*

!!! warning inline end "Caution"

    **Do not install the physical hardware yet.**

1. [ ] Ensure the build plate is completely empty.
2. [ ] Trigger the `WIPE_NOZZLE` macro via Fluidd or Guppy Screen.
3. [ ] Observe the toolhead to verify it moves to the correct coordinates safely without risking a collision.

## :symbols-wrench:&ensp;Physical Installation

1. [ ] Lower the build plate halfway down the Z-axis to create working room.
2. [ ] Drop the A1 brush into the slot
3. [ ] Using a **2mm hex driver** and the **M3x12mm** self-tapping screws, install the spacer and the V5 brush mount into the two existing holes at the back of the Z-axis.

## :symbols-badge-check:&ensp;Final Verification

+ [ ] Use a ruler to visually confirm there is exactly a 1.0 mm gap between the bottom of the printed wiper mount and the build plate. 

---

## :symbols-file-code-corner:&ensp;PROWIPER G-Code

```cfg {title="3DPHUB_PROWIPER.cfg" linenums="1" hl_lines="43 58" .mono-title}
--8<-- "3dhub_prowiper.cfg"
```