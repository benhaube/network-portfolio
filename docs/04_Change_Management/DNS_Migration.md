---
icon: material/dns
title: DNS Migration
tags:
  - DNS
  - Domain
  - Infrastructure
  - Server
  - Service
hide:
  - toc
---
![Pi-hole Icon](../assets/icons/pi-hole.svg){ width=150 }&nbsp;![material-arrow-right-bold icon](../assets/icons/arrow-right-bold-light.svg#only-light){ width=100 }![material-arrow-right-bold icon](../assets/icons/arrow-right-bold-dark.svg#only-dark){ width=100 }&emsp;![Technitium Icon](../assets/icons/technitium-light.svg#only-light){ width=150 }![Technitium Icon](../assets/icons/technitium.svg#only-dark){ width=150 }

# DNS Migration (Pi-hole :material-arrow-right-thin: Technitium)

---

## :material-file-document: Phase 1: Pre-Migration & Documentation

1. **Export Pi-hole Data:** 
    + [ ] Run a "Teleporter" backup on your current primary and secondary Pi-holes.
2. **Document Static Records:** 
    + [ ] Note all local DNS records and DHCP reservations *(if Pi-hole is handling DHCP)*.
3. **Map IP Addresses:**
    + [ ] Primary: [:material-raspberry-pi:&thinsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) :material-arrow-right-thin: `192.168.50.2` 
    + [ ] Secondary: [:material-debian:&thinsp;Debian Server VM](../02_Hardware/Debian_Server_VM.md) :material-arrow-right-thin: `192.168.50.6`
    + [ ] Tertiary/Failover: [:material-raspberry-pi:&thinsp;Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) :material-arrow-right-thin: `192.168.50.3`

## :material-dns: Phase 2: Server Provisioning

### :material-debian:&nbsp;Debian Server VM *(ZimaOS NAS)*:

1. **Allocate Resources:** 
    + [ ] Assign 2 vCPUs and 2 GB RAM to the VM.
2. **Install Technitium:** 
    + [ ] Use the installer script or Docker container.
3. **Configure Upstream:** 
    + [ ] Set Quad9 DoT *(`9.9.9.9:853` and `149.112.112.112:853`)*.
4. **Import Records:** 
    + [ ] Manually add local DNS zones/records from the Pi-hole export.

### :material-raspberry-pi:&nbsp;Raspberry Pi 4B:

1. **Uninstall Pi-hole:**
    + [ ] Use the command `#!bash sudo pihole uninstall` to remove Pi-hole from the server.
2. **Install Technitium:** 
    + [ ] Match the version running on the Debian VM.
3. **Set as Secondary:** 
    + [ ] Configure identical upstream servers.

## :material-cog-sync: Phase 3: Cluster Synchronization

1. **Enable Clustering:** 
    + [ ] Set the Debian VM as the **Master**.
    + [ ] Set the Pi 4B as the **Slave**.
2. **Verify Sync:** 
    + [ ] Ensure local zones and blocklists are appearing on both instances.
3. **Blocklist Tuning:** 
    + [ ] Add your preferred lists *(e.g., OISD, HaGeZi)* and verify they are enabled on both.

## :material-toggle-switch-outline: Phase 4: Network Cutover

1. **Update Router DHCP:** 
    + [ ] Point DNS 1 to the Debian VM IP.
    + [ ] Point DNS 2 to the Pi 4B IP.
    + [ ] *(Optional)* Point DNS 3 to the Pi Zero IP.
2. **Clear Local Caches:** 
    + [ ] Flush DNS on your main workstation *(`#!bash resolvectl flush-caches` or `#!bash ipconfig /flushdns`)*.
3. **Test Resolution:** 
    + [ ] Run `#!bash dig @[Primary-IP] google.com` and verify the `SERVER` field.

## :material-web-check: Phase 5: Verification & Safety Net

1. **Check DoT Status:** 
    + [ ] Run `#!bash dig @[Primary-IP] +short txt proto.on.quad9.net` to ensure the upstream is encrypted.
2. **Verify Pi Zero Fallback:** 
    + [ ] Temporarily stop the Technitium service on both the VM and Pi 4B. Confirm the Pi Zero takes over resolution.
3. **Audit Dashboard:** 
    + [ ] Monitor the Technitium dashboard for any unexpected `NXDOMAIN` responses or high latency.

## :material-sitemap: Flowchart

```mermaid
--8<-- "dns_migration.mmd"
```