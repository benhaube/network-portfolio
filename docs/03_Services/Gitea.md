---
icon: services/gitea
status: new
title: Gitea
subtitle: Git with a Cup of Tea
description: Painless, self-hosted, all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD.
tags:
  - Active
  - Backup
  - Docker
  - File Share
  - Development
  - New
  - Service
hide:
  - toc
---
![Gitea Logo](../assets/icons/gitea.svg){ width=225 }

# Gitea
*Git with a Cup of Tea*

[GitHub&ensp;:simple-github:](https://github.com/go-gitea/gitea){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://docs.gitea.com/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Painless, self-hosted, all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD.
 
#### :symbols-settings-ethernet:&ensp;Port(s)

+ `3080`
+ `222`

#### :symbols-link:&ensp;URL / Access

+ Web-UI:
    + <http://storage-server.internal:3080>
    + <http://storage-server-2.internal:3080>
+ SSH: 
    + `git@storage-server.internal`

#### :symbols-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Gitea (admin)"
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Gitea (benhaube)"
    + SSH Keys&ensp;:symbols-arrow-right-thin:&ensp;"Gitea"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                | Method                                | Container Name | Image                           |
| :------------------------------------------------------------------------- | :------------------------------------ | :------------- | :------------------------------ |
| [:symbols-nas-outline:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :services-docker:&nbsp;Docker Compose | `gitea`        | `docker.gitea.com/gitea:latest` |
|                                                                            | :services-docker:&nbsp;Docker Compose | `gitea_runner` | `gitea/act_runner:latest`       |

### :symbols-settings:&ensp;Configuration 

!!! note

    :services-dockge:&ensp;**Deployed with Dockge:**
    :    This service is deployed and managed by [Dockge](./Dockge.md). To pull updated images, start the service, stop the service, modify the environment variables, and modify the `compose.yml` file, visit the [Dockge Web-UI](http://pi-server.internal:5001). Alternatively, SSH into the ZimaOS NAS and edit the `compose.yml` and `.env` files directly. 

    :symbols-folder-data:&ensp;**Data Directory:**
    :    The data for the `gitea` container is stored in the `dockge/stacks` directory, and is owned by `root:root`. 
    
        + `/media/nvme0n1p1/AppData/dockge/stacks/gitea/gitea`

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "gitea.yml"
```