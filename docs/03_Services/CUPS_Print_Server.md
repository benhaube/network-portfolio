---
icon: material/printer
title: CUPS
subtitle: Open Print Server
description: A standards-based, open-source printing system for Linux and other Unix-like operating systems.
tags:
  - Active
  - Service
  - Software
  - Printing
  - Native
hide:
  - toc
---
![CUPS Open Print Server icon](../assets/icons/cups-service.svg){ width=200 }

# CUPS
*Open Print Server*

[GitHub&ensp;:simple-github:](https://github.com/OpenPrinting/cups){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:material-file-document-multiple:](https://openprinting.github.io/cups/#DOCUMENTATION){ .md-button .md-button--primary }

---
## :material-information-outline:&ensp;Overview

#### :symbols-description:&ensp;Description

:    A standards-based, open-source printing system for Linux and other Unix-like operating systems.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `631`

#### :material-link-variant:&ensp;URL / Access

+ <https://192.168.50.2:631>

#### :material-printer-settings:&ensp;Printer URL

+ IPP:
    + `ipp://192.168.50.2:631/printers/Brother_HL-L2300D_series`
+ mDNS:
    + `dnssd://Brother%20Laser%20Printer%20%40%20pi-server._ipp._tcp.local/cups?uuid=06d625d5-f736-30c6-6315-c20eec2f460e`

#### :material-key-chain:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"CUPS Admin"&emsp;:material-information-outline:{ title="Login needed for Administration, but anyone on the local network can print." }

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                     | Method                             | Container Name | Image |
| :---------------------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| [:material-raspberry-pi:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :material-cog:&ensp;Configuration 

```apacheconf title="<code>/etc/cups/cupsd.conf</code>" linenums="1"
--8<-- "cupsd.conf"
```
