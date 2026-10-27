---
icon: services/homebox
title: Homebox
subtitle: Inventory Management
description: Homebox is the inventory and organization system built for the home user! With a focus on simplicity and ease of use, Homebox is the perfect solution for your home inventory, organization, and management needs.
tags:
  - Active
  - Container
  - Inventory
  - New
  - Service
hide:
  - toc
---

![Homebox Logo](../assets/icons/homebox-light.svg#only-light){ width=200 }
![Homebox Logo](../assets/icons/homebox-dark.svg#only-dark){ width=200 }

# Homebox

_Inventory Management_

[GitHub&ensp;:brands-github:](https://github.com/sysadminsmedia/homebox){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-file-text:](https://homebox.software/en/quick-start/){ .md-button .md-button--primary }

---

![Homebox homepage](../assets/screenshots/homebox-home-light.png#only-light){ width=400 align=right .on-glb }
![Homebox homepage](../assets/screenshots/homebox-home-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

**Description**

:    Homebox is the inventory and organization system built for the home user! With a focus on simplicity and ease of use, Homebox is the perfect solution for your home inventory, organization, and management needs.

**Port(s)** 

:    `3100`

**URL / Access**

- <http://storage-server.internal:3100>
{ .no-bullets }
- <http://storage-server-2.internal:3100>
{ .no-bullets }
- <https://homebox.rac3r4life.online>
{ .no-bullets }

**Credentials**

-   [:services-authentik:&ensp;Authentik OAuth](https://auth.rac3r4life.online){ external-link }
{ .no-bullets }
-   [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Homebox"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                                   | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :-------------------------------------- | :------ |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `homebox`      | `ghcr.io/sysadminsmedia/homebox:latest` | `3100`  |

---

## :symbols-settings:&ensp;Configuration

--8<-- "includes/managed_by_dockge.md"

### :symbols-folder-git-2:&ensp;Data Directories

| Contents            | Path                                                          |
| :------------------ | :------------------------------------------------------------ |
| Docker Compose File | `/media/nvme0n1p1/AppData/dockge/stacks/homebox/compose.yaml` |
| Application Data    | `/media/nvme0n1p1/AppData/homebox-data/`                      |

### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="../AppData/dockge/stacks/homebox/compose.yaml" hl_lines="15 19 20" }
--8<-- "includes/code/yaml/homebox.yml"
```

1.  Please consider allowing analytics to help us improve Homebox _(basic computer information, no personal data)_.
2.  Use a strong random string for the pepper in production, it will be used to hash API keys and make them more secure.

    To generate a random string use the following command:

    ``` bash linenums="1"
    openssl rand -base64 48
    ```
