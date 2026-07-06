---
icon: symbols/terminal
title: ttydBridge
subtitle: The Terminal on the Web
description: A DockerApp makes it easy to use the host terminal on the Web.
tags:
  - Active
  - Docker
  - Remote Access
  - Shell
hide:
  - toc
---
![Material Design console icon](../assets/icons/console.svg){ width=200 }

# ttydBridge
*The Terminal on the Web*

[GitHub&ensp;:simple-github:](https://github.com/Cp0204/ttydBridge){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://deepwiki.com/tsl0922/ttyd){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 
:    A DockerApp makes it easy to use the host terminal on the Web.

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `2222`

#### :symbols-link:&ensp;URL / Access

+ <http://storage-server.internal:2222>
+ <http://storage-server-2.internal:2222>

#### :symbols-key:&ensp;Credentials  

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"ZimaOS NAS (admin)"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                        | Method                                | Container Name | Image                      |
| :----------------------------------------------------------------- | :------------------------------------ | :------------- | :------------------------- |
| [:symbols-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :services-docker:&nbsp;Docker Compose | `ttydbridge`   | `cp0204/ttydbridge:v0.0.3` |

### :symbols-settings:&ensp;Configuration

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "ttydBridge.yml"
```

--8<-- "zima-ssh.md"
