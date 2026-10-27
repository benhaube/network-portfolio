---
icon: services/authentik
title: Authentik
subtitle: SSO Identity Provider
description: An open-source Identity Provider (IdP) for modern SSO. It supports SAML, OAuth2 / OIDC, LDAP, RADIUS, and more, designed for self-hosting from small labs to large production clusters.
status: new
tags:
  - Active
  - Container
  - Infrastructure
  - New
  - Security
  - Service
hide:
  - toc
---

![Authentik logo](../assets/icons/authentik-pride.png){ width=200 .no-shadow }

# Authentik

_SSO Identity Provider_

[GitHub&ensp;:brands-github:](https://github.com/goauthentik/authentik){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.goauthentik.io/){ .md-button .md-button--primary }

---

![Screenshot of the Authentik login page](../assets/screenshots/authentik-login-light.png#only-light){ width=400 align=right .on-glb }
![Screenshot of the Authentik login page](../assets/screenshots/authentik-login-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

**Description**

:    An open-source Identity Provider for modern SSO. It supports SAML, OAuth2 / OIDC, LDAP, RADIUS, and more, designed for self-hosting from small labs to large production clusters.

**Port(s)**

- `9000` &ndash; _HTTP_
{ .no-bullets }
- `9443` &ndash; _HTTPS_
{ .no-bullets }

**URL / Access**

- <http://storage-server.internal:9000>
{ .no-bullets }
- <https://storage-server.internal:9443>
{ .no-bullets }
- <https://auth.rac3r4life.online>
{ .no-bullets }

**Credentials**

-   [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Authentik (admin)"
    - Local Network&ensp;:symbols-move-right:&ensp;"Authentik (bhaube)"
    - Local Network&ensp;:symbols-move-right:&ensp;"Authentik (rpereira)"
-   2FA / MFA
{ .no-bullets }
    - :symbols-clock-key:&ensp;TOTP
    - :symbols-key-fido2:&ensp;FIDO2 / WebAuthen

**Applications**

- [:services-beszel:&ensp;Beszel](beszel.md#overview){ data-preview }
{ .no-bullets }
- [:services-cloudflare-zero-trust:&ensp;Cloudflare](cloudflared.md#overview){ data-preview }
{ .no-bullets }
- [:services-gitea:&ensp;Gitea](gitea.md#overview){ data-preview }
{ .no-bullets }
- [:services-glance:&ensp;Glance](glance.md#overview){ data-preview }
{ .no-bullets }
- [:services-gotify-notification:&ensp;Gotify](gotify.md#overview){ data-preview }
{ .no-bullets }
- [:services-homebox:&ensp;Homebox](homebox.md#overview){ data-preview }
{ .no-bullets }
- [:services-immich:&ensp;Immich](immich.md#overview){ data-preview }
{ .no-bullets }
- [:services-technitium:&ensp;Technitium](technitium.md#overview){ data-preview }
{ .no-bullets }

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name           | Image                                  | Port(s)       |
| :------------------------------------------------------------------- | :---------------------------------------- | :----------------------- | :------------------------------------- | :------------ |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `authentik-server-1`     | `ghcr.io/goauthentik/server`           | `9000` `9443` |
|                                                                      | :symbols-container:&nbsp;Docker Container | `authentik-worker-1`     | `ghcr.io/goauthentik/server`           | `-`           |
|                                                                      | :symbols-container:&nbsp;Docker Container | `authentik-postgresql-1` | `docker.io/library/postgres:16-alpine` | `-`           |

---

## :symbols-settings:&ensp;Configuration

--8<-- "includes/managed_by_dockge.md"

### :symbols-key-round:&ensp;Generate New Secrets

If this is a fresh Authentik installation, generate a PostgreSQL password and an authentik secret key. Use a secure password generator of your choice such as `pwgen`, or use `openssl` as shown below.

1.  Run the following command to generate a new PostgreSQL password:

    ``` bash
    openssl rand -base64 36 | tr -d '\n'
    ```

2.  Run the following command to generate a new secret key:

    ``` bash
    openssl rand -base64 60 | tr -d '\n'
    ```

3.  Write both values into the `.env` file.

### :symbols-folder-git-2:&ensp;Data Directories

| Contents              | Path                                                                   |
| :-------------------- | :--------------------------------------------------------------------- |
| Docker Compose File   | `/media/nvme0n1p1/AppData/dockge/stacks/authentik/docker-compose.yaml` |
| Environment Variables | `/media/nvme0n1p1/AppData/dockge/stacks/authentik/.env`                |
| Application Data      | `/media/nvme0n1p1/AppData/dockge/stacks/authentik/data`                |
| Custom Templates      | `/media/nvme0n1p1/AppData/dockge/stacks/authentik/custom-templates`    |
| TLS Certificates      | `/media/nvme0n1p1/AppData/dockge/stacks/authentik/certs`               |
| Postgres Database     | `database` _(Docker volume)_                                           |

### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="../AppData/dockge/stacks/authentik/docker-compose.yaml" }
--8<-- "includes/code/yaml/authentik.yaml"
```

### :symbols-file-type-corner:&ensp;Environment Variables File

``` properties { .mono-title title="../AppData/dockge/stacks/authentik/.env" hl_lines="3 9 10 15" }
--8<-- "includes/code/config/authentik.env"
```
