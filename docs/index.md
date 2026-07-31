---
title: Index
icon: symbols/list
hide:
  - toc
---

![Material Design file-document-multiple customized icon](assets/icons/logo.svg){ width=250 }

# Network Documentation & Portfolio
[About Me&ensp;:symbols-user-search:](about.md){ .md-button .md-button--primary }&emsp;[Contact Me&ensp;:symbols-send:](mailto:ben@haube-pereira.com){ .md-button .md-button--primary }

---
## :symbols-chevrons-left-right-ellipsis:&ensp;Infrastructure

[:symbols-tornado:&ensp;Disaster Recovery Plan](01_infrastructure/disaster_recovery_plan.md)
:    Ensuring **HA** for critical network services and providing a clear path to data restoration for stateful services in the event of hardware failure or data corruption.

[:symbols-binary:&ensp;IP Address Management](01_infrastructure/ip_address_mangement.md)
:    This page contains information about IPAM, VPNs, and VLANs encompassed by the LAN.

[:symbols-hash:&ensp;MAC Address Tables](01_infrastructure/mac_address_tables.md)
:    This page contains tables organizing devices on the LAN and their hardware MAC addresses.

[:symbols-shield-keyhole:&ensp;Network Security Policy](01_infrastructure/network_security_policy.md) 
:    This infrastructure operates on the *Principle of Least Privilege*. No device or service is granted more network access than is strictly required for its primary function. Security is maintained through physical isolation, logical segmentation, and encrypted transit.

[:symbols-sitemap:&ensp;Logical Network Map](01_infrastructure/logical_map.md)
:    A *Mermaid.js* flowchart focusing on servers, services, and their connections. 

[:symbols-sitemap:&ensp;Physical Network Map](01_infrastructure/physical_map.md)
:    A *Mermaid.js* flowchart focusing on physical devices and their connections.

---
## :symbols-circuit-board:&ensp;Hardware

!!! links inline end "Extra Links"

    [More Kacey Info&ensp;:symbols-printer-3d-nozzle:](02_hardware/kacey_info.md){ .md-button }

    [Hardware Tags&ensp;:symbols-tags:](02_hardware/tags.md){ .md-button }

### Core Infrastructure

