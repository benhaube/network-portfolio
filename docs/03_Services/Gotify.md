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

#### :material-application-cog: Configured Applications:

| Application                                                              | Host Device                                                                                      | Role / Notes                                                                                                                     |
| :----------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------- |
| :services-beszel:&nbsp;[Beszel Hub](../03_Services/Beszel_Hub.md)        | :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)  | Recieve notifications when servers have a hardware failure and/or reach or exceed set thresholds for temperature, load avg, etc. |
| :services-uptime-kuma:&nbsp;[Uptime Kuma](../03_Services/Uptime_Kuma.md) | :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)  | Recieve notifications when services / infrastructure monitored by Uptime Kuma report a down status or other issue.               |
| :material-console-network:&nbsp;[SSH](../03_Services/SSH.md)             | :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md)                 | Recieve notifications when a new SSH session is successfully established. Reports the user, hostname, and cliet IP address.      |
|                                                                          | :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md)                    |                                                                                                                                  |
|                                                                          | :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)  |                                                                                                                                  |
|                                                                          | :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) |                                                                                                                                  |
|                                                                          | :services-zimaos:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                           |                                                                                                                                  |