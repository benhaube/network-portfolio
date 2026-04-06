---
hide:
  - toc
---
![[ethernet.svg|200]]
# [MAC Address Tables](../01_Infrastructure/MAC_Address_Tables.md)

> [!info]+
> Tables containing devices on the LAN and their hardware MAC addresses.

---
## :material-router-wireless: Network Infrastructure

| Device Type | Location | Hostname | Interface | MAC Address | Role / Notes |
| :---------- | :------- | :------- | :-------- | :---------- | :----------- |
| :material-wan: Cable Modem | Living-Room | [hitron-modem](../02_Hardware/Hitron_Modem.md) | :material-ethernet: LAN 1 | `00:1c:73:00:00:99` | Cable modem, Hitron DOCSIS 3.1 |  
| - | - | - | :material-ethernet: LAN 2 | `XX:XX:XX:XX:XX:XX` | - | 
| :material-router-wireless: Wireless Router | Living-Room | [asusrouter](../02_Hardware/ASUS_RT-BE92U.md) | :material-ethernet: | `60:CF:84:51:FA:F0` | Main router, ASUS RT-BE92U |
| - | - | - | :material-wifi: *(2.4 GHz)* | `6A:CF:84:51:FA:F1` | - |
| - | - | - | :material-wifi: *(5 GHz)* | `82:CF:84:51:FA:F5` | - |
| - | - | - | :material-wifi: *(6 GHz)* | `60:CF:84:51:FA:F9` | - |
| :material-router-wireless: Mesh Node | Office | [aimesh-node](../02_Hardware/ASUS_RT-AX55.md) | :material-ethernet: | `7C:10:C9:DF:13:60` | AiMesh Node, ASUS RT-AX55 |
| - | - | - | :material-wifi: *(2.4 GHz)* | `7C:10:C9:DF:13:61` | - |
| - | - | - | :material-wifi: *(5 GHz)* | `7C:10:C9:DF:13:64` | - |

---
## :material-security: Trusted Network *(vlan50)*

