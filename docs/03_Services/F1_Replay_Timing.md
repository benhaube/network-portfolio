---
icon: simple/f1
tags:
  - active
  - service
  - software
  - docker
hide:
  - toc
---
![F1 Replay Timing Icon](../assets/icons/f1-replay-timing-light.svg#only-light){ width=200 }
![F1 Replay Timing Icon](../assets/icons/f1-replay-timing-dark.svg#only-dark){ width=200 }

# F1 Replay Timing
[GitHub :material-github:](https://github.com/adn8naiagent/F1ReplayTiming){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/adn8naiagent/F1ReplayTiming/issues){ .md-button }

---
## :material-information-outline: Overview

#### :material-comment-eye-outline: Description: 
+ Visualization of real-time track data and telemetry synced to F1 live and replays.

#### :symbols-settings-ethernet: Port(s):  
+ `3000`
+ `8000`

#### :material-protocol: URL / Access: 
+ Backend: 
    + <http://storage-server.internal:8000>
+ Frontend: 
    + <http://storage-server.internal:3000>

#### :material-key-chain: Credentials: 
+ N/A

## :material-package-down: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `f1-backend` | `ghcr.io/adn8naiagent/f1replaytiming-backend:latest` |
|  |  | `f1-backend` | `ghcr.io/adn8naiagent/f1replaytiming-backend:latest` |

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
services:
  backend:
    image: ghcr.io/adn8naiagent/f1replaytiming-backend:latest
    container_name: f1-backend
    ports:
      - "8000:8000"
    environment:
      - FRONTEND_URL=http://storage-server.internal:3000 # (1)!
      - DATA_DIR=/data
    volumes:
      - /media/nvme0n1p1/AppData/f1-replay-timing/f1data:/data
      - /media/nvme0n1p1/AppData/f1-replay-timing/f1cache:/data/fastf1-cache
    networks:
      - host

  frontend:
    image: ghcr.io/adn8naiagent/f1replaytiming-frontend:latest
    container_name: f1_frontend
    ports:
      - "3000:3000"
    environment:
      - NEXT_PUBLIC_API_URL=http://storage-server.internal:8000 # (2)!
    depends_on:
      - backend
    networks:
      - host

networks:
  - host

volumes:
  f1data:
  f1cache:
```

1. Do *NOT* use `127.0.0.1` or `localhost`. The application running in the client Web browser will think the backend / frontend is being hosted on the local machine. Use the IP address or URL of the host server. 

2. Do *NOT* use `127.0.0.1` or `localhost`. The application running in the client Web browser will think the backend / frontend is being hosted on the local machine. Use the IP address or URL of the host server. 