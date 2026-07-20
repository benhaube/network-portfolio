---
icon: symbols/grid-2x2
title: MAC Address Tables
subtitle: Hardware MAC Addresses
tags:
  - Network
  - IoT
  - Router
  - Server
  - Mobile
  - Laptop
  - Desktop
hide:
  - toc
---
![Lucide 'grid-2x2' icon](../assets/icons/grid-2x2.svg){ width=200 }

# MAC Address Tables
*Hardware MAC Addresses*

---

## :symbols-router:&ensp;Network Infrastructure

| Device Type                                  | Location    | Hostname                                                      | Interface                            | MAC Address         | Role / Notes                      |
| :------------------------------------------- | :---------- | :------------------------------------------------------------ | :----------------------------------- | :------------------ | :-------------------------------- |
| :symbols-settings-ethernet:&nbsp;Cable Modem | Living-Room | [<code>N/A</code>](../02_hardware/hitron_modem.md)            | :symbols-ethernet-port:&nbsp;*LAN 1* | `00:1c:73:00:00:99` | Cable modem, Hitron DOCSIS 3.1    |
|                                              |             |                                                               | :symbols-ethernet-port:&nbsp;*LAN 2* | `XX:XX:XX:XX:XX:XX` |                                   |
| :symbols-router:&nbsp;Wireless Router        | Living-Room | [<code>RT-BE92U-FAF0</code>](../02_hardware/asus_rt-be92u.md) | :symbols-ethernet-port:&nbsp;*WAN*   | `60:CF:84:51:FA:F0` | Main router, ASUS RT-BE92U        |
|                                              |             |                                                               | :symbols-wifi-cog:&nbsp;*2.4 GHz*    | `6A:CF:84:51:FA:F1` |                                   |
|                                              |             |                                                               | :symbols-wifi-cog:&nbsp;*5 GHz*      | `82:CF:84:51:FA:F5` |                                   |
|                                              |             |                                                               | :symbols-wifi-cog:&nbsp;*6 GHz*      | `60:CF:84:51:FA:F9` |                                   |
| :symbols-router:&nbsp;Mesh Node              | Office      | [<code>RT-AX55-1360</code>](../02_hardware/asus_rt-ax55.md)   | :symbols-ethernet-port:&nbsp;*WAN*   | `7C:10:C9:DF:13:60` | AiMesh^&copy;^ Node, ASUS RT-AX55 |
|                                              |             |                                                               | :symbols-wifi-cog:&nbsp;*2.4 GHz*    | `7C:10:C9:DF:13:61` |                                   |
|                                              |             |                                                               | :symbols-wifi-cog:&nbsp;*5 GHz*      | `7C:10:C9:DF:13:64` |                                   |

## :symbols-shield-quarter:&ensp;Trusted Network 
&emsp;&emsp;&ensp;*VLAN50*

