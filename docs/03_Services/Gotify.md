---
icon: services/gotify-notification
status: new
title: Gotify
tags:
  - Active
  - Service
  - Software
  - Docker
  - Monitor
hide:
  - toc
---
![Gotify logo](../assets/icons/gotify-logo.png){ width=200 }

# Gotify
[GitHub :material-github:](https://github.com/gotify/server){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://gotify.net/docs/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A simple server for sending and receiving messages in real-time per WebSocket. *(Includes a sleek Web-UI)*
 
#### :symbols-settings-ethernet: Port(s): 
+ `8180`

#### :material-link-variant: URL / Access: 
+ <http://storage-server.internal:8180> &mdash; *Local Network Web-UI only*
+ <https://gotify.rac3r4life.online> &mdash; *Use for notification WebSocket*

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Gotify (admin) @ storage-server"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Gotify (bhaube) @ storage-server"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                  |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :--------------------- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `gotify`       | `gotify/server:latest` |

### :material-cog: Configuration 

```yaml title="compose.yml" linenums="1"
--8<-- "gotify.yml"
```

1. Sets your initial `admin` password. Change the `admin` password after first login.