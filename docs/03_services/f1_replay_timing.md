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

_All of the Data_

[GitHub&ensp;:brands-github:](https://github.com/adn8naiagent/F1ReplayTiming){ .md-button .md-button--primary }&emsp;[Issues&ensp;:symbols-circle-dot-dashed:](https://github.com/adn8naiagent/F1ReplayTiming/issues){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Visualization of real-time track data and telemetry synced to F1 live and replays.

#### :symbols-hash:&ensp;Port(s)

:    `8000`

#### :symbols-link-2:&ensp;URL / Access 

:    <http://storage-server.internal:8000>

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }:

    - Local Network&ensp;:symbols-move-right:&ensp;"F1 Replay Timing"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                                        |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `f1timing`     | `ghcr.io/adn8naiagent/f1replaytiming:latest` |

### :symbols-settings:&ensp;Configuration

--8<-- "deploy_with_dockge.md"

#### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="../AppData/dockge/stacks/f1-replay-timing/compose.yaml" linenums="1" }
--8<-- "f1-replay-timing.yaml"
```

#### :symbols-file-type-corner:&ensp;Environment Variables File

``` properties { .mono-title title="../AppData/dockge/stacks/f1-replay-timing/.env" linenums="1" }
--8<-- "f1-replay-timing.env"
```