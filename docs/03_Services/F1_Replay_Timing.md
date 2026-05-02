---
icon: services/f1-replay-timing
tags:
  - Active
  - Service
  - Software
  - Docker
hide:
  - toc
---
![F1 Replay Timing Icon](../assets/icons/f1-replay-timing-light.svg#only-light){ width=200 }
![F1 Replay Timing Icon](../assets/icons/f1-replay-timing-dark.svg#only-dark){ width=200 }

# F1 Replay Timing
[GitHub :material-github:](https://github.com/adn8naiagent/F1ReplayTiming){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/adn8naiagent/F1ReplayTiming/issues){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Visualization of real-time track data and telemetry synced to F1 live and replays.

#### :symbols-settings-ethernet: Port(s):  
+ `3000`
+ `8000`

#### :material-link-variant: URL / Access: 
+ Backend: 
    + <http://storage-server.internal:8000>
+ Frontend: 
    + <http://storage-server.internal:3000>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                                                 |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :---------------------------------------------------- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `f1-backend`   | `ghcr.io/adn8naiagent/f1replaytiming-backend:latest`  |
|                                                                     |                                       | `f1-frontend`  | `ghcr.io/adn8naiagent/f1replaytiming-frontend:latest` |

### :material-cog: Configuration 

```yaml title="compose.yml" linenums="1"
--8<-- "f1-replay-timing.yaml"
```

1. Do **NOT** use `0.0.0.0`, `127.0.0.1` or `localhost`. The application running in the client Web browser will think the backend / frontend is being hosted on the local machine. Use the IP address or URL of the host server. 
2. Do **NOT** use `0.0.0.0`, `127.0.0.1` or `localhost`. The application running in the client Web browser will think the backend / frontend is being hosted on the local machine. Use the IP address or URL of the host server. 