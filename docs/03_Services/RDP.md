---
icon: material/remote-desktop
tags:
  - active
  - service
  - software
  - native
hide:
  - toc
---
![Material Design remote-desktop icon](../assets/icons/remote-desktop.svg){ width=200 }

# [[RDP|RDP (Remote Desktop Protocol)]]
[Gitlab :simple-gitlab:](https://invent.kde.org/plasma/krdp){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/){ .md-button }

---
## :material-information-outline: Overview

#### Purpose:
+ Remote desktop access over the local network *(not publicly exposed)*

#### Port(s):
+ `3389`

#### URL / Access: 
+ [rdp://192.168.50.67:3389](rdp://192.168.50.67:3389)
+ [rdp://bens-workstation.internal:3389](rdp://192.168.50.67:3389)

#### Credentials: 
+ :material-account-outline:&nbsp;Local User: `bhaube`

## :material-package-down: Deployment Details 

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-fedora:&nbsp;[Ben's Desktop](../02_Hardware/Ben's_Desktop.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |

### :material-cog: Configuration

```ini title="~/.config/krdbserverrc" linenums="1"
[General]  
Autostart=true  
Certificate=/home/bhaube/.local/share/krdpserver/krdp.crt  
CertificateKey=/home/bhaube/.local/share/krdpserver/krdp.key  
SystemUserEnabled=true
```
