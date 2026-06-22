---
icon: material/ethernet
title: MAC Address Tables
subtitle: Hardware MAC Addresses
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
*Hardware MAC Addresses*

---

## :symbols-router:&ensp;Network Infrastructure

| Device Type                           | Location    | Hostname                                                      | Interface                                  | MAC Address         | Role / Notes                      |
| :------------------------------------ | :---------- | :------------------------------------------------------------ | :----------------------------------------- | :------------------ | :-------------------------------- |
| :material-wan:&nbsp;Cable Modem       | Living-Room | [<code>N/A</code>](../02_Hardware/Hitron_Modem.md)            | :material-ethernet:&nbsp;*LAN 1*           | `00:1c:73:00:00:99` | Cable modem, Hitron DOCSIS 3.1    |
|                                       |             |                                                               | :material-ethernet:&nbsp;*LAN 2*           | `XX:XX:XX:XX:XX:XX` |                                   |
| :symbols-router:&nbsp;Wireless Router | Living-Room | [<code>RT-BE92U-FAF0</code>](../02_Hardware/ASUS_RT-BE92U.md) | :material-ethernet:&nbsp;*WAN*             | `60:CF:84:51:FA:F0` | Main router, ASUS RT-BE92U        |
|                                       |             |                                                               | :symbols-android-wifi-lock:&nbsp;*2.4 GHz* | `6A:CF:84:51:FA:F1` |                                   |
|                                       |             |                                                               | :symbols-android-wifi-lock:&nbsp;*5 GHz*   | `82:CF:84:51:FA:F5` |                                   |
|                                       |             |                                                               | :symbols-android-wifi-lock:&nbsp;*6 GHz*   | `60:CF:84:51:FA:F9` |                                   |
| :symbols-router:&nbsp;Mesh Node       | Office      | [<code>RT-AX55-1360</code>](../02_Hardware/ASUS_RT-AX55.md)   | :material-ethernet:&nbsp;*WAN*             | `7C:10:C9:DF:13:60` | AiMesh^&copy;^ Node, ASUS RT-AX55 |
|                                       |             |                                                               | :symbols-android-wifi-lock:&nbsp;*2.4 GHz* | `7C:10:C9:DF:13:61` |                                   |
|                                       |             |                                                               | :symbols-android-wifi-lock:&nbsp;*5 GHz*   | `7C:10:C9:DF:13:64` |                                   |

## :symbols-security:&ensp;Trusted Network 
&emsp;&emsp;&ensp;*VLAN50*

