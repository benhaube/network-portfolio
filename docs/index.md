---
title: Index
icon: material/format-list-bulleted
hide:
  - toc
---

![Material Design file-document-multiple customized icon](assets/icons/file-document-multiple-color.svg){ width=250 }&nbsp;![Material Design format-list-bulleted customized icon](assets/icons/format-list-bulleted.svg){ width=50 } 

# Network Documentation & Portfolio
[About Me :material-account-question:](about.md){ .md-button .md-button--primary }&emsp;[Contact Me :material-email:](mailto:ben@haube-pereira.com){ .md-button }

---
## :material-lan: Infrastructure

+ :material-restore-alert:&ensp;[[Disaster_Recovery_Plan|Disaster Recovery Plan]]: Ensure **HA** for critical network services and to provide a clear path to data restoration for stateful services in the event of hardware failure or data corruption.
+ :material-ip-network:&ensp;[[IP_Address_Management|IP Address Management]]: Local network IPAM, VPN and VLAN information.
+ :material-ethernet:&ensp;[[MAC_Address_Tables|MAC Address Tables]]: Tables containing devices on the LAN and their hardware MAC addresses.
+ :symbols-policy-fill:&ensp;[[Network_Security_Policy|Network Security Policy]]: This infrastructure operates on the *Principle of Least Privilege*. No device or service is granted more network access than is strictly required for its primary function. Security is maintained through physical isolation, logical segmentation, and encrypted transit.
+ :material-sitemap:&ensp;[[Logical_Map|Logical Map]]: *Mermaid.js* flowchart focusing on servers and services. 
+ :material-sitemap:&ensp;[[Physical_Map|Physical Map]]: *Mermaid.js* flowchart focusing on physical connections.

---
## :material-devices: Hardware

> [!links inline end] Extra Links
> 
> [More Kacey Info :devices-creality:](02_Hardware/Kacey_Info.md){ .md-button }
> 
> [Hardware Tags :material-tag:](02_Hardware/tags.md){ .md-button }

