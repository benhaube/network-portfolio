---
icon: services/gitea
status: new
title: Gitea
subtitle: Git with a Cup of Tea
description: Painless, self-hosted, all-in-one software development service. Including Git hosting, code review, team collaboration, package registry and CI/CD.
tags:
  - Active
  - Backup
  - Container
  - Development
  - File Share
  - New
  - Service
hide:
  - toc
---

![Gitea Logo](../assets/icons/gitea.svg){ width=225 }

# Gitea

_Git with a Cup of Tea_

[GitHub&ensp;:brands-github:](https://github.com/go-gitea/gitea){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.gitea.com/){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Painless, self-hosted, all-in-one software development service. Including Git hosting, code review, team collaboration, package registry and CI/CD.

#### :symbols-hash:&ensp;Port(s)

:    `3080`&emsp;`222`

#### :symbols-link-2:&ensp;URL / Access 

:    Web-UI:

    - <http://storage-server.internal:3080>
    - <http://storage-server-2.internal:3080>

:    SSH:

    - `git@storage-server.internal:222`

#### :symbols-user-key:&ensp;Credentials

:    [:brands-gitlab:&ensp;GitLab OAuth](https://gitlab.com/-/user_settings/applications){ external-link }

:    [:brands-github:&ensp;GitHub OAuth](https://github.com/settings/developers){ external-link }

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }:

    - Local Network&ensp;:symbols-move-right:&ensp;"Gitea (admin)"
      - Local Network&ensp;:symbols-move-right:&ensp;"Gitea (benhaube)"
      - SSH Keys&ensp;:symbols-move-right:&ensp;"Gitea"

:    2FA / MFA:

    - :symbols-key-fido2:&ensp;FIDO2 / WebAuthn
      - :symbols-clock:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                           |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------ |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `gitea`        | `docker.gitea.com/gitea:latest` |
|                                                                      | :symbols-container:&nbsp;Docker Container | `gitea_runner` | `gitea/act_runner:latest`       |

### :symbols-settings:&ensp;Configuration

#### :symbols-folder-git-2:&ensp;Data Directories

:   The data for the `gitea` container is stored in the `dockge/stacks` directory, and is owned by `root:root`.

##### Gitea App Data

:    `/media/nvme0n1p1/AppData/dockge/stacks/gitea/data`

##### Repo Data

:    `/media/nvme0n1p1/AppData/dockge/stacks/gitea/data/git/repositories`

##### SSH Data

:    `/media/nvme0n1p1/AppData/dockge/stacks/gitea/data/ssh`

##### Runner Data

:    `/media/nvme0n1p1/AppData/dockge/stacks/gitea/runner-data`

#### :symbols-file-cog:&ensp;Config File

``` ini { .mono-title title="../data/gitea/conf/app.ini" linenums="1" }
--8<-- "gitea_app.ini"
```

#### :symbols-file-code-corner:&ensp;Docker Compose File

--8<-- "deploy_with_dockge.md"

``` yaml { .mono-title title="../AppData/dockge/stacks/gitea/compose.yaml" linenums="1" }
--8<-- "gitea.yml"
```