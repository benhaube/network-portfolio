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
    * Local Network&ensp;:material-arrow-right-thin:&ensp;"Syncthing @ storage-server"
    * Local Network&ensp;:material-arrow-right-thin:&ensp;"Syncthing @ pi-server"
    * Local Network&ensp;:material-arrow-right-thin:&ensp;"Syncthing @ pi-hole"
    * Local Network&ensp;:material-arrow-right-thin:&ensp;"Syncthing @ bens-workstation"
    * Local Network&ensp;:material-arrow-right-thin:&ensp;"Syncthing @ ben-laptop"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                      | Method                                | Container Name | Image                          |
| :----------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :----------------------------- |
| :material-desktop-tower:&nbsp;[Ben's Desktop](../02_Hardware/Ben's_Desktop.md)                   | :material-linux:&nbsp;Native Linux    | `N/A`          | `N/A`                          |
| :material-laptop:&nbsp;[Ben's Laptop](../02_Hardware/Ben's_Laptop.md)                            | :material-linux:&nbsp;Native Linux    | `N/A`          | `N/A`                          |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)  | :material-linux:&nbsp;Native Linux    | `N/A`          | `N/A`                          |
| :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :material-linux:&nbsp;Native Linux    | `N/A`          | `N/A`                          |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                              | :material-docker:&nbsp;Docker Compose | `syncthing`    | `linuxserver/syncthing:1.29.7` |

### :material-cog: Configuration  

#### :symbols-install-desktop: Install Commands:
+ :material-raspberry-pi:&nbsp;Raspberry Pi 4B Server / Raspberry Pi Zero Server:
    + `#!bash sudo apt install -y syncthing`
+ :material-fedora:&nbsp;Ben's Desktop / Ben's Laptop:
    + `#!bash sudo dnf install -y syncthing syncthingctl-qt6 syncthingplasmoid-qt6`

#### :material-docker: Docker Compose:

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "syncthing-zima.yml"
```