+ :material-router-wireless:&ensp;[[ASUS_RT-BE92U|ASUS RT-BE92U *(Wireless Router)*]]: Main router for the local network.
+ :material-router-wireless:&ensp;[[ASUS_RT-AX55|ASUS RT-AX55 *(AiMesh Node)*]]: Secondary router in the office upstairs, acting as an "*AiMesh*" node. 
+ :material-desktop-tower:&ensp;[[Ben's_Desktop|Ben's Desktop PC]]: Ben's main desktop PC located in the office upstairs.
+ :material-laptop:&ensp;[[Ben's_Laptop|Ben's Laptop PC]]: Ben's main laptop PC. Mobile device connected to the Trusted Wi-Fi network *(SSID: `Home`)*.
+ :material-debian:&ensp;[[Debian_Server_VM|Debian Server VM]]: General purpose Debian Linux server hosted on *[[ZimaBoard_2_NAS|ZimaOS NAS]]*. 
+ :material-wan:&ensp;[[Hitron_Modem|Hitron Modem]]: DOCSIS 3.1 cable modem that communicates with the ISP *([Xfinity](https://www.xfinity.com/overview))*. 
+ :material-printer-3d-nozzle:&ensp;[[Kacey_3D-printer|Kacey 3D-Printer (Creality^&copy;^ K1C)]]: Creality K1C 3D-printer located in the office upstairs. 
+ :material-raspberry-pi:&ensp;[[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]: Main DNS server *(Pi-hole)*, CUPS print server, Home Assistant server, and other *[Docker](https://www.docker.com/)* containers. 
+ :material-raspberry-pi:&ensp;[[Raspberry_Pi_Zero_2_W|Raspberry Pi Zero Server]]: Second DNS server *(Pi-hole)*.
+ :material-desktop-tower:&ensp;[[Rob's_Desktop|Rob's Desktop PC]]: Rob's main desktop PC located in the office upstairs.
+ :material-laptop:&ensp;[Rob's Laptop](02_Hardware/Rob's_Laptop.md): Rob's laptop PC for work and gaming
+ :material-switch:&ensp;[[TP-Link_Switch|TP-Link Switch]]: Core gigabit desktop switch *(5-port)*. 
+ :material-switch:&ensp;[[Ugreen_Switch|Ugreen Switch]]: Rack-mounted 2.5 gigabit switch in the living room.
+ :material-nas:&ensp;[[ZimaBoard_2_NAS|ZimaOS NAS]]: Primary NAS server & VM host. 

---
## :material-web: Services

> [!links inline end] Extra Links
>
> [Services Tags :material-tag:](03_Services/tags.md){ .md-button }

+ :services-beszel:&ensp;[[Beszel_Hub|Beszel]]: A lightweight server monitoring hub with historical data, docker stats, and alerts.
+ :services-caddy:&ensp;[[Caddy]]: Lightweight, open-source Web server written in Go. Used as a *reverse-proxy* for creating unique domains for locally hosted services.
+ :material-web-clock:&nbsp;[[Chrony|Chrony *(NTP Server)*]]: Advanced, lightweight NTP client and server.
+ :services-cloudflare:&ensp;[[Cloudflared]]: A secure reverse-proxy tunnel for hosting private services. Currently, *[[Immich]]* and *[[Uptime_Kuma|Uptime Kuma]]* are utilizing this service. 
+ :material-printer:&ensp;[[CUPS_Print_Server|CUPS *(Open Print Server)*]]: Print server for USB-connected `Brother_HL-L2300D_series` laser printer. 
+ :services-dockge:&ensp;[[Dockge]]: A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.
+ :services-f1-replay-timing:&ensp;[[F1_Replay_Timing|F1 Replay Timing]]: Visualization of real-time track data and telemetry synced to F1 live and replays.
+ :services-fluidd:&ensp;[[Fluidd]]: A Web UI for managing the 3D-printer.
+ :services-glance:&ensp;[[Glance]]: A server dashboard Web UI. 
+ :services-glances:&ensp;[[Glances]]: A `top` / `htop` alternative for the Web browser. 
+ :simple-homeassistant:&ensp;[[Home_Assistant|Home Assistant]]: A home automation and IoT dashboard.
+ :services-homebox:&ensp;[[Homebox]]: An inventory and organization system built for the home user.
+ :services-immich:&ensp;[[Immich]]: Photo gallery and backup service.
+ :services-it-tools:&ensp;[[IT-Tools]]: Handy tools for network administrators and developers.
+ :services-klipper:&ensp;[[Moonraker]]: An API for the *[Klipper](https://www.klipper3d.org/)* firmware.
+ :material-cog-sync:&ensp;[[Nebula-Sync]]: Synchronize settings between *[Pi-hole](https://pi-hole.net)* instances.
+ :services-nextcloud:&ensp;[[Nextcloud]]: Self-hosted cloud storage and collaboration platform.
+ :material-folder-network:&ensp;[[NFS|NFS *(Network File System)*]]: Remote file system access.
+ :simple-nginx:&ensp;[[Nginx|Nginx *(Network Portfolio)*]]: The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.
+ :services-ntop:&ensp;[[ntopng]]: Network traffic probe.
+ :simple-obsidian:&ensp;[[Obsidian_LiveSync|Obsidian LiveSync *(CouchDB)*]]: A CouchDB database for synchronizing *[Obsidian](https://obsidian.md)* Vaults.
+ :services-openspeedtest:&ensp;[[OpenSpeedTest]]: An HTML5 network speed test server.
+ :simple-pihole:&ensp;[[Pi-hole| Pi-hole DNS Server]]: A DNS server and ad/malware blocker.
+ :services-portainer:&ensp;[[Portainer]]: A *[Docker](https://www.docker.com)* container management platform.
+ :services-portracker:&ensp;[[Portracker]]: A self-hosted, real-time port monitoring and discovery tool.
+ :material-remote-desktop:&ensp;[[RDP|RDP *(Remote Desktop Protocol)*]]: Remote desktop access over the local network. *(not exposed to the internet)*
+ :material-folder-network:&ensp;[[SMB|SMB *(Server Message Block)*]]: Remote file system access.
+ :services-spoolman:&ensp;[[Spoolman]]: Manage 3D-printer filament inventory.
+ :material-console-network:&ensp;[[SSH|SSH *(Secure Shell)*]]: Remote shell access to servers
+ :simple-syncthing:&ensp;[[Syncthing]]: Open decentralized file synchronization.
+ :services-technitium:&ensp;[[Technitium|Technitium DNS Server]]: An open source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.
+ :material-console:&ensp;[[ttydBridge]]: Access the host terminal in a Web browser.
+ :services-uptime-kuma:&ensp;[[Uptime_Kuma|Uptime Kuma]]: A self-hosted service monitoring tool.
+ :simple-wireguard:&ensp;[[WireGuard_Server|WireGuard Server]]: A lightweight, secure remote access VPN server.
+ :services-youtube-dl:&ensp;[[yt-dlp_WebUI|yt-dlp Web-UI]]: A Web UI and RPC server for yt-dlp.

---
## :material-swap-horizontal-bold: Change Management

+ :simple-raspberrypi:&nbsp;:material-arrow-right-bold:&nbsp;:services-caddy:&ensp;[Reverse Proxy & DNS Routing](04_Change_Management/Reverse-Proxy.md): Preparing the *[[Raspberry_Pi_Zero_2_W|Raspberry Pi Zero Server]]* to be a *[[Caddy]]* reverse proxy server to give unique domain names to services hosted on the local network.
+ :simple-pihole:&nbsp;:material-arrow-right-bold:&nbsp;:services-technitium:&ensp;[[DNS_Migration|DNS Migration (Pi-hole :material-arrow-right-thin: Technitium)]]: Preparing to migrate from *[[Pi-hole]]* to *[[Technitium]]* for DNS queries on the local network. 

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
+ :material-cog:&ensp;[[K1_Bed_Level_Knobs_Tutorial|Manual Bed Leveling Mod]]: Installing a bed leveling modification on the [[Kacey_3D-printer|Creality^&copy;^ K1C]].
+ :devices-toothbrush-nozzle:&ensp;[[Manual_Nozzle_Cleaning_Gcode_Macro|Interactive Manual Nozzle Cleaning Macro]]: Enabling a custom g-code macro I wrote for manually cleaning the nozzle with a silicone brush.
+ :devices-prowiper:&ensp;[[PROWIPER_Mod|PROWIPER^&copy;^ Mod]]: Installing the PROWIPER^&copy;^ Mod, and editing the required g-code on the [[Kacey_3D-printer|Creality^&copy;^ K1C]].

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
+ :material-console:&ensp;[[Defining_Terminal_Aliases|Defining Terminal Aliases]]: How to define Bash terminal aliases in their own file to avoid a cluttered `.bashrc` file. The methodology is different on  Debian and RHEL / Fedora based Linux distributions.
+ :services-immich-frame:&ensp;[[Immich_Slideshow_for_Nest_Hub|Immich Slideshow for Nest Hub]]: How to replace the Google Photos slideshow on the Nest Hub with an Immich slideshow utilizing an `immich-frame` container and [[Home_Assistant|Home Assistant]] with Google Cast.
+ :material-email-alert:&ensp;[[Setup_SSH_Login_Email_Notification|Setup SSH Login Email Notification]]: How to set up an email notification delivered to your inbox every time a new SSH session is established; utilizing a Bash script, `msmtp` and `pam_exec.so`. 
+ :material-lock-open:&ensp;[[Unlock_LUKS_TPM2|Unlocking LUKS2 Volumes with TPM2]]: How to unlock your encrypted LUKS2 volumes with the TPM2 when the system boots. 