| Device Type                                    | Location    | Hostname                                                          | MAC Address         |      Interface      |   WAN Access    | Role / Notes                                                         |
| :--------------------------------------------- | :---------- | :---------------------------------------------------------------- | :------------------ | :-----------------: | :-------------: | :------------------------------------------------------------------- |
| :symbols-dns:&nbsp;DNS Server                  | Office      | [<code>pi-server</code>](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | `E4:5F:01:A4:60:07` | :material-ethernet: | :symbols-check: | Secondary [Technitium](../03_Services/Technitium.md) DNS server node |
| :symbols-server:&nbsp;Proxy Server             | Office      | [<code>pi-zero</code>](../02_Hardware/Raspberry_Pi_Zero_2_W.md)   | `2C:CF:67:DB:F5:E2` |   :symbols-wifi:    | :symbols-check: | [Caddy](../03_Services/Caddy.md) reverse proxy server                |
| :material-nas:&nbsp;NAS Server                 | Living-Room | [<code>ZimaOS-NAS</code>](../02_Hardware/ZimaBoard_2_NAS.md)      | `00:E0:4C:5B:9A:96` | :material-ethernet: | :symbols-check: | Main file storage server *(eth0)*                                    |
| :material-nas:&nbsp;NAS Server                 | Living-Room | [<code>ZimaOS-NAS</code>](../02_Hardware/ZimaBoard_2_NAS.md)      | `00:E0:4C:5B:9A:95` | :material-ethernet: | :symbols-check: | Second NIC for main file storage server *(eth1)*                     |
| :symbols-dns:&nbsp;DNS Server                  | -           | [<code>debian-vm</code>](../02_Hardware/Debian_Server_VM.md)      | `52:54:00:28:BB:EA` | :material-ethernet: | :symbols-check: | Primary [Technitium](../03_Services/Technitium.md) DNS server node   |
| :material-desktop-tower:&nbsp;Desktop PC       | Office      | [<code>bens-workstation</code>](../02_Hardware/Ben's_Desktop.md)  | `3C:7C:3F:0D:A9:CD` | :material-ethernet: | :symbols-check: | Ben's Main desktop PC                                                |
| :material-desktop-tower:&nbsp;Desktop PC       | Office      | [<code>bens-workstation</code>](../02_Hardware/Ben's_Desktop.md)  | `C2:57:52:3B:6F:D8` |   :symbols-wifi:    | :symbols-check: | Wi-Fi NIC on Ben's main desktop PC                                   |
| :symbols-laptop:&nbsp;Laptop PC                | Mobile      | [<code>ben-laptop</code>](../02_Hardware/Ben's_Laptop.md)         | `A6:97:E3:D2:F1:C4` |   :symbols-wifi:    | :symbols-check: | Ben's laptop PC                                                      |
| :material-printer-3d-nozzle:&nbsp;3D-Printer   | Office      | [<code>k1c-a71e</code>](../02_Hardware/Kacey_3D-printer.md)       | `FC:EE:28:09:A7:1E` |   :symbols-wifi:    | :symbols-check: | Creality K1C 3D-printer                                              |
| :material-desktop-tower:&nbsp;Desktop PC       | Office      | [<code>Rob-Desktop</code>](../02_Hardware/Rob's_Desktop.md)       | `50:EB:F6:59:74:C3` | :material-ethernet: | :symbols-check: | Rob's main desktop PC                                                |
| :material-desktop-tower:&nbsp;Desktop PC       | Office      | [<code>Rob-Desktop</code>](../02_Hardware/Rob's_Desktop.md)       | `70:A6:CC:B5:F5:4A` |   :symbols-wifi:    | :symbols-check: | Wi-Fi NIC on Rob's main desktop PC                                   |
| :symbols-laptop:&nbsp;Laptop PC                | Mobile      | [<code>ems1</code>](../02_Hardware/Rob's_Laptop.md)               | `E8:9C:25:90:8B:11` | :material-ethernet: | :symbols-check: | Ethernet NIC on Rob's main laptop PC                                 |
| :symbols-laptop:&nbsp;Laptop PC                | Mobile      | [<code>ems1</code>](../02_Hardware/Rob's_Laptop.md)               | `F8:54:F6:C1:88:D2` |   :symbols-wifi:    | :symbols-check: | Wi-Fi NIC on Rob's main laptop PC                                    |
| :symbols-mobile:&nbsp;Pixel 9 Pro              | Mobile      | [<code>ben-s-phone</code>](../02_Hardware/Ben's_Smartphone.md)    | `08:8B:C8:4E:19:7B` |   :symbols-wifi:    | :symbols-check: | Ben's phone, Google Pixel 9 Pro                                      |
| :symbols-mobile:&nbsp;Galaxy S25+              | Mobile      | `robert-s-phone`                                                  | `1A:5C:54:48:81:37` |   :symbols-wifi:    | :symbols-check: | Rob's phone, Samsung Galaxy S25+                                     |
| :symbols-tv-assistant:&nbsp;Google TV          | Bedroom     | `google-tv-bedroom`                                               | `AC:67:84:EC:DF:9D` |   :symbols-wifi:    | :symbols-check: | Chromecast with Google TV connected to Bedroom TV                    |
| :symbols-watch:&nbsp;Pixel Watch               | Mobile      | `Google-Pixel-Watch-2`                                            | `16:EA:08:E8:93:75` |   :symbols-wifi:    | :symbols-check: | Ben's Smartwatch, Google Pixel Watch 2                               |
| :symbols-nest-audio:&nbsp;Nest Speaker         | Office      | `nest-audio`                                                      | `1C:53:F9:FA:F6:7C` |   :symbols-wifi:    | :symbols-check: | Nest Audio in Office                                                 |
| :symbols-nest-display-assistant:&nbsp;Nest Hub | Kitchen     | `kitchen-hub`                                                     | `3C:8D:20:FC:D4:D1` |   :symbols-wifi:    | :symbols-check: | Nest Hub smart display in the Kitchen                                |
| :symbols-nest-display-assistant:&nbsp;Nest Hub | Living-Room | `living-room-hub`                                                 | `24:E5:0F:D9:44:A9` |   :symbols-wifi:    | :symbols-check: | Nest Hub smart display in the Living Room                            |
| :symbols-tv-assistant:&nbsp;Google TV          | Living-Room | `google-tv-livingroom`                                            | `B8:7B:D4:9D:80:F5` |   :symbols-wifi:    | :symbols-check: | Google TV Streamer, Connected to the Fire TV in the Living Room      |
| :symbols-tv-assistant:&nbsp;Google TV          | Living-Room | `google-tv-livingroom`                                            | `B8:7B:D4:9D:80:F7` | :material-ethernet: | :symbols-check: | Google TV Streamer, Connected to the Fire TV in the Living Room      |
| :symbols-tv:&nbsp;Smart TV                     | Living-Room | `amazon-fire-tv`                                                  | `4C:53:FD:47:AC:14` |   :symbols-wifi:    | :symbols-check: | 55" TCL Smart TV in Living Room                                      |
| :symbols-tv:&nbsp;Smart TV                     | Living-Room | `amazon-fire-tv`                                                  | `4C:53:FD:6A:81:D5` | :material-ethernet: | :symbols-check: | 55" TCL Smart TV in Living Room                                      |
| :symbols-chromecast-fill:&nbsp;Streaming Stick | Living-Room | `StreamingStick4K`                                                | `50:06:F5:53:2A:F2` |   :symbols-wifi:    | :symbols-check: | Roku Streaming Stick 4K (2025), Connected to TV in Living Room       |
| :material-nintendo-switch:&nbsp;Game Console   | Mobile      | `nintendo-switch`                                                 | `74:84:69:0B:56:EF` |   :symbols-wifi:    | :symbols-check: | Nintendo Switch OLED                                                 |
| :material-nintendo-switch:&nbsp;Game Console   | Living-Room | `nintendo-switch`                                                 | `74:84:69:34:69:78` | :material-ethernet: | :symbols-check: | Nintendo Switch OLED docking station for TV in Living Room           |

## :symbols-shield-house-fill:&ensp;IoT Network 
&emsp;&emsp;&ensp;*VLAN53*

| Device Type                                       | Location    | Hostname                                                                | MAC Address         |   Interface    |   WAN Access    | Role / Notes                                                    |
| :------------------------------------------------ | :---------- | :---------------------------------------------------------------------- | :------------------ | :------------: | :-------------: | :-------------------------------------------------------------- |
| :simple-homeassistant:&nbsp;Home Assistant        | Office      | [<code>home-assistant</code>](../02_Hardware/Raspberry_Pi_4B_Server.md) | `E4:5F:01:A4:60:08` | :symbols-wifi: | :symbols-check: | Home Assistant server, hosted on `pi-server` via `wlan0`        |
| :symbols-vacuum-fill:&nbsp;Robot Vacuum           | Living-Room | `roomba-675`                                                            | `80:C5:F2:DC:B1:57` | :symbols-wifi: | :symbols-close: | Roomba 675 robot vacuum                                         |
| :symbols-nest-protect:&nbsp;Alarm Hub             | Living-Room | `ring-solutions`                                                        | `B0:09:DA:1C:92:08` | :symbols-wifi: | :symbols-check: | Ring Alarm base station                                         |
| :material-bell-ring-outline:&nbsp;Doorbell Chime  | Living-Room | `ring-chime`                                                            | `18:7F:88:FD:A6:9D` | :symbols-wifi: | :symbols-check: | Chime for Ring Doorbell                                         |
| :symbols-nest-thermostat:&nbsp;Nest Thermostat    | Living-Room | `nest-thermostat`                                                       | `18:B4:30:1D:4F:05` | :symbols-wifi: | :symbols-check: | Nest Thermostat for HVAC system                                 |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Office      | `office-lamp-2`                                                         | `D0:C9:07:00:09:D0` | :symbols-wifi: | :symbols-close: | Govee RGBW smart LED bulb for lamp in office                    |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Office      | `office-lamp-1`                                                         | `D0:C9:07:05:00:AA` | :symbols-wifi: | :symbols-close: | Govee RGBW smart LED bulb for lamp in office                    |
| :symbols-floor-lamp:&nbsp;Smart Lamp              | Living-Room | `floor-lamp`                                                            | `60:74:F4:EA:F1:62` | :symbols-wifi: | :symbols-close: | Govee RGBW floor lamp in Living Room                            |
| :symbols-nest-cam:&nbsp;Security Camera           | Living-Room | `ring-cam-indoor`                                                       | `9C:76:13:F6:9F:FD` | :symbols-wifi: | :symbols-check: | Ring indoor security camera                                     |
| :symbols-lightstrip:&nbsp;LED Strip Light         | Office      | `office-desk-accent`                                                    | `D4:AD:FC:0E:F1:B1` | :symbols-wifi: | :symbols-close: | Govee RGB LED strip for desk accent lighting                    |
| :symbols-nest-cam:&nbsp;Security Camera           | Back-Yard   | `ring-cam-outdoor`                                                      | `18:7F:88:F2:8F:21` | :symbols-wifi: | :symbols-check: | Ring outdoor security camera in the back yard                   |
| :material-doorbell-video:&nbsp;Video Doorbell     | Front-Door  | `ring-doorbell`                                                         | `90:48:6C:61:29:BC` | :symbols-wifi: | :symbols-check: | Ring video doorbell, front door                                 |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Bedroom     | `bedroom-lamp`                                                          | `D0:C9:07:08:81:18` | :symbols-wifi: | :symbols-close: | Govee RGBW smart LED bulb for lamp in bedroom                   |
| :symbols-climate-mini-split:&nbsp;Window A/C Unit | Bedroom     | `gemodule1C46`                                                          | `D8:28:C9:F7:1C:46` | :symbols-wifi: | :symbols-close: | GE window A/C unit in bedroom                                   |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Kitchen     | `vent-hood`                                                             | `D0:C9:07:ED:A7:E6` | :symbols-wifi: | :symbols-close: | Govee RGBW smart LED bulb for vent hood in kitchen              |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Living-Room | `table-lamp-1`                                                          | `D0:C9:07:05:04:4C` | :symbols-wifi: | :symbols-close: | Govee RGBW smart LED bulb for lamp in living room               |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Living-Room | `table-lamp-2`                                                          | `D0:C9:07:DB:9C:86` | :symbols-wifi: | :symbols-close: | Govee RGBW smart LED bulb for lamp in living room               |
| :material-lightbulb-variant:&nbsp;Smart Bulb      | Living-Room | `christmas-tree-lamp`                                                   | `D0:C9:07:EF:4D:A4` | :symbols-wifi: | :symbols-close: | Govee RGBW smart LED bulb for ceramic Christmas tree decoration |

---
<div class="grid cards" markdown>

-   :material-ip-network:{ .lg .middle }&emsp;**IP Address Management**

    ---

    [IP Address Management](../01_Infrastructure/IP_Address_Management.md){ .md-button }

-   :symbols-sitemap:{ .lg .middle }&emsp;**Network Diagrams**

    ---

    [Logical Map](../01_Infrastructure/Logical_Map.md){ .md-button }&emsp;[Physical Map](../01_Infrastructure/Physical_Map.md){ .md-button }

</div>

<div class="grid cards" markdown>

-   :symbols-restore:{ .lg .middle }&emsp;**Disaster Recovery**
    
    ---

    [Disaster Recovery Plan](../01_Infrastructure/Disaster_Recovery_Plan.md){ .md-button }

-   :symbols-policy-fill:{ .lg .middle }&emsp;**Network Security**

    ---

    [Network Security Policy](../01_Infrastructure/Network_Security_Policy.md){ .md-button }

</div>