| Device Type                                 | Location    | Hostname                                                        | MAC Address         |        Interface        |   WAN Access    | Role / Notes                                                         |
| :------------------------------------------ | :---------- | :-------------------------------------------------------------- | :------------------ | :---------------------: | :-------------: | :------------------------------------------------------------------- |
| :symbols-server:&nbsp;DNS Server            | Office      | [<code>pi-server</code>](../02_hardware/pi_zero_2w_server.md)   | `E4:5F:01:A4:60:07` | :symbols-ethernet-port: | :symbols-check: | Secondary [Technitium](../03_services/technitium.md) DNS server node |
| :symbols-server:&nbsp;Proxy Server          | Office      | [<code>pi-zero</code>](../02_hardware/pi_zero_2w_server.md)     | `2C:CF:67:DB:F5:E2` |     :symbols-wifi:      | :symbols-check: | [Caddy](../03_services/caddy.md) reverse proxy server                |
| :symbols-server-nas:&nbsp;NAS Server        | Living-Room | [<code>ZimaOS-NAS</code>](../02_hardware/zimaos_nas.md)         | `00:E0:4C:5B:9A:96` | :symbols-ethernet-port: | :symbols-check: | Main file storage server *(eth0)*                                    |
| :symbols-server-nas:&nbsp;NAS Server        | Living-Room | [<code>ZimaOS-NAS</code>](../02_hardware/zimaos_nas.md)         | `00:E0:4C:5B:9A:95` | :symbols-ethernet-port: | :symbols-check: | Second NIC for main file storage server *(eth1)*                     |
| :symbols-server:&nbsp;DNS Server            | -           | [<code>debian-vm</code>](../02_hardware/debian_server.md)       | `52:54:00:28:BB:EA` | :symbols-ethernet-port: | :symbols-check: | Primary [Technitium](../03_services/technitium.md) DNS server node   |
| :symbols-pc-case:&nbsp;Desktop PC           | Office      | [<code>bens-workstation</code>](../02_hardware/bens_desktop.md) | `3C:7C:3F:0D:A9:CD` | :symbols-ethernet-port: | :symbols-check: | Ben's Main desktop PC                                                |
| :symbols-pc-case:&nbsp;Desktop PC           | Office      | [<code>bens-workstation</code>](../02_hardware/bens_desktop.md) | `C2:57:52:3B:6F:D8` |     :symbols-wifi:      | :symbols-check: | Wi-Fi NIC on Ben's main desktop PC                                   |
| :symbols-laptop-minimal:&nbsp;Laptop PC     | Mobile      | [<code>ben-laptop</code>](../02_hardware/bens_laptop.md)        | `A6:97:E3:D2:F1:C4` |     :symbols-wifi:      | :symbols-check: | Ben's laptop PC                                                      |
| :symbols-printer-3d-nozzle:&nbsp;3D-Printer | Office      | [<code>k1c-a71e</code>](../02_hardware/kacey_3d-printer.md)     | `FC:EE:28:09:A7:1E` |     :symbols-wifi:      | :symbols-check: | Creality K1C 3D-printer                                              |
| :symbols-pc-case:&nbsp;Desktop PC           | Office      | [<code>Rob-Desktop</code>](../02_hardware/robs_desktop.md)      | `50:EB:F6:59:74:C3` | :symbols-ethernet-port: | :symbols-check: | Rob's main desktop PC                                                |
| :symbols-pc-case:&nbsp;Desktop PC           | Office      | [<code>Rob-Desktop</code>](../02_hardware/robs_desktop.md)      | `70:A6:CC:B5:F5:4A` |     :symbols-wifi:      | :symbols-check: | Wi-Fi NIC on Rob's main desktop PC                                   |
| :symbols-laptop-minimal:&nbsp;Laptop PC     | Mobile      | [<code>ems1</code>](../02_hardware/robs_laptop.md)              | `E8:9C:25:90:8B:11` | :symbols-ethernet-port: | :symbols-check: | Ethernet NIC on Rob's main laptop PC                                 |
| :symbols-laptop-minimal:&nbsp;Laptop PC     | Mobile      | [<code>ems1</code>](../02_hardware/robs_laptop.md)              | `F8:54:F6:C1:88:D2` |     :symbols-wifi:      | :symbols-check: | Wi-Fi NIC on Rob's main laptop PC                                    |
| :symbols-smartphone:&nbsp;Pixel 9 Pro       | Mobile      | [<code>ben-s-phone</code>](../02_hardware/bens_smartphone.md)   | `08:8B:C8:4E:19:7B` |     :symbols-wifi:      | :symbols-check: | Ben's phone, Google Pixel 9 Pro                                      |
| :symbols-smartphone:&nbsp;Galaxy S25+       | Mobile      | `robert-s-phone`                                                | `1A:5C:54:48:81:37` |     :symbols-wifi:      | :symbols-check: | Rob's phone, Samsung Galaxy S25+                                     |
| :symbols-cast:&nbsp;Google TV               | Bedroom     | `google-tv-bedroom`                                             | `AC:67:84:EC:DF:9D` |     :symbols-wifi:      | :symbols-check: | Chromecast with Google TV connected to Bedroom TV                    |
| :symbols-watch:&nbsp;Pixel Watch            | Mobile      | `Google-Pixel-Watch-2`                                          | `16:EA:08:E8:93:75` |     :symbols-wifi:      | :symbols-check: | Ben's Smartwatch, Google Pixel Watch 2                               |
| :symbols-speaker:&nbsp;Nest Speaker         | Office      | `nest-audio`                                                    | `1C:53:F9:FA:F6:7C` |     :symbols-wifi:      | :symbols-check: | Nest Audio in Office                                                 |
| :symbols-nest-hub:&nbsp;Nest Hub            | Kitchen     | `kitchen-hub`                                                   | `3C:8D:20:FC:D4:D1` |     :symbols-wifi:      | :symbols-check: | Nest Hub smart display in the Kitchen                                |
| :symbols-nest-hub:&nbsp;Nest Hub            | Living-Room | `living-room-hub`                                               | `24:E5:0F:D9:44:A9` |     :symbols-wifi:      | :symbols-check: | Nest Hub smart display in the Living Room                            |
| :symbols-cast:&nbsp;Google TV               | Living-Room | `google-tv-livingroom`                                          | `B8:7B:D4:9D:80:F5` |     :symbols-wifi:      | :symbols-check: | Google TV Streamer, Connected to the Fire TV in the Living Room      |
| :symbols-cast:&nbsp;Google TV               | Living-Room | `google-tv-livingroom`                                          | `B8:7B:D4:9D:80:F7` | :symbols-ethernet-port: | :symbols-check: | Google TV Streamer, Connected to the Fire TV in the Living Room      |
| :symbols-tv-minimal:&nbsp;Smart TV          | Living-Room | `amazon-fire-tv`                                                | `4C:53:FD:47:AC:14` |     :symbols-wifi:      | :symbols-check: | 55" TCL Smart TV in Living Room                                      |
| :symbols-tv-minimal:&nbsp;Smart TV          | Living-Room | `amazon-fire-tv`                                                | `4C:53:FD:6A:81:D5` | :symbols-ethernet-port: | :symbols-check: | 55" TCL Smart TV in Living Room                                      |
| :symbols-hdmi-port:&nbsp;Streaming Stick    | Living-Room | `StreamingStick4K`                                              | `50:06:F5:53:2A:F2` |     :symbols-wifi:      | :symbols-check: | Roku Streaming Stick 4K (2025), Connected to TV in Living Room       |
| :symbols-gamepad-2:&nbsp;Game Console       | Mobile      | `nintendo-switch`                                               | `74:84:69:0B:56:EF` |     :symbols-wifi:      | :symbols-check: | Nintendo Switch OLED                                                 |
| :symbols-gamepad-2:&nbsp;Game Console       | Living-Room | `nintendo-switch`                                               | `74:84:69:34:69:78` | :symbols-ethernet-port: | :symbols-check: | Nintendo Switch OLED docking station for TV in Living Room           |