| Device Type | Location | Hostname | MAC Address | IP Method | IP Address | Interface | WAN Access | Role / Notes |
| :---------- | :------- | :------- | :---------- | :-------- | :--------- | :-------: | :--------: | :----------- |
| :material-dns: Server *(DNS)* | Office | [pi-server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | `E4:5F:01:A4:60:07` | Static | `192.168.50.2` | :material-ethernet: | :material-checkbox-outline: | Secondary [[Technitium]] DNS server node |
| :material-server: Server *(Proxy)* | Office | [pi-zero](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | `2C:CF:67:DB:F5:E2` | Static | `192.168.50.3` | :material-wifi: | :material-checkbox-outline: | [[Caddy]] reverse proxy server |
| :material-nas: Server *(NAS)* | Living-Room | [storage-server](../02_Hardware/ZimaBoard_2_NAS.md) | `00:E0:4C:5B:9A:96` | Static | `192.168.50.4` | :material-ethernet: | :material-checkbox-outline: | Main file storage server |
| :material-nas: Server *(NAS)* | Living-Room | [storage-server-2](../02_Hardware/ZimaBoard_2_NAS.md) | `00:E0:4C:5B:9A:95` | Static | `192.168.50.5` | :material-ethernet: | :material-checkbox-outline: | Second NIC for main file storage server |
| :material-dns: Server *(DNS)* | - | [debian-vm](../02_Hardware/Debian_Server_VM.md) | `52:54:00:28:BB:EA` | Static | `192.168.50.6` | :material-ethernet: | :material-checkbox-outline: | Main [[Technitium]] DNS server node |
| :material-desktop-tower: Desktop PC | Office | [bens-workstation](../02_Hardware/Ben's_Desktop.md) | `3C:7C:3F:0D:A9:CD` | Static | `192.168.50.61` | :material-ethernet: | :material-checkbox-outline: | Ben's Main desktop PC |
| :material-desktop-tower: Desktop PC | Office | [bens-workstation](../02_Hardware/Ben's_Desktop.md) | `C2:57:52:3B:6F:D8` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Wi-Fi NIC on Ben's main desktop PC |
| :material-laptop: Laptop PC | Mobile | [ben-laptop](../02_Hardware/Ben's_Laptop.md) | `A6:97:E3:D2:F1:C4` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Ben's laptop PC |
| :material-printer-3d-nozzle: 3D-Printer | Office | [k1c-a71e](../02_Hardware/Kacey_3D-printer.md) | `FC:EE:28:09:A7:1E` | Static | `192.168.50.153` | :material-wifi: | :material-checkbox-outline: | Creality K1C 3D-printer |
| :material-desktop-tower: Desktop PC | Office | [rob-desktop](../02_Hardware/Rob's_Desktop.md) | `50:EB:F6:59:74:C3` | DHCP | - | :material-ethernet: | :material-checkbox-outline: | Rob's main desktop PC |
| :material-desktop-tower: Desktop PC | Office | [rob-desktop](../02_Hardware/Rob's_Desktop.md) | `70:A6:CC:B5:F5:4A` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Wi-Fi NIC on Rob's main desktop PC |
| :material-laptop: Laptop PC | Mobile | `ems1` | `E8:9C:25:90:8B:11` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Wi-Fi NIC on Rob's main laptop PC |
| :material-laptop: Laptop PC | Mobile | `ems1` | `F8:54:F6:C1:88:D2` | DHCP | - | :material-ethernet: | :material-checkbox-outline: | Ethernet NIC on Rob's main laptop PC |
| :simple-googletv: Google TV | Bedroom | `google-tv-bedroom` | `AC:67:84:EC:DF:9D` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Chromecast with Google TV connected to Bedroom TV |
| :material-watch: Smartwatch | Mobile | `google-pixel-watch-2` | `16:EA:08:E8:93:75` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Ben's Smartwatch, Google Pixel Watch 2 |
| :devices-nest-audio:&nbsp;Nest Speaker | Office | `nest-speaker` | `1C:53:F9:FA:F6:7C` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Nest Audio in Office |
| :material-cellphone: Smartphone | Mobile | `bens-phone` | `08:8B:C8:4E:19:7B` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Ben's phone, Google Pixel 9 Pro |
| :material-cellphone: Smartphone | Mobile | `robs-phone` | `1A:5C:54:48:81:37` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Rob's phone, Samsung Galaxy S25+ |
| :devices-nest-display:&nbsp;Nest Hub | Kitchen | `kitchen-hub` | `3C:8D:20:FC:D4:D1` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Nest Hub® smart display in the Kitchen |
| :devices-nest-display:&nbsp;Nest Hub | Living-Room | `living-room-hub` | `24:E5:0F:D9:44:A9` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Nest Hub® smart display in the Living Room |
| :simple-googletv: Google TV | Living-Room | `google-tv-livingroom` | `B8:7B:D4:9D:80:F5` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Google TV Streamer, Connected to the Fire TV in the Living Room |
| :material-cast: Smart TV | Living-Room | `amazon-fire-tv` | `4C:53:FD:47:AC:14` | DHCP | - | :material-wifi: | :material-checkbox-outline: | 55" TCL Smart TV in Living Room |
| :material-cast: Streaming Box | Living-Room | `roku-streaming-stick-4k` | `50:06:F5:53:2A:F2` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Roku Streaming Stick 4K (2025), Connected to TV in Living Room |
| :material-nintendo-game-boy: Game Console | Mobile | `nintendo-switch` | `74:84:69:0B:56:EF` | DHCP | - | :material-wifi: | :material-checkbox-outline: | Nintendo Switch OLED |

---
## :material-home-automation: IoT Network *(vlan53)*

| Device Type | Location | Hostname | MAC Address | IP Method | Interface | WAN Access | Role / Notes |
| :---------- | :------- | :------- | :---------- | :-------- | :-------: | :--------: | :----------- |
| :material-robot-vacuum: Robot Vacuum | Living-Room | `roomba-675` | `80:C5:F2:DC:B1:57` | DHCP | :material-wifi: | :material-close-box-outline: | Roomba 675 robot vacuum |
| :devices-nest-protect:&nbsp;Alarm Hub | Living-Room | `ring-solutions` | `B0:09:DA:1C:92:08` | DHCP | :material-wifi: | :material-checkbox-outline: | Ring Alarm base station |
| :material-bell-ring-outline: Doorbell Chime | Living-Room | `ring-chime` | `18:7F:88:FD:A6:9D` | DHCP | :material-wifi: | :material-checkbox-outline: | Chime for Ring Doorbell |
| :material-thermostat: Nest Thermostat | Living-Room | `nest-thermostat` | `18:B4:30:1D:4F:05` | DHCP | :material-wifi: | :material-checkbox-outline: | Nest Thermostat for HVAC system |
| :material-home-assistant: Home Assistant | Office | `pi-server` | `E4:5F:01:A4:60:08` | DHCP | :material-wifi: | :material-checkbox-outline: | Home Assistant server, hosted on [pi-server](../02_Hardware/Raspberry_Pi_4B_Server.md) via Wi-Fi NIC |
| :material-lightbulb-variant: Smart Bulb | Office | `office-lamp-2` | `D0:C9:07:00:09:D0` | DHCP | :material-wifi: | :material-close-box-outline: | Govee RGBW smart LED bulb for lamp in office |
| :material-lightbulb-variant: Smart Bulb | Office | `office-lamp-1` | `D0:C9:07:05:00:AA` | DHCP | :material-wifi: | :material-close-box-outline: | Govee RGBW smart LED bulb for lamp in office |
| :material-floor-lamp: Smart Lamp | Living-Room | `floor-lamp` | `60:74:F4:EA:F1:62` | DHCP | :material-wifi: | :material-close-box-outline: | Govee RGBW floor lamp in Living Room |
| :devices-nest-cam:&nbsp;Security Camera | Living-Room | `ring-cam-indoor` | `9C:76:13:F6:9F:FD` | DHCP | :material-wifi: | :material-checkbox-outline: | Ring indoor security camera |
| :material-led-strip-variant: LED Strip Light | Office | `office-desk-accent` | `D4:AD:FC:0E:F1:B1` | DHCP | :material-wifi: | :material-close-box-outline: | Govee RGB LED strip for desk accent lighting |
| :devices-nest-cam:&nbsp;Security Camera | Back-Yard | `ring-cam-outdoor` | `18:7F:88:F2:8F:21` | DHCP | :material-wifi: | :material-checkbox-outline: | Ring outdoor security camera in the back yard |
| :material-doorbell-video: Video Doorbell | Front-Door | `ring-doorbell` | `90:48:6C:61:29:BC` | DHCP | :material-wifi: | :material-checkbox-outline: | Ring video doorbell, front door |
| :material-lightbulb-variant: Smart Bulb | Bedroom | `bedroom-lamp` | `D0:C9:07:08:81:18` | DHCP | :material-wifi: | :material-close-box-outline: | Govee RGBW smart LED bulb for lamp in bedroom |
| :material-air-conditioner: Window A/C Unit | Bedroom | `gemodule1C46` | `D8:28:C9:F7:1C:46` | DHCP | :material-wifi: | :material-close-box-outline: | GE window A/C unit in bedroom |
| :material-lightbulb-variant: Smart Bulb | Kitchen | `vent-hood` | `D0:C9:07:ED:A7:E6` | DHCP | :material-wifi: | :material-close-box-outline: | Govee RGBW smart LED bulb for vent hood in kitchen |
| :material-lightbulb-variant: Smart Bulb | Living-Room | `table-lamp-1` | `D0:C9:07:05:04:4C` | DHCP | :material-wifi: | :material-close-box-outline: | Govee RGBW smart LED bulb for lamp in living room |
| :material-lightbulb-variant: Smart Bulb | Living-Room | `table-lamp-2` | `D0:C9:07:DB:9C:86` | DHCP | :material-wifi: | :material-close-box-outline: | Govee RGBW smart LED bulb for lamp in living room |
| :material-lightbulb-variant: Smart Bulb | Living-Room | `christmas-tree-lamp` | `D0:C9:07:EF:4D:A4` | DHCP | :material-wifi: | :material-close-box-outline: | Govee RGBW smart LED bulb for ceramic Christmas tree decoration |
