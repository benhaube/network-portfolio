---
icon: symbols/shield-keyhole
title: Network Security Policy
subtitle: The Principle of Least Privilege
description: This infrastructure operates on the Principle of Least Privilege. No device or service is granted more network access than is strictly required for its primary function. Security is maintained through physical isolation, logical segmentation, and encrypted transit.
tags:
  - DNS
  - IoT
  - Policy
  - Remote Access
  - Security
  - VLAN
  - VPN
---

![Lucide 'brick-wall-shield' icon](../assets/icons/shield-keyhole.svg){ width=200 }

# Network Security Policy

_The Principle of Least Privilege_

!!! info "Security Philosophy"

    This infrastructure operates on the **Principle of Least Privilege**. No device or service is granted more network access than is strictly required for its primary function. Security is maintained through physical isolation, logical segmentation, and encrypted transit.

---

## :symbols-square-split-horizontal:&ensp;Network Segmentation

&emsp;&emsp;&ensp;_VLAN Architecture_

| Zone                                                                                | VLAN ID              | Description { data-sort-method="none" }                | Access Rules { data-sort-method="none" }                                                                                                              |
| :---------------------------------------------------------------------------------- | :------------------- | :----------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------- |
| [:symbols-shield:&nbsp;Trusted](mac_address_tables.md#trusted-network)              | _VLAN50_&emsp;&emsp; | Primary workstations, mobile devices, and core servers | Full access to all internal zones; restricted outbound                                                                                                |
| [:symbols-user-shield:&nbsp;Guest](ip_address_management.md#virtual-local-networks) | _VLAN52_&emsp;&emsp; | Temporary visitor devices                              | Internet access only; strictly isolated from all other VLANs                                                                                          |
| [:symbols-house-shield:&nbsp;IoT](mac_address_tables.md#iot-network)                | _VLAN53_&emsp;&emsp; | Smart home hardware _(bulbs, sensors, etc.)_           | **No Internet Access** by default. Strictly isolated from all other VLANs; communication only with [Home Assistant](../03_services/home_assistant.md) |

## :symbols-brick-wall-fire:&ensp;Boundary Defense & Remote Access

### Edge Protection

: An [ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md) acts as the primary firewall, utilizing **SPI** and **DoS / DDoS** protection. The two-way **IPS** built into the ASUS router uses SPI to protect any device connected to the network from spam, DoS / DDoS attacks, and from malicious packets entering or exiting the network. The [Asuswrt-Merlin][merlin]{ external-link } firmware extends the basic functionality of the built-in firewall with [Skynet][skynet]{ external-link }. It leverages predefined malware lists from reputable sources to protect the network against potential threats, and prevent unauthorized access.

### External Access

##### Reverse-Proxy

:   Direct port forwarding is strictly prohibited. Remote access to individual services is facilitated through multiple [Cloudflare Tunnels](../03_services/cloudflared.md), ensuring all incoming traffic is proxied and SSL-encrypted.

##### VPN

:   For administrative tasks, there are two [WireGuard](../03_services/wireguard_server.md) instances providing a secure, encrypted tunnel into the Trusted zone. The primary WireGuard server is hosted natively on the main [ASUS router](../02_hardware/asus_rt-be92u.md). The secondary / backup WireGuard server is hosted in a Docker container on the [ZimaOS NAS](../02_hardware/zimaos_nas.md).

## :symbols-server:&ensp;DNS Security & Content Filtering

### Internal Resolution

:   A clustered [Technitium DNS](../03_services/technitium.md) environment handles all local queries. The [Debian Server](../02_hardware/debian_server.md) acts as the primary node in the cluster, and the [Pi 4B Server](../02_hardware/pi_4b_server.md) acts as the secondary node. Both server IP addresses are configured in the router's DHCP server to ensure all clients on the trusted VLAN _(VLAN50)_ are using the local DNS servers for domain name resolution. Thanks to the clustered, highly available configuration; one DNS server can go down and domain resolution will remain functional.

### Upstream Privacy

:   DNS queries that cannot be resolved by the local servers' cache are forwarded to [Quad-9][quad-9]{ external-link } via **DoT** to prevent ISP snooping and **MITM** _([Man-in-the-Middle][mitm]{ external-link })_ attacks.

### Blocking

:   Network-wide ad, tracking, and malware blocking is enforced at the DNS level using curated blocklists to neutralize telemetry and malicious domains. Additionally, the [uBlock Origin][ubo]{ external-link } and [uBlock Lite][ubol]{ external-link } browser extensions are used in Firefox and Chromium to block any ads, tracking, and malware that make it through the DNS filter.

## :symbols-brick-wall-shield:&ensp;Device & Host Hardening

### Operating Systems

##### Servers

:   Servers primarily utilize **Debian** and **ZimaOS** _(on the NAS)_ for stability and security. Both of these server operating systems ensure maximum security and availability for services hosted on the network.

    - **Debian Linux** _(Stable)_ is a rock-solid, unchanging base to build a server on. Packages are not frequently updated with new features, so there is no need to worry about breakages. The 10-year-long service life means you are guaranteed to get security updates for the server's lifetime.
    - The immutability of **ZimaOS** means OS updates on the NAS are easy to revert if they cause a breakage, and ensures no system files can be modified by an intruder.

##### Clients

:   Client PCs utilize **Fedora _(KDE Plasma Desktop Edition)_** and **Windows 11** for their frequent security updates, up-to-date packages with the latest features, and support for the newest hardware _(e.g., the latest CPUs & GPUs)_.

##### Mobile Devices

:   Mobile devices _(e.g., smartphones and tablets)_ utilize **Android**. Only **Google Pixel** and **Samsung Galaxy** devices are allowed due to their monthly security patches and long service & support lifespan. While Apple's **iOS** mobile operating system is secure, it is not compatible with our philosophy that promotes the use of open-source software.  

### Access Control

##### Credential Storage

:   [Bitwarden][bw]{ external-link } is utilized to securely store credentials, including usernames, passwords, Passkeys, API keys, and SSH keys. Bitwarden's desktop client has a built-in SSH key-agent; allowing private keys to be stored securely inside an encrypted vault. The Chromium and Firefox browser extensions auto-fill credentials and integrate with the desktop client; allowing the use of biometric authentication. Additionally, the `bitwarden-cli` utility gives users an easy way to access their credentials while working in the terminal. The mobile client can auto-fill credentials on websites and native applications. Finally, the Bitwarden "Organization" feature allows household members to securely share credentials.

:   While Bitwarden does have the ability to store TOTP credentials, we forego this feature and use [Ente Auth][ente]{ external-link } instead. We believe it is vitally important to separate your primary and secondary authentication factors. Storing both factors in the same location gives attackers a single point of access, and negates the benefits of 2FA / MFA entirely. **Ente Auth** is an open-source, cross-platform TOTP manager with secure synchronization. It has desktop, mobile, and PWA clients making it easy to access your second factor authentication credentials anywhere you need them.

:   The other 2FA / MFA method we utilize wherever possible are physical FIDO2 / WebAuthen security keys. While there are many companies manufacturing these physical security keys, we generally recommend the [YubiKey 5][yubi]{ external-link } and the [Google Titan][titan]{ external-link } products. Both products have a long, proven history of security, and come from reputable companies. Unfortunately, not all accounts offer FIDO2 authentication, but we recommend using it on any accounts that do. It is ideal to have a backup in the event you lose your physical key. This can be either a second physical key you store in a secure location, or TOTP authentication.

##### SSH Security

:   [SSH](../03_services/ssh.md) access requires **Ed25519 Key-Based Authentication**; password-based and `root` user login are disabled. No SSH ports are publicly exposed. To manage a server, first connect to the **WireGuard** VPN server to gain secure, encrypted access to the local network.

##### Local User Accounts

:   Local user accounts on the Fedora and Windows 11 PCs do not have administrator privileges. A separate "admin" account is required to make system-level changes.

##### Self-Hosted Services

:   Services hosted on the network that require login have separate "admin" accounts for administration. Regular user accounts have reduced permissions for increased operational security.

### Updates

:   Automated security patching is enabled for critical packages on the **Debian servers** with `unattended-upgrades`, weekly manual audits for **Docker container** image updates *(monitored via &nbsp;[Dockge](../03_services/dockge.md))*, and **desktop / laptop PCs** have automatic updates enabled.

### 3D Infrastructure

:   The [Creality K1C](../02_hardware/kacey_3d-printer.md) is isolated to prevent unauthorized control while remaining accessible to the **Trusted** zone for print management.

## :symbols-door-closed-locked:&ensp;IoT & Smart Home Integrity

:   The migration from **Google Home** to **Home Assistant** ensures that IoT devices are managed locally. By isolating **VLAN53**, "phone-home" telemetry from generic IoT hardware is neutralized, preventing potential lateral movement if a device is compromised.

---

<div class="grid cards" markdown>

-   :symbols-hash:{ .lg .middle }&emsp;**MAC Addresses**

    ---

    [MAC Address Tables](mac_address_tables.md){ .md-button }

-   :symbols-sitemap:{ .lg .middle }&emsp;**Network Diagrams**

    ---

    [Logical Diagram](logical_diagram.md){ .md-button }&emsp;[Physical Diagram](physical_diagram.md){ .md-button }

</div>

<div class="grid cards" markdown>

-   :symbols-tornado:{ .lg .middle }&emsp;**Disaster Recovery**

    ---

    [Disaster Recovery Plan](disaster_recovery_plan.md){ .md-button }

-   :symbols-binary:{ .lg .middle }&emsp;**IP Addresses**

    ---

    [IP Address Management](ip_address_management.md){ .md-button }

</div>

[bw]: <https://vault.bitwarden.com> "Bitwarden Web Vault"
[ente]: <https://auth.ente.com/login> "Login &mdash; Ente Auth"
[merlin]: <https://www.asuswrt-merlin.net/> "Asuswrt-Merlin Documentation"
[mitm]: <https://en.wikipedia.org/wiki/Man-in-the-middle_attack> "Wikipedia"
[quad-9]: <https://quad9.net/> "Quad-9 DNS"
[skynet]: <https://github.com/Adamm00/IPSet_ASUS> "GitHub: Skynet"
[titan]: <https://store.google.com/us/product/titan_security_key?hl=en-US&selections=eyJwcm9kdWN0RmFtaWx5IjoiWkdWMmFXTmxYMlpoYldsc2VWOWZkR2wwWVc1ZmMyVmpkWEpwZEhsZmEyVjUifQ%3D%3D> "Shop Google Titan Keys"
[ubo]: <https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/> "Add to Firefox"
[ubol]: <https://chromewebstore.google.com/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh> "Add to Chromium"
[yubi]: <https://www.yubico.com/products/yubikey-5-overview/> "Shop YubiKey 5 Series"