---
icon: services/technitium
title: Technitium DNS Server
status: new
tags:
  - Active
  - Service
  - Software
  - DNS
  - Infrastructure
  - Network
  - Domain
  - Native
hide:
  - toc
---
![Technitium Icon](../assets/icons/technitium-light.svg#only-light){ width=200 }
![Technitium Icon](../assets/icons/technitium.svg#only-dark){ width=200 }

# Technitium DNS Server
[GitHub :material-github:](https://github.com/TechnitiumSoftware/DnsServer){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://technitium.com/dns/help.html){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ An open source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.

#### :symbols-settings-ethernet: Port(s): 
* `53`
* `443`
* `5380`

#### :material-link-variant: URL / Access:  
* :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md)
    * `192.168.50.6:53`
    * <http://debian-vm.internal:5380>
* :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)
    * `192.168.50.2:53`
    * <http://pi-server.internal:5380>

#### :material-key-chain: Credentials: 
* [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    * Local Network&ensp;:material-arrow-right-thin:&ensp;"Technitium"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                     | Method                             | Container Name | Image |
| :---------------------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md)                   | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :material-cog: Configuration 

#### :symbols-install-desktop: Install:

```bash title="Command to install Technitium" linenums="1"
curl -sSL https://download.technitium.com/dns/install.sh | sudo bash
```

#### :material-network-outline: Zones:

```zone title="50.168.192.in-addr.arpa.zone"
--8<-- "50.168.192.in-addr.arpa.zone"
```

```zone title="cluster-catalog.internal.zone"
--8<-- "cluster-catalog.internal.zone"
```

```zone title="internal.zone"
--8<-- "internal.zone"
```
