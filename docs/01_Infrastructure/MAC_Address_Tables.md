---
icon: material/ethernet
title: MAC Address Tables
tags:
  - Infrastructure
  - Network
  - Hardware
  - VLAN
  - IoT
  - Router
  - Server
  - Mobile
  - Laptop
  - Desktop
  - PC
hide:
  - toc
---
![Material Ethernet Icon customized](../assets/icons/ethernet.svg){ width=200 }

# MAC Address Tables

---

## :material-router-wireless: Network Infrastructure

| Device Type                                     | Location    | Hostname                                                    | Interface                        | MAC Address         | Role / Notes                      |
| :---------------------------------------------- | :---------- | :---------------------------------------------------------- | :------------------------------- | :------------------ | :-------------------------------- |
| :material-wan:&nbsp;Cable Modem                 | Living-Room | [<code>hitron-modem</code>](../02_Hardware/Hitron_Modem.md) | :material-ethernet:&nbsp;LAN 1   | `00:1c:73:00:00:99` | Cable modem, Hitron DOCSIS 3.1    |
|                                                 |             |                                                             | :material-ethernet:&nbsp;LAN 2   | `XX:XX:XX:XX:XX:XX` |                                   |
| :material-router-wireless:&nbsp;Wireless Router | Living-Room | [<code>asusrouter</code>](../02_Hardware/ASUS_RT-BE92U.md)  | :material-ethernet:              | `60:CF:84:51:FA:F0` | Main router, ASUS RT-BE92U        |
|                                                 |             |                                                             | :material-wifi:&nbsp;*(2.4 GHz)* | `6A:CF:84:51:FA:F1` |                                   |
|                                                 |             |                                                             | :material-wifi:&nbsp;*(5 GHz)*   | `82:CF:84:51:FA:F5` |                                   |
|                                                 |             |                                                             | :material-wifi:&nbsp;*(6 GHz)*   | `60:CF:84:51:FA:F9` |                                   |
| :material-router-wireless:&nbsp;Mesh Node       | Office      | [<code>aimesh-node</code>](../02_Hardware/ASUS_RT-AX55.md)  | :material-ethernet:              | `7C:10:C9:DF:13:60` | AiMesh^&copy;^ Node, ASUS RT-AX55 |
|                                                 |             |                                                             | :material-wifi:&nbsp;*(2.4 GHz)* | `7C:10:C9:DF:13:61` |                                   |
|                                                 |             |                                                             | :material-wifi:&nbsp;*(5 GHz)*   | `7C:10:C9:DF:13:64` |                                   |

## :material-security: Trusted Network *(VLAN50)*

