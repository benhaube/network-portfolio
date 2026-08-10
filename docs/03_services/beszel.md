---
icon: services/beszel
title: Beszel
subtitle: Server Monitoring
description: A lightweight server monitoring hub with historical data, docker stats, and alerts.
tags:
  - Active
  - Container
  - Infrastructure
  - Monitor
  - Service
hide:
  - toc
---

![Beszel Logo](../assets/icons/beszel.svg){ width=200 }

# Beszel

_Server Monitoring_

[GitHub&ensp;:brands-github:](https://github.com/henrygd/beszel){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://beszel.dev/guide/what-is-beszel){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A lightweight server monitoring hub with historical data, docker stats, and alerts. Includes the **"Hub"** container _(the main server)_ and **"Agent"** containers for connecting other servers to the hub.

#### :symbols-hash:&ensp;Port(s)

- Hub:&ensp;`8090`
{ .no-bullets }
- Agent:&ensp;`45867`
{ .no-bullets }

#### :symbols-link-2:&ensp;URL / Access  

:    <http://pi-server.internal:8090/>

#### :symbols-user-key:&ensp;Credentials

- [:brands-github:&ensp;GitHub OAuth](https://github.com/settings/developers){ external-link }
{ .no-bullets }
- [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Beszel Hub"
- 2FA / MFA
{ .no-bullets }
    - :symbols-clock:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

##### Hub

| Host Device                                                          | Method                                    | Container Name | Image                  |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :--------------------- |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `beszel-hub`   | `henrygd/beszel`       |
|                                                                      | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent` |

##### Agents

| Host Device                                                                    | Method                                    | Container Name | Image                        |
| :----------------------------------------------------------------------------- | :---------------------------------------- | :------------- | :--------------------------- |
| [:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md)         | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent`       |
| [:symbols-server:&nbsp;Pi Zero 2W Server](../02_hardware/pi_zero_2w_server.md) | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent`       |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)           | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent-intel` |

### :symbols-settings:&ensp;Configuration

#### :symbols-key-round:&ensp;Generate API Tokens

:    Run the following command in a terminal on a client machine to generate API tokens.

    ``` bash linenums="1"
    curl -X POST "http://pi-server.internal:8090/api/collections/users/auth-with-password" \
      -H "Content-Type: application/json" \
      -d '{"identity":"user@example.com","password":"your-password"}'  # (1)!
    ```

    1. Replace **"user@example.com"** with your user's email address, and **"your-password"** with your user's password.

#### :symbols-file-code-corner:&ensp;Docker Compose Files

--8<-- "deploy_with_dockge.md"

##### Pi 4B Server _(Hub)_

``` yaml { .mono-title title="/opt/stacks/beszel/docker-compose.yml" linenums="1" }
--8<-- "beszel-pi-4b.yaml"
```

1. Monitor other **disks / partitions** by mounting a folder in `/extra-filesystems`.

##### Debian Server

``` yaml { .mono-title title="/opt/stacks/beszel-agent/docker-compose.yml" linenums="1" }
--8<-- "beszel-debian-vm.yaml"
```

1. Monitor other **disks / partitions** by mounting a folder in `/extra-filesystems`.

##### Pi Zero 2W Server

``` yaml { .mono-title title="/opt/stacks/beszel-agent/compose.yaml" linenums="1" }
--8<-- "beszel-pi-zero.yaml"
```

1. Monitor other **disks / partitions** by mounting a folder in `/extra-filesystems`.

##### ZimaOS NAS

``` yaml { .mono-title title="../AppData/dockge/stacks/beszel-agent/compose.yaml" linenums="1" }
--8<-- "beszel-zima.yaml"
```