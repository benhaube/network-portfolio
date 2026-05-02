---
icon: material/printer
title: CUPS (Open Print Server)
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

# CUPS (Open Print Server)
[GitHub :material-github:](https://github.com/OpenPrinting/cups){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://openprinting.github.io/cups/#DOCUMENTATION){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description:  
+ Print server for `Brother_HL-L2300D_series` laser printer.

#### :symbols-settings-ethernet: Port(s): 
+ `631`

#### :material-link-variant: URL / Access: 
+ <http://pi-server.internal:631>
+ <http://192.168.50.2:631>

#### :material-printer-settings: Printer URL: 
+ IPP:
    + `ipp://pi-server.local:631/printers/Brother_HL-L2300D_series`
+ Bonjour:
    + `dnssd://Brother%20Laser%20Printer%20%40%20pi-server._ipp._tcp.local/cups?uuid=06d625d5-f736-30c6-6315-c20eec2f460e`

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"CUPS Server"&emsp;:material-information-outline:{ title="Login needed for Administration, but anyone on the local network can print." }

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                     | Method                             | Container Name | Image |
| :---------------------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :material-cog: Configuration 

```apacheconf title="/etc/cups/cupsd.conf" linenums="1"
--8<-- "cupsd.conf"
```
