---
icon: material/server-security
---
![Material Design server-security icon](../assets/icons/server-security.svg){ width=200 }

# [[Network_Security_Policy|Network Security Policy (NSP)]]

> [!info] Security Philosophy
> This infrastructure operates on the **Principle of Least Privilege**. No device or service is granted more network access than is strictly required for its primary function. Security is maintained through physical isolation, logical segmentation, and encrypted transit.

---
## :material-segment: Network Segmentation *(VLAN Architecture)*

| Zone | VLAN ID | Description | Access Rules |
| :--- | :------ | :---------- | :----------- |
| :material-security:&nbsp;Trusted | *vlan50* | Primary workstations, mobile devices, and core servers | Full access to all internal zones; restricted outbound |
| :material-account-multiple:&nbsp;Guest | *vlan52* | Temporary visitor devices | Internet access only; strictly isolated from all other VLANs |
| :material-home-automation:&nbsp;IoT | *vlan53* | Smart home hardware *(bulbs, sensors, etc.)* | **No Internet Access** by default; communication only with [Home Assistant](../03_Services/Home_Assistant.md) |

## :material-wall-fire: Boundary Defense & Remote Access

#### Edge Protection: 

+ An [[ASUS_RT-BE92U|ASUS RT-BE92U]] acts as the primary firewall, utilizing **SPI** and **DoS** protection. 

#### External Access: 

+ Direct port forwarding is strictly prohibited. 
+ Remote access to individual services is facilitated through a [[Cloudflared|Cloudflare Tunnel]], ensuring all incoming traffic is proxied and SSL-encrypted.

#### VPN:

+ For administrative tasks, there are two [[Wireguard_Server|WireGuard]] instances providing a secure, encrypted tunnel into the Trusted zone.
+ The primary WireGuard server is hosted natively on the main [[ASUS_RT-BE92U|ASUS router]]. 
+ The secondary / backup WireGuard server is hosted in a Docker container on the [[ZimaBoard_2_NAS|ZimaOS NAS]]. 

## :material-server-security: DNS Security & Content Filtering

#### Internal Resolution: 

+ A clustered [[Technitium|Technitium DNS]] environment *([[Debian_Server_VM|Debian VM]] & [[Raspberry_Pi_4B_Server|Pi 4B Server]])* handles all local queries.

#### Upstream Privacy:

+ Queries are forwarded to [Quad-9](https://quad9.net/) via **DoT** to prevent ISP snooping and **MITM** *([Man-in-the-Middle](https://en.wikipedia.org/wiki/Man-in-the-middle_attack))* attacks.

#### Blocking:

+ Network-wide ad and malware blocking is enforced at the DNS level using curated blocklists to neutralize telemetry and malicious domains.

## :material-security-network: Device & Host Hardening

#### Operating Systems:

+ Servers primarily utilize **Debian** and **ZimaOS** *(on the NAS)* for stability and security. 
	+ Debian Linux *(Stable)* is a rock-solid, unchanging base to build a server on. Packages are not frequently updated with new features, so there is no need to worry about breakages. The 10-year-long service life means you are guaranteed to get security updates for the server's lifetime. 
	+ The immutability of ZimaOS means OS updates on the NAS are easy to revert if they cause a breakage, and ensures no system files can be modified by an intruder. 
	+ Both of these server operating systems ensure maximum security and availability for services hosted on the network.
+ Client PCs utilize **Fedora *(KDE Plasma Desktop Edition)*** and **Windows 11** for their frequent security updates, up-to-date packages with the latest features, and support for the newest hardware *(e.g., the latest CPUs & GPUs)*.
+ Mobile devices *(smartphones and tablets)* utilize **Android**. Only Google Pixel and Samsung Galaxy devices are allowed due to their monthly security patches and long service & support lifespan.   

#### Access Control: 

+ [[SSH]] access requires **Ed25519 Key-Based Authentication**; password-based SSH is disabled.
+ [:services-bitwarden: Bitwarden](https://vault.bitwarden.com) is utilized to securely store passwords, API keys, and SSH keys. 
	+ Bitwarden's desktop app has a built-in SSH key-agent; allowing private keys to be stored securely.
	+ The Chromium and Firefox browser extensions auto-fill passwords and integrate with the desktop app; allowing the use of biometric authentication. 
	+ The mobile application auto-fills passwords on websites and native applications.
+ Local user accounts on the Fedora and Windows 11 PCs do not have administrator privileges. A separate "admin" account is required to make system-level changes. 
+ Services hosted on the network that require login have separate "admin" accounts for administration. The regular user accounts have reduced permissions to increase security. 

#### Updates:

+ Automated security patching is enabled for critical packages on the Debian servers with `unattended-upgrades`. 
+ Weekly manual audits for Docker container image updates *(monitored via [[Dockge]])*.
+ Desktop and Laptop PCs have automatic updates enabled.

#### 3D Infrastructure:

+ The [[Kacey_3D-printer|Creality K1C]] is isolated to prevent unauthorized control while remaining accessible to the **Trusted** zone for print management.

## :material-shield-home: IoT & Smart Home Integrity

+ The migration from **Google Home** to **Home Assistant** ensures that IoT devices are managed locally. 
+ By isolating VLAN 53, "phone-home" telemetry from generic IoT hardware is neutralized, preventing potential lateral movement if a device is compromised.

---
<div class="grid cards" markdown>

-   :material-ethernet:{ .lg .middle } **MAC Addresses**

	---

	[MAC Address Tables](../01_Infrastructure/MAC_Address_Tables.md){ .md-button }

-   :material-sitemap:{ .lg .middle } **Network Diagrams**

	---

	[Logical Map](../01_Infrastructure/Logical_Map.md){ .md-button }&emsp;[Physical Map](../01_Infrastructure/Physical_Map.md){ .md-button }

</div>

<div class="grid cards" markdown>

-   :material-restore-alert:{ .lg .middle } **Disaster Recovery**
	
	---

	[Disaster Recovery Plan](../01_Infrastructure/Disaster_Recovery_Plan.md){ .md-button }

-   :material-ip-network:{ .lg .middle } **IP Address Management**

	---

	[IPAM](../01_Infrastructure/IP_Address_Management.md){ .md-button }

</div>