| Device Type                                    | Location    | Hostname                                                           | MAC Address         |      Interface      |    WAN Access    | Role / Notes                                                         |
| :--------------------------------------------- | :---------- | :----------------------------------------------------------------- | :------------------ | :-----------------: | :--------------: | :------------------------------------------------------------------- |
| :material-dns:&nbsp;DNS Server                 | Office      | [<code>pi-server</code>](../02_Hardware/Raspberry_Pi_Zero_2_W.md)  | `E4:5F:01:A4:60:07` | :material-ethernet: | :material-check: | Secondary [Technitium](../03_Services/Technitium.md) DNS server node |
| :material-server-network:&nbsp;Proxy Server    | Office      | [<code>pi-zero</code>](../02_Hardware/Raspberry_Pi_Zero_2_W.md)    | `2C:CF:67:DB:F5:E2` |   :material-wifi:   | :material-check: | [Caddy](../03_Services/Caddy.md) reverse proxy server                |
| :material-nas:&nbsp;NAS Server                 | Living-Room | [<code>storage-server</code>](../02_Hardware/ZimaBoard_2_NAS.md)   | `00:E0:4C:5B:9A:96` | :material-ethernet: | :material-check: | Main file storage server                                             |
| :material-nas:&nbsp;NAS Server                 | Living-Room | [<code>storage-server-2</code>](../02_Hardware/ZimaBoard_2_NAS.md) | `00:E0:4C:5B:9A:95` | :material-ethernet: | :material-check: | Second NIC for main file storage server                              |
| :material-dns:&nbsp;DNS Server                 | -           | [<code>debian-vm</code>](../02_Hardware/Debian_Server_VM.md)       | `52:54:00:28:BB:EA` | :material-ethernet: | :material-check: | Primary [Technitium](../03_Services/Technitium.md) DNS server node   |
| :material-desktop-tower:&nbsp;Desktop PC       | Office      | [<code>bens-workstation</code>](../02_Hardware/Ben's_Desktop.md)   | `3C:7C:3F:0D:A9:CD` | :material-ethernet: | :material-check: | Ben's Main desktop PC                                                |
| :material-desktop-tower:&nbsp;Desktop PC       | Office      | [<code>bens-workstation</code>](../02_Hardware/Ben's_Desktop.md)   | `C2:57:52:3B:6F:D8` |   :material-wifi:   | :material-check: | Wi-Fi NIC on Ben's main desktop PC                                   |
| :material-laptop:&nbsp;Laptop PC               | Mobile      | [<code>ben-laptop</code>](../02_Hardware/Ben's_Laptop.md)          | `A6:97:E3:D2:F1:C4` |   :material-wifi:   | :material-check: | Ben's laptop PC                                                      |
| :material-printer-3d-nozzle:&nbsp;3D-Printer   | Office      | [<code>k1c-a71e</code>](../02_Hardware/Kacey_3D-printer.md)        | `FC:EE:28:09:A7:1E` |   :material-wifi:   | :material-check: | Creality K1C 3D-printer                                              |
| :material-desktop-tower:&nbsp;Desktop PC       | Office      | [<code>rob-desktop</code>](../02_Hardware/Rob's_Desktop.md)        | `50:EB:F6:59:74:C3` | :material-ethernet: | :material-check: | Rob's main desktop PC                                                |
| :material-desktop-tower:&nbsp;Desktop PC       | Office      | [<code>rob-desktop</code>](../02_Hardware/Rob's_Desktop.md)        | `70:A6:CC:B5:F5:4A` |   :material-wifi:   | :material-check: | Wi-Fi NIC on Rob's main desktop PC                                   |
| :material-laptop:&nbsp;Laptop PC               | Mobile      | [<code>ems1</code>](../02_Hardware/Rob's_Laptop.md)                | `E8:9C:25:90:8B:11` | :material-ethernet: | :material-check: | Ethernet NIC on Rob's main laptop PC                                 |
| :material-laptop:&nbsp;Laptop PC               | Mobile      | [<code>ems1</code>](../02_Hardware/Rob's_Laptop.md)                | `F8:54:F6:C1:88:D2` |   :material-wifi:   | :material-check: | Wi-Fi NIC on Rob's main laptop PC                                    |
| :symbols-mobile:&nbsp;Pixel 9 Pro              | Mobile      | [<code>bens-phone</code>](../02_Hardware/Ben's_Smartphone.md)      | `08:8B:C8:4E:19:7B` |   :material-wifi:   | :material-check: | Ben's phone, Google Pixel 9 Pro                                      |
| :symbols-mobile:&nbsp;Galaxy S25+              | Mobile      | `robs-phone`                                                       | `1A:5C:54:48:81:37` |   :material-wifi:   | :material-check: | Rob's phone, Samsung Galaxy S25+                                     |
| :devices-google-tv-remote:&nbsp;Google TV      | Bedroom     | `google-tv-bedroom`                                                | `AC:67:84:EC:DF:9D` |   :material-wifi:   | :material-check: | Chromecast with Google TV connected to Bedroom TV                    |
| :material-watch:&nbsp;Pixel Watch              | Mobile      | `google-pixel-watch-2`                                             | `16:EA:08:E8:93:75` |   :material-wifi:   | :material-check: | Ben's Smartwatch, Google Pixel Watch 2                               |
| :devices-nest-audio:&nbsp;Nest Speaker         | Office      | `nest-speaker`                                                     | `1C:53:F9:FA:F6:7C` |   :material-wifi:   | :material-check: | Nest Audio in Office                                                 |
| :devices-nest-display-assistant:&nbsp;Nest Hub | Kitchen     | `kitchen-hub`                                                      | `3C:8D:20:FC:D4:D1` |   :material-wifi:   | :material-check: | Nest Hub smart display in the Kitchen                                |
| :devices-nest-display-assistant:&nbsp;Nest Hub | Living-Room | `living-room-hub`                                                  | `24:E5:0F:D9:44:A9` |   :material-wifi:   | :material-check: | Nest Hub smart display in the Living Room                            |
| :devices-google-tv-remote:&nbsp;Google TV      | Living-Room | `google-tv-livingroom`                                             | `B8:7B:D4:9D:80:F5` |   :material-wifi:   | :material-check: | Google TV Streamer, Connected to the Fire TV in the Living Room      |
| :devices-connected-tv:&nbsp;Smart TV           | Living-Room | `amazon-fire-tv`                                                   | `4C:53:FD:47:AC:14` |   :material-wifi:   | :material-check: | 55" TCL Smart TV in Living Room                                      |
| :devices-chromecast-fill:&nbsp;Streaming Stick | Living-Room | `roku-streaming-stick-4k`                                          | `50:06:F5:53:2A:F2` |   :material-wifi:   | :material-check: | Roku Streaming Stick 4K (2025), Connected to TV in Living Room       |
| :material-nintendo-game-boy:&nbsp;Game Console | Mobile      | `nintendo-switch`                                                  | `74:84:69:0B:56:EF` |   :material-wifi:   | :material-check: | Nintendo Switch OLED                                                 |

## :symbols-shield-house-fill: IoT Network *(VLAN53)*

| Device Type                                       | Location    | Hostname              | MAC Address         |    Interface    |    WAN Access    | Role / Notes                                                                                         |
| :------------------------------------------------ | :---------- | :-------------------- | :------------------ | :-------------: | :--------------: | :--------------------------------------------------------------------------------------------------- |
| :devices-vacuum-fill:&nbsp;Robot Vacuum           | Living-Room | `roomba-675`          | `80:C5:F2:DC:B1:57` | :material-wifi: | :material-close: | Roomba 675 robot vacuum                                                                              |
| :devices-nest-protect:&nbsp;Alarm Hub             | Living-Room | `ring-solutions`      | `B0:09:DA:1C:92:08` | :material-wifi: | :material-check: | Ring Alarm base station                                                                              |
| :material-bell-ring-outline:&nbsp;Doorbell Chime  | Living-Room | `ring-chime`          | `18:7F:88:FD:A6:9D` | :material-wifi: | :material-check: | Chime for Ring Doorbell                                                                              |
| :devices-nest-thermostat:&nbsp;Nest Thermostat    | Living-Room | `nest-thermostat`     | `18:B4:30:1D:4F:05` | :material-wifi: | :material-check: | Nest Thermostat for HVAC system                                                                      |
| :material-home-assistant:&nbsp;Home Assistant     | Office      | `pi-server`           | `E4:5F:01:A4:60:08` | :material-wifi: | :material-check: | Home Assistant server, hosted on [pi-server](../02_Hardware/Raspberry_Pi_4B_Server.md) via Wi-Fi NIC |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Office      | `office-lamp-2`       | `D0:C9:07:00:09:D0` | :material-wifi: | :material-close: | Govee RGBW smart LED bulb for lamp in office                                                         |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Office      | `office-lamp-1`       | `D0:C9:07:05:00:AA` | :material-wifi: | :material-close: | Govee RGBW smart LED bulb for lamp in office                                                         |
| :material-floor-lamp:&nbsp;Smart Lamp             | Living-Room | `floor-lamp`          | `60:74:F4:EA:F1:62` | :material-wifi: | :material-close: | Govee RGBW floor lamp in Living Room                                                                 |
| :devices-nest-cam:&nbsp;Security Camera           | Living-Room | `ring-cam-indoor`     | `9C:76:13:F6:9F:FD` | :material-wifi: | :material-check: | Ring indoor security camera                                                                          |
| :material-led-strip-variant:&nbsp;LED Strip Light | Office      | `office-desk-accent`  | `D4:AD:FC:0E:F1:B1` | :material-wifi: | :material-close: | Govee RGB LED strip for desk accent lighting                                                         |
| :devices-nest-cam:&nbsp;Security Camera           | Back-Yard   | `ring-cam-outdoor`    | `18:7F:88:F2:8F:21` | :material-wifi: | :material-check: | Ring outdoor security camera in the back yard                                                        |
| :material-doorbell-video:&nbsp;Video Doorbell     | Front-Door  | `ring-doorbell`       | `90:48:6C:61:29:BC` | :material-wifi: | :material-check: | Ring video doorbell, front door                                                                      |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Bedroom     | `bedroom-lamp`        | `D0:C9:07:08:81:18` | :material-wifi: | :material-close: | Govee RGBW smart LED bulb for lamp in bedroom                                                        |
| :devices-ac-unit:&nbsp;Window A/C Unit            | Bedroom     | `gemodule1C46`        | `D8:28:C9:F7:1C:46` | :material-wifi: | :material-close: | GE window A/C unit in bedroom                                                                        |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Kitchen     | `vent-hood`           | `D0:C9:07:ED:A7:E6` | :material-wifi: | :material-close: | Govee RGBW smart LED bulb for vent hood in kitchen                                                   |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Living-Room | `table-lamp-1`        | `D0:C9:07:05:04:4C` | :material-wifi: | :material-close: | Govee RGBW smart LED bulb for lamp in living room                                                    |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Living-Room | `table-lamp-2`        | `D0:C9:07:DB:9C:86` | :material-wifi: | :material-close: | Govee RGBW smart LED bulb for lamp in living room                                                    |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Living-Room | `christmas-tree-lamp` | `D0:C9:07:EF:4D:A4` | :material-wifi: | :material-close: | Govee RGBW smart LED bulb for ceramic Christmas tree decoration                                      |

---
<div class="grid cards" markdown>

-   :material-ip-network:{ .lg .middle } **IP Address Management**

    ---

    [IP Address Management](../01_Infrastructure/IP_Address_Management.md){ .md-button }

-   :material-sitemap:{ .lg .middle } **Network Diagrams**

    ---

    [Logical Map](../01_Infrastructure/Logical_Map.md){ .md-button }&emsp;[Physical Map](../01_Infrastructure/Physical_Map.md){ .md-button }

</div>

<div class="grid cards" markdown>

-   :material-restore-alert:{ .lg .middle } **Disaster Recovery**
    
    ---

    [Disaster Recovery Plan](../01_Infrastructure/Disaster_Recovery_Plan.md){ .md-button }

-   :material-server-security:{ .lg .middle } **Network Security**

    ---

    [Network Security Policy](../01_Infrastructure/Network_Security_Policy.md){ .md-button }

</div>