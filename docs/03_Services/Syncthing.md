---
icon: simple/syncthing
tags:
  - Active
  - Service
  - Software
  - Docker
  - Download
  - File Share
  - Native
hide:
  - toc
---
![Syncthing Icon](../assets/icons/syncthing-light.svg#only-light){ width=200 }
![Syncthing Icon](../assets/icons/syncthing.svg#only-dark){ width=200 }

# Syncthing
[GitHub :material-github:](https://github.com/syncthing/syncthing){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.syncthing.net/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Open decentralized file synchronization.

#### :symbols-settings-ethernet: Port(s): 
+ `8384`

#### :material-link-variant: URL / Access:  
* :material-desktop-tower:&nbsp;[Ben's Desktop](../02_Hardware/Ben's_Desktop.md):
    * <http://bens-workstation.internal:8384>
    * <http://192.168.50.61:8384>
* :material-laptop:&nbsp;[Ben's Laptop](../02_Hardware/Ben's_Laptop.md):
    * <http://127.0.0.1:8384>
* :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md):
    * <https://pi-server.internal:8384>
* :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md):
    * <https://pi-zero.internal:8384>
* :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md):
    * <http://storage-server.internal:8384>

#### :material-key-chain: Credentials: 
* [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    * "Syncthing @ storage-server"
    * "Syncthing @ pi-server"
    * "Syncthing @ pi-hole"
    * "Syncthing @ bens-workstation"
    * "Syncthing @ ben-laptop"

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-desktop-tower:&nbsp;[Ben's Desktop](../02_Hardware/Ben's_Desktop.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |
| :material-laptop:&nbsp;[Ben's Laptop](../02_Hardware/Ben's_Laptop.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `syncthing` | `linuxserver/syncthing:1.29.7` |

### :material-cog: Configuration  

#### :symbols-install-desktop: Install Commands:
+ :material-raspberry-pi:&nbsp;Raspberry Pi 4B Server / Raspberry Pi Zero Server:
    + `#!bash sudo apt install -y syncthing`
+ :material-fedora:&nbsp;Ben's Desktop / Ben's Laptop:
    + `#!bash sudo dnf install -y syncthing syncthingctl-qt6 syncthingplasmoid-qt6`

#### :material-docker: Docker Compose: <br>&emsp;*(ZimaOS NAS)*

```yaml title="docker-compose.yml" linenums="1"
services:
  syncthing:
    cpu_shares: 90
    container_name: syncthing
    deploy:
      resources:
        limits:
          memory: 16508235776
        reservations:
          memory: "268435456"
    environment:
      - PGID=1000
      - PUID=1000
      - TZ=America/New_York
    image: linuxserver/syncthing:latest
    labels:
      icon: https://cdn.jsdelivr.net/gh/selfhst/icons@main/svg/syncthing.svg
    ports:
      - target: 8384
        published: "8384"
        protocol: tcp
      - target: 22000
        published: "22000"
        protocol: tcp
      - target: 22000
        published: "22000"
        protocol: udp
      - target: 21027
        published: "21027"
        protocol: udp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/syncthing/config
        target: /config
      - type: bind
        source: /DATA
        target: /DATA
```