## :symbols-shield-house:&ensp;IoT Network 
&emsp;&emsp;&ensp;*VLAN53*

| Device Type                                 | Location    | Hostname                                                      | MAC Address         |   Interface    |   WAN Access    | Role / Notes                                                    |
| :------------------------------------------ | :---------- | :------------------------------------------------------------ | :------------------ | :------------: | :-------------: | :-------------------------------------------------------------- |
| :symbols-home-automation:&nbsp;IoT Server   | Office      | [<code>home-assistant</code>](../02_hardware/pi_4b_server.md) | `E4:5F:01:A4:60:08` | :symbols-wifi: | :symbols-check: | Home Assistant server, hosted on `pi-server` via `wlan0`        |
| :symbols-robot-vacuum:&nbsp;Robot Vacuum    | Living-Room | `roomba-675`                                                  | `80:C5:F2:DC:B1:57` | :symbols-wifi: |   :symbols-x:   | Roomba 675 robot vacuum                                         |
| :symbols-door-closed-locked:&nbsp;Alarm Hub | Living-Room | `ring-solutions`                                              | `B0:09:DA:1C:92:08` | :symbols-wifi: | :symbols-check: | Ring Alarm base station                                         |
| :symbols-bell-ring:&nbsp;Doorbell Chime     | Living-Room | `ring-chime`                                                  | `18:7F:88:FD:A6:9D` | :symbols-wifi: | :symbols-check: | Chime for Ring Doorbell                                         |
| :symbols-sun-snow:&nbsp;Thermostat          | Living-Room | `nest-thermostat`                                             | `18:B4:30:1D:4F:05` | :symbols-wifi: | :symbols-check: | Nest Thermostat for HVAC system                                 |
| :symbols-lamp:&nbsp;Table Lamp              | Office      | `office-lamp-2`                                               | `D0:C9:07:00:09:D0` | :symbols-wifi: |   :symbols-x:   | Govee RGBW smart LED bulb for lamp in office                    |
| :symbols-lamp:&nbsp;Table Lamp              | Office      | `office-lamp-1`                                               | `D0:C9:07:05:00:AA` | :symbols-wifi: |   :symbols-x:   | Govee RGBW smart LED bulb for lamp in office                    |
| :symbols-lamp-floor:&nbsp;Floor Lamp        | Living-Room | `floor-lamp`                                                  | `60:74:F4:EA:F1:62` | :symbols-wifi: |   :symbols-x:   | Govee RGBW floor lamp in Living Room                            |
| :symbols-cctv:&nbsp;Security Camera         | Living-Room | `ring-cam-indoor`                                             | `9C:76:13:F6:9F:FD` | :symbols-wifi: | :symbols-check: | Ring indoor security camera                                     |
| :symbols-led-on:&nbsp;LED Strip             | Office      | `office-desk-accent`                                          | `D4:AD:FC:0E:F1:B1` | :symbols-wifi: |   :symbols-x:   | Govee RGB LED strip for desk accent lighting                    |
| :symbols-cctv:&nbsp;Security Camera         | Back-Yard   | `ring-cam-outdoor`                                            | `18:7F:88:F2:8F:21` | :symbols-wifi: | :symbols-check: | Ring outdoor security camera in the back yard                   |
| :symbols-door-closed:&nbsp;Video Doorbell   | Front-Door  | `ring-doorbell`                                               | `90:48:6C:61:29:BC` | :symbols-wifi: | :symbols-check: | Ring video doorbell, front door                                 |
| :symbols-lamp:&nbsp;Table Lamp              | Bedroom     | `bedroom-lamp`                                                | `D0:C9:07:08:81:18` | :symbols-wifi: |   :symbols-x:   | Govee RGBW smart LED bulb for lamp in bedroom                   |
| :symbols-air-vent:&nbsp;Window A/C Unit     | Bedroom     | `gemodule1C46`                                                | `D8:28:C9:F7:1C:46` | :symbols-wifi: |   :symbols-x:   | GE window A/C unit in bedroom                                   |
| :symbols-lightbulb:&nbsp;Lightbulb          | Kitchen     | `vent-hood`                                                   | `D0:C9:07:ED:A7:E6` | :symbols-wifi: |   :symbols-x:   | Govee RGBW smart LED bulb for vent hood in kitchen              |
| :symbols-lamp:&nbsp;Table Lamp              | Living-Room | `table-lamp-1`                                                | `D0:C9:07:05:04:4C` | :symbols-wifi: |   :symbols-x:   | Govee RGBW smart LED bulb for lamp in living room               |
| :symbols-lamp:&nbsp;Table Lamp              | Living-Room | `table-lamp-2`                                                | `D0:C9:07:DB:9C:86` | :symbols-wifi: |   :symbols-x:   | Govee RGBW smart LED bulb for lamp in living room               |
| :symbols-lightbulb:&nbsp;Lightbulb          | Living-Room | `christmas-tree-lamp`                                         | `D0:C9:07:EF:4D:A4` | :symbols-wifi: |   :symbols-x:   | Govee RGBW smart LED bulb for ceramic Christmas tree decoration |

---
<div class="grid cards" markdown>

-   :symbols-binary:{ .lg .middle }&emsp;**IP Addresses**

    ---

    [IP Address Management](ip_address_mangement.md){ .md-button }

-   :symbols-sitemap:{ .lg .middle }&emsp;**Network Diagrams**

    ---

    [Logical Map](logical_map.md){ .md-button }&emsp;[Physical Map](physical_map.md){ .md-button }

</div>

<div class="grid cards" markdown>

-   :symbols-tornado:{ .lg .middle }&emsp;**Disaster Recovery**
    
    ---

    [Disaster Recovery Plan](disaster_recovery_plan.md){ .md-button }

-   :symbols-firewall:{ .lg .middle }&emsp;**Network Security**

    ---

    [Network Security Policy](network_security_policy.md){ .md-button }

</div>