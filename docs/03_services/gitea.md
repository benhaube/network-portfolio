---
icon: services/gitea
status: new
title: Gitea
subtitle: Git with a Cup of Tea
description: Painless, self-hosted, all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD.
tags:
  - Active
  - Backup
  - Container
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

[GitHub&ensp;:brands-github:](https://github.com/go-gitea/gitea){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.gitea.com/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Painless, self-hosted, all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD.
 
#### :symbols-settings-ethernet:&ensp;Port(s)

:    `3080`&emsp;`222`

#### :symbols-link:&ensp;URL / Access

:    Web-UI:
    
      + <http://storage-server.internal:3080>
      + <http://storage-server-2.internal:3080>

:    SSH: 
    
      + `git@storage-server.internal`

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"Gitea (admin)"
      + Local Network&ensp;:symbols-move-right:&ensp;"Gitea (benhaube)"
      + SSH Keys&ensp;:symbols-move-right:&ensp;"Gitea"

:    2FA / MFA:
    
      + :symbols-key-fido2:&nbsp;FIDO2 / WebAuthn
      + :symbols-clock:&nbsp;TOTP 

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                | Container Name | Image                           |
| :------------------------------------------------------------------- | :------------------------------------ | :------------- | :------------------------------ |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :services-docker:&nbsp;Docker Compose | `gitea`        | `docker.gitea.com/gitea:latest` |
|                                                                      | :services-docker:&nbsp;Docker Compose | `gitea_runner` | `gitea/act_runner:latest`       |

### :symbols-settings:&ensp;Configuration 

!!! note

    :services-dockge:&ensp;**Deployed with Dockge:**
    :    This service is deployed and managed by [Dockge](dockge.md). To pull updated images, start the service, stop the service, modify the environment variables, and modify the `compose.yml` file, visit the [Dockge Web-UI:symbols-external-link-small:](http://pi-server.internal:5001). Alternatively, SSH into the ZimaOS NAS and edit the `compose.yml` and `.env` files directly. 

    :symbols-folder-git-2:&ensp;**Data Directory:**
    :    The data for the `gitea` container is stored in the `dockge/stacks` directory, and is owned by `root:root`. 
    
        + `/media/nvme0n1p1/AppData/dockge/stacks/gitea/gitea`

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "gitea.yml"
```