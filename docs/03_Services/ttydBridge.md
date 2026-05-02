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
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"storage-server (Admin)"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                      |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :------------------------- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `ttydbridge`   | `cp0204/ttydbridge:v0.0.3` |

### :material-cog: Configuration

```yaml title="compose.yml" linenums="1"
--8<-- "ttydBridge.yml"
```

--8<-- "zima-ssh.md"
