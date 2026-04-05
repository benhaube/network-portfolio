---
tags:
  - active
  - service
  - software
  - docker
hide:
  - toc
---
![[f1-replay-timing.svg|200]]

# [[F1_Replay_Timing|F1 Replay Timing]]
[GitHub :material-github:](https://github.com/adn8naiagent/F1ReplayTiming){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/adn8naiagent/F1ReplayTiming/issues){ .md-button }

---
## :material-information-outline: Overview
* **Purpose:** Visualization of real-time track data and telemetry synced to F1 live and replays.
* **Port(s):** 
    * `3000`
    * `8000`
* **URL / Access:** 
    * Backend: <http://storage-server.internal:8000>
    * Frontend: <http://storage-server.internal:3000>
* **Credentials:** N/A

## :material-package-down: Deployment Details
* **Host Device:** 
    * :services-zimaos:&nbsp;[[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]
* **Method:** &nbsp;:simple-docker:&nbsp;Docker Compose *(Stack)*
* **Container Names:** 
    * `f1-backend`
    * `f1-frontend`
* **Images:** 
    * `ghcr.io/adn8naiagent/f1replaytiming-backend:latest`
    * `ghcr.io/adn8naiagent/f1replaytiming-frontend:latest`

### :material-cog: Configuration 

```yaml title="docker-compose.yml" linenums="1"
services:
  backend:
    image: ghcr.io/adn8naiagent/f1replaytiming-backend:latest
    container_name: f1-backend
    ports:
      - "8000:8000"
    environment:
      - FRONTEND_URL=http://storage-server.internal:3000
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
      - NEXT_PUBLIC_API_URL=http://storage-server.internal:8000
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
