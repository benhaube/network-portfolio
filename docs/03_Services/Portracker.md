---
icon: services/portracker
tags:
  - Active
  - Service
  - Software
  - Docker
  - Monitor
  - Network
  - Infrastructure
hide:
  - toc
---
![Portracker Icon](../assets/icons/portracker-light.svg#only-light){ width=200 }
![Portracker Icon](../assets/icons/portracker-dark.svg#only-dark){ width=200 }

# Portracker
[GitHub :material-github:](https://github.com/mostafa-wahied/portracker){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A self-hosted, real-time port monitoring and discovery tool.

#### :symbols-settings-ethernet: Port(s):
+ `4999`

#### :material-link-variant: URL / Access:  
+ <http://192.168.50.4:4999>
+ <http://storage-server.internal:4999>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `portracker` | `mostafawahied/portracker:latest` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `portracker` | `mostafawahied/portracker:latest` |
| :material-raspberry-pi:&nbsp;~~[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md)~~ | :material-docker:&nbsp;Docker Compose | `portracker` | `mostafawahied/portracker:latest` |

### :material-cog: Configuration  

#### :material-nas: ZimaOS NAS:

```yaml title="docker-compose.yml" linenums="1"
services:
  big-bear-portracker:
    cpu_shares: 90
    container_name: big-bear-portracker
    deploy:
      resources:
        limits:
          memory: 16508235776
        reservations:
    environment:
      - CACHE_TIMEOUT_MS=30000
      - DATABASE_PATH=/data/portracker.db
      - DEBUG=false
      - DISABLE_CACHE=false
      - INCLUDE_UDP=true
      - PORT=4999
      - TRUSTED_LOCAL_EMAIL=server@haube-pereira.com
    image: mostafawahied/portracker:latest
    labels:
      icon: data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xml%3Aspace%3D%22preserve%22%20viewBox%3D%220%200%20512%20512%22%3E%3Cpath%20d%3D%22M507.7%20312.8c-12.5%2054.7-43.1%20104.6-86.3%20140.4s-97.8%2056.7-153.9%2058.7h-.9c-12.5%200-22.8-9.9-23.3-22.4-.5-12.8%209.5-23.6%2022.4-24.1%2045.9-1.7%2090.6-18.8%20125.9-48.1C427%20388%20452%20347.2%20462.2%20302.4c2.8-12.5%2015.3-20.4%2027.9-17.6%2012.6%203%2020.5%2015.5%2017.6%2028M471%20231.7c4.5%204.2%2010.2%206.3%2015.9%206.3%206.2%200%2012.4-2.5%2017-7.4l.2-.2c8.8-9.4%208.2-24-1.2-32.8s-24.2-8.2-33%201.2-8.3%2024.2%201.1%2032.9M263.2%20418.9h.8c22.3-.8%2043.8-6%2064-15.5s37.9-22.8%2052.6-39.6c14.8-16.7%2025.7-35.9%2032.7-57.1%206.9-21.2%209.4-43.2%207.4-65.4s-8.4-43.4-19.1-63c-10.6-19.6-24.9-36.5-42.4-50.3s-37.3-23.7-58.9-29.4c-20.4-5.4-41.4-6.7-62.5-4-2.7-.3-5.5-.3-8.1.4-24.6%204-112.2%2026.8-142.4%20146.2-3.1%2012.5%204.4%2025.1%2016.9%2028.3%201.9.5%203.8.7%205.7.7%2010.4%200%2019.9-7%2022.6-17.6%2023.5-93.1%2086.3-109.2%20105.9-111.9%201%200%201.9.3%202.9.2%2015.8-2.3%2031.6-1.4%2046.9%202.7%2015.4%204.1%2029.6%2011.2%2042.1%2021%2012.5%209.9%2022.7%2022%2030.3%2035.9%207.6%2014%2012.2%2029.2%2013.6%2045%201.5%2015.9-.3%2031.6-5.3%2046.7s-12.8%2028.9-23.4%2040.8c-10.5%2011.9-23.1%2021.4-37.5%2028.2s-29.8%2010.5-45.7%2011.1c-12.8.4-22.9%2011.2-22.5%2024.1.6%2012.6%2010.9%2022.5%2023.4%2022.5m-62.8%2051.2c-.8%205.4-3.5%2010-7.2%2013.4-4.1%207.8-11.9%2012.6-20.4%2012.6-2.8%200-5.7-.5-8.5-1.6-37.3-14.6-71.1-38.2-97.7-68.1-26.7-29.9-46.2-66.2-56.4-105C0%20282.7-1%20241.5%207.4%20202.3S33.6%20126%2058.8%2094.8c25.2-31.1%2057.9-56.2%2094.5-72.6%2036.6-16.3%2077.1-24%20117.1-22S350%2013.7%20384.8%2033.6s64.8%2048.1%2086.9%2081.5c7.1%2010.7%204.1%2025.2-6.6%2032.2-10.7%207.1-25.2%204.1-32.2-6.6-18.1-27.4-42.6-50.5-71.1-66.7-28.5-16.3-60.8-25.7-93.6-27.3-32.7-1.7-65.9%204.6-95.8%2018s-56.7%2033.9-77.3%2059.4S59.9%20180%2053%20212s-6.1%2065.7%202.3%2097.5c8.4%2031.7%2024.3%2061.4%2046.1%2085.9%2016.1%2018%2035.3%2033.2%2056.5%2044.7l31.6-209.8c1.3-8.3%207-14.6%2014.2-17.6%201.1-1.3%201.9-2.8%203.1-4.1%2026.2-28.2%2070.5-29.9%2098.7-3.7%2013.7%2012.7%2021.6%2029.9%2022.3%2048.6.7%2018.6-5.9%2036.4-18.6%2050.1s-29.9%2021.6-48.6%2022.3c-.9%200-1.8.1-2.7.1-12.2%200-23.9-3.3-34.3-9.3zm40.4-229.8c-4.2%204.5-6.4%2010.5-6.2%2016.7s2.9%2012%207.4%2016.2c4.6%204.2%2010.3%206.4%2016.7%206.2%206.2-.2%2011.9-2.9%2016.2-7.4%204.2-4.6%206.4-10.5%206.2-16.7s-2.9-12-7.4-16.2c-9.4-8.8-24.2-8.2-32.9%201.2m-121.6%20110c2.2%200%204.5-.3%206.7-1l.2-.1c12.3-3.7%2019.2-16.6%2015.5-29-3.7-12.3-16.9-19.2-29.1-15.6-12.3%203.7-19.3%2016.7-15.6%2029%203.1%2010.2%2012.3%2016.7%2022.3%2016.7%22%20style%3D%22fill%3A%23fff%22%2F%3E%3C%2Fsvg%3E
    ports:
      - mode: ingress
        target: 4999
        published: "4999"
        protocol: tcp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/big-bear-portracker/data
        target: /data
        bind:
          create_host_path: true
      - type: bind
        source: /var/run/docker.sock
        target: /var/run/docker.sock
        bind:
          create_host_path: true
```

#### :material-raspberry-pi: Raspberry Pi 4B Server:

```yaml title="docker-compose.yml" linenums="1"
services:
  portracker:
    image: mostafawahied/portracker:latest
    container_name: portracker
    restart: unless-stopped
    pid: "host"  # (1)!
    # (2)!
    cap_add:
      - SYS_PTRACE  # (3)!
      - SYS_ADMIN  # (4)!
    security_opt:
      - apparmor:unconfined  # (5)!
    volumes:
      - ./portracker-data:/data  # (6)!
      - /var/run/docker.sock:/var/run/docker.sock:ro  # (7)!
    ports:
      - "4999:4999"
    # environment:
      # - TRUENAS_API_KEY=your-api-key-here  (8)
```

1. Required for port detection.
2. Required permissions for system ports service namespace access.
3. **Linux hosts:** read other PIDs' `/proc` entries.
4. **Docker Desktop:** allow namespace access for host ports *(required for MacOS)*.
5. Required for system ports.
6. Required for data persistence.
7. Required for discovering services running in Docker.
8. **Optional:** For enhanced TrueNAS features

#### :material-raspberry-pi: ~~Raspberry Pi Zero Server:~~

```yaml title="docker-compose.yml" linenums="1"
services:
  portracker:
    image: mostafawahied/portracker:latest
    container_name: portracker
    restart: unless-stopped
    pid: "host"  # (1)!
    # (2)!
    cap_add:
      - SYS_PTRACE  # (3)!
      - SYS_ADMIN  #(4)!
    security_opt:
      - apparmor:unconfined  # (5)!
    volumes:
      - ./portracker-data:/data  # (6)!
      - /var/run/docker.sock:/var/run/docker.sock:ro  # (7)!
    ports:
      - "4999:4999"
    # environment:
      # - TRUENAS_API_KEY=your-api-key-here  (8)
```

1. Required for port detection.
2. Required permissions for system ports service namespace access.
3. **Linux hosts:** read other PIDs' `/proc` entries.
4. **Docker Desktop:** allow namespace access for host ports *(required for MacOS)*.
5. Required for system ports.
6. Required for data persistence.
7. Required for discovering services running in Docker.
8. **Optional:** For enhanced TrueNAS features
