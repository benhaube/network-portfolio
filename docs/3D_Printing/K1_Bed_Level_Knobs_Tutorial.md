---
hide:
  - toc
---
![[bed-knobs-mod-2.png|400]]

# [[K1_Bed_Level_Knobs_Tutorial|Manual Bed Leveling Mod]]

---
> [!info]
> The K1 series does NOT have automatic bed leveling! This upgrade allows you to fine tune your bed level using the `screws_tilt_calculate` command in Fluidd. This method is superior to tooth skipping and the Creality method. It's quick, easy and accurate.

> [!done] Purchased Parts
> The links below are for a complete kit, which is used on a lot of printers. It's possible to print knobs if you already have longer screws and springs.
> 
> + Order from [AliExpress](https://s.click.aliexpress.com/e/_oopAFjx). 
> + Order from [Amazon](https://amzn.to/4jkJ185).

> [!danger] Root Access Required
> This project requires you to use the helper script to make changes to the `printer.cfg` file *(located at `/usr/data/printer_data/config/`)* and run macros or commands through a Klipper interface such as Fluidd or Mainsail. On a Creality K1-Series printer, this requires root access. Read the links below for more information.
> + [Helper Script](https://guilouz.github.io/Creality-Helper-Script-Wiki/) guide.
> + [Root Access](https://www.3dphub.net/learn/root-access-quick-start-guide) quick guide

---
## :material-tools: Hardware Setup
> [!info]+
> If you plan to upgrade your bed to glass, aluminium or graphite, or if you want to increase your chamber temperature for ABS and ASA using bed fans, it is recommended to do these mods at the same time because they all require the first 8 steps.

> [!info]+ 
> If you have a graphite bed kit, you can print the knobs out of nylon and use the springs and screws that come with the kit *(using metal knobs is still recommended to avoid heat issues)*.

1. [ ] Home the printer.
2. [ ] Lower the bed ¾ of the way down, so that you have enough room to stand the bed up.
3. [ ] Shut down the power and disconnect the power.
4. [ ] You can optionally remove the side panels to make the process easier.
5. [ ] Slowly and gently move the toolhead to the side, so that you have enough room to work.

    > [!danger] Danger!
    > Moving the toolhead quickly generates back EMF that can damage your printer’s electronics.

6. [ ] Remove the build plate.
7. [ ] Remove the 4 screws from the bed.
8. [ ] Stand the bed up.

    > [!danger] Caution!
    > Take care not to put any stress on the wiring.

9. [ ] If you are using printed knobs, remove the black hexagonal spacers and drill them to 4.5mm if you aren’t using other spacers.
10. [ ] Put the bed springs in place of the spacers.
11. [ ] Optionally add Loctite 222 or 243 to the bottom third of the new screws to combat vibrations.
12. [ ] Working at one corner from above, put a screw back through the build plate and spring.
13. [ ] Put a spacer underneath the bed, with the screw coming through it.
14. [ ] Put a knob under the spacer, with the screw coming through it.

    > [!danger] Stop!
    > Don't tighten yet - just give it a few turns so it doesn't fall off.

15. [ ] Repeat for the other 3 corners, making sure the springs are straight.
16. [ ] Alternating between corners, tighten the knobs little by little to ensure even torque distribution.

    > [!info]
    > This prevents uneven stress warping the bed.

17. [ ] When it starts getting tight or bottoms out, back off a little so you have room for adjustment.

    > [!danger] Danger!
    > Do not overtighten if you are still using the factory load cells as it may cause damage or issues.

18. [ ] Place the build plate back on.

![[bed-knobs-mod-complete.jpg|400]]

---
## :material-chip: Firmware Setup
1. [ ] Turn the printer on.
2. [ ] SSH into the printer.

    > [!info]
    > If you don't know how to do this, refer to the [Root Access Guide](https://guilouz.github.io/Creality-Helper-Script-Wiki/firmwares/install-and-update-rooted-firmware-k1/#enable-root-access).

3. [ ] **Option 1:** Run the [helper script](https://guilouz.github.io/Creality-Helper-Script-Wiki/helper-script/helper-script-installation/) and install `13) Screws Tilt Adjust Support`

    > [!info]
    > This automatically modifies your printer.cfg file and adds a convenient macro you can click inside of Fluidd.

    **Option 2:** Add this to `printer.cfg`

    ```gcode title="K1/K1C/K1SE" linenums="1"
    [screws_tilt_adjust]
    screw1: 25,20
    screw1_name: left front
    screw2: 25,190
    screw2_name: left back
    screw3: 195,190
    screw3_name: right back
    screw4: 195,20
    screw4_name: right front
    speed: 100
    horizontal_move_z: 5
    screw_thread: CW-M4
    ```

    ```gcode title="K1 MAX" linenums="1"
    [screws_tilt_adjust]
    screw1: 21,21
    screw1_name: left front
    screw2: 48,270
    screw2_name: left back
    screw3: 250,270
    screw3_name: right back
    screw4: 279,21
    screw4_name: right front
    speed: 100
    horizontal_move_z: 5
    screw_thread: CW-M4
    ```

4. [ ] Save *(if you edited `printer.cfg`)* and restart the printer to apply the changes.

---
## :material-tooltip-question-outline: How to Use
1. [ ] Home the printer.
2. [ ] Preheat the bed to your normal bed temperature for 20 minutes *(60° C for PLA)*.

    > [!info]
    > + Factory beds change shape when heated - you need to wait for it to stabilize.
    > + You can skip this if you have a Graphite Bed Upgrade. 

3. [ ] Open up Fluidd or mainsail through Orca Slicer or by typing your printers IP address into your web browser with the appropriate port number appended.

    | Interface | Port |
    | :---------- | :----: |
    | Fluidd | `4408` |
    | Mainsail | `4409` |

4. [ ] In the Fluidd console, type `SCREWS_TILT_CALCULATE` or click the handy macro.
5. [ ] The printer will probe each corner and a message will pop up telling you how high or low the corners are relative to the front left corner. It will instruct you which direction *(looking at it from the top down)* and how far to turn each knob *(in minutes)*.

    > [!info]
    > 15 min = ¼ turn.

    In the image below, the back right corner is 0.1277mm lower than the front left, and to correct it, you would turn it 7 minutes clockwise *(looking at it from above)*, or roughly ⅛ of a turn.

    ![[screws-tilt-adjust.png|400]]

6. [ ] Click retry or repeat the command to check the new level.

    > [!info]
    > + Click retry or repeat the command to check the new level.
    > + With this method, it is possible to get each corner to the exact same level.

---
## :material-information-outline: Additional Info

> [!info]
> If your bed mesh looks warped compared to before you installed the knobs, loosen three screws, heat soak the bed and tighten again.

> [!info]
> Sometimes if you do the calibration a few times in a row, you will not get a popup. In this case, the output should be displayed in the console and you can simply restart the printer and fluidd to bring the popup back.

> [!warning] Warning!
> This process is only as accurate as your probe. To get an idea of how accurate your probe is, you can type `PROBE_ACCURACY`. 
> Most aftermarket probes are at least 10x more accurate than factory, and it is highly recommended to upgrade before doing this in order to get the best results and minimize the chances of issues.

> [!warning] Warning!
> If you are doing this with load cells *(factory probe)* and get a `key60` error *(Internal error command: `BEDMESH_CALIBRATE`)*.
> This may be due to too much pressure being applied to the load cells. Try backing off the knobs more and run `SCREWS_TILT_CALCULATE` again.

---
### :material-link-variant: References and Resources
+ [Screws Tilt Calculate Documentation](https://www.klipper3d.org/G-Codes.html?h=screws#screws_tilt_calculate)
+ [Manual Bed Leveling Documentation](https://www.klipper3d.org/Manual_Level.html#adjusting-bed-leveling-screws-using-the-bed-probe)
+ [Fluidd Access](https://guilouz.github.io/Creality-Helper-Script-Wiki/configurations/access-to-web-interface/)
