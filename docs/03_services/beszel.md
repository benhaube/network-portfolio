---
icon: services/beszel
title: Beszel
subtitle: Server Monitoring
description: A lightweight server monitoring hub with historical data, docker stats, and alerts. Includes the **"Hub"** container *(the main server)* and **"Agent"** containers for connecting other servers to the hub.
tags:
  - Active
  - Container
  - Monitor
  - Infrastructure
  - Service
hide:
  - toc
---
![Beszel Logo](../assets/icons/beszel.svg){ width=200 }

# Beszel
*Server Monitoring*

[GitHub&ensp;:brands-github:](https://github.com/henrygd/beszel){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://beszel.dev/guide/what-is-beszel){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    A lightweight server monitoring hub with historical data, docker stats, and alerts. Includes the **"Hub"** container *(the main server)* and **"Agent"** containers for connecting other servers to the hub.

#### :symbols-hash:&ensp;Port(s)

:    Hub:
    
      + `8090`

:    Agent:
    
      + `45867` 

#### :symbols-link-2:&ensp;URL / Access  

:    <http://pi-server.internal:8090/>

#### :symbols-user-key:&ensp;Credentials

:    [:brands-github:&ensp;GitHub OAuth](https://github.com/settings/developers){ external-link }

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"Beszel Hub"

:    2FA / MFA:
    
      + :symbols-clock:&ensp;TOTP 

## :symbols-package-search:&ensp;Deployment Details

##### Hub

| Host Device                                                          | Method                                    | Container Name | Image                  |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :--------------------- |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `beszel-hub`   | `henrygd/beszel`       |
|                                                                      | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent` |

##### Agents

| Host Device                                                                    | Method                                    | Container Name | Image                        |
| :----------------------------------------------------------------------------- | :---------------------------------------- | :------------- | :--------------------------- |
| [:symbols-server:&nbsp;Debian Server VM](../02_hardware/debian_server.md)      | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent`       |
| [:symbols-server:&nbsp;Pi Zero 2W Server](../02_hardware/pi_zero_2w_server.md) | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent`       |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)           | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent-intel` |

### :symbols-settings:&ensp;Configuration

#### :symbols-key-round:&ensp;Generate API Tokens

:    Run the following command in a terminal on a client machine to generate API tokens.

    ```bash linenums="1"
    curl -X POST "http://pi-server.internal:8090/api/collections/users/auth-with-password" \
      -H "Content-Type: application/json" \
      -d '{"identity":"user@example.com","password":"your-password"}'  # (1)!
    ```

    1. Replace **"user@example.com"** with your user's email address, and **"your-password"** with your user's password.

#### :symbols-file-code-corner:&ensp;Docker Compose File

##### Hub

```yaml title="Pi 4B Server" linenums="1"
--8<-- "beszel-pi-4b.yaml"
```

1. Monitor other **disks / partitions** by mounting a folder in `/extra-filesystems`.

##### Agents

```yaml title="Debian Server VM" linenums="1"
--8<-- "beszel-debian-vm.yaml"
```

1. Monitor other **disks / partitions** by mounting a folder in `/extra-filesystems`.

```yaml title="Pi Zero 2W Server" linenums="1"
--8<-- "beszel-pi-zero.yaml"
```

1. Monitor other **disks / partitions** by mounting a folder in `/extra-filesystems`.

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "beszel-zima.yaml"
```