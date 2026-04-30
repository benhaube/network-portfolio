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
    + [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): Local Network :material-arrow-right-thin: "Fluidd @ K1C-A71E" 

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
# K1C
# Printer_size: 220x220x250
# Version: v2.0.5
# CreateDate: 2023/09/05
# Nozzle_mcu: chip: GD32F303CBT6
#             version: CR-K1-MAX-NOZZLE-V1.2.0
# Leveling_mcu: chip: GD32E230F8P6
#             version: CR-K1-MAX-LEVELING-V1.1.0
# mcu: chip: GD32F303RET6
#      version: CR4CU220812S12

[virtual_pins]
[include sensorless.cfg]
[include gcode_macro.cfg]
[include printer_params.cfg]
[include Helper-Script/buzzer-support.cfg]
[include Helper-Script/git-backup.cfg]
[include GuppyScreen/*.cfg]
[include Helper-Script/camera-settings.cfg]
[include Helper-Script/timelapse.cfg]
# [include Helper-Script/M600-support.cfg]
[include M600-custom.cfg]
[include Helper-Script/screws-tilt-adjust.cfg]
[include Helper-Script/save-zoffset.cfg]
[include Helper-Script/useful-macros.cfg]
[include Helper-Script/fans-control.cfg]
[include Helper-Script/nozzle-cleaning-fan-control.cfg]
[include Helper-Script/KAMP/KAMP_Settings.cfg]
[include spoolman.cfg]
[include 3DPHUB_PROWIPER.cfg]
[include manual-nozzle-clean-v2.cfg]

[mcu]
serial: /dev/ttyS7
baud: 230400
restart_method: command

[mcu nozzle_mcu]
serial: /dev/ttyS1
baud: 230400
restart_method: command

[mcu leveling_mcu]
serial: /dev/ttyS9
baud: 230400
restart_method: command

[verify_heater extruder]
[verify_heater heater_bed]
check_gain_time: 120
heating_gain: 1.0
hysteresis: 10

[mcu rpi]
serial: /tmp/klipper_host_mcu

[bl24c16f]
i2c_mcu: rpi
i2c_bus: i2c.2
i2c_speed: 400000

[idle_timeout]
timeout: 3600

[virtual_sdcard]
path: /usr/data/printer_data/gcodes

[gcode_arcs]
resolution: 1.0

[temperature_sensor mcu_temp]
sensor_type: temperature_mcu
min_temp: 0
max_temp: 100

[temperature_sensor chamber_temp]
sensor_type: EPCOS 100K B57560G104F
sensor_pin: PC5
min_temp: 0
max_temp: 125

#[duplicate_pin_override]
#pins: PC0, PC5

#[temperature_fan chamber_fan]
#pin: PC0
#cycle_time: 0.0100
#hardware_pwm: false
#max_power: 1
#shutdown_speed: 0
#sensor_type: EPCOS 100K B57560G104F
#sensor_pin: PC5
#min_temp: 0
#max_temp: 70
#control: watermark
#max_delta: 2
#target_temp: 35.0
#max_speed: 1.0
#min_speed: 0.0

[stepper_x]
step_pin: PC2
dir_pin: !PB9
enable_pin: !PC3
microsteps: 32
rotation_distance: 40
endstop_pin: tmc2209_stepper_x:virtual_endstop
position_endstop: 229
position_min: -5
position_max: 229
homing_speed: 30
homing_retract_dist:0

[tmc2209 stepper_x]
uart_pin:PA9
interpolate: True
run_current:1.5
hold_current:1.0
sense_resistor: 0.100
stealthchop_threshold: 0
uart_address:3
diag_pin: ^PB12
# driver_IHOLDDELAY: 8
# driver_TPOWERDOWN: 20
# driver_TBL: 1
# driver_TOFF: 1
# driver_HEND: 0
# driver_HSTRT: 7
driver_SGTHRS: 75

[stepper_y]
step_pin: PB8
dir_pin: !PB7
enable_pin: !PC3
microsteps: 32
rotation_distance: 40
endstop_pin: tmc2209_stepper_y:virtual_endstop
position_endstop: -0.5
position_min: -0.5
position_max: 227
homing_speed: 30
homing_retract_dist:0

[tmc2209 stepper_y]
uart_pin:PA10
interpolate: True
run_current:1.5
hold_current:1.0
sense_resistor: 0.100
stealthchop_threshold: 0
uart_address:3
diag_pin: ^PB13
# driver_IHOLDDELAY: 8
# driver_TPOWERDOWN: 20
# driver_TBL: 1
# driver_TOFF: 1
# driver_HEND: 0
# driver_HSTRT: 7
driver_SGTHRS: 75

[stepper_z]
step_pin: PB6
dir_pin: !PB5
enable_pin: !PC3
microsteps: 16
rotation_distance:8
gear_ratio: 64:20
endstop_pin: tmc2209_stepper_z:virtual_endstop# PA15   #probe:z_virtual_endstop
#position_endstop: 0
position_max: 255
position_min: -5

[tmc2209 stepper_z]
uart_pin: PA11
uart_address: 3
run_current: 0.8
diag_pin: ^PB14
stealthchop_threshold: 0
sense_resistor: 0.100
# driver_IHOLDDELAY: 8
# driver_TPOWERDOWN: 20
# driver_TBL: 1
# driver_TOFF: 1
# driver_HEND: 2
# driver_HSTRT: 2
driver_SGTHRS: 0

[extruder]
max_extrude_only_distance: 1000.0
max_extrude_cross_section: 80
step_pin: nozzle_mcu:PB1
dir_pin: nozzle_mcu:PB0
enable_pin: !nozzle_mcu:PB2
microsteps: 16
rotation_distance: 6.9
nozzle_diameter: 0.400
filament_diameter: 1.750
heater_pin: nozzle_mcu:PB7
sensor_type: EPCOS 100K B57560G104F
sensor_pin: nozzle_mcu:PA0
pressure_advance: 0.04
pressure_advance_smooth_time: 0.040
#control: pid
#pid_Kp: 25.013
#pid_Ki: 2.566
#pid_Kd: 60.966
min_temp: 0
max_temp: 320

[tmc2209 extruder]
uart_pin: nozzle_mcu:PB11
tx_pin: nozzle_mcu:PB10

uart_address: 3
run_current: 0.55
sense_resistor: 0.150
stealthchop_threshold: 0
# driver_IHOLDDELAY: 8
# driver_TPOWERDOWN: 20
# driver_TBL: 2
# driver_TOFF: 3
# driver_HEND: 0
# driver_HSTRT: 5

[heater_bed]
heater_pin: PB10
sensor_type: EPCOS 100K B57560G104F
sensor_pin: PC4
#control: watermark
# control: pid
# pid_kp: 27
# pid_ki: 0.08
# pid_kd: 0
min_temp: 0
max_temp: 115

#[filament_switch_sensor filament_sensor]
#pause_on_runout: true
#switch_pin: !PC15
#runout_gcode:
#  {% if printer.extruder.can_extrude|lower == 'true' %}
#    G91
#    G0 E30 F600
#    G90
#  {% endif %}

[filament_switch_sensor filament_sensor_2]
pause_on_runout: true
switch_pin: !nozzle_mcu:PA10

[multi_pin heater_fans]
pins:nozzle_mcu:PB5,PB2

[heater_fan hotend_fan]
pin: multi_pin:heater_fans
heater: extruder
heater_temp: 40

[static_digital_output my_fan_output_pins]
pins: nozzle_mcu: PB6

[output_pin fan0]
pin: !nozzle_mcu: PB8
pwm: True
cycle_time: 0.0100
hardware_pwm: false
value: 0.00
scale: 255
shutdown_value: 0.0

[output_pin fan1]
pin: PC0
pwm: True
cycle_time: 0.0100
hardware_pwm: false
value: 0.00
scale: 255
shutdown_value: 0.0

[output_pin fan2]
pin: PB1
pwm: True
cycle_time: 0.0100
hardware_pwm: false
value: 0.00
scale: 255
shutdown_value: 0.0

[output_pin LED]
pin:PB0
pwm: True
cycle_time: 0.010
value: 1

[adxl345]
cs_pin: nozzle_mcu:PA4
spi_speed: 5000000
axes_map: x,-z,y
spi_software_sclk_pin: nozzle_mcu:PA5
spi_software_mosi_pin: nozzle_mcu:PA7
spi_software_miso_pin: nozzle_mcu:PA6

[resonance_tester]
accel_chip: adxl345
accel_per_hz: 75
# min_freq: 30
# max_freq: 100
probe_points:
   110,110,10

[prtouch_v2]  # K1
pr_version: 1
step_base: 2
z_offset: 0 
noz_ex_com: 0.06
tilt_corr_dis: 0
tri_min_hold: 2500
tri_max_hold: 6000
pres_cnt: 4
pres0_clk_pins: leveling_mcu:PA5
pres0_sdo_pins: leveling_mcu:PA1
pres1_clk_pins: leveling_mcu:PA2
pres1_sdo_pins: leveling_mcu:PA0
pres2_clk_pins: leveling_mcu:PA6
pres2_sdo_pins: leveling_mcu:PA3
pres3_clk_pins: leveling_mcu:PA7
pres3_sdo_pins: leveling_mcu:PA4
show_msg: False
step_swap_pin: PC10
pres_swap_pin: leveling_mcu:PB1
g28_wait_cool_down: true
pa_clr_down_mm: -0.15
clr_noz_start_x: 87
clr_noz_start_y: 225
clr_noz_len_x: 46
clr_noz_len_y: 1
speeds: 2.5,1.0
tri_hftr_cut: 2,1
tri_lftr_k1: 0.70,0.30
tri_try_max_times: 10
tri_min_hold: 2500,20000
tri_max_hold: 6000,60000

clr_noz_quick: true
clr_quick_high:0.7
clr_xy_quick_spd:100
clr_quick_times:10
clr_quick_react_dis:5

[bed_mesh]
speed: 150
mesh_min: 5,5
mesh_max: 215,210
probe_count: 5,5
fade_start: 5.0
fade_end: 50.0

[display_status]

[printer]
kinematics: corexy
max_velocity: 600
max_accel: 20000
max_accel_to_decel: 20000
max_z_velocity: 10
square_corner_velocity: 5.0
max_z_accel: 300
square_corner_max_velocity: 200.0
[pause_resume]
# recover_velocity: 500.

[exclude_object]

#*# <---------------------- SAVE_CONFIG ---------------------->
#*# DO NOT EDIT THIS BLOCK OR BELOW. The contents are auto-generated.
#*#
#*# [input_shaper]
#*# shaper_type_x = zv
#*# shaper_freq_x = 71.7
#*# shaper_type_y = zv
#*# shaper_freq_y = 59.7
#*#
#*# [bed_mesh default]
#*# version = 1
#*# points =
#*# 	-0.027844, -0.061966, -0.059062, -0.103312, -0.066938
#*# 	0.032596, -0.008750, -0.000937, -0.015531, -0.010125
#*# 	0.091250, 0.073563, 0.073167, 0.021000, 0.049187
#*# 	-0.031937, -0.044500, -0.012156, -0.021281, 0.019031
#*# 	-0.031594, -0.044531, 0.006048, -0.001028, 0.019125
#*# x_count = 5
#*# y_count = 5
#*# mesh_x_pps = 2
#*# mesh_y_pps = 2
#*# algo = lagrange
#*# tension = 0.2
#*# min_x = 5.0
#*# max_x = 215.0
#*# min_y = 5.0
#*# max_y = 210.0
#*#
#*# [bed_mesh adaptive]
#*# version = 1
#*# points =
#*# 	0.051375, 0.025625, 0.023616
#*# 	0.027094, 0.074017, 0.005656
#*# 	0.007875, 0.041813, -0.040177
#*# x_count = 3
#*# y_count = 3
#*# mesh_x_pps = 2
#*# mesh_y_pps = 2
#*# algo = lagrange
#*# tension = 0.2
#*# min_x = 79.78
#*# max_x = 140.2
#*# min_y = 77.65
#*# max_y = 142.33
#*#
#*# [prtouch_v2]
#*#
#*# [stepper_z]
#*# position_endstop = -0.125
#*#
#*# [extruder]
#*# control = pid
#*# pid_kp = 25.835
#*# pid_ki = 2.610
#*# pid_kd = 63.941
#*#
#*# [heater_bed]
#*# control = pid
#*# pid_kp = 67.831
#*# pid_ki = 1.391
#*# pid_kd = 826.686
```

```cfg title="printer_params.cfg" linenums="1"
# K1C
# Printer_size: 220x220x250
# Version: v1.0.0
# CreateDate: 2023/09/05
# Nozzle_mcu: chip: GD32F303CBT6
#             version: CR-K1-MAX-NOZZLE-V1.2.0
# Leveling_mcu: chip: GD32E230F8P6
#             version: CR-K1-MAX-LEVELING-V1.1.0
# mcu: chip: GD32F303RET6
#      version: CR4CU220812S12

[fan_feedback]
# fan0_pin: nozzle_mcu:PB3 # model fan
fan0_pin: nozzle_mcu:PB4 # throat fan
fan1_pin: PC6 # backplane fan
print_delay_time: 5
current_delay_time: 2

[custom_macro]
default_bed_temp: 50
default_extruder_temp: 240
g28_ext_temp: 140

# 产品定义参数
[gcode_macro product_param]
# 模型成型尺寸
variable_bed_size_x: 220
variable_bed_size_y: 220
variable_bed_size_z: 220
# 支持最高温度
variable_nozzle_temp: 300
variable_bed_temp: 100
variable_chamber_temp: 60
gcode:
```

```cfg title="moonraker.conf" linenums="1"
[server]
host: 0.0.0.0
port: 7125
klippy_uds_address: /tmp/klippy_uds
max_upload_size: 2048

[file_manager]
queue_gcode_uploads: False
enable_object_processing: True

[database]

[data_store]
temperature_store_size: 600
gcode_store_size: 1000

[machine]
provider: supervisord_cli
validate_service: False
validate_config: True

[authorization]
force_logins: False
cors_domains:
  *.internal
  *.lan
  *.local
  *://localhost
  *://localhost:*
  *://my.mainsail.xyz
  *://app.fluidd.xyz

trusted_clients:
  127.0.0.0/8

[octoprint_compat]

[history]

[update_manager]
enable_auto_refresh: True
refresh_interval: 24
enable_system_updates: False

# Remove '#' after this line to keep Creality Helper Script up to date
[update_manager Creality-Helper-Script]
type: git_repo
channel: dev
path: /usr/data/helper-script
origin: https://github.com/Guilouz/Creality-Helper-Script.git
primary_branch: main
managed_services: klipper

# Remove '#' after this line to enable camera configuration with Moonraker and replace 'xxx.xxx.xxx.xxx' by your IP addresses
# [webcam Camera]
# location: printer
# enabled: True
# service: mjpegstreamer
# target_fps: 15
# target_fps_idle: 5
# stream_url: http://192.168.50.153:8080/?action=stream
# snapshot_url: http://192.168.50.153:8080/?action=snapshot
# flip_horizontal: False
# flip_vertical: False
# rotation: 0
#aspect_ratio: 4:3

# Remove '#' after this line if you use Timelapse function and replace port '4408' by '4409' in snapshoturl if you use Mainsail
[timelapse]
output_path: /usr/data/printer_data/timelapse/
frame_path: /usr/data/printer_data/frames/
ffmpeg_binary_path: /opt/bin/ffmpeg
snapshoturl: http://localhost:8080/?action=snapshot

# Remove '#' after this line if you use Fluidd
[update_manager fluidd]
type: web
channel: beta
repo: fluidd-core/fluidd
path: /usr/data/fluidd

# Remove '#' after this line if you use Mainsail
#[update_manager mainsail]
#type: web
#channel: beta
#repo: mainsail-crew/mainsail
#path: /usr/data/mainsail

# Remove '#' after this line if you use Mobileraker Companion
[update_manager mobileraker]
type: git_repo
path: /usr/data/mobileraker_companion
origin: https://github.com/Clon1998/mobileraker_companion.git
virtualenv: /usr/data/mobileraker-env
primary_branch:main
requirements: scripts/mobileraker-requirements.txt
install_script: scripts/install.sh
managed_services: mobileraker

[spoolman]
server: http://192.168.50.4:7912
#   URL to the Spoolman instance. This parameter must be provided.
sync_rate: 5
#   The interval, in seconds, between sync requests with the
#   Spoolman server.  The default is 5.

[include octoeverywhere-system.cfg]
```

```cfg title="octoeverywhere-system.cfg" linenums="1"
[update_manager octoeverywhere]
type: git_repo
# Using `channel: beta` makes moonraker only update to the lasted tagged commit on the branch. Which lets us control releases.
channel: beta
path: /usr/data/octoeverywhere
origin: https://github.com/QuinnDamerell/OctoPrint-OctoEverywhere.git
# env is deprecated for virtualenv, but for now we can only use one and must use the older option for compat.
env: /usr/data/octoeverywhere-env/bin/python
#virtualenv: /usr/data/octoeverywhere-env
# requirements is deprecated for system_dependencies, but for now we can only use one and must use the older option for compat.
requirements: requirements.txt
# system_dependencies: moonraker-system-dependencies.json
install_script: install.sh
managed_services:
  octoeverywhere

# This allows users of OctoEverywhere to get announcements from the system.
[announcements]
subscriptions:
    octoeverywhere
```

```gcode title="sesorless.cfg" linenums="1"
[force_move]
    enable_force_move: true

[gcode_macro xyz_ready]
variable_x_ready: 0
variable_y_ready: 0
variable_z_ready: 0
variable_xy_moved: 0
variable_z_moved: 0
variable_safe_z: 3
gcode:

[gcode_macro _IF_HOME_Z]
gcode:
  {% if printer['gcode_macro xyz_ready'].z_ready|int == 1 %}
    {% if printer.toolhead.position.z|int < 5 %}
      {% set z_park = 5.0 - printer.toolhead.position.z|int %}
      G91
      G1 z{z_park} F600
      G90
    {% endif %}
  {% else %}
    {% if printer['gcode_macro xyz_ready'].z_moved|int == 0 %}
      {% if printer.print_stats.z_pos|float <= 20.0 or printer.print_stats.power_loss == 1 %}
        FORCE_MOVE STEPPER=stepper_z DISTANCE={printer["gcode_macro PRINTER_PARAM"].z_safe_g28} VELOCITY=10
      {% else %}
        FORCE_MOVE STEPPER=stepper_z DISTANCE=0.1 VELOCITY=10
      {% endif %}
      SET_GCODE_VARIABLE MACRO=xyz_ready VARIABLE=z_moved VALUE=1
    {% endif %}
  {% endif %}

[gcode_macro _IF_MOVE_XY]
gcode:
  _IF_HOME_Z
  {% if printer['gcode_macro xyz_ready'].xy_moved|int == 0 %}
    {action_respond_info("move xy\n")}
    # FORCE_MOVE STEPPER=stepper_x DISTANCE=14 VELOCITY=50
    FORCE_MOVE STEPPER=stepper_y DISTANCE=-14 VELOCITY=50
    FORCE_MOVE STEPPER=stepper_y DISTANCE=7 VELOCITY=50
    SET_GCODE_VARIABLE MACRO=xyz_ready VARIABLE=xy_moved VALUE=1
    G4 P1000
  {% endif %}

[gcode_macro _HOME_X]
gcode:
  _IF_MOVE_XY

  {% if printer['gcode_macro xyz_ready'].x_ready|int == 1 %}
    {% if (printer.configfile.settings['stepper_x'].position_max - printer.toolhead.position.x)|round < 10 %}
      {% set x_park = (10 - (printer.configfile.settings['stepper_x'].position_max - printer.toolhead.position.x))|round %}
      {% if x_park > 0 %}
        G91
        G1 x-{x_park} F3600
        G90
        G4 P1000
      {% endif %}
    {% endif %}
  {% endif %}
  
  # SET_TMC_FIELD FIELD=SGTHRS STEPPER=stepper_y VALUE=70
  # SET_TMC_FIELD FIELD=SGTHRS STEPPER=stepper_x VALUE=70
  # Home
  G28 X
  SET_GCODE_VARIABLE MACRO=xyz_ready VARIABLE=x_ready VALUE=1
  # Move away
  G91
  G1 x-10 F3600
  G90
  # Wait just a second (give StallGuard registers time to clear)
  G4 P2000

[gcode_macro _HOME_Y]
gcode:
  _IF_MOVE_XY

  {% if printer['gcode_macro xyz_ready'].y_ready|int == 1 %}
    {% if printer.toolhead.position.y|round < 9 %}
      {% set y_park = 9 - printer.toolhead.position.y|round %}
      {% if y_park > 0 %}
        G91
        G1 y{y_park} F3600
        G90
        G4 P1000
      {% endif %}
    {% endif %}
  {% endif %}

  # SET_TMC_FIELD FIELD=SGTHRS STEPPER=stepper_y VALUE=60
  # SET_TMC_FIELD FIELD=SGTHRS STEPPER=stepper_x VALUE=60
  # Home
  G28 Y
  SET_GCODE_VARIABLE MACRO=xyz_ready VARIABLE=y_ready VALUE=1
  # Move away
  G91
  G1 y10 F3600
  G90
  # Wait just a second (give StallGuard registers time to clear)
  G4 P2000

[gcode_macro _HOME_Z]
gcode:
  {% if printer['gcode_macro xyz_ready'].y_ready|int == 1 %}
    {% if printer['gcode_macro xyz_ready'].x_ready|int == 1 %}
      _IF_HOME_Z
    {% endif %}
  {% endif %}
  {% if printer.print_stats.z_pos|float >= 210.0 %}
    FORCE_MOVE STEPPER=stepper_z DISTANCE=-8 VELOCITY=10
  {% endif %}

  {% set POSITION_X = printer.configfile.settings['stepper_x'].position_max/2 %}
  {% set POSITION_Y = printer.configfile.settings['stepper_y'].position_max/2 %}
  # BED_MESH_SET_DISABLE
  G91
  {% set x_park = POSITION_X - printer.toolhead.position.x|int %}
  {% set y_park = POSITION_Y - printer.toolhead.position.y|int %}
  {action_respond_info("x_park = %s \n" % (x_park))}
  {action_respond_info("y_park = %s \n" % (y_park))}
  G1 x{x_park} y{y_park} F3600
  G90
  # G4 P500

  G28 Z
  SET_GCODE_VARIABLE MACRO=xyz_ready VARIABLE=z_ready VALUE=1
  # BED_MESH_SET_ENABLE

[homing_override]
axes: xyz
# set_position_x: 0
# set_position_y: 0
# set_position_z:0
gcode:
  M220 S100
  # SET_TMC_FIELD STEPPER=stepper_x FIELD=en_spreadcycle VALUE=0
  # SET_TMC_FIELD STEPPER=stepper_y FIELD=en_spreadcycle VALUE=0
  # BED_MESH_CLEAR
  {% set x_axes = printer.toolhead.homed_axes %}
  {% if x_axes is defined and x_axes[0] is defined %}
    {action_respond_info(
        "x_axes: %s \n"
        % (x_axes))}
  {% else %}
    SET_GCODE_VARIABLE MACRO=xyz_ready VARIABLE=x_ready VALUE=0
    SET_GCODE_VARIABLE MACRO=xyz_ready VARIABLE=y_ready VALUE=0
    SET_GCODE_VARIABLE MACRO=xyz_ready VARIABLE=z_ready VALUE=0
    SET_GCODE_VARIABLE MACRO=xyz_ready VARIABLE=xy_moved VALUE=0
    SET_GCODE_VARIABLE MACRO=xyz_ready VARIABLE=z_moved VALUE=0
    {action_respond_info(
        "x_axes is NULL\n")}
  {% endif %}

  {% if x_axes is not defined or x_axes[2] is not defined %}
    BED_MESH_CLEAR
  {% endif %}
  
  {% if x_axes is defined and x_axes[0] is defined and x_axes[1] is defined %}
    {action_respond_info("x_axes: %s \n"% (x_axes))}
    {% set position_y = printer.toolhead.position.y|int %}
    {% set max_y_position = printer["gcode_macro PRINTER_PARAM"].max_y_position|int %}
    {% if position_y >= max_y_position %}
      G91
      G0 Y-10 F3600
      G90
    {% endif %}
  {% endif %}

  {% set home_all = 'X' not in params and 'Y' not in params %}
  {% if 'Z' in params and 'X' not in params and 'Y' not in params %}
    {% if x_axes[0] is defined and x_axes[1] is defined %}
      {% set home_all = 0 %}
    {% endif %}
  {% endif %}

  {% if home_all or 'X' in params %}
    _HOME_X
  {% endif %}

  {% if home_all or 'Y' in params %}
    _HOME_Y
  {% endif %}

  {% if home_all or 'X' in params %}
    _HOME_X
  {% endif %}

  {% if home_all or 'Y' in params %}
    _HOME_Y
  {% endif %}

  {% if home_all or 'Z' in params %}
    _HOME_Z
  {% endif %}
  BED_MESH_PROFILE LOAD="default"
  # SET_TMC_FIELD STEPPER=stepper_x FIELD=en_spreadcycle VALUE=1
  # SET_TMC_FIELD STEPPER=stepper_y FIELD=en_spreadcycle VALUE=1
  # SET_TMC_FIELD FIELD=SGTHRS STEPPER=stepper_x VALUE=0
  # SET_TMC_FIELD FIELD=SGTHRS STEPPER=stepper_y VALUE=0
  G4 P500
```

```gcode title="M600-custom.cfg" linenums="1"
########################################
# M600 Support
########################################

[respond]

[idle_timeout]
gcode:
  {% if printer["gcode_macro M600"].m600_state == 1 %}
    RESPOND TYPE=command MSG="Stopping hotend heating..."
    M104 S0
  {% else %}
    TURN_OFF_HEATERS
    M84
  {% endif %}
timeout: 1800


[filament_switch_sensor filament_sensor]
pause_on_runout: false
switch_pin: !PC15
runout_gcode:
  M600


[gcode_macro _UNLOAD_FILAMENT]
gcode:
  RESTORE_E_CURRENT
  M109 S{printer['gcode_macro PRINTER_PARAM'].hotend_temp|int}
  RESPOND TYPE=command MSG="Unloading filament..."
  M83
  G1 E10 F300
  G1 E-15 F3000
  G1 E-22.4700 F2400
  G1 E-6.4200 F1200
  G1 E-3.2100 F720
  G1 E5.0000 F356
  G1 E-5.0000 F384
  G1 E5.0000 F412
  G1 E-5.0000 F440
  G1 E5.0000 F467
  G1 E-5.0000 F495
  G1 E5.0000 F523
  G1 E-5.0000 F3000
  G1 E-15 F3000
  SET_E_MIN_CURRENT


[gcode_macro _LOAD_FILAMENT]
gcode:
  RESTORE_E_CURRENT
  M109 S{printer['gcode_macro PRINTER_PARAM'].hotend_temp|int}
  RESPOND TYPE=command MSG="Loading filament..."
  G91
  G1 E100 F180
  G90
  M400
  SET_E_MIN_CURRENT


[gcode_macro _PURGE_MORE]
gcode:
  RESTORE_E_CURRENT
  M109 S{printer['gcode_macro PRINTER_PARAM'].hotend_temp|int}
  RESPOND TYPE=command MSG="Purging filament..."
  G91
  G1 E10 F180
  G90
  M400
  SET_E_MIN_CURRENT


[gcode_macro M600]
description: Filament Change
variable_m600_state: 0
variable_fan0_speed: 0
gcode:
  {% set E = printer["gcode_macro PAUSE"].extrude|float %}
  # {% set y_park = printer.toolhead.axis_minimum.y|float + 5.0 %}
  # CHANGE: Set Y park to the middle (max / 2) instead of minimum + 5
  {% set y_park = printer.toolhead.axis_maximum.y / 2 %}
  {% set x_park = printer.toolhead.axis_maximum.x|float - 10.0 %}
  {% set max_z = printer["gcode_macro PRINTER_PARAM"].max_z_position|float %}
  {% set act_z = printer.toolhead.position.z|float %}
  {% set z_safe = 0.0 %}
  {% if act_z < 48.0 %}
    {% set z_safe = 50.0 - act_z %}
  {% elif act_z < (max_z - 2.0) %}
    {% set z_safe = 2.0 %}
  {% elif act_z < max_z %}
    {% set z_safe = max_z - act_z %}
  {% endif %}
  {action_respond_info("z_safe = %s"% (z_safe))}
  SET_GCODE_VARIABLE MACRO=M600 VARIABLE=m600_state VALUE=1
  SET_GCODE_VARIABLE MACRO=PRINTER_PARAM VARIABLE=hotend_temp VALUE={printer.extruder.target}
  SET_GCODE_VARIABLE MACRO=PRINTER_PARAM VARIABLE=z_safe_pause VALUE={z_safe|float}
  RESPOND TYPE=command MSG="Print paused for filament change!"
  PAUSE_BASE
  G91
  {% if "xyz" in printer.toolhead.homed_axes %}
    {% if printer.extruder.can_extrude|lower == 'true' %}
      G1 E-1.0 F180
      G1 E-{E} F4000
    {% else %}
      RESPOND TYPE=command MSG="Extruder not hot enough!"
    {% endif %}
    G1 Z{z_safe} F600
    M400
    G90
    G1 X{x_park} Y{y_park} F30000
  {% endif %}
  _UNLOAD_FILAMENT
  SET_GCODE_VARIABLE MACRO=PRINTER_PARAM VARIABLE=fan2_speed VALUE={printer['output_pin fan2'].value}
  SET_GCODE_VARIABLE MACRO=M600 VARIABLE=fan0_speed VALUE={printer['output_pin fan0'].value}
  M106 P0 S0
  M106 P2 S0
  SET_IDLE_TIMEOUT TIMEOUT=900
  SET_E_MIN_CURRENT
  RESPOND TYPE=command MSG="action:prompt_begin Filament change detected!"
  RESPOND TYPE=command MSG="action:prompt_text A necessary filament change has been detected. Please replace filament, LOAD it and click RESUME button."
  RESPOND TYPE=command MSG="action:prompt_button UNLOAD FILAMENT|_UNLOAD_FILAMENT|secondary"
  RESPOND TYPE=command MSG="action:prompt_button LOAD FILAMENT|_LOAD_FILAMENT|secondary"
  RESPOND TYPE=command MSG="action:prompt_button PURGE MORE FILAMENT|_PURGE_MORE|secondary"
  RESPOND TYPE=command MSG="action:prompt_footer_button CANCEL PRINT|CANCEL_PRINT|error"
  RESPOND TYPE=command MSG="action:prompt_footer_button IGNORE|RESPOND TYPE=command MSG=action:prompt_end|warning"
  RESPOND TYPE=command MSG="action:prompt_footer_button RESUME|RESUME|primary"
  RESPOND TYPE=command MSG="action:prompt_show"


[gcode_macro RESUME]
description: Resume the current print
rename_existing: RESUME_BASE
gcode:
  RESTORE_E_CURRENT
  {% if printer['gcode_macro PRINTER_PARAM'].hotend_temp|int != 0 %}
    {% if printer['gcode_macro PRINTER_PARAM'].hotend_temp|int > printer.extruder.temperature %}
      RESPOND TYPE=command MSG="Starting hotend heating..."
      M109 S{printer['gcode_macro PRINTER_PARAM'].hotend_temp|int}
    {% else %}
      RESPOND TYPE=command MSG="Starting hotend heating..."
      M104 S{printer['gcode_macro PRINTER_PARAM'].hotend_temp|int}
    {% endif %}
    SET_GCODE_VARIABLE MACRO=PRINTER_PARAM VARIABLE=hotend_temp VALUE=0
  {% endif %}
  {% if printer['gcode_macro PRINTER_PARAM'].fan2_speed > 0 %}
    {% set s_value = (printer['gcode_macro PRINTER_PARAM'].fan2_speed * 255 - printer['gcode_macro PRINTER_PARAM'].fan2_min) * 255 / (255 - printer['gcode_macro PRINTER_PARAM'].fan2_min)|float %}
    M106 P2 S{s_value}
  {% endif %}
  {% if printer['gcode_macro M600'].m600_state != 1 %}
    {% set z_resume_move = printer['gcode_macro PRINTER_PARAM'].z_safe_pause|int %}
    {% if z_resume_move > 2 %}
      {% set z_resume_move = z_resume_move - 2 %}
      G91
      G1 Z-{z_resume_move} F600
      M400
    {% endif %}
  {% endif %}
  {% set E = printer["gcode_macro PAUSE"].extrude|float + 1.0 %}
  {% if 'VELOCITY' in params|upper %}
    {% set get_params = ('VELOCITY=' + params.VELOCITY) %}
  {%else %}
    {% set get_params = "" %}
  {% endif %}
  {% if printer["gcode_macro M600"].m600_state == 1 %}
    {% if printer['gcode_macro M600'].fan0_speed > 0 %}
      {% set s_value = (printer['gcode_macro M600'].fan0_speed * 255 - printer['gcode_macro PRINTER_PARAM'].fan0_min) * 255 / (255 - printer['gcode_macro PRINTER_PARAM'].fan0_min)|float %}
      M106 P0 S{s_value}
      SET_GCODE_VARIABLE MACRO=M600 VARIABLE=fan0_speed VALUE=0
    {% endif %}
    SET_GCODE_VARIABLE MACRO=M600 VARIABLE=m600_state VALUE=0
    SET_IDLE_TIMEOUT TIMEOUT=1800
    RESPOND TYPE=command MSG="action:prompt_end"
  {% else %}
    {% if printer.extruder.can_extrude|lower == 'true' %}
      G91
      G1 E{E} F2100
      G90
      M400
    {% else %}
      RESPOND TYPE=command MSG="Extruder not hot enough!"
    {% endif %}
  {% endif %}
  RESPOND TYPE=command MSG="Resuming printing..."
  RESUME_BASE {get_params}
```

```gcode title="spoolman.cfg" linenums="1"
[gcode_macro SET_ACTIVE_SPOOL]
description: Set the active spool from Spoolman inventory.
gcode:
  {% if params.ID %}
    {% set id = params.ID|int %}
    {action_call_remote_method(
       "spoolman_set_active_spool",
       spool_id=id
    )}
  {% else %}
    {action_respond_info("Parameter 'ID' is required")}
  {% endif %}

[gcode_macro CLEAR_ACTIVE_SPOOL]
description: Clear the active spool from Spoolman inventory.
gcode:
  {action_call_remote_method(
    "spoolman_set_active_spool",
    spool_id=None
  )}
```

```gcode title="gcode-macros.cfg" linenums="1"
# K1C
# CreateDate: 2023/09/05

[gcode_macro PRINTER_PARAM]
variable_z_safe_pause: 0.0
variable_z_safe_g28: 3.0
variable_max_x_position: 220.0
variable_max_y_position: 220.0
variable_max_z_position: 250.0
variable_fans: 3
variable_auto_g29: 0
variable_fan0_min: 25
variable_fan1_min: 50
variable_fan2_min: 180
variable_fan2_speed: 0
variable_hotend_temp: 0
variable_e_min_current: 0.27
variable_cam_off_temp: 60
gcode:

[gcode_macro AUTOTUNE_SHAPERS]
#variable_autotune_shapers: 'ei'
gcode:

[gcode_macro LOAD_MATERIAL_CLOSE_FAN2]
variable_fan2_value: 0
gcode:
  SAVE_GCODE_STATE NAME=myMoveState
  {% if printer['output_pin fan2'].value > 0.0 %}
    SET_GCODE_VARIABLE MACRO=LOAD_MATERIAL_CLOSE_FAN2 VARIABLE=fan2_value VALUE={printer['output_pin fan2'].value}
    M107 P2
  {% endif %}
  RESTORE_E_CURRENT

[gcode_macro LOAD_MATERIAL_RESTORE_FAN2]
gcode:
  {% set fan2_value = printer['gcode_macro LOAD_MATERIAL_CLOSE_FAN2'].fan2_value|float %}
  RESTORE_GCODE_STATE NAME=myMoveState
  {% if fan2_value > 0.0 %}
    {% set s_value = (fan2_value * 255 - printer["gcode_macro PRINTER_PARAM"].fan2_min) * 255 / (255 - printer["gcode_macro PRINTER_PARAM"].fan2_min) %}
    M106 P2 S{s_value}
    SET_GCODE_VARIABLE MACRO=LOAD_MATERIAL_CLOSE_FAN2 VARIABLE=fan2_value VALUE=0
  {% endif %}
  SET_E_MIN_CURRENT

[gcode_macro SET_E_MIN_CURRENT]
gcode:
  {% set e_current = printer['gcode_macro PRINTER_PARAM'].e_min_current %}
  M400
  SET_TMC_CURRENT STEPPER=extruder CURRENT={e_current} HOLDCURRENT={e_current}
  G4 P2000

[gcode_macro RESTORE_E_CURRENT]
gcode:
  {% set e_current = printer.configfile.settings['tmc2209 extruder'].run_current %}
  M400
  SET_TMC_CURRENT STEPPER=extruder CURRENT={e_current} HOLDCURRENT={e_current}
  G4 P2000

[gcode_macro LOAD_MATERIAL]
gcode:
  LOAD_MATERIAL_CLOSE_FAN2
  M109 S{printer.custom_macro.default_extruder_temp}
  G91
  G1 E80 F180
  LOAD_MATERIAL_RESTORE_FAN2

[gcode_macro QUIT_MATERIAL]
gcode:
  SAVE_GCODE_STATE NAME=myMoveState
  RESTORE_E_CURRENT
  M109 S{printer.custom_macro.default_extruder_temp}
  M83
  G1 E100 F300
  G1 E-15 F3000
  G1 E-22.4700 F2400
  G1 E-6.4200 F1200
  G1 E-3.2100 F720
  G1 E5.0000 F356
  G1 E-5.0000 F384
  G1 E5.0000 F412
  G1 E-5.0000 F440
  G1 E5.0000 F467
  G1 E-5.0000 F495
  G1 E5.0000 F523
  G1 E-5.0000 F3000
  G1 E-15 F3000
  SET_E_MIN_CURRENT
  RESTORE_GCODE_STATE NAME=myMoveState

[gcode_macro Qmode]
variable_flag: 0
variable_accel: 0
variable_accel_to_decel: 0
variable_velocity: 0
variable_square_corner_velocity: 0
variable_pressure_advance:0.0
variable_fan0_value: 0.00
variable_fan1_value: 0.00
variable_fan2_value: 0.00
variable_speed_factor: 0
variable_max_accel: 2500
variable_max_accel_to_decel: 2500
gcode:
  {% set printer_state = printer.print_stats.state %}
  {% if printer['gcode_macro Qmode'].flag|int == 0 %}
    {% if printer_state == "printing" or printer_state == "paused" %}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=accel VALUE={printer.toolhead.max_accel}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=accel_to_decel VALUE={printer.toolhead.max_accel_to_decel}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=velocity VALUE={printer.toolhead.max_velocity}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=square_corner_velocity VALUE={printer.toolhead.square_corner_velocity}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=pressure_advance VALUE={printer.extruder.pressure_advance}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=speed_factor VALUE={printer.gcode_move.speed_factor}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=fan0_value VALUE={printer['output_pin fan0'].value}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=fan1_value VALUE={printer['output_pin fan1'].value}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=fan2_value VALUE={printer['output_pin fan2'].value}
      SET_TMC_FIELD STEPPER=stepper_x FIELD=en_spreadcycle VALUE=0
      SET_TMC_FIELD STEPPER=stepper_y FIELD=en_spreadcycle VALUE=0

      SET_TMC_CURRENT STEPPER=stepper_x CURRENT=1.0 
      SET_TMC_CURRENT STEPPER=stepper_y CURRENT=1.0 
      G4 P1000

      # Set Motion Parameters
      SET_VELOCITY_LIMIT ACCEL=2500
      SET_VELOCITY_LIMIT ACCEL_TO_DECEL=2500
      SET_VELOCITY_LIMIT VELOCITY=150
      SET_VELOCITY_LIMIT SQUARE_CORNER_VELOCITY=5
      SET_PRESSURE_ADVANCE ADVANCE=0.05
      M220 S50

      {% set tmp = printer['output_pin fan0'].value * 255 %}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=fan0_value VALUE={tmp}
      {% if tmp - printer['gcode_macro PRINTER_PARAM'].fan0_min > (255 - printer['gcode_macro PRINTER_PARAM'].fan0_min) / 2 %}
        {% set tmp = printer['gcode_macro PRINTER_PARAM'].fan0_min + (255 - printer['gcode_macro PRINTER_PARAM'].fan0_min) / 2 %}
        SET_PIN PIN=fan0 VALUE={tmp}
      {% endif %}

      {% set tmp = printer['output_pin fan1'].value * 255 %}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=fan1_value VALUE={printer['output_pin fan1'].value * 255}
      {% if tmp - printer['gcode_macro PRINTER_PARAM'].fan1_min > (255 - printer['gcode_macro PRINTER_PARAM'].fan1_min) / 2 %}
        {% set tmp = printer['gcode_macro PRINTER_PARAM'].fan1_min + (255 - printer['gcode_macro PRINTER_PARAM'].fan1_min) / 2 %}
        SET_PIN PIN=fan1 VALUE={tmp}
      {% endif %}

      {% set tmp = printer['output_pin fan2'].value * 255 %}
      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=fan2_value VALUE={printer['output_pin fan2'].value * 255}
      {% if tmp - printer['gcode_macro PRINTER_PARAM'].fan2_min > (255 - printer['gcode_macro PRINTER_PARAM'].fan2_min) / 2 %}
        {% set tmp = printer['gcode_macro PRINTER_PARAM'].fan2_min + (255 - printer['gcode_macro PRINTER_PARAM'].fan2_min) / 2 %}
        SET_PIN PIN=fan2 VALUE={tmp}
      {% endif %}

      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=flag VALUE=1
      SET_QMODE_FLAG FLAG=1
    {% endif %}
  {% endif %}

[gcode_macro Qmode_exit]
gcode:
  {% set printer_state = printer.print_stats.state %}
  {% if printer['gcode_macro Qmode'].flag|int == 1 %}
    {% if printer_state == "printing" or printer_state == "paused" %}
      SET_VELOCITY_LIMIT ACCEL={printer['gcode_macro Qmode'].accel}
      SET_VELOCITY_LIMIT ACCEL_TO_DECEL={printer['gcode_macro Qmode'].accel_to_decel}
      SET_VELOCITY_LIMIT VELOCITY={printer['gcode_macro Qmode'].velocity}
      SET_VELOCITY_LIMIT SQUARE_CORNER_VELOCITY={printer['gcode_macro Qmode'].square_corner_velocity}
      SET_PRESSURE_ADVANCE ADVANCE={printer['gcode_macro Qmode'].pressure_advance}
      M220 S{printer['gcode_macro Qmode'].speed_factor * 100}
      
      {% set X_RUN_CUR = printer.configfile.settings['tmc2209 stepper_x'].run_current %}
      {% set Y_RUN_CUR = printer.configfile.settings['tmc2209 stepper_y'].run_current %}
      SET_TMC_CURRENT STEPPER=stepper_x CURRENT={X_RUN_CUR}
      SET_TMC_CURRENT STEPPER=stepper_y CURRENT={Y_RUN_CUR}

      SET_TMC_FIELD STEPPER=stepper_x FIELD=en_spreadcycle VALUE=1
      SET_TMC_FIELD STEPPER=stepper_y FIELD=en_spreadcycle VALUE=1 
      G4 P1000

      SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=flag VALUE=0
      SET_QMODE_FLAG FLAG=0

      {% if printer['output_pin fan0'].value != 0 %}
        {action_respond_info("fan0_value = %s" % printer['gcode_macro Qmode'].fan0_value)}
        SET_PIN PIN=fan0 VALUE={printer['gcode_macro Qmode'].fan0_value}
        SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=fan0_value VALUE=0
      {% endif %}
      {% if printer['output_pin fan1'].value != 0 %}
        {action_respond_info("fan1_value = %s" % printer['gcode_macro Qmode'].fan1_value)}
        SET_PIN PIN=fan1 VALUE={printer['gcode_macro Qmode'].fan1_value}
        SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=fan1_value VALUE=0
      {% endif %}
      {% if printer['output_pin fan2'].value != 0 %}
        {action_respond_info("fan2_value = %s" % printer['gcode_macro Qmode'].fan2_value)}
        SET_PIN PIN=fan2 VALUE={printer['gcode_macro Qmode'].fan2_value}
        SET_GCODE_VARIABLE MACRO=Qmode VARIABLE=fan2_value VALUE=0
      {% endif %}
    {% endif %}
  {% endif %}

[gcode_macro M204]
description: Acceleration limit
rename_existing: M204.1
gcode:
  # {% if printer['gcode_macro Qmode'].flag|int == 0 %}
    {% set get_params = "" %}
    {% set qmode_max_accel = printer['gcode_macro Qmode'].max_accel|string %}
    {% if 'S' in params|upper %}
      {% if printer['gcode_macro Qmode'].flag|int == 1 and params.S|float > qmode_max_accel|float %}
        {% set get_params = (get_params + ' ' + 'S' + qmode_max_accel) %}
      {% else %}
        {% set get_params = (get_params + ' ' + 'S' + params.S) %}
      {% endif %}
    {% endif %}
    {% if 'P' in params|upper %}
      {% if printer['gcode_macro Qmode'].flag|int == 1 and params.P|float > qmode_max_accel|float %}
        {% set get_params = (get_params + ' ' + 'P' + qmode_max_accel) %}
      {% else %}
        {% set get_params = (get_params + ' ' + 'P' + params.P) %}
      {% endif %}
    {% endif %}
    {% if 'T' in params|upper %}
      {% if printer['gcode_macro Qmode'].flag|int == 1 and params.T|float > qmode_max_accel|float %}
        {% set get_params = (get_params + ' ' + 'T' + qmode_max_accel) %}
      {% else %}
        {% set get_params = (get_params + ' ' + 'T' + params.T) %}
      {% endif %}
    {% endif %}
    M204.1 {get_params}
[gcode_macro M205]
description: Square corner velocity
gcode:
  {% if 'X' in params %}
    SET_VELOCITY_LIMIT SQUARE_CORNER_VELOCITY={params.X}
  {% elif 'Y' in params %}
    SET_VELOCITY_LIMIT SQUARE_CORNER_VELOCITY={params.Y}
  {% endif %}

[gcode_macro M107]
description: Turn off fan0 and fan2
gcode:
  {% set fans = printer["gcode_macro PRINTER_PARAM"].fans|int %}
  {% if params.P is defined %}
    {% if params.P|int < fans %}
      SET_PIN PIN=fan{params.P|int} VALUE=0
    {% else %}
      SET_PIN PIN=fan0 VALUE=0
    {% endif %}
  {% else %}
    SET_PIN PIN=fan0 VALUE=0
    SET_PIN PIN=fan2 VALUE=0
  {% endif %}

[gcode_macro M900]
description: Set pressure advance
gcode:
  {% if 'K' in params %}
    {% if 'E' in params %}
      SET_PRESSURE_ADVANCE EXTRUDER={params.E} ADVANCE={params.K}
    {% else %}
      SET_PRESSURE_ADVANCE ADVANCE={params.K}
    {% endif %}
  {% endif %}

[delayed_gcode wait_temp]
# initial_duration: 2.
gcode:
  {% set cur_temp = printer.extruder.temperature %}
  {% if cur_temp|int < 40 %}
    WAIT_TEMP_END
  {% else %}
    UPDATE_DELAYED_GCODE ID=wait_temp DURATION=5
  {% endif %}

[gcode_macro WAIT_TEMP_START]
gcode:
  UPDATE_DELAYED_GCODE ID=wait_temp DURATION=1
  SET_PIN PIN=fan0 VALUE=210
  SET_PIN PIN=fan2 VALUE=210

[gcode_macro WAIT_TEMP_END]
gcode:
  UPDATE_DELAYED_GCODE ID=wait_temp DURATION=0
  M106 P0 S0
  M106 P2 S0

[gcode_macro PRINT_CALIBRATION]
# This part of the command is replaced by the application side without passing parameters
gcode:
  CX_PRINT_LEVELING_CALIBRATION

[gcode_macro FIRST_FLOOR_PAUSE_POSITION]
gcode:
  {% set extruder_temp = printer.custom_macro.g28_ext_temp %}
  M104 S{extruder_temp}
  {% set y_park = printer.toolhead.axis_maximum.y/2 %}
  {% set x_park = printer['gcode_macro PRINTER_PARAM'].max_x_position|float + 1 %}
  G90
  G1 Z2 F600
  G1 X{x_park} Y{y_park} F6000
  G1 Z0.2 F600

[gcode_macro ACCURATE_G28]
description: More precise homing routine for the Z-axis
gcode:
  ACCURATE_HOME_Z

[gcode_macro PRINT_PREPARED]
gcode:
  SET_GCODE_VARIABLE MACRO=START_PRINT VARIABLE=prepare VALUE=1
  {action_respond_info("print prepared")}

[gcode_macro PRINT_PREPARE_CLEAR]
gcode:
  SET_GCODE_VARIABLE MACRO=START_PRINT VARIABLE=prepare VALUE=0

[gcode_macro END_PRINT_POINT_WITHOUT_LIFTING]
gcode:
  {% if "xyz" in printer.toolhead.homed_axes %}
    {% set E = printer["gcode_macro PAUSE"].extrude|float %}
    G91
    {% if printer.extruder.can_extrude|lower == 'true' %}
      G1 E-1.0 F180
      G1 E-{E} F4000
    {% else %}
      {action_respond_info("Extruder not hot enough")}
    {% endif %}
    G1 Z2.0 F600
    G90
    {% set y_park = printer.toolhead.axis_maximum.y/2 %}
    {% set x_park = printer.toolhead.axis_maximum.x|float - 10.0 %}
    G1 X{x_park} Y{y_park} F30000
  {% else %}
    {action_respond_info("end print xyz_axes is NULL\n")}
  {% endif %}

[gcode_macro END_PRINT_POINT]
gcode:
  {% if "xyz" in printer.toolhead.homed_axes %}
    {% set E = printer["gcode_macro PAUSE"].extrude|float %}
    {% set max_z = printer["gcode_macro PRINTER_PARAM"].max_z_position|float %}
    {% set act_z = printer.toolhead.position.z|float %}
    {% set z_safe = 0.0 %}
    {% if act_z < (max_z / 2) %}
      {% set z_safe = (max_z / 2) - act_z %}
    {% elif act_z < max_z %}
      {% set z_safe = 2.0 %}
    {% endif %}
    G91
    {% if printer.extruder.can_extrude|lower == 'true' %}
      G1 E-1.0 F180
      G1 E-{E} F4000
    {% else %}
      {action_respond_info("Extruder not hot enough")}
    {% endif %}
    G1 Z2.0 F600
    G90
    {% set y_park = printer.toolhead.axis_maximum.y/2 %}
    {% set x_park = printer.toolhead.axis_maximum.x|float - 10.0 %}
    G1 X{x_park} Y{y_park} F30000
    {% if z_safe > 2.0 %}
      G91
      {% set z_safe = z_safe - 2.0 %}
      G1 Z{z_safe} F600
      G90
    {% endif %}
  {% else %}
    {action_respond_info("end print xyz_axes is NULL\n")}
  {% endif %}

[gcode_macro END_PRINT]
gcode:
  Qmode_exit
  EXCLUDE_OBJECT_RESET
  PRINT_PREPARE_CLEAR
  M220 S100
  SET_VELOCITY_LIMIT ACCEL=5000 ACCEL_TO_DECEL=2500
  TURN_OFF_HEATERS
  M107 P1
  M107 P2
  END_PRINT_POINT
  WAIT_TEMP_START
  M84

[gcode_macro FIRST_FLOOR_PAUSE]
description: Pause the first floor print
# change this if you need more or less extrusion
variable_extrude: 2.0
gcode:
  ##### read E from pause macro #####
  {% set E = printer["gcode_macro FIRST_FLOOR_PAUSE"].extrude|float %}
  ##### set park positon for x and y #####
  # default is your max posion from your printer.cfg
  {% set y_park = printer.toolhead.axis_maximum.y/2 %}
  {% set x_park = printer.toolhead.axis_maximum.x|float - 10.0 %}
  ##### calculate save lift position #####
  {% set max_z = printer["gcode_macro PRINTER_PARAM"].max_z_position|float %}
  {% set act_z = printer.toolhead.position.z|float %}
  {% set z_safe = 0.0 %}
  {% if act_z < (max_z - 2.0) %}
    {% set z_safe = 2.0 %}
  {% elif act_z < max_z %}
    {% set z_safe = max_z - act_z %}
  {% endif %}
  ##### end of definitions #####
  SET_GCODE_VARIABLE MACRO=PRINTER_PARAM VARIABLE=z_safe_pause VALUE={z_safe|float}
  PAUSE_BASE
  G91
  {% if "xyz" in printer.toolhead.homed_axes %}
    {% if printer.extruder.can_extrude|lower == 'true' %}
      G1 E-1.0 F180
      G1 E-{E} F4000
    {% else %}
      {action_respond_info("Extruder not hot enough")}
    {% endif %}
    G1 Z{z_safe} F600
    G90
    G1 X{x_park} Y{y_park} F30000
  {% else %}
    {action_respond_info("Printer not homed")}
  {% endif %}
  # save fan2 value and turn off fan2
  SET_GCODE_VARIABLE MACRO=PRINTER_PARAM VARIABLE=fan2_speed VALUE={printer['output_pin fan2'].value}
  {% set fspeed = printer['gcode_macro PRINTER_PARAM'].fan2_speed %}
  {action_respond_info("fan2_value = %s \n" % (fspeed))}
  # SET_PIN PIN=fan2 VALUE=0
  M106 P2 S0
  SET_E_MIN_CURRENT

[gcode_macro FIRST_FLOOR_RESUME]
description: Resume the first floor print
gcode:
  RESTORE_E_CURRENT
  {% if printer['gcode_macro PRINTER_PARAM'].fan2_speed > 0 %}
    # {% set fspeed = printer['gcode_macro PRINTER_PARAM'].fan2_speed %}
    # {action_respond_info("fan2_value2 = %s \n" % (fspeed))}
    # SET_PIN PIN=fan2 VALUE={(printer['gcode_macro PRINTER_PARAM'].fan2_speed * 255 + 0.5)|int}
    {% set s_value = (printer['gcode_macro PRINTER_PARAM'].fan2_speed * 255 - printer['gcode_macro PRINTER_PARAM'].fan2_min) * 255 / (255 - printer['gcode_macro PRINTER_PARAM'].fan2_min)|float %}
    M106 P2 S{s_value}
  {% endif %}
  ##### read E from pause macro #####
  {% set E = printer["gcode_macro FIRST_FLOOR_PAUSE"].extrude|float + 1.0 %}
  #### get VELOCITY parameter if specified ####
  {% if 'VELOCITY' in params|upper %}
    {% set get_params = ('VELOCITY=' + params.VELOCITY) %}
  {%else %}
    {% set get_params = "" %}
  {% endif %}
  ##### end of definitions #####
  {% if printer.extruder.can_extrude|lower == 'true' %}
    G91
    G1 E{E} F2100
  {% else %}
    {action_respond_info("Extruder not hot enough")}
  {% endif %}
  M400
  RESUME_BASE {get_params}

[gcode_macro PAUSE]
description: Pause the actual running print
rename_existing: PAUSE_BASE
# change this if you need more or less extrusion
variable_extrude: 2.0
gcode:
  ##### read E from pause macro #####
  {% set E = printer["gcode_macro PAUSE"].extrude|float %}
  ##### set park positon for x and y #####
  # default is your max posion from your printer.cfg
  {% set y_park = printer.toolhead.axis_maximum.y/2 %}
  {% set x_park = printer.toolhead.axis_maximum.x|float - 10.0 %}
  ##### calculate save lift position #####
  {% set max_z = printer["gcode_macro PRINTER_PARAM"].max_z_position|float %}
  {% set act_z = printer.toolhead.position.z|float %}
  {% set z_safe = 0.0 %}
  {% if act_z < 48.0 %}
    {% set z_safe = 50.0 - act_z %}
  {% elif act_z < (max_z - 2.0) %}
    {% set z_safe = 2.0 %}
  {% elif act_z < max_z %}
    {% set z_safe = max_z - act_z %}
  {% endif %}
  {action_respond_info("z_safe = %s"% (z_safe))}
  ##### end of definitions #####
  SET_GCODE_VARIABLE MACRO=PRINTER_PARAM VARIABLE=z_safe_pause VALUE={z_safe|float}
  PAUSE_BASE
  G91
  SET_GCODE_VARIABLE MACRO=PRINTER_PARAM VARIABLE=hotend_temp VALUE={printer.extruder.target}
  M104 S140
  {% if "xyz" in printer.toolhead.homed_axes %}
    {% if printer.extruder.can_extrude|lower == 'true' %}
      G1 E-1.0 F180
      G1 E-{E} F4000
    {% else %}
      {action_respond_info("Extruder not hot enough")}
    {% endif %}
    G1 Z{z_safe} F600
    M400
    G90
    G1 X{x_park} Y{y_park} F30000
  {% else %}
    {action_respond_info("Printer not homed")}
  {% endif %}
  # save fan2 value and turn off fan2
  SET_GCODE_VARIABLE MACRO=PRINTER_PARAM VARIABLE=fan2_speed VALUE={printer['output_pin fan2'].value}
  {% set fspeed = printer['gcode_macro PRINTER_PARAM'].fan2_speed %}
  {action_respond_info("fan2_value = %s \n" % (fspeed))}
  # SET_PIN PIN=fan2 VALUE=0
  M106 P2 S0
  SET_E_MIN_CURRENT

[gcode_macro INPUTSHAPER]
gcode:
  SET_FILAMENT_SENSOR SENSOR=filament_sensor ENABLE=0
  SET_FILAMENT_SENSOR SENSOR=filament_sensor_2 ENABLE=0
  G90
  G28
  {% set POSITION_X = printer.configfile.settings['stepper_x'].position_max/2 %}
  {% set POSITION_Y = printer.configfile.settings['stepper_y'].position_max/2 %}
  G1 X{POSITION_X} Y{POSITION_Y} F6000
  G1 Z10 F600
  SHAPER_CALIBRATE
  CXSAVE_CONFIG
  SET_FILAMENT_SENSOR SENSOR=filament_sensor ENABLE=1
  SET_FILAMENT_SENSOR SENSOR=filament_sensor_2 ENABLE=1

[gcode_macro BEDPID]
gcode:
  PID_CALIBRATE HEATER=heater_bed TARGET=100
  SAVE_CONFIG

[gcode_macro TUNOFFINPUTSHAPER]
gcode:
  SET_INPUT_SHAPER SHAPER_FREQ_X=0 SHAPER_FREQ_Y=0

[gcode_macro CANCEL_PRINT]
description: Cancel the actual running print
rename_existing: CANCEL_PRINT_BASE
gcode:
  END_PRINT
  CANCEL_PRINT_BASE

[gcode_macro G29]
description: Bed mesh calibration
gcode:
  {% if 'PROBE_COUNT' in params|upper %}
    {% set get_count = ('PROBE_COUNT=' + params.PROBE_COUNT) %}
  {%else %}
    {% set get_count = "" %}
  {% endif %}

  {% set bed_temp = printer.custom_macro.default_bed_temp %}
  {% set extruder_temp = printer.custom_macro.g28_ext_temp %}
  {% set nozzle_clear_temp = printer.custom_macro.default_extruder_temp %}

  {% if 'BED_TEMP' in params|upper %}
    {% set bed_temp = params.BED_TEMP %}
  {% endif %}

  {% if 'EXTRUDER_TEMP' in params|upper %}
    {% set nozzle_clear_temp = params.EXTRUDER_TEMP %}
  {% endif %}
  SET_FILAMENT_SENSOR SENSOR=filament_sensor ENABLE=0
  SET_FILAMENT_SENSOR SENSOR=filament_sensor_2 ENABLE=0

### Commented out for PROWIPER Mod to call 'WIPE_NOZZLE' instead of 'NOZZLE_CLEAR' ###
 # G28
 # BED_MESH_CLEAR
 # NOZZLE_CLEAR HOT_MIN_TEMP={extruder_temp} HOT_MAX_TEMP={nozzle_clear_temp} BED_MAX_TEMP={bed_temp}
 # ACCURATE_G28
 
  G28
  BED_MESH_CLEAR
  WIPE_NOZZLE EXTRUDER_TEMP={nozzle_clear_temp} BED_TEMP={bed_temp}
  ACCURATE_G28
  M204 S5000
  SET_VELOCITY_LIMIT ACCEL_TO_DECEL=5000
  BED_MESH_CALIBRATE {get_count}
  BED_MESH_OUTPUT
  {% set y_park = printer.toolhead.axis_maximum.y/2 %}
  {% set x_park = printer.toolhead.axis_maximum.x|float - 10.0 %}
  G1 X{x_park} Y{y_park} F2000
  CXSAVE_CONFIG
  TURN_OFF_HEATERS
  SET_FILAMENT_SENSOR SENSOR=filament_sensor ENABLE=1
  SET_FILAMENT_SENSOR SENSOR=filament_sensor_2 ENABLE=1
```