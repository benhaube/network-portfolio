---
hide:
  - toc
---
![[file-document-multiple-color.svg|200]] 

# [[index|Network Documentation Index]]
[About Me :material-account-question:](About_Me.md){ .md-button .md-button--primary }&emsp;[Contact Me :material-email:](mailto:ben@haube-pereira.com){ .md-button }

---
## :material-lan: Infrastructure
> [!info]+
> The core infrastructure that makes up the LAN, such as: IP addressing, VLANs, VPNs, DDNS providers, etc.

1. :material-restore-alert:&ensp;[[Disaster_Recovery_Plan|Disaster Recovery Plan]]: Ensure **HA** for critical network services and to provide a clear path to data restoration for stateful services in the event of hardware failure or data corruption.
2. :material-ip-network:&ensp;[[IP_Address_Management|IP Address Management]]: Local network IPAM, VPN and VLAN information.
3. :material-ethernet:&ensp;[[MAC_Address_Tables|MAC Address Tables]]: Tables containing devices on the LAN and their hardware MAC addresses.
4. :material-server-security:&ensp;[[Network_Security_Policy|Network Security Policy]]: This infrastructure operates on the *Principle of Least Privilege*. No device or service is granted more network access than is strictly required for its primary function. Security is maintained through physical isolation, logical segmentation, and encrypted transit.
5. :material-sitemap:&ensp;[[Logical_Map|Logical Map]]: *Mermaid.js* flowchart focusing on servers and services. 
6. :material-sitemap:&ensp;[[Physical_Map|Physical Map]]: *Mermaid.js* flowchart focusing on physical connections.

---
## :material-router-wireless: Hardware
> [!info]+
> The hardware on the LAN. (servers, clients, routers, switches, etc.)

1. :material-router-network-wireless:&ensp;[[ASUS_RT-BE92U|ASUS RT-BE92U]]: Main router for the local network.
2. :material-router-network-wireless:&ensp;[[ASUS_RT-AX55|ASUS RT-AX55]]: Secondary router in the office upstairs, acting as an "*AiMesh*" node. 
3. :material-desktop-tower:&ensp;[[Ben's_Desktop|Ben's Desktop]]: Ben's main desktop PC located in the office upstairs.
4. :material-laptop:&ensp;[[Ben's_Laptop|Ben's Laptop]]: Ben's main laptop PC. Mobile device connected to the Trusted Wi-Fi network *(SSID: `Home`)*.
5. :material-debian:&ensp;[[Debian_Server_VM|Debian Server VM]]: General purpose Debian Linux server hosted on *[[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]*. 
6. :material-wan:&ensp;[[Hitron_Modem|Hitron Modem]]: DOCSIS 3.1 cable modem that communicates with the ISP *([Xfinity](https://www.xfinity.com/overview))*. 
7. :material-printer-3d-nozzle:&ensp;[[Kacey_3D-printer|Kacey 3D-Printer]]: Creality K1C 3D-printer located in the office upstairs. 
    
    > [!info]- More Creality K1C Info
    > More detailed information about the Creality K1C hardware.
    >
    > [More Kacey Info :devices-creality:](02_Hardware/Kacey_Info.md){ .md-button }

8. :simple-raspberrypi:&ensp;[[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]: Main DNS server *(Pi-hole)*, CUPS print server, Home Assistant server, and other *[Docker](https://www.docker.com/)* containers. 
9. :simple-raspberrypi:&ensp;[[Raspberry_Pi_Zero_2_W|Raspberry Pi Zero 2 W]]: Second DNS server *(Pi-hole)*.
10. :material-desktop-tower:&ensp;[[Rob's_Desktop|Rob's Desktop]]: Rob's main desktop PC located in the office upstairs.
11. :material-switch:&ensp;[[TP-Link_Switch|TP-Link Switch]]: Core gigabit desktop switch *(5-port)*. 
12. :material-switch:&ensp;[[Ugreen_Switch|Ugreen Switch]]: Rack-mounted 2.5 gigabit switch in the living room.
13. :material-nas:&ensp;[[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]: Primary NAS server & VM host. 

---
## :material-web: Services
> [!info]+
> The applications and services hosted on the Local Area Network.

1. :services-beszel:&ensp;[[Beszel_Agent|Beszel Agent]]: Agent for *[[Beszel_Hub|Beszel Hub]]*, a server utilization monitor. 
2. :services-beszel:&ensp;[[Beszel_Hub|Beszel Hub]]: A self-hosted server utilization monitor.
3. :services-caddy:&ensp;[[Caddy]]: Lightweight, open-source Web server written in Go. Used as a *reverse-proxy* for creating unique domains for locally hosted services.
4. :services-cloudflare:&ensp;[[Cloudflared]]: A secure reverse-proxy tunnel for hosting private services. Currently, *[[Immich]]* and *[[Uptime_Kuma|Uptime Kuma]]* are utilizing this service. 
5. :material-printer:&ensp;[[CUPS_Print_Server|CUPS Print Server]]: Print server for USB-connected `Brother_HL-L2300D_series` laser printer. 
6. :services-dockge:&ensp;[[Dockge]]: A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.
7. :services-f1-replay-timing:&ensp;[[F1_Replay_Timing|F1 Replay Timing]]: Visualization of real-time track data and telemetry synced to F1 live and replays.
8. :services-fluidd:&ensp;[[Fluidd]]: A Web UI for managing the 3D-printer.
9. :services-glance:&ensp;[[Glance]]: A server dashboard Web UI. 
10. :services-glances:&ensp;[[Glances]]: A `top` / `htop` alternative for the Web browser. 
11. :simple-homeassistant:&ensp;[[Home_Assistant|Home Assistant]]: A home automation and IoT dashboard.
12. :services-homebox:&ensp;[[Homebox]]: An inventory and organization system built for the home user.
13. :services-immich:&ensp;[[Immich]]: Photo gallery and backup service.
14. :services-it-tools:&ensp;[[IT-Tools]]: Handy tools for network administrators and developers.
15. :services-klipper:&ensp;[[Moonraker]]: An API for the *[Klipper](https://www.klipper3d.org/)* firmware.
16. :material-cog-sync:&ensp;[[Nebula-Sync]]: Synchronize settings between *[Pi-hole](https://pi-hole.net)* instances.
17. :services-nextcloud:&ensp;[[Nextcloud]]: Self-hosted cloud storage and collaboration platform.
18. :material-folder-network:&ensp;[[NFS|Network File System (NFS)]]: Remote file system access.
19. :simple-nginx:&ensp;[[Nginx|Nginx (Network Portfolio)]]: The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.
20. :material-ethernet:&ensp;[[ntopng]]: Network traffic probe.
21. :simple-obsidian:&ensp;[[Obsidian_LiveSync|Obsidian LiveSync]]: A CouchDB database for synchronizing *[Obsidian](https://obsidian.md)* Vaults.
22. :services-openspeedtest:&ensp;[[OpenSpeedTest]]: An HTML5 network speed test server.
23. :simple-pihole:&ensp;[[Pi-hole]]: A DNS server and ad/malware blocker.
24. :services-portainer:&ensp;[[Portainer]]: A *[Docker](https://www.docker.com)* container management platform. 
25. :services-portainer:&ensp;[[Portainer_Agent|Portainer Agent]]: An agent for connecting remote servers to *[[Portainer]]*.
26. :services-portracker:&ensp;[[Portracker]]: A self-hosted, real-time port monitoring and discovery tool.
27. :material-remote-desktop:&ensp;[[RDP|Remote Desktop Protocol (RDP)]]: Remote desktop access over the local network. *(not exposed to the internet)*
28. :material-folder-network:&ensp;[[SMB|Server Message Block (SMB)]]: Remote file system access.
29. :services-spoolman:&ensp;[[Spoolman]]: Manage 3D-printer filament inventory.
30. :material-console-network:&ensp;[[SSH|Secure Shell (SSH)]]: Remote shell access to servers
31. :simple-syncthing:&ensp;[[Syncthing]]: Open decentralized file synchronization.
32. :services-technitium:&ensp;[[Technitium]]: An open source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.
33. :simple-gnubash:&ensp;[[ttydBridge]]: Access the host terminal in a Web browser.
34. :services-uptime-kuma:&ensp;[[Uptime_Kuma|Uptime Kuma]]: A self-hosted service monitoring tool.
35. :simple-wireguard:&ensp;[[WireGuard_Server|WireGuard Server]]: A lightweight, secure remote access VPN server.
36. :services-youtube-dl:&ensp;[[yt-dlp_WebUI|yt-dlp WebUI]]: A Web UI and RPC server for yt-dlp.

---
## :material-swap-horizontal-bold: Change Management
> [!info]+
> Change management involves implementing approaches to prepare for organizational change.

1. :simple-raspberrypi:&nbsp;:material-arrow-right-bold:&nbsp;:services-caddy:&ensp;[[Caddy_Reverse-Proxy|Caddy Reverse Proxy]]: Preparing the *[[Raspberry_Pi_Zero_2_W|Raspberry Pi Zero 2 W]]* to be a *[[Caddy]]* reverse proxy server to give unique domain names to services hosted on the local network.
2. :simple-pihole:&nbsp;:material-arrow-right-bold:&nbsp;:services-technitium:&ensp;[[DNS_Migration|DNS Migration]]: Preparing to migrate from *[[Pi-hole]]* to *[[Technitium]]* for DNS queries on the local network. 

---
## :material-printer-3d-nozzle: 3D Printing
> [!info]+ 
> Documenting 3D-printing projects, custom g-code, and hardware modifications.<br>
> **Check out my 3D-models:**
> 
> [Printables :simple-printables:](https://www.printables.com/@rac3r4life){ .md-button }

### :material-file-document-multiple: Documentation
1. :devices-creality:&ensp;[Creality Helper Script](https://guilouz.github.io/Creality-Helper-Script-Wiki/): Add features to your printer.
2. :services-fluidd:&ensp;[Fluidd Docs](https://docs.fluidd.xyz/): A lightweight & responsive user interface for Klipper.
3. :services-klipper:&ensp;[Klipper Docs](https://www.klipper3d.org/): The Klipper firmware controls 3D-printers. It combines the power of a general purpose computer with one or more micro-controllers.
4. :material-printer-3d:&ensp;[Moonraker Docs](https://moonraker.readthedocs.io/en/latest/): Moonraker is a Python 3 based web server that exposes APIs with which client applications may use to interact with the 3D printing firmware [Klipper](https://github.com/Klipper3d/klipper).

### :material-tools: Modifications
1. :material-cog:&ensp;[[K1_Bed_Level_Knobs_Tutorial|Bed Leveling Knobs]]: Installing a bed leveling modification on the [[Kacey_3D-printer|Creality K1C]].
2. :material-code-block-tags:&ensp;[[Manual_Nozzle_Cleaning_Gcode_Macro|Manual Nozzle Cleaning G-Code Macro]]: Enabling a custom g-code macro I wrote for manually cleaning the nozzle with a silicone brush.
3. :devices-prowiper:&ensp;[[PROWIPER_Mod|PROWIPER© Mod]]: Installing the PROWIPER© Mod, and editing the required g-code on the [[Kacey_3D-printer|Creality K1C]].

---
## :simple-linux: Linux Tutorials
> [!info]+
> Documenting the Linux tutorials I have written.<br>
> **Check out these tutorials in this GitHub repository:**
> 
> [Linux Tutorials :simple-github:](https://github.com/benhaube/Linux-Configuration-Tutorials){ .md-button }

1. :material-console:&ensp;[[Defining_Terminal_Aliases|Defining Terminal Aliases]]: How to define Bash terminal aliases in their own file to avoid a cluttered `.bashrc` file. The methodology is different on  Debian and RHEL / Fedora based Linux distributions.

    > [!info]- My Terminal Aliases
    > Here is an aggregated list of Bash terminal aliases that I find useful in my daily workflow.
    > 
    > [My Aliases :material-console:](Linux_Tutorials/My_Terminal_Aliases.md){ .md-button }

2. :services-immich:&ensp;[[Immich_Slideshow_for_Nest_Hub|Immich Slideshow for Nest Hub]]: How to replace the Google Photos slideshow on the Nest Hub with an Immich slideshow utilizing an `immich-frame` container and [[Home_Assistant|Home Assistant]] with Google Cast.
3. :material-email-alert:&ensp;[[Setup_SSH_Login_Email_Notification|Setup SSH Login Email Notification]]: How to set up an email notification delivered to your inbox every time a new SSH session is established; utilizing a Bash script, `msmtp` and `pam_exec.so`. 
4. :material-lock-open:&ensp;[[Unlock_LUKS_TPM2|Unlocking LUKS2 Volumes with TPM2]]: How to unlock your encrypted LUKS2 volumes with the TPM2 when the system boots. 

    > [!info]- Update PCRs Script
    > In this GitHub repository I have written a Bash script, `update-pcrs`, that automates the process of clearing and registering new PCRs and regenerating the initramfs after a firmware or kernel upgrade. The script is full-featured with flags for using custom PCRs *(defaults to 0+4+7+11)*, usage help, checking the version, and defining the device path. 
    > 
    > [Update PCRs :simple-github:](){ .md-button }
