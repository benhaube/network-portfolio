---
icon: services/gitea
status: new
title: Gitea
tags:
  - Active
  - Backup
  - Service
  - Software
  - Docker
  - Tools
  - File Share
  - Development
  - New
hide:
  - toc
---
![Gitea Logo](../assets/icons/gitea.svg){ width=225 }

# Gitea
[GitHub :material-github:](https://github.com/go-gitea/gitea){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.gitea.com/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Painless, self-hosted, all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD.
 
#### :symbols-settings-ethernet: Port(s): 
+ `3080`
+ `222`

#### :material-link-variant: URL / Access: 
+ Web-UI:
    + <http://storage-server.internal:3080>
+ SSH: 
    + `git@storage-server.internal`

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Gitea (admin)"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Gitea (benhaube)"
    + SSH Keys&ensp;:material-arrow-right-thin:&ensp;"Gitea"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                           |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :------------------------------ |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `gitea`        | `docker.gitea.com/gitea:latest` |

### :material-cog: Configuration 

> [!note]
> **Deployed with Dockge:**
> :    This service is deployed and managed by [Dockge](./Dockge.md). To pull updated images, start the service, stop the service, modify the environment variables, and modify the `compose.yml` file, visit the [Dockge Web-UI](http://pi-server.internal:5001). Alternatively, SSH into the ZimaOS NAS and edit the `compose.yml` and `.env` files directly. 
>
> **Data Directory:**
> :    The data for the `gitea` container is stored in the `dockge/stacks` directory, and is owned by `root:root`. 
>     + `/media/nvme0n1p1/AppData/dockge/stacks/gitea/gitea`

```yaml title="<code>compose.yml</code>" linenums="1"
--8<-- "gitea.yml"
```