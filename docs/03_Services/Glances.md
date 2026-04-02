---
tags:
  - active
  - service
  - software
  - docker
  - monitor
hide:
  - toc
---
![[glances.svg|200]]

# [[Glances]]
[GitHub :material-github:](https://github.com/nicolargo/glances){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/nicolargo/glances/wiki){ .md-button }

---
## :material-information-outline: Overview
* **Purpose:** Glances an Eye on your system. A `top` / `htop` alternative for the Web browser. 
* **Port(s):** `21208`
* **URL / Access:** 
    * <http://pi-server.internal:61208>
    * <http://storage-server.internal:61208>
* **Credentials:** N/A

## :material-package-down: Deployment Details
* **Host Device:** 
    * :simple-raspberrypi:&nbsp;[[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]
    * :simple-raspberrypi:&nbsp;[[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]
* **Method:** &nbsp;:simple-docker:&nbsp;Docker Compose
* **Container Name:** `glances`
* **Image:** `nicolargo/glances:latest-full `

### :fontawesome-solid-gear: Configuration

```yaml title="docker-compose.yml" linenums="1"
services:  
  glances:  
    # See all images tags here: https://hub.docker.com/r/nicolargo/glances/tags  
    image: nicolargo/glances:latest-full  
    restart: always  
  
    pid: "host"  
    network_mode: "host"  
  
    read_only: true  
    privileged: false  
    # Uncomment next line for SATA or NVME smartctl monitoring  
    # cap_add:  
    # Uncomment next line for SATA smartctl monitoring  
    # - SYS_RAWIO  
    # Uncomment next line for NVME smartctl monitoring  
    # - SYS_ADMIN  
    # devices:  
    #   - "/dev/nvme0"  
  
  volumes:  
    - "/:/rootfs:ro"  
    - "/var/run/docker.sock:/var/run/docker.sock:ro"  
    - "/run/user/1000/podman/podman.sock:/run/user/1000/podman/podman.sock:ro"  
    - "./glances.conf:/glances/conf/glances.conf"  
    - "/var/log:/var/log:ro"  
    # Uncomment for proper distro information in upper panel.  
    # Works only for distros that do have this file (most of distros do).  
    - "/etc/os-release:/etc/os-release:ro"  
  
  tmpfs:  
    - /tmp  
  
  environment:  
    # Please set to your local timezone (or use local ${TZ} environment variable if set on your host)  
    - TZ=America/New_York  
    - GLANCES_OPT=-C /glances/conf/glances.conf -w --enable-plugin smart  
    - PYTHONPYCACHEPREFIX=/tmp/py_caches  
  
#   # Uncomment for GPU compatibility (Nvidia) inside the container  
#   deploy:  
#     resources:  
#       reservations:  
#         devices:  
#           - driver: nvidia  
#             count: 1  
#             capabilities: [gpu]  
  
   # Uncomment to protect Glances WebUI by a login/password (add --password to GLANCES_OPT)  
   # secrets:  
   #   - source: glances_password  
   #     target: /root/.config/glances/<login>.pwd  
  
# secrets:  
#   glances_password:  
#     file: ./secrets/glances_password
```

```yaml title="docker-compose.yml" linenums="1"
name: glances
services:
  glances:
    cap_add:
      - SYS_RAWIO
      - SYS_ADMIN
    cpu_shares: 90
    command: []
    container_name: glances
    deploy:
      resources:
        limits:
          memory: 16508317696
        reservations:
          memory: "268435456"
          devices: []
    devices:
      - /dev/sda:/dev/sda
      - /dev/sdb:/dev/sdb
      - /dev/nvme0:/dev/nvme0
      - /dev/md0:/dev/md0
      - /dev/mmcblk0:/dev/mmcblk0
    environment:
      - GLANCES_OPT=-C /glances/conf/glances.conf -w --enable-plugin smart
      - TZ=America/New_York
    image: nicolargo/glances:latest-full
    labels:
      icon: https://cdn.jsdelivr.net/gh/IceWhaleTech/CasaOS-AppStore@main/Apps/Glances/icon.png
    pid: host
    ports:
      - target: 61208
        published: "61208"
        protocol: tcp
      - target: 61209
        published: "61209"
        protocol: tcp
    restart: always
    volumes:
      - type: bind
        source: /var/run/docker.sock
        target: /var/run/docker.sock
      - type: bind
        source: /mnt
        target: /mnt
      - type: bind
        source: /etc/os-release
        target: /etc/os-release
      - type: bind
        source: /media/nvme0n1p1/AppData/glances/glances.conf
        target: /glances/conf/glances.conf
      - type: bind
        source: /media/Quick-Storage
        target: /media/Quick-Storage
      - type: bind
        source: /media/nvme0n1p1
        target: /media/nvme0n1p1
      - type: bind
        source: /media/ZimaOS-HD
        target: /media/ZimaOS-HD
    x-casaos:
      envs:
        - container: GLANCES_OPT
          description:
            en_us: Glances mode
            zh_cn: Glances模式
      ports:
        - container: "61208"
          description:
            en_us: WebUI HTTP Port
            zh_cn: WebUI HTTP端口
          protocol: tcp
        - container: "61209"
          description:
            en_us: Glances API port
            zh_cn: Glances API 端口
          protocol: tcp
      volumes:
        - container: /var/run/docker.sock
          description:
            en_us: Docker socket
            zh_cn: Docker socket
        - container: /mnt
          description:
            en_us: Drivers mount folder
            zh_cn: 驱动器挂载点
    network_mode: host
    privileged: false
x-casaos:
  architectures:
    - amd64
    - arm64
  author: joaobosconff
  category: Utility
  description:
    en_us: Glances is an open-source system cross-platform monitoring tool. It
      allows real-time monitoring of various aspects of your system such as CPU,
      memory, disk, network usage etc.
    pt_br: Glances é uma ferramenta de monitoramento de sistema de plataforma
      cruzada de código aberto. Ele permite o monitoramento em tempo real de
      vários aspectos do seu sistema, como CPU, memória, disco, uso da rede,
      etc.
    zh_cn: Glances 是一个开源的跨平台系统监控工具。它允许实时监控系统的各个方面，如 CPU、内存、磁盘、网络使用情况等。
  developer: Nicolas Hennion
  hostname: ""
  icon: https://cdn.jsdelivr.net/gh/IceWhaleTech/CasaOS-AppStore@main/Apps/Glances/icon.png
  index: /
  is_uncontrolled: true
  main: glances
  port_map: "61208"
  scheme: http
  screenshot_link:
    - https://cdn.jsdelivr.net/gh/IceWhaleTech/CasaOS-AppStore@main/Apps/Glances/screenshot-1.png
  store_app_id: glances
  tagline:
    en_us: Cross-platform monitoring tool.
    pt_br: Ferramenta de monitoramento multiplataforma.
    zh_cn: 跨平台监控工具
  title:
    custom: ""
    en_us: Glances
    pt_br: Glances
    zh_cn: Glances
```
