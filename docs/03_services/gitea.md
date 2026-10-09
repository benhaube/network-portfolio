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

![Gitea Logo](../assets/icons/git.svg){ width=200 }

# Gitea

_Git with a Cup of Tea_

[GitHub&ensp;:brands-github:](https://github.com/go-gitea/gitea){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.gitea.com/){ .md-button .md-button--primary }

---

![Gitea homepage](../assets/screenshots/gitea-home-light.png#only-light){ width=400 align=right .on-glb }
![Gitea homepage](../assets/screenshots/gitea-home-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

: Painless, self-hosted, all-in-one software development service. Including Git hosting, code review, team collaboration, package registry and CI/CD.

#### :symbols-hash:&ensp;Port(s)

- `3080`
{ .no-bullets }
- `222`
{ .no-bullets }

#### :symbols-link-2:&ensp;URL / Access

-   Web-UI:
{ .no-bullets }
    - <http://storage-server.internal:3080>
    - <http://storage-server-2.internal:3080>
-   SSH:
{ .no-bullets }
    - `git@storage-server.internal:222`

#### :symbols-user-key:&ensp;Credentials

- [:brands-gitlab:&ensp;GitLab OAuth](https://gitlab.com/-/user_settings/applications){ external-link }
{ .no-bullets }
- [:brands-github:&ensp;GitHub OAuth](https://github.com/settings/developers){ external-link }
{ .no-bullets }
- [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Gitea (admin)"
    - Local Network&ensp;:symbols-move-right:&ensp;"Gitea (benhaube)"
    - SSH Keys&ensp;:symbols-move-right:&ensp;"Gitea"
- 2FA / MFA
{ .no-bullets }
    - :symbols-key-fido2:&ensp;FIDO2 / WebAuthn
    - :symbols-clock:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                           | Port(s)           |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------ | :---------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `gitea`        | `docker.gitea.com/gitea:latest` | `3080`&ensp;`222` |
|                                                                      | :symbols-container:&nbsp;Docker Container | `gitea_runner` | `gitea/act_runner:latest`       | `N/A`             |

### :symbols-settings:&ensp;Configuration

--8<-- "includes/managed_by_dockge.md"

#### :symbols-folder-git-2:&ensp;Data Directories

| Contents            | Path                                                                 |
| :------------------ | :------------------------------------------------------------------- |
| Docker Compose File | `/media/nvme0n1p1/AppData/dockge/stacks/gitea/compose.yaml`          |
| Gitea Config File   | `/media/nvme0n1p1/AppData/dockge/stacks/gitea/conf/app.ini`          |
| Gitea App Data      | `/media/nvme0n1p1/AppData/dockge/stacks/gitea/data`                  |
| Repository Data     | `/media/nvme0n1p1/AppData/dockge/stacks/gitea/data/git/repositories` |
| SSH Data            | `/media/nvme0n1p1/AppData/dockge/stacks/gitea/data/ssh`              |
| Runner Data         | `/media/nvme0n1p1/AppData/dockge/stacks/gitea/runner-data`           |

#### :symbols-file-cog:&ensp;Config File

``` ini { .mono-title title="../data/gitea/conf/app.ini" linenums="1" }
--8<-- "gitea_app.ini"
```

#### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="../AppData/dockge/stacks/gitea/compose.yaml" linenums="1" }
--8<-- "gitea.yml"
```

#### :symbols-svg:&ensp;Change Site Logo

To build a custom logo and / or favicon; clone the Gitea source repository, replace `assets/logo.svg` and / or `assets/favicon.svg` and run the command `make generate-images`. The file, `assets/favicon.svg`, is used for the favicon only. This will update the output files listed below which you can then place in `./public/assets/img` on your server.

| File                                       | Use Case                                             |
| :----------------------------------------- | :--------------------------------------------------- |
| `./public/assets/img/logo.svg`             | Site icon, app icon                                  |
| `./public/assets/img/logo.png`             | Open Graph                                           |
| `./public/assets/img/avatar_default.png`   | Default avatar image                                 |
| `./public/assets/img/apple-touch-icon.png` | Used on iOS devices for bookmarks                    |
| `./public/assets/img/favicon.svg`          | Favicon icon                                         |
| `./public/assets/img/favicon.png`          | Fallback favicon for browsers that don't support SVG |

#### :symbols-palette:&ensp;Gitea GitHub Theme

The built-in themes are `gitea-light`, `gitea-dark`, and `gitea-auto` _(which automatically adapts to OS settings)_. The default theme can be changed via `DEFAULT_THEME` in the `[ui]` section of `app.ini`. Gitea also has support for user themes, which means every user can select which theme should be used. The list of themes a user can choose from can be configured with the `THEMES` value in the `[ui]` section of `app.ini`.

[Gitea GitHub Theme&ensp;:brands-github:](https://github.com/lutinglt/gitea-github-theme){ .md-button }

##### Install Themes

1. Download the latest `theme-github.tar.gz` file from the "Releases" page.
2. Extract the CSS files, and place them in the `./public/assets/css/` directory on the server.
3. Add `<theme-name>` of your desired themes to the comma-separated list of setting `THEMES` in `app.ini`, or leave `THEMES` empty to allow all themes.

    ``` ini title="Example"
    --8<-- "gitea_app.ini:105:107"
    ```

#### :symbols-layout-template:&ensp;Gitea Mail Templates

The `./templates/mail` folder allows changing the body of every mail of Gitea. Templates to override can be found in the `templates/mail` directory of Gitea source. Override by making a copy of the file under `./templates/mail` using a full path structure matching source.

[Gitea Mail Templates&ensp;:brands-git:](https://gitea.kenanzhu.com/KenanZhu/GiteaMailTemplates){ .md-button }

##### Installation

1. **Choose a package** &ndash; Check your Gitea version with `gitea --version`, then select a template release from the [compatibility matrix](https://gitea.kenanzhu.com/KenanZhu/GiteaMailTemplates/src/branch/main/COMPATIBILITY.md#compatibility-matrix).
2. **Copy onto server** &ndash; Copy the chosen theme's `mail/` contents into `./templates/mail/`, then restart Gitea. 
3. **Confirm it works** &ndash; Trigger a notification that uses Gitea's mail templates, such as a password-reset email for a test account, and check its appearance and links. The administration test-email button does not use custom mail templates.