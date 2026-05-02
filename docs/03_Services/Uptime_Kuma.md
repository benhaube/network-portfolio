---
icon: services/uptime-kuma
tags:
  - Active
  - Service
  - Software
  - Docker
  - Monitor
  - Network
hide:
  - toc
---
![Uptime Kuma Icon](../assets/icons/uptime-kuma-light.svg#only-light){ width=200 }
![Uptime Kuma Icon](../assets/icons/uptime-kuma.svg#only-dark){ width=200 }

# Uptime Kuma
[GitHub :material-github:](https://github.com/louislam/uptime-kuma){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/louislam/uptime-kuma/wiki){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A fancy self-hosted service monitoring tool.

#### :symbols-settings-ethernet: Port(s): 
+ `3001`

#### :material-link-variant: URL / Access: 
+ :material-lan:&nbsp;LAN Access
    + <https://uptime.internal>
    + <http://pi-server.internal:3001>
+ :material-wan:&nbsp;WAN Access
    + <https://uptime.rac3r4life.online>

#### :material-key-chain: Credentials:  
* [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    * Local Network&ensp;:material-arrow-right-thin:&ensp;"Uptime Kuma @ pi-server"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                     | Method                                | Container Name | Image                    |
| :---------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :----------------------- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `uptime-kuma`  | `louislam/uptime-kuma:2` |

### :material-cog: Configuration 

```yaml title="compose.yml" linenums="1"
--8<-- "uptime-kuma.yml"
```