[:symbols-router:&ensp;ASUS RT-BE92U](02_hardware/asus_rt-be92u.md)
:    The main wireless router and firewall for the LAN. Located next to the 10-inch server rack in the living room on the main floor. The standard firmware has been replaced with [Asuswrt-Merlin](https://www.asuswrt-merlin.net/){ external-link }, a more powerful option that retains the standard ASUS features / UI and adds a lot of great features and capabilities.

[:symbols-router:&ensp;ASUS RT-AX55](02_hardware/asus_rt-ax55.md)
:    A secondary router located on the stationary printer cart in the office upstairs, acting as an "*AiMesh*" node to expand Wi-Fi coverage to the upper levels. All settings and firmware updates are managed through the main router's Web-UI.

[:symbols-layers:&ensp;Debian Server](02_hardware/debian_server.md)
:    The primary DNS server in the [Technitium](03_services/technitium.md#deployment-details){ data-preview } cluster. It is a VM hosted on the rack-mounted [ZimaOS NAS](02_hardware/zimaos_nas.md#virtualization){ data-preview }. 

[:symbols-globe:&ensp;Hitron Modem](02_hardware/hitron_modem.md)
:    The DOCSIS 3.1 cable modem that communicates with the ISP *([Xfinity](https://www.xfinity.com/overview){ external-link })*. Located in the 10-inch server rack.

[:symbols-server:&ensp;Pi 4B Server](02_hardware/pi_4b_server.md)
:    The secondary DNS server in the [Technitium](03_services/technitium.md#deployment-details){ data-preview } cluster, a CUPS print server, a Home Assistant server, and host for other [Docker](https://www.docker.com/){ external-link } containers. Located next to the Ai-Mesh node on the stationary printer cart in the office upstairs, and connected to the LAN through the [TP-Link Switch](02_hardware/tp-link_switch.md#port-map){ data-preview }.

[:symbols-server:&ensp;Pi Zero 2W Server](02_hardware/pi_zero_2w_server.md) 
:    A tiny, low-power server acting as a dedicated as Caddy reverse-proxy, giving unique `.internal` FQDNs to services hosted on the LAN. Located on the stationary printer cart in the office upstairs, and connected to the LAN via 2.4 GHz Wi-Fi ([SSID: `Home`](02_hardware/asus_rt-be92u.md#wi-fi-networks){ data-preview }). 

[:symbols-ethernet-port:&ensp;TP-Link LiteWave Switch](02_hardware/tp-link_litewave_switch.md)
:    A gigabit desktop switch *(5-port)* distributing Ethernet connections to devices in the TV stand in the living room. Located on the back of the TV stand, attached with Velcro.

[:symbols-ethernet-port:&ensp;TP-Link Switch](02_hardware/tp-link_switch.md)
:    A gigabit desktop switch *(5-port)* distributing Ethernet connections to devices in the office. It is located on the floor underneath the stationary printer cart.

[:symbols-ethernet-port:&ensp;Ugreen Switch](02_hardware/ugreen_switch.md)
:    A rack-mounted 2.5 gigabit switch in the living room with a 10 Gb/s SFP+ uplink to the router, distributing Ethernet connections to the devices in the 10-inch server rack with extra ports available for future network expansion.

[:symbols-server-nas:&ensp;ZimaOS NAS](02_hardware/zimaos_nas.md) 
:    The primary rack-mounted NAS server & VM host for the LAN. With a [ZimaBoard 2 1664](https://www.zimaspace.com/products/single-board2-server?utm_source=head&utm_medium=menu){ external-link } as the "beating heart," it is the most powerful server on the LAN. With an *x86-64* Intel N150 CPU and 16 GB of LPDDR5 *(6400 MHz)* RAM. Located in the 10-inch server rack in the living room on the main floor. It has two 2.5 Gb/s Ethernet NICs connected through the [Ugreen Switch](02_hardware/ugreen_switch.md#port-map){ data-preview }.

### Key Clients

[:symbols-pc-case:&ensp;Ben's Workstation](02_hardware/bens_desktop.md) 
:    Ben's main workstation PC located at his desk in the office upstairs. Connected to the LAN through the [TP-Link Switch](02_hardware/tp-link_switch.md#port-map){ data-preview }.

[:symbols-laptop-minimal:&ensp;Ben's Laptop](02_hardware/bens_laptop.md)
:    Ben's main laptop PC, a ThinkPad X1 Carbon, used primarily for getting work done on-the-go. A mobile device connected to the Trusted Wi-Fi network ([SSID: `Home`](02_hardware/asus_rt-be92u.md#wi-fi-networks){ data-preview }).

[:symbols-smartphone:&ensp;Ben's Smartphone](02_hardware/bens_smartphone.md)
:    Ben's main mobile device. A Google Pixel 9 Pro connected to the Trusted Wi-Fi network ([SSID: `Home`](02_hardware/asus_rt-be92u.md#wi-fi-networks){ data-preview }).

[:symbols-printer-3d-nozzle:&ensp;Kacey 3D-Printer](02_hardware/kacey_3d-printer.md) 
:    The Creality K1C 3D-printer located in the office upstairs, and connected to the LAN through 2.4 GHz Wi-Fi ([SSID: `Home`](02_hardware/asus_rt-be92u.md#wi-fi-networks){ data-preview }). Affectionately, named 'Kacey' as a play on the model name, K1C. 

[:symbols-pc-case:&ensp;Rob's Workstation](02_hardware/robs_desktop.md) 
:    Rob's main workstation PC located at his desk in the office upstairs. Connected to the LAN through the [TP-Link Switch](02_hardware/tp-link_switch.md#port-map){ data-preview }.

[:symbols-laptop-minimal:&ensp;Rob's Laptop](02_hardware/robs_laptop.md) 
:    Rob's laptop PC, an ASUS TUF Gaming laptop, used for work and gaming. A mobile device primarily connected to the Trusted Wi-Fi network ([SSID: `Home`](02_hardware/asus_rt-be92u.md#wi-fi-networks){ data-preview }). However, sometimes it has a 2.5 Gb/s Ethernet connection through the [Ugreen Switch](02_hardware/ugreen_switch.md#port-map){ data-preview }.

---
## :symbols-monitor-cloud:&ensp;Services

!!! links inline end "Extra Links"

    [Services Tags&ensp;:symbols-tags:](03_services/tags.md){ .md-button }

[:services-beszel:&ensp;Beszel](03_services/beszel.md)
:    A lightweight server monitoring hub with historical data, docker stats, and alerts.

[:services-caddy:&ensp;Caddy](03_services/caddy.md)
:    Lightweight, open-source Web server written in Go. Used as a *reverse-proxy* for creating unique domains for locally hosted services.

[:symbols-clock-refresh-cw:&nbsp;Chrony](03_services/chrony.md)
:    Advanced, lightweight NTP client and server.

[:services-cloudflare:&ensp;Cloudflared](03_services/cloudflared.md)
:    A secure reverse-proxy tunnel for hosting private services on the public Internet.

[:symbols-printer:&ensp;CUPS](03_services/cups_print_server.md)
:    A standards-based, open-source printing system for Linux and other Unix-like operating systems.

[:symbols-cloud-cog:&ensp;DDNS](03_services/ddns.md)
:    A networking service that automatically maps a static domain name *(hostname)* to a dynamic public IP address. On this LAN, the DDNS service is provided by [addr.tools](https://addr.tools){ external-link }.

[:services-dockge:&ensp;Dockge](03_services/dockge.md) 
:    A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.

[:services-f1-replay-timing:&ensp;F1 Replay Timing](03_services/f1_replay_timing.md) 
:    Visualization of real-time track data and telemetry synced to F1 live and replays.

[:services-fluidd:&ensp;Fluidd](03_services/fluidd.md)
:    A free and open-source Klipper web interface for managing your 3D-printer.

[:services-gitea:&ensp;Gitea](03_services/gitea.md) 
:    Painless, self-hosted, all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD.

[:services-glance:&ensp;Glance](03_services/glance.md)
:    A self-hosted dashboard that puts all your feeds in one place. 

[:services-glances:&ensp;Glances](03_services/glances.md)
:    Glances an Eye on your system. A `top` / `htop` alternative for GNU / Linux, BSD, Mac OS and Windows operating systems. 

[:services-gotify-notification:&ensp;Gotify](03_services/gotify.md)
:    A simple server for sending and receiving messages in real-time per WebSocket. 

[:services-home-assistant:&ensp;Home Assistant](03_services/home_assistant.md)
:    Open-source home automation that puts local control and privacy first.

[:services-homebox:&ensp;Homebox](03_services/homebox.md) 
:    An inventory and organization system built for the home user.

[:services-immich:&ensp;Immich](03_services/immich.md)
:    High performance self-hosted photo and video management solution.

[:services-it-tools:&ensp;IT-Tools](03_services/it-tools.md)
:    Handy tools for network administrators and developers.

[:symbols-api:&ensp;Moonraker](03_services/moonraker.md)
:    Web API server for [Klipper](https://www.klipper3d.org/){ external-link }.

[:symbols-refresh-cw:&ensp;Nebula-Sync](03_services/nebula-sync.md)
:    Synchronize configuration between multiple [Pi-hole](https://pi-hole.net){ external-link } instances.

[:services-netalertx:&ensp;NetAlertX](03_services/netalertx.md)
:    Centralized network visibility and continuous asset discovery. Monitor devices, detect change, and stay aware across distributed networks.

[:services-nextcloud:&ensp;Nextcloud](03_services/nextcloud.md)
:    Self-hosted cloud storage and collaboration platform.

[:symbols-cloud-sync:&ensp;NFS](03_services/nfs.md) 
:    Remote file system access.

[:services-nginx:&ensp;Nginx](03_services/nginx.md)
:    The world's most popular Web Server, high performance Load Balancer, Reverse Proxy, API Gateway and Content Cache.

[:services-ntop:&ensp;ntopng](03_services/ntopng.md)
:    Web-based traffic and security network traffic monitoring. 

[:services-obsidian:&ensp;Obsidian LiveSync](03_services/obsidian_livesync.md)
:    Seamless multi-primary syncing database with an intuitive HTTP / JSON API, designed for reliability.

[:services-openspeedtest:&ensp;OpenSpeedTest](03_services/openspeedtest.md)
:    A free & open-source HTML5 network performance estimation tool.

[:services-pi-hole:&ensp;Pi-hole](03_services/pi-hole.md)
:    A DNS sinkhole that protects your devices from unwanted content without installing any client-side software.

[:services-portainer:&ensp;Portainer-EE](03_services/portainer.md)
:    A lightweight service delivery platform for containerized applications. 

[:services-portracker:&ensp;Portracker](03_services/portracker.md)
:    A self-hosted, real-time port monitoring and discovery tool.

[:symbols-screen-share:&ensp;RDP](03_services/rdp.md)
:    Remote desktop access over the LAN. *(not exposed to the internet)*

[:symbols-cloud-sync:&ensp;SMB](03_services/smb.md)
:    Remote file system access.

[:services-spoolman:&ensp;Spoolman](03_services/spoolman.md)
:    Keep track of your inventory of 3D-printer filament spools. 

[:symbols-terminal-alt:&ensp;SSH](03_services/ssh.md)
:    Provides secure encrypted communications between two untrusted hosts over an insecure network.

[:services-syncthing-alt:&ensp;Syncthing](03_services/syncthing.md)
:    Open decentralized file synchronization.

[:services-technitium:&ensp;Technitium](03_services/technitium.md)
:    An open-source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.

[:symbols-terminal:&ensp;ttydBridge](03_services/ttydbridge.md)
:    A DockerApp makes it easy to use the host terminal in the Web.

[:services-uptime-kuma:&ensp;Uptime Kuma](03_services/uptime_kuma.md)
:    A fancy self-hosted monitoring tool.

[:services-wireguard:&ensp;WireGuard Server](03_services/wireguard_server.md)
:    An extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography.

[:services-youtube-dl:&ensp;yt-dlp Web-UI](03_services/yt-dlp_web-ui.md)
:    High performance extendable Web-UI and RPC server for `yt-dlp` with low impact on resources.

---
## :symbols-arrow-right-left:&ensp;Change Management

[:services-caddy:&ensp;Reverse Proxy & DNS Routing](04_change_management/reverse-proxy.md)
:    Preparing the [Pi Zero 2W Server](02_hardware/pi_zero_2w_server.md) to be a [Caddy](03_services/caddy.md) reverse proxy server to give unique FQDNs to services hosted on the LAN.

[:symbols-cloud-cog:&ensp;DNS Migration](04_change_management/dns_migration.md) 
:    Preparing to migrate from [Pi-hole](03_services/pi-hole.md) to [Technitium](03_services/technitium.md) for DNS queries on the LAN. 

---
## :symbols-tux:&ensp;Linux Tutorials

!!! links inline end "Extra Links"

    **Tag Index:**
    
    :    [Linux Tutorials Tags&ensp;:symbols-tags:](/linux_tutorials/tags.md){ .md-button }

    **My Favorite Bash Aliases:**
    :    Here is an aggregated list of Bash terminal aliases that I find useful in my daily workflow.

        [My Bash Aliases&ensp;:symbols-terminal:](linux_tutorials/my_bash_aliases.md){ .md-button }

    **Update PCRs Script:**
    :    In this GitHub repository I have written a Bash script, `update-pcrs`, that automates the process of clearing and registering new PCRs and regenerating the initramfs after a firmware or kernel upgrade. The script is full-featured with flags for using custom PCRs *(defaults to 0+4+7+11)*, usage help, checking the version, and defining the device path. 

        [Update PCRs&ensp;:brands-github:](https://github.com/benhaube/Update-LUKS-PCRs-script){ .md-button }

[:symbols-update:&ensp;Automatic Updates for Debian Servers](linux_tutorials/configure_unattended-upgrades.md)
:    How to install and configure the `unattended-upgrades` package on your Debian server to enable automatic updates. This tutorial will help you configure Systemd timers, custom origin settings, email notifications, automatic reboot scheduling, and dedicated logging to monitor all upgrade activity.

[:symbols-svg:&ensp;Convert an SVG to Data URI](linux_tutorials/svg_to_uri.md) 
:    How to convert an SVG into a data URI for use in HTML pages and CSS stylesheets. 

[:symbols-lock-keyhole-open:&ensp;Decrypt LUKS with TPM2](linux_tutorials/unlock_luks_tpm2.md) 
:    How to unlock your encrypted LUKS2 volumes with the TPM2 when the system boots. 

[:symbols-terminal:&ensp;Defining Bash Aliases](linux_tutorials/define_bash_aliases.md) 
:    How to define Bash terminal aliases in their own file to avoid a cluttered `.bashrc` file. The methodology is different on  Debian and RHEL / Fedora based Linux distributions.

[:symbols-image-play:&ensp;Immich Slideshow for Nest Hub](linux_tutorials/immich_slidshow_for_nest_hub.md)
:    How to replace the Google Photos slideshow on the Nest Hub with an Immich slideshow utilizing an `immich-frame` container and [Home Assistant](03_services/home_assistant.md) with Google Cast.

[:symbols-file-badge:&ensp;Self-Signed Certificates](linux_tutorials/self-signed_certificates.md)
:    How to generate self-signed SSL certificates for use in testing, development, and internal web servers.

[:symbols-message-square-warning:&ensp;Setup SSH Login Notification](linux_tutorials/setup_ssh_login_notification.md) 
:    How to set up an email and push notification delivered to your inbox every time a new SSH session is established; utilizing a Bash script, `msmtp` and `pam_exec.so`, and a Gotify server. 

---
## :symbols-printer-3d-nozzle:&ensp;3D Printing

!!! links inline end "Check out my 3D Models!"
    All of my 3D models are published to Printables, and shared with the GPLv3 open-source license. Every model has STEP and FreeCAD files included for easy editing.

    [Printables&ensp;:brands-printables:](https://www.printables.com/@rac3r4life){ .md-button }

[:symbols-settings:&ensp;Manual Bed Leveling Mod](3d_printing/k1_bed_level_knobs.md) 
:    Installing a bed leveling modification on the [Creality K1C](02_hardware/kacey_3d-printer.md). 

[:symbols-toothbrush-nozzle:&ensp;Nozzle Cleaning Macro](3d_printing/manual_nozzle_cleaning_macro.md) 
:    Enabling a custom g-code macro I wrote for manually cleaning the nozzle with a silicone brush.

[:brands-prowiper:&ensp;PROWIPER^&copy;^ Mod](3d_printing/prowiper_mod.md) 
:    Installing the PROWIPER^&copy;^ Mod, and editing the required g-code on the [Creality K1C](02_hardware/kacey_3d-printer.md).