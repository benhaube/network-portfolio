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

```yaml title="docker-compose.yml" linenums="1"
services:
  ttydbridge:
    cpu_shares: 90
    container_name: ttydbridge
    deploy:
      resources:
        limits:
          memory: 16508235776
        reservations:
          memory: "8388608"
    environment:
      - EXEC_DIR=/opt
      - PORT=2222
      - START_COMMAND=login
    image: cp0204/ttydbridge:v0.0.3
    labels:
      icon: data:image/svg+xml;charset=utf-8,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%3F%3E%0A%3Csvg%20version%3D%221.1%22%20viewBox%3D%220%200%2024%2024%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%3Cpath%20d%3D%22m21.56%2020.365v-14.34h-19.119v14.34h19.119m0-19.119a2.3899%202.3899%200%20012.3899%202.3899v16.73a2.3899%202.3899%200%2001-2.3899%202.3899h-19.119a2.3899%202.3899%200%2001-2.3899-2.3899v-16.73c0-1.3264%201.0755-2.3899%202.3899-2.3899h19.119m-8.3648%2016.73v-2.3899h5.9748v2.3899h-5.9748m-4.0868-4.7799-4.7918-4.7799h3.3818l3.9434%203.9434c.46604.46604.46604%201.2308%200%201.6969l-3.9195%203.9195h-3.3818z%22%20fill%3D%22%23f2f2f2%22%20stroke-width%3D%221.195%22%2F%3E%3C%2Fsvg%3E%0A
    pid: host
    privileged: true
    restart: unless-stopped
    volumes:
      - type: bind
        source: /opt
        target: /opt
        bind:
          create_host_path: true
    network_mode: bridge
```

> [!zima] Settings Toggle Needed!
> **ZimaOS** does not have SSH enabled after a fresh install. For the [[ZimaBoard_2_NAS|ZimaOS NAS]] the SSH service needs to be enabled first through the [ZimaOS Web UI](http://storage-server.internal/) in the developer options.
> + Settings :material-arrow-right-thin: General :material-arrow-right-thin: Developer Mode :material-arrow-right-thin: SSH Access 
>     
>       ![[zimaos_ssh.png|600]]
>         
> + After enabling SSH in the developer options the [[ttydBridge]] application is automatically installed. The SSH service can be configured from there.
> + Once the SSH server is configured the **ttydBridge** application is no longer needed, but remains installed. This is a good backup to get shell access in case of an SSH configuration issue.
