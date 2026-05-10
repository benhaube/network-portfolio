---
icon: services/gitea
status: new
title: Gitea
tags:
  - Active
  - Service
  - Software
  - Docker
  - Tools
  - File Share
  - Development
hide:
  - toc
---
![Gitea Logo](../assets/icons/gitea.svg){ width=200 }

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
+ <http://storage-server.internal:3080>
+ SSH: <git@storage-server.internal>

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

```yaml title="<code>compose.yml</code>" linenums="1"
networks:
  gitea:
    external: false

services:
  server:
    image: docker.gitea.com/gitea:latest
    container_name: gitea
    environment:
      - USER_UID=1000
      - USER_GID=1000
    restart: always
    networks:
      - gitea
    volumes:
      - ./gitea:/data
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
    ports:
      - "3080:3000"
      - "222:22"
```