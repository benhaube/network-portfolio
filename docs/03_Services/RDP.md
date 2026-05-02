---
icon: material/remote-desktop
title: RDP (Remote Desktop Protocol)
tags:
  - Active
  - Service
  - Software
  - Native
hide:
  - toc
---
![Material Design remote-desktop icon](../assets/icons/remote-desktop.svg){ width=200 }

# RDP (Remote Desktop Protocol)
[Gitlab :simple-gitlab:](https://invent.kde.org/plasma/krdp){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Remote desktop access over the local network *(not publicly exposed)*

#### :symbols-settings-ethernet: Port(s):
+ `3389`

#### :material-link-variant: URL / Access:  
+ [rdp://192.168.50.67:3389](rdp://192.168.50.67:3389)
+ [rdp://bens-workstation.internal:3389](rdp://192.168.50.67:3389)

#### :material-key-chain: Credentials: 
+ :material-account-outline:&nbsp;Local User: `bhaube`

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                    | Method                             | Container Name | Image |
| :----------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| :material-desktop-tower:&nbsp;[Ben's Desktop](../02_Hardware/Ben's_Desktop.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :material-cog: Configuration

```ini title="~/.config/krdpserverrc" linenums="1"
--8<-- "krdpserverrc"
```
