---
icon: symbols/screen-share
title: RDP
subtitle: Remote Desktop Protocol
description: KRDP is a Remote Desktop Protocol server implementation for the KDE Plasma desktop environment and Wayland-based systems. It enables remote access to a Wayland desktop session using standard RDP clients, leveraging modern Linux desktop technologies including PipeWire for screen capture, XDG Desktop Portals for compositor integration, and FreeRDP for protocol implementation.
tags:
  - Active
  - Infrastructure
  - Native
  - Remote Access
  - Service
hide:
  - toc
---

![Lucide 'screen-share' icon](../assets/icons/screen-share.svg){ width=200 }

# RDP

_Remote Desktop Protocol_

[Gitlab&ensp;:brands-gitlab:](https://invent.kde.org/plasma/krdp){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://deepwiki.com/KDE/krdp){ .md-button .md-button--primary }

---

![KDE Plasma RDP server settings](../assets/screenshots/rdp-light.png#only-light){ width=400 align=right .on-glb }
![KDE Plasma RDP server settings](../assets/screenshots/rdp-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

KRDP is a Remote Desktop Protocol server implementation for the KDE Plasma desktop environment and Wayland-based systems. It enables remote access to a Wayland desktop session using standard RDP clients, leveraging modern Linux desktop technologies including PipeWire for screen capture, XDG Desktop Portals for compositor integration, and FreeRDP for protocol implementation.

![Fedora package](https://img.shields.io/fedora/v/krdp?label=Release&color=%2351a2da)

**Port(s)**

- `3389`
{ .no-bullets }

**URL / Access**  

- [rdp://bens-workstation.internal:3389](rdp://192.168.50.67:3389)
{ .no-bullets }

**Credentials**

-   [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }  
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Local User @ Ben's-Workstation"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                            | Method                          | Container Name | Image | Port(s) |
| :--------------------------------------------------------------------- | :------------------------------ | :------------- | :---- | :------ |
| [:symbols-pc-case:&nbsp;Ben's Desktop](../02_hardware/bens_desktop.md) | :symbols-tux:&nbsp;Native Linux | `-`            | `-`   | `3389`  |

---

## :symbols-settings:&ensp;Configuration

``` ini { .mono-title title="~/.config/krdpserverrc" linenums="1" }
--8<-- "krdpserverrc"
```
