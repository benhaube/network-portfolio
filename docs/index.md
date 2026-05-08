---
title: Index
icon: material/format-list-bulleted
hide:
  - toc
---

![Material Design file-document-multiple customized icon](assets/icons/file-document-multiple-color.svg){ width=250 }&nbsp;![Material Design format-list-bulleted customized icon](assets/icons/format-list-bulleted.svg){ width=50 } 

# Network Documentation & Portfolio
[About Me :material-account-question:](about.md){ .md-button .md-button--primary }&emsp;[Contact Me :symbols-send-alt:](mailto:ben@haube-pereira.com){ .md-button }

---
## :material-lan: Infrastructure

+ :material-restore-alert:&ensp;[Disaster Recovery Plan](./01_Infrastructure/Disaster_Recovery_Plan.md): Ensure **HA** for critical network services and to provide a clear path to data restoration for stateful services in the event of hardware failure or data corruption.
+ :material-ip-network:&ensp;[IP Address Management](./01_Infrastructure/IP_Address_Management.md): Local network IPAM, VPN and VLAN information.
+ :material-ethernet:&ensp;[MAC Address Tables](./01_Infrastructure/MAC_Address_Tables.md): Tables containing devices on the LAN and their hardware MAC addresses.
+ :symbols-policy-fill:&ensp;[Network Security Policy](./01_Infrastructure/Network_Security_Policy.md): This infrastructure operates on the *Principle of Least Privilege*. No device or service is granted more network access than is strictly required for its primary function. Security is maintained through physical isolation, logical segmentation, and encrypted transit.
+ :material-sitemap:&ensp;[Logical Network Map](./01_Infrastructure/Logical_Map.md): *Mermaid.js* flowchart focusing on servers and services. 
+ :material-sitemap:&ensp;[Physical Network Map](./01_Infrastructure/Physical_Map.md): *Mermaid.js* flowchart focusing on physical connections.

---
## :material-devices: Hardware

> [!links inline end] Extra Links
> 
> [More Kacey Info :devices-creality:](02_Hardware/Kacey_Info.md){ .md-button }
> 
> [Hardware Tags :material-tag:](02_Hardware/tags.md){ .md-button }

+ :material-router-wireless:&ensp;[ASUS RT-BE92U](./02_Hardware/ASUS_RT-BE92U.md): Main router for the local network.
+ :material-router-wireless:&ensp;[ASUS RT-AX55](./02_Hardware/ASUS_RT-AX55.md): Secondary router in the office upstairs, acting as an "*AiMesh*" node. 
+ :material-desktop-tower:&ensp;[Ben's Desktop PC](./02_Hardware/Ben's_Desktop.md): Ben's main desktop PC located in the office upstairs.
+ :material-laptop:&ensp;[Ben's Laptop PC](./02_Hardware/Ben's_Laptop.md): Ben's main laptop PC. Mobile device connected to the Trusted Wi-Fi network *(SSID: `Home`)*.
+ :material-debian:&ensp;[Debian Server VM](./02_Hardware/Debian_Server_VM.md): General purpose Debian Linux server hosted on *[ZimaOS NAS](./02_Hardware/ZimaBoard_2_NAS.md)*. 
+ :material-wan:&ensp;[Hitron Modem](./02_Hardware/Hitron_Modem.md): DOCSIS 3.1 cable modem that communicates with the ISP *([Xfinity](https://www.xfinity.com/overview))*. 
+ :material-printer-3d-nozzle:&ensp;[Kacey 3D-Printer (Creality^&copy;^ K1C)](./02_Hardware/Kacey_3D-printer.md): Creality K1C 3D-printer located in the office upstairs. 
+ :material-raspberry-pi:&ensp;[Raspberry Pi 4B Server](./02_Hardware/Raspberry_Pi_4B_Server.md): Main DNS server *(Pi-hole)*, CUPS print server, Home Assistant server, and other *[Docker](https://www.docker.com/)* containers. 
+ :material-raspberry-pi:&ensp;[Raspberry Pi Zero Server](./02_Hardware/Raspberry_Pi_Zero_2_W.md): Second DNS server *(Pi-hole)*.
+ :material-desktop-tower:&ensp;[Rob's Desktop PC](./02_Hardware/Rob's_Desktop.md): Rob's main desktop PC located in the office upstairs.
+ :material-laptop:&ensp;[Rob's Laptop PC](02_Hardware/Rob's_Laptop.md): Rob's laptop PC for work and gaming
+ :material-switch:&ensp;[TP-Link Switch](./02_Hardware/TP-Link_Switch.md): Core gigabit desktop switch *(5-port)*. 
+ :material-switch:&ensp;[Ugreen Switch](./02_Hardware/Ugreen_Switch.md): Rack-mounted 2.5 gigabit switch in the living room.
+ :material-nas:&ensp;[ZimaOS NAS](./02_Hardware/ZimaBoard_2_NAS.md): Primary NAS server & VM host. 

---
## :material-web: Services

> [!links inline end] Extra Links
>
> [Services Tags :material-tag:](03_Services/tags.md){ .md-button }

+ :services-beszel:&ensp;[Beszel](./03_Services/Beszel_Hub.md): A lightweight server monitoring hub with historical data, docker stats, and alerts.
+ :services-caddy:&ensp;[Caddy](./03_Services/Caddy.md): Lightweight, open-source Web server written in Go. Used as a *reverse-proxy* for creating unique domains for locally hosted services.
+ :material-web-clock:&nbsp;[Chrony *(NTP Server)*](./03_Services/Chrony.md): Advanced, lightweight NTP client and server.
+ :services-cloudflare:&ensp;[Cloudflared](./03_Services/Cloudflared.md): A secure reverse-proxy tunnel for hosting private services on the public Internet.
+ :material-printer:&ensp;[CUPS *(Open Print Server)*](./03_Services/CUPS_Print_Server.md): A standards-based, open-source printing system for Linux and other Unix-like operating systems.
+ :services-dockge:&ensp;[Dockge](./03_Services/Dockge.md): A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.
+ :services-f1-replay-timing:&ensp;[F1 Replay Timing](./03_Services/F1_Replay_Timing.md): Visualization of real-time track data and telemetry synced to F1 live and replays.
+ :services-fluidd:&ensp;[Fluidd](./03_Services/Fluidd.md): A free and open-source Klipper web interface for managing your 3d printer.
+ :services-glance:&ensp;[Glance](./03_Services/Glance.md): A self-hosted dashboard that puts all your feeds in one place. 
+ :services-glances:&ensp;[Glances](./03_Services/Glances.md): Glances an Eye on your system. A `top` / `htop` alternative for GNU / Linux, BSD, Mac OS and Windows operating systems. 
+ :services-gotify-notification:&ensp;[Gotify](./03_Services/Gotify.md): A simple server for sending and receiving messages in real-time per WebSocket. 
+ :simple-homeassistant:&ensp;[Home Assistant](./03_Services/Home_Assistant.md): Open-source home automation that puts local control and privacy first.
+ :services-homebox:&ensp;[Homebox](./03_Services/Homebox.md): An inventory and organization system built for the home user.
+ :services-immich:&ensp;[Immich](./03_Services/Immich.md): High performance self-hosted photo and video management solution.
+ :services-it-tools:&ensp;[IT-Tools](./03_Services/IT-Tools.md): Handy tools for network administrators and developers.
+ :services-klipper:&ensp;[Moonraker](./03_Services/Moonraker.md): Web API server for *[Klipper](https://www.klipper3d.org/)*.
+ :material-cog-sync:&ensp;[Nebula-Sync](./03_Services/Nebula-Sync.md): Synchronize configuration between multiple *[Pi-hole](https://pi-hole.net)* instances.
+ :services-nextcloud:&ensp;[Nextcloud](./03_Services/Nextcloud.md): Self-hosted cloud storage and collaboration platform.
+ :material-folder-network:&ensp;[NFS *(Network File System)*](./03_Services/NFS.md): Remote file system access.
+ :simple-nginx:&ensp;[Nginx *(Network Portfolio)*](./03_Services/Nginx.md): The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.
+ :services-ntop:&ensp;[ntopng](./03_Services/ntopng.md): Web-based traffic and security network traffic monitoring. 
+ :simple-obsidian:&ensp;[Obsidian LiveSync *(CouchDB)*](./03_Services/Obsidian_LiveSync.md): Seamless multi-primary syncing database with an intuitive HTTP / JSON API, designed for reliability.
+ :services-openspeedtest:&ensp;[OpenSpeedTest](./03_Services/OpenSpeedTest.md): A free & open-source HTML5 network performance estimation tool.
+ :simple-pihole:&ensp;[Pi-hole DNS Server](./03_Services/Pi-hole.md): A DNS server and ad/malware blocker.
+ :services-portainer:&ensp;[Portainer-EE](./03_Services/Portainer.md): A *[Docker](https://www.docker.com)* container management platform.
+ :services-portracker:&ensp;[Portracker](./03_Services/Portracker.md): A self-hosted, real-time port monitoring and discovery tool.
+ :material-remote-desktop:&ensp;[RDP *(Remote Desktop Protocol)*](./03_Services/RDP.md): Remote desktop access over the local network. *(not exposed to the internet)*
+ :material-folder-network:&ensp;[SMB *(Server Message Block)*](./03_Services/RDP.md): Remote file system access.
+ :services-spoolman:&ensp;[Spoolman](./03_Services/Spoolman.md): Manage 3D-printer filament inventory.
+ :material-console-network:&ensp;[SSH *(Secure Shell)*](./03_Services/SSH.md): Remote shell access to servers
+ :simple-syncthing:&ensp;[Syncthing](./03_Services/Syncthing.md): Open decentralized file synchronization.
+ :services-technitium:&ensp;[Technitium DNS Server](./03_Services/Technitium.md): An open source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.
+ :material-console:&ensp;[ttydBridge](./03_Services/ttydBridge.md): Access the host terminal in a Web browser.
+ :services-uptime-kuma:&ensp;[Uptime Kuma](./03_Services/Uptime_Kuma.md): A self-hosted service monitoring tool.
+ :simple-wireguard:&ensp;[WireGuard Server](./03_Services/Wireguard_Server.md): A lightweight, secure remote access VPN server.
+ :services-youtube-dl:&ensp;[yt-dlp Web-UI](./03_Services/yt-dlp_WebUI.md): A Web UI and RPC server for yt-dlp.

---
## :material-swap-horizontal-bold: Change Management

+ :simple-raspberrypi:&nbsp;:material-arrow-right-bold:&nbsp;:services-caddy:&ensp;[Reverse Proxy & DNS Routing](./04_Change_Management/Reverse-Proxy.md): Preparing the *[Raspberry Pi Zero Server](./02_Hardware/Raspberry_Pi_Zero_2_W.md)* to be a *[Caddy](./03_Services/Caddy.md)* reverse proxy server to give unique domain names to services hosted on the local network.
+ :simple-pihole:&nbsp;:material-arrow-right-bold:&nbsp;:services-technitium:&ensp;[DNS Migration (Pi-hole :material-arrow-right-thin: Technitium)](./04_Change_Management/DNS_Migration.md): Preparing to migrate from *[Pi-hole](./03_Services/Pi-hole.md)* to *[Technitium](./03_Services/Technitium.md)* for DNS queries on the local network. 

---
## :material-printer-3d-nozzle: 3D Printing

> [!links inline end] Check out my 3D Models!
> All of my 3D models are published to Printables, and shared with the GPLv3 open-source licence. Every model has STEP and FreeCAD files included for easy editing.
> 
> [Printables :simple-printables:](https://www.printables.com/@rac3r4life){ .md-button }

### Documentation *(External Links)*
+ :devices-creality:&ensp;[Creality Helper Script](https://guilouz.github.io/Creality-Helper-Script-Wiki/): Add features to your printer.
+ :services-fluidd:&ensp;[Fluidd Docs](https://docs.fluidd.xyz/): A lightweight & responsive user interface for Klipper.
+ :services-klipper:&ensp;[Klipper Docs](https://www.klipper3d.org/): The Klipper firmware controls 3D-printers. It combines the power of a general purpose computer with one or more micro-controllers.
+ :material-printer-3d:&ensp;[Moonraker Docs](https://moonraker.readthedocs.io/en/latest/): Moonraker is a Python 3 based web server that exposes APIs with which client applications may use to interact with the 3D printing firmware [Klipper](https://github.com/Klipper3d/klipper).

### Modifications
+ :material-cog:&ensp;[Manual Bed Leveling Mod](./3D_Printing/K1_Bed_Level_Knobs_Tutorial.md): Installing a bed leveling modification on the [Creality^&copy;^ K1C](./02_Hardware/Kacey_3D-printer.md).
+ :devices-toothbrush-nozzle:&ensp;[Interactive Manual Nozzle Cleaning Macro](./3D_Printing/Manual_Nozzle_Cleaning_Gcode_Macro.md): Enabling a custom g-code macro I wrote for manually cleaning the nozzle with a silicone brush.
+ :devices-prowiper:&ensp;[PROWIPER^&copy;^ Mod](./3D_Printing/PROWIPER_Mod.md): Installing the PROWIPER^&copy;^ Mod, and editing the required g-code on the [Creality^&copy;^ K1C](./02_Hardware/Kacey_3D-printer.md).

---
## :material-linux: Linux Tutorials

> [!links inline end] My Terminal Aliases
> Here is an aggregated list of Bash terminal aliases that I find useful in my daily workflow.
> 
> [My Aliases :material-console:](Linux_Tutorials/My_Terminal_Aliases.md){ .md-button }

> [!links inline end] Update PCRs Script
> In this GitHub repository I have written a Bash script, `update-pcrs`, that automates the process of clearing and registering new PCRs and regenerating the initramfs after a firmware or kernel upgrade. The script is full-featured with flags for using custom PCRs *(defaults to 0+4+7+11)*, usage help, checking the version, and defining the device path. 
> 
> [Update PCRs :simple-github:](https://github.com/benhaube/Update-LUKS-PCRs-script){ .md-button }

+ :material-svg:&ensp;[Converting an SVG into Data URI](Linux_Tutorials/SVG_to_URI.md): How to convert an SVG into a data URI for use in HTML pages and CSS stylesheets. 
+ :material-console:&ensp;[Defining Terminal Aliases](./Linux_Tutorials/Defining_Terminal_Aliases.md): How to define Bash terminal aliases in their own file to avoid a cluttered `.bashrc` file. The methodology is different on  Debian and RHEL / Fedora based Linux distributions.
+ :services-immich-frame:&ensp;[Immich Slideshow for Nest Hub](./Linux_Tutorials/Immich_Slideshow_for_Nest_Hub.md): How to replace the Google Photos slideshow on the Nest Hub with an Immich slideshow utilizing an `immich-frame` container and [Home Assistant](./03_Services/Home_Assistant.md) with Google Cast.
+ :material-email-alert:&ensp;[Setup SSH Login Email Notification](./Linux_Tutorials/Setup_SSH_Login_Email_Notification.md): How to set up an email notification delivered to your inbox every time a new SSH session is established; utilizing a Bash script, `msmtp` and `pam_exec.so`. 
+ :material-lock-open:&ensp;[Unlocking LUKS2 Volumes with TPM2](./Linux_Tutorials/Unlock_LUKS_TPM2.md): How to unlock your encrypted LUKS2 volumes with the TPM2 when the system boots. 
