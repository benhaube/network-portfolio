---
icon: symbols/firewall
title: Network Security Policy
subtitle: The Principle of Least Privilege
tags:
  - Policy
  - Security
  - IoT
  - VLAN
  - DNS
  - VPN
  - Remote Access
---
![Lucide Firewall icon](../assets/icons/firewall.svg){ width=200 }

# Network Security Policy
*The Principle of Least Privilege*

!!! info "Security Philosophy"

	This infrastructure operates on the **Principle of Least Privilege**. No device or service is granted more network access than is strictly required for its primary function. Security is maintained through physical isolation, logical segmentation, and encrypted transit.

---
## :symbols-square-split-horizontal:&ensp;Network Segmentation 
&emsp;&emsp;&ensp;*VLAN Architecture*

| Zone                                                                               | VLAN ID  | Description                                            | Access Rules                                                                                                                                          |
| :--------------------------------------------------------------------------------- | :------- | :----------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------- |
| [:symbols-shield-quarter:&nbsp;Trusted](mac_address_tables.md#trusted-network)     | *VLAN50* | Primary workstations, mobile devices, and core servers | Full access to all internal zones; restricted outbound                                                                                                |
| [:symbols-shield-user:&nbsp;Guest](ip_address_mangement.md#virtual-local-networks) | *VLAN52* | Temporary visitor devices                              | Internet access only; strictly isolated from all other VLANs                                                                                          |
| [:symbols-shield-house:&nbsp;IoT](mac_address_tables.md#iot-network)               | *VLAN53* | Smart home hardware *(bulbs, sensors, etc.)*           | **No Internet Access** by default. Strictly isolated from all other VLANs; communication only with [Home Assistant](../03_services/home_assistant.md) |

## :symbols-firewall:&ensp;Boundary Defense & Remote Access

### Edge Protection

+ An [ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md) acts as the primary firewall, utilizing **SPI** and **DoS / DDoS** protection.
+ The two-way **IPS** built into the ASUS router uses SPI to protect any device connected to the network from spam, DoS / DDoS attacks, and from malicious packets entering or exiting the network. 
+ The Asuswrt-Merlin firmware extends the basic functionality of the built-in firewall with [Skynet](https://github.com/Adamm00/IPSet_ASUS){ external-link }. It leverages predefined malware lists from reputable sources to protect the network against potential threats, and prevent unauthorized access.

### External Access

+ Direct port forwarding is strictly prohibited. 
+ Remote access to individual services is facilitated through a [Cloudflare Tunnel](../03_services/cloudflared.md), ensuring all incoming traffic is proxied and SSL-encrypted.

### VPN

+ For administrative tasks, there are two [WireGuard](../03_services/wireguard_server.md) instances providing a secure, encrypted tunnel into the Trusted zone.
+ The primary WireGuard server is hosted natively on the main [ASUS router](../02_hardware/asus_rt-be92u.md). 
+ The secondary / backup WireGuard server is hosted in a Docker container on the [ZimaOS NAS](../02_hardware/zimaos_nas.md). 

## :symbols-server:&ensp;DNS Security & Content Filtering

### Internal Resolution

+ A clustered [Technitium DNS](../03_services/technitium.md) environment *([Debian Server](../02_hardware/debian_server.md) & [Pi 4B Server](../02_hardware/pi_4b_server.md))* handles all local queries.

### Upstream Privacy

+ Queries are forwarded to [Quad-9](https://quad9.net/){ external-link } via **DoT** to prevent ISP snooping and **MITM** *([Man-in-the-Middle](https://en.wikipedia.org/wiki/Man-in-the-middle_attack){ external-link })* attacks.

### Blocking

+ Network-wide ad, tracking, and malware blocking is enforced at the DNS level using curated blocklists to neutralize telemetry and malicious domains.

## :symbols-brick-wall-shield:&ensp;Device & Host Hardening

### Operating Systems

##### Servers

+ Servers primarily utilize **Debian** and **ZimaOS** *(on the NAS)* for stability and security. 
	+ Debian Linux *(Stable)* is a rock-solid, unchanging base to build a server on. Packages are not frequently updated with new features, so there is no need to worry about breakages. The 10-year-long service life means you are guaranteed to get security updates for the server's lifetime. 
	+ The immutability of ZimaOS means OS updates on the NAS are easy to revert if they cause a breakage, and ensures no system files can be modified by an intruder. 
+ Both of these server operating systems ensure maximum security and availability for services hosted on the network.

##### Clients

+ Client PCs utilize **Fedora *(KDE Plasma Desktop Edition)*** and **Windows 11** for their frequent security updates, up-to-date packages with the latest features, and support for the newest hardware *(e.g., the latest CPUs & GPUs)*.

##### Mobile Devices

+ Mobile devices *(smartphones and tablets)* utilize **Android**. Only Google Pixel and Samsung Galaxy devices are allowed due to their monthly security patches and long service & support lifespan.   

### Access Control

##### Credential Storage

+ [Bitwarden](https://vault.bitwarden.com){ external-link } is utilized to securely store passwords, API keys, and SSH keys. 
	+ Bitwarden's desktop app has a built-in SSH key-agent; allowing private keys to be stored securely.
	+ The Chromium and Firefox browser extensions auto-fill passwords and integrate with the desktop app; allowing the use of biometric authentication. 
	+ The mobile application auto-fills passwords on websites and native applications.

##### SSH Security

+ [SSH](../03_services/ssh.md) access requires **Ed25519 Key-Based Authentication**; password-based SSH is disabled.

##### Local User Accounts

+ Local user accounts on the Fedora and Windows 11 PCs do not have administrator privileges. A separate "admin" account is required to make system-level changes. 

##### Self-Hosted Services

+ Services hosted on the network that require login have separate "admin" accounts for administration. The regular user accounts have reduced permissions to increase security. 

### Updates

+ Automated security patching is enabled for critical packages on the Debian servers with `unattended-upgrades`. 
+ Weekly manual audits for Docker container image updates *(monitored via &nbsp;[Dockge](../03_services/dockge.md))*.
+ Desktop and Laptop PCs have automatic updates enabled.

### 3D Infrastructure

+ The [Creality K1C](../02_hardware/kacey_3d-printer.md) is isolated to prevent unauthorized control while remaining accessible to the **Trusted** zone for print management.

## :symbols-door-closed-locked:&ensp;IoT & Smart Home Integrity

+ The migration from **Google Home** to **Home Assistant** ensures that IoT devices are managed locally. 
+ By isolating VLAN 53, "phone-home" telemetry from generic IoT hardware is neutralized, preventing potential lateral movement if a device is compromised.

---
<div class="grid cards" markdown>

-   :symbols-grid-2x2:{ .lg .middle }&emsp;**MAC Addresses**

	---

	[MAC Address Tables](mac_address_tables.md){ .md-button }

-   :symbols-sitemap:{ .lg .middle }&emsp;**Network Diagrams**

	---

	[Logical Map](logical_map.md){ .md-button }&emsp;[Physical Map](physical_map.md){ .md-button }

</div>

<div class="grid cards" markdown>

-   :symbols-tornado:{ .lg .middle }&emsp;**Disaster Recovery**
	
	---

	[Disaster Recovery Plan](disaster_recovery_plan.md){ .md-button }

-   :symbols-binary:{ .lg .middle }&emsp;**IP Addresses**

	---

	[IP Address Management](ip_address_mangement.md){ .md-button }

</div>