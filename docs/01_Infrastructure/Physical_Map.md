---
hide:
  - toc
---
![[sitemap.svg|100]]
# [[Physical_Map|Physical Network Map]]
---

```mermaid
%%{init: {'theme': 'dark'}}%%
graph
    %% --- Class definitions for Obsidian ---
    %% classDef isp fill:#ffebee,stroke:#c62828,stroke-width:2px;
    %% classDef multi fill:#e1f5fe,stroke:#01579b,stroke-width:2px;
    %% classDef tenGb fill:#ffccbc,stroke:#bf360c,stroke-width:2px;
    %% classDef twoFiveGb fill:#fff9c4,stroke:#fbc02d,stroke-width:2px;
    %% classDef twoFiveGbTemp fill:#fff9c4,stroke:#fbc02d,stroke-width:2px,stroke-dasharray: 5 5;
    %% classDef gigabit fill:#e8f5e9,stroke:#2e7d32,stroke-width:2px;
    %% classDef gigabitTemp fill:#e8f5e9,stroke:#2e7d32,stroke-width:2px,stroke-dasharray: 5 5;
    %% classDef wifi fill:#f3e5f5,stroke:#7b1fa2,stroke-width:2px,stroke-dasharray: 5 5;
    
	%% --- Class Definitions for MkDocs ---
	classDef isp fill:#22090E,stroke:#c62828,stroke-width:2px;
    classDef multi fill:#00111D,stroke:#01579b,stroke-width:2px;
    classDef tenGb fill:#5A1C00,stroke:#bf360c,stroke-width:2px;
    classDef twoFiveGb fill:#110C00,stroke:#fbc02d,stroke-width:2px;
    classDef twoFiveGbTemp fill:#110C00,stroke:#fbc02d,stroke-width:2px,stroke-dasharray: 5 5;
    classDef gigabit fill:#001200,stroke:#2e7d32,stroke-width:2px;
    classDef gigabitTemp fill:#001200,stroke:#2e7d32,stroke-width:2px,stroke-dasharray: 5 5;
    classDef wifi fill:#241026,stroke:#7b1fa2,stroke-width:2px,stroke-dasharray: 5 5;

	%% --- Ledgend ---
	VM("Virtual Machine"):::multi
	TenGb("10Gb Ethernet"):::tenGb
	TwoFiveGb("2.5Gb Ethernet"):::twoFiveGb
	TwoFiveGbTemp("2.5Gb Ethernet<br><i>(Temporary)</i>"):::twoFiveGbTemp
	Gigabit("1Gb Ethernet"):::gigabit
	GigabitTemp("1Gb Ethernet<br><i>(Temporary)</i>"):::gigabitTemp
	WiFi("Wi-Fi"):::wifi
```

```mermaid
%%{init: {'theme': 'dark'}}%%
graph TD
    %% --- Class definitions for Obsidian ---
    %% classDef isp fill:#ffebee,stroke:#c62828,stroke-width:2px;
    %% classDef multi fill:#e1f5fe,stroke:#01579b,stroke-width:2px;
    %% classDef tenGb fill:#ffccbc,stroke:#bf360c,stroke-width:2px;
    %% classDef twoFiveGb fill:#fff9c4,stroke:#fbc02d,stroke-width:2px;
    %% classDef twoFiveGbTemp fill:#fff9c4,stroke:#fbc02d,stroke-width:2px,stroke-dasharray: 5 5;
    %% classDef gigabit fill:#e8f5e9,stroke:#2e7d32,stroke-width:2px;
    %% classDef gigabitTemp fill:#e8f5e9,stroke:#2e7d32,stroke-width:2px,stroke-dasharray: 5 5;
    %% classDef wifi fill:#f3e5f5,stroke:#7b1fa2,stroke-width:2px,stroke-dasharray: 5 5;
    
    %% --- Class definitions for MkDocs ---
	classDef isp fill:#22090E,stroke:#c62828,stroke-width:2px;
    classDef multi fill:#00111D,stroke:#01579b,stroke-width:2px;
    classDef tenGb fill:#5A1C00,stroke:#bf360c,stroke-width:2px;
    classDef twoFiveGb fill:#110C00,stroke:#fbc02d,stroke-width:2px;
    classDef twoFiveGbTemp fill:#110C00,stroke:#fbc02d,stroke-width:2px,stroke-dasharray: 5 5;
    classDef gigabit fill:#001200,stroke:#2e7d32,stroke-width:2px;
    classDef gigabitTemp fill:#001200,stroke:#2e7d32,stroke-width:2px,stroke-dasharray: 5 5;
    classDef wifi fill:#241026,stroke:#7b1fa2,stroke-width:2px,stroke-dasharray: 5 5;
    
    %% --- Nodes ---
    ISP(("<b>ISP</b><br><i>(Xfinity)</i>")):::isp
    
    subgraph Living_Room ["<b>Living Room / Mini-Rack</b>"]
        direction TB
        Modem("<b>Hitron Modem</b><br><i>(DOCSIS 3.1)</i>"):::twoFiveGb
        RouterMain("<b>ASUS RT-BE92U</b><br><i>(Main Router)</i>"):::tenGb
        SwitchAgg("<b>Ugreen Switch</b><br><i>(CM753)</i>"):::tenGb
        Zima("<b>ZimaBoard 2 NAS</b><br><i>(Storage Server)</i>"):::twoFiveGb
        VM("<b>Debian Server VM</b><br><i>(Primary DNS)</i>"):::multi
    end

    subgraph Office ["<b>Office / Printer Cart</b>"]
        direction TB
        MeshNode("<b>ASUS RT-AX55</b><br><i>(AiMesh Node)</i>"):::gigabit
        SwitchOffice("<b>TP-Link Switch</b><br><i>(SG105)</i>"):::gigabit
        DesktopBen("Ben's Desktop"):::gigabit
        DesktopRob("Rob's Desktop"):::gigabit
        Pi4("<b>Raspberry Pi 4B</b><br><i>(Server / DNS)</i>"):::gigabit
        PiZero("<b>Pi Zero 2 W</b><br><i>(Caddy Reverse Proxy)</i>"):::wifi
        Printer3D("<b>Creality K1C</b><br><i>(3D-printer)</i>"):::wifi
    end

    subgraph Mobile ["<b>Mobile / Wi-Fi</b> <i>(VLAN50)</i>"]
        direction TB
        LaptopBen("Ben's Laptop"):::wifi
        LaptopRob("Rob's Laptop"):::twoFiveGbTemp
        PhoneBen("Ben's Phone"):::wifi
        PhoneRob("Rob's Phone"):::wifi
    end
    
    %% Invisible connections to arrange "Mobile / Wi-Fi"
    %% LaptopBen ~~~ PhoneBen
    %% LaptopRob ~~~ PhoneRob
    
    subgraph IoT ["<b>IoT Network</b> <i>(VLAN 53)</i>"]
        direction TB
        IoTDevices("IoT Devices"):::wifi
    end
    
    subgraph Guest ["<b>Guest Wi-Fi</b> <i>(VLAN 52)</i>"]
        direction TB
        GuestDevices("Guest Devices"):::wifi
    end

    %% --- Connections ---
    
    %% WAN / Uplinks
    ISP ==> Modem
    Modem -- "<b>WAN</b> <i>(2.5Gb)</i>" --> RouterMain
    
    %% 10Gb Core Backbone
    RouterMain == "<b>10Gb SFP+</b> <i>(Red Cat6a)</i>" ==> SwitchAgg

    %% Living Room Connections
    SwitchAgg -- "<b>Port 1</b> <i>(White Cat5e)</i>" --> LaptopRob
    SwitchAgg -- "<b>Port 4</b> <i>(Blue Cat6a)</i>" --> Zima
    SwitchAgg -- "<b>Port 5</b> <i>(Yellow Cat6a)</i>" --> Zima
    
    %% Virtual Connections
    Zima -.- VM

    %% Wireless Backhaul to Office
    RouterMain -. "Wi-Fi 5GHz Backhaul" .- MeshNode

    %% Office Connections
    MeshNode -- "<b>LAN 1</b> <i>(Black Cat6a)</i>" --> SwitchOffice
    SwitchOffice -- "<b>Port 1</b> <i>(White Cat5e)</i>" --> DesktopBen
    SwitchOffice -- "<b>Port 2</b> <i>(White Cat5e)</i>" --> DesktopRob
    SwitchOffice -- "<b>Port 3</b> <i>(White Cat5e)</i>" --> Pi4

    %% Wi-Fi Devices
    RouterMain -. "VLAN 52" .- GuestDevices
    RouterMain -. "VLAN 53" .- IoTDevices
    MeshNode -. "VLAN 50" .- PiZero
    RouterMain -. "VLAN 53<br><i>(wlan0)</i>" .- Pi4
    MeshNode -. "VLAN 50" .- Printer3D
    %%RouterMain -. "VLAN 50" .- LaptopBen
    %%RouterMain -. "VLAN 50" .- LaptopRob
    %%RouterMain -. "VLAN 50" .- PhoneBen
    %%RouterMain -. "VLAN 50" .- PhoneRob
    RouterMain -. "VLAN 50" .- Mobile
```
