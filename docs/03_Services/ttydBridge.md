---
icon: material/console
tags:
  - Active
  - Service
  - Software
  - Docker
  - Remote Access
  - Shell
hide:
  - toc
---
![Material Design console icon](../assets/icons/console.svg){ width=200 }

# ttydBridge
[GitHub :material-github:](https://github.com/Cp0204/ttydBridge){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Easily access and use the host terminal in a Web browser.

#### :symbols-settings-ethernet: Port(s): 
+ `2222`

#### :material-link-variant: URL / Access: 
+ <http://storage-server.internal:2222>

#### :material-key-chain: Credentials:  
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "storage-server (Admin)"

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `ttydbridge` | `cp0204/ttydbridge:v0.0.3` |

### :material-cog: Configuration

```yaml title="compose.yml" linenums="1"
--8<-- "ttydBridge.yml"
```

> [!zima] Settings Toggle Needed!
> **ZimaOS** does not have SSH enabled after a fresh install. For the [[ZimaBoard_2_NAS|ZimaOS NAS]] the SSH service needs to be enabled first through the [ZimaOS Web UI](http://storage-server.internal/) in the developer options.
> + Settings :material-arrow-right-thin: General :material-arrow-right-thin: Developer Mode :material-arrow-right-thin: SSH Access 
>     
>       ![[zimaos_ssh.png|600]]
>         
> + After enabling SSH in the developer options the [[ttydBridge]] application is automatically installed. The SSH service can be configured from there.
> + Once the SSH server is configured the **ttydBridge** application is no longer needed, but remains installed. This is a good backup to get shell access in case of an SSH configuration issue.
