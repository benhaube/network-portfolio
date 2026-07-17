---
icon: symbols/printer
title: CUPS
subtitle: Open Print Server
description: A standards-based, open-source printing system for Linux and other Unix-like operating systems.
tags:
  - Active
  - Printing
  - Native
  - Service
hide:
  - toc
---
![Lucide printer icon](../assets/icons/printer.svg){ width=200 }

# CUPS
*Open Print Server*

[GitHub&ensp;:brands-github:](https://github.com/OpenPrinting/cups){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://openprinting.github.io/cups/#DOCUMENTATION){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A standards-based, open-source printing system for Linux and other Unix-like operating systems.

#### :symbols-settings-ethernet:&ensp;Port(s)

:    `631`

#### :symbols-link:&ensp;URL / Access

:    <https://192.168.50.2:631>

#### :symbols-printer-plus:&ensp;Printer URL

:    IPP:
    
      + `ipp://192.168.50.2:631/printers/Brother_HL-L2300D_series`

:    mDNS:
    
      + `dnssd://Brother%20Laser%20Printer%20%40%20pi-server._ipp._tcp.local/cups?uuid=06d625d5-f736-30c6-6315-c20eec2f460e`

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"CUPS Admin"&emsp;:symbols-info:{ title="Login needed for Administration, but anyone on the local network can print." }

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                              | Container Name | Image |
| :------------------------------------------------------------------- | :---------------------------------- | :------------- | :---- |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-penguin:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration 

#### :symbols-install-desktop: Install CUPS Server

1. Install the `cups` package and its dependencies:

    ```bash linenums="1"
    sudo apt update
    sudo apt install cups
    ```

2. Start / Enable the `cups` Systemd service:

    ```bash linenums="1"
    sudo systemctl enable cups
    sudo systemctl start cups
    ```

3. Make a backup of the original configuration file, and replace the working config file with the one on this page.
4. Restart the `cups` Systemd service:

    ```bash linenums="1"
    sudo systemctl restart cups
    ```

#### :symbols-file-config: Config File

```apacheconf {title="/etc/cups/cupsd.conf" linenums="1" .mono-title}
--8<-- "cupsd.conf"
```
