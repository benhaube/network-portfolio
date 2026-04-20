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
name: ttydbridge
services:
  ttydbridge:
    container_name: ttydbridge
    deploy:
      resources:
        reservations:
          memory: "8388608"
          devices: []
        limits:
          memory: 16508321792
    environment:
      - EXEC_DIR=/opt
      - PORT=2222
      - START_COMMAND=login
    image: cp0204/ttydbridge:v0.0.3
    labels:
      icon: https://cdn.jsdelivr.net/gh/IceWhaleTech/CasaOS-AppStore@main/Apps/ttydbridge/icon.png
    pid: host
    privileged: true
    restart: unless-stopped
    volumes:
      - type: bind
        source: /opt
        target: /opt
        bind:
          create_host_path: true
    ports: []
    devices: []
    cap_add: []
    command: []
    network_mode: bridge
    cpu_shares: 90
x-casaos:
  architectures:
    - amd64
    - arm
    - arm64
  author: Cp0204
  category: Developer
  description:
    en_us: >
      ttydBridge acts as a "bridge" to the host environment, allowing you to
      easily access and use the host terminal in a web. It is built on ttyd and
      runs in a containerized manner, providing a secure and convenient remote
      endpoint experience.
    zh_cn: >
      ttydBridge 如一座“桥”，连通了宿主机环境，让你在浏览器中轻松访问和使用宿主机终端。它基于 ttyd
      构建，并以容器化的方式运行，提供了安全、便捷的远程终端体验。
  developer: Cp0204
  hostname: ""
  icon: https://cdn.jsdelivr.net/gh/IceWhaleTech/CasaOS-AppStore@main/Apps/ttydbridge/icon.png
  index: /
  is_uncontrolled: false
  main: ttydbridge
  port_map: "2222"
  scheme: http
  screenshot_link:
    - https://cdn.jsdelivr.net/gh/IceWhaleTech/CasaOS-AppStore@main/Apps/ttydbridge/screenshot-1.png
    - https://cdn.jsdelivr.net/gh/IceWhaleTech/CasaOS-AppStore@main/Apps/ttydbridge/screenshot-2.png
  store_app_id: ttydbridge
  tagline:
    en_us: Easy access to the host terminal in web
    zh_cn: 在浏览器中轻松访问宿主机终端
  tips:
    before_install:
      en_us: >
        1. Default to using Linux system user authentication.

        2. You can increase HTTP authentication by setting the `HTTP_USERNAME` and `HTTP_PASSWORD` variables.

        [Official DOC](https://hub.docker.com/r/cp0204/ttydbridge)
      zh_cn: |
        1. 默认使用 Linux 系统用户鉴权。

        2. 可以通过设置 `HTTP_USERNAME` `HTTP_PASSWORD` 变量，增加 HTTP 鉴权。

        [官方文档](https://hub.docker.com/r/cp0204/ttydbridge)
  title:
    en_us: ttydBridge
    custom: ""
```

> [!tip] Settings Toggle Needed!
> + **ZimaOS** does not have SSH enabled after a fresh install. For the [[ZimaBoard_2_NAS|ZimaOS NAS]] the SSH service needs to be enabled first through the [ZimaOS Web UI](http://storage-server.internal/) in the developer options.
>     + Settings :material-arrow-right-thin: General :material-arrow-right-thin: Developer Mode :material-arrow-right-thin: SSH Access 
>     
>         ![[zimaos_ssh.png|600]]
>         
> + After enabling SSH in the developer options the [[ttydBridge]] application is automatically installed. The SSH service can be configured from there.
> + Once the SSH server is configured the **ttydBridge** application is no longer needed, but remains installed. This is a good backup to get shell access in case of an SSH configuration issue.
