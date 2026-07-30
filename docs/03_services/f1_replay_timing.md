---
icon: services/f1-replay-timing
title: F1 Replay Timing
subtitle: All of the Data
description: Visualization of real-time track data and telemetry synced to F1 live and replays.
tags:
  - Active
  - Container
  - Service
hide:
  - toc
---
![F1 Replay Timing Icon](../assets/icons/f1-replay-timing-light.svg#only-light){ width=200 }
![F1 Replay Timing Icon](../assets/icons/f1-replay-timing-dark.svg#only-dark){ width=200 }

# F1 Replay Timing
*All of the Data*

[GitHub&ensp;:brands-github:](https://github.com/adn8naiagent/F1ReplayTiming){ .md-button .md-button--primary }&emsp;[Issues&ensp;:symbols-circle-dot-dashed:](https://github.com/adn8naiagent/F1ReplayTiming/issues){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Visualization of real-time track data and telemetry synced to F1 live and replays.

#### :symbols-hash:&ensp;Port(s)

:    `3000`&emsp;`8000`

#### :symbols-link-2:&ensp;URL / Access 

:    Backend: 
    
      + <http://storage-server.internal:8000>

:    Frontend: 
    
      + <http://storage-server.internal:3000>
      + <http://storage-server-2.internal:3000>

#### :symbols-user-key:&ensp;Credentials 

:    N/A

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                                                 |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :---------------------------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `f1-backend`   | `ghcr.io/adn8naiagent/f1replaytiming-backend:latest`  |
|                                                                      |                                           | `f1-frontend`  | `ghcr.io/adn8naiagent/f1replaytiming-frontend:latest` |

### :symbols-settings:&ensp;Configuration 

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "f1-replay-timing.yaml"
```

1.    :symbols-triangle-alert:&nbsp;**Warning!**

      + Do **NOT** use `0.0.0.0`, `127.0.0.1` or `localhost`. The application running in the client Web browser will think the backend / frontend is being hosted on the local machine. 
      + Use the IP address or URL of the host server. 

2.    :symbols-triangle-alert:&nbsp;**Warning!**

      + Do **NOT** use `0.0.0.0`, `127.0.0.1` or `localhost`. The application running in the client Web browser will think the backend / frontend is being hosted on the local machine. 
      + Use the IP address or URL of the host server. 