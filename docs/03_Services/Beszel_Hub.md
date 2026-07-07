---
icon: services/beszel
title: Beszel
subtitle: Server Monitoring
description: A lightweight server monitoring hub with historical data, docker stats, and alerts. Includes the **"Hub"** container *(the main server)* and **"Agent"** containers for connecting other servers to the hub.
tags:
  - Active
  - Docker
  - Monitor
  - Infrastructure
  - Service
hide:
  - toc
---
![Beszel Logo](../assets/icons/beszel.svg){ width=200 }

# Beszel
*Server Monitoring*

[GitHub&ensp;:simple-github:](https://github.com/henrygd/beszel){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://beszel.dev/guide/what-is-beszel){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    A lightweight server monitoring hub with historical data, docker stats, and alerts. Includes the **"Hub"** container *(the main server)* and **"Agent"** containers for connecting other servers to the hub.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ Hub:
    + `8090`
+ Agent:
    + `45867` 

#### :symbols-link:&ensp;URL / Access 

+ <https://beszel.internal>
+ <http://pi-server.internal:8090/>

#### :symbols-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Beszel Hub"
+ [:simple-github:&nbsp;GitHub OAuth](https://github.com/settings/developers)

## :symbols-deployed-code-update:&ensp;Deployment Details

##### Hub

| Host Device                                                                                      | Method                                | Container Name | Image                  |
| :----------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :--------------------- |
| [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :services-docker:&nbsp;Docker Compose | `beszel-hub`   | `henrygd/beszel`       |
|                                                                                                  | :services-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent` |

##### Agents

| Host Device                                                                                       | Method                                | Container Name | Image                        |
| :------------------------------------------------------------------------------------------------ | :------------------------------------ | :------------- | :--------------------------- |
| [:symbols-server-outline:&nbsp;Debian Server VM](../02_Hardware/Debian_Server_VM.md)              | :services-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent`       |
| [:symbols-server-outline:&nbsp;Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :services-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent`       |
| [:symbols-nas-outline:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                        | :services-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent-intel` |

### :symbols-settings:&ensp;Configuration

#### :symbols-key:&ensp;Generate API Tokens

:    Run the following command in a terminal on a client machine to generate API tokens.

    ```bash linenums="1"
    curl -X POST "http://pi-server.internal:8090/api/collections/users/auth-with-password" \
      -H "Content-Type: application/json" \
      -d '{"identity":"user@example.com","password":"your-password"}'  # (1)!
    ```

    1. Replace **"user@example.com"** with your user's email address, and **"your-password"** with your user's password.

#### :services-docker:&ensp;Docker Compose

##### Hub

```yaml title="Raspberry Pi 4B Server" linenums="1"
--8<-- "beszel-pi-4b.yaml"
```

1. Monitor other **disks / partitions** by mounting a folder in `/extra-filesystems`.

##### Agents

```yaml title="Debian Server VM" linenums="1"
--8<-- "beszel-debian-vm.yaml"
```

1. Monitor other **disks / partitions** by mounting a folder in `/extra-filesystems`.

```yaml title="Raspberry Pi Zero Server" linenums="1"
--8<-- "beszel-pi-zero.yaml"
```

1. Monitor other **disks / partitions** by mounting a folder in `/extra-filesystems`.

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "beszel-zima.yaml"
```