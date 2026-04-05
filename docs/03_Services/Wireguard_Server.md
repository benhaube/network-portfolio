---
tags:
  - active
  - service
  - software
  - docker
  - remote-access
  - vpn
  - network
hide:
  - toc
---
![[wireguard-rounded-square.svg|200]]

# [[WireGuard_Server|WireGuard Server]]
[GitHub :material-github:](https://github.com/wg-easy/wg-easy){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://wg-easy.github.io/wg-easy/latest/){ .md-button }

---
## :material-information-outline: Overview
* **Purpose:** A lightweight, secure remote access VPN server.
* **Port(s):** 
    * `41820`
    * `51820`
    * `51821` *(for [configuration WebUI](http://storage-server.internal:51821) on [[ZimaBoard_2_NAS|ZimaBoard 2 NAS]])*
* **URL / Access:** 
    * :material-vpn:&nbsp;Server Endpoint:
        * `remote-access-home-34.asuscomm.com:41820` *(for [[ASUS_RT-BE92U|ASUS RT-BE92U]])*
        * `remote-access-home-34.asuscomm.com:51820` *(for [[ZimaBoard_2_NAS|ZimaBoard 2 NAS]])*
    * :material-application-cog:&nbsp;Web UI Admin 
        * <http://storage-server.internal:51821/>
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): "WireGuard WebUI"
* **Clients:**
    * `ben-laptop`
    * `ben-pixel`

## :material-package-down: Deployment Details 
* **Host Device:** 
    * :material-router-wireless:&nbsp;[[ASUS_RT-BE92U|ASUS RT-BE92U]]
    * :services-zimaos:&nbsp;[[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]
* **Method:** 
    * :simple-linux:&nbsp;Native *(for [[ASUS_RT-BE92U|ASUS RT-BE92U]])*
    * :simple-docker:&nbsp;Docker Compose *(for [[ZimaBoard_2_NAS|ZimaBoard 2 NAS]])*
* **Container Name:** `big-bear-wg-easy-v15`
* **Image:** `ghcr.io/wg-easy/wg-easy:15`

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
name: big-bear-wg-easy-v15
services:
  big-bear-wg-easy-v15:
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    cpu_shares: 90
    command: []
    container_name: big-bear-wg-easy-v15
    deploy:
      resources:
        limits:
          memory: 16508321792
        reservations:
          devices: []
    environment:
      - INIT_DNS=9.9.9.9,149.112.112.112
      - INIT_ENABLED=true
      - INIT_HOST=https://remote-access-home-34.asuscomm.com
      - INIT_IPV4_CIDR=10.8.0.0/24
      - INIT_IPV6_CIDR=fd42:42:42::/64
      - INIT_PASSWORD=nsuq3BHmzq$$$$!3488
      - INIT_PORT=51820
      - INIT_USERNAME=admin
      - INSECURE=true
    image: ghcr.io/wg-easy/wg-easy:15
    labels:
      icon: https://cdn.jsdelivr.net/gh/bigbeartechworld/big-bear-universal-apps/apps/wg-easy-v15/logo.png
    ports:
      - mode: ingress
        target: 51820
        published: "51820"
        protocol: udp
      - mode: ingress
        target: 51821
        published: "51821"
        protocol: tcp
    restart: unless-stopped
    sysctls:
      net.ipv4.conf.all.src_valid_mark: "1"
      net.ipv4.ip_forward: "1"
      net.ipv6.conf.all.disable_ipv6: "0"
      net.ipv6.conf.all.forwarding: "1"
      net.ipv6.conf.default.forwarding: "1"
    volumes:
      - type: bind
        source: /DATA/AppData/big-bear-wg-easy-v15/data
        target: /etc/wireguard
        bind:
          create_host_path: true
    devices: []
    networks:
      - big-bear-wg-easy-v15
    privileged: false
networks:
  big-bear-wg-easy-v15:
    name: big-bear-wg-easy-v15
x-casaos:
  architectures:
    - amd64
    - arm64
  author: BigBearTechWorld
  category: BigBearCasaOS
  description:
    en_us: "WireGuard Easy v15 - Complete rewrite with new features and improved UI.
      Access your homeserver from anywhere with this modern VPN solution. NOTE:
      This is v15 which has breaking changes from v14. If you're currently using
      v14, please backup your configuration before migrating."
  developer: WeeJeWel
  hostname: ""
  icon: https://cdn.jsdelivr.net/gh/bigbeartechworld/big-bear-universal-apps/apps/wg-easy-v15/logo.png
  index: /
  is_uncontrolled: false
  main: big-bear-wg-easy-v15
  port_map: "51821"
  scheme: http
  store_app_id: big-bear-wg-easy-v15
  tagline:
    en_us: WireGuard VPN server v15 (New Version)
  thumbnail: ""
  tips:
    before_install:
      en_us: "Read this before installing:
        https://community.bigbeartechworld.com/t/added-wg-easy-v15-to-bigbearca\
        saos/5071#p-7701-why-a-new-version-4"
  title:
    custom: ""
    en_us: WireGuard Easy v15
```
