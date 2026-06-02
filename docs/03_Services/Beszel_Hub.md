---
icon: services/beszel
title: Beszel
subtitle: Server Monitoring
description: A lightweight server monitoring hub with historical data, docker stats, and alerts. Includes the **"Hub"** container *(the main server)* and **"Agent"** containers for connecting other servers to the hub.
tags:
  - Active
  - Service
  - Software
  - Docker
  - Monitor
  - Infrastructure
hide:
  - toc
---
![Beszel Logo](../assets/icons/beszel.svg){ width=200 }

# Beszel
*Server Monitoring*

[GitHub :material-github:](https://github.com/henrygd/beszel){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://beszel.dev/guide/what-is-beszel){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 

:    A lightweight server monitoring hub with historical data, docker stats, and alerts. Includes the **"Hub"** container *(the main server)* and **"Agent"** containers for connecting other servers to the hub.

#### :symbols-settings-ethernet: Port(s):

+ Hub:
    + `8090`
+ Agent:
    + `45867` 

#### :material-link-variant: URL / Access: 

+ <https://beszel.internal>
+ <http://pi-server.internal:8090/>

#### :material-key-chain: Credentials: 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Beszel Hub"

## :symbols-deployed-code-update: Deployment Details

##### Hub

| Host Device                                                                                     | Method                                | Container Name | Image                  |
| :---------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :--------------------- |
| [:material-raspberry-pi:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-docker:&nbsp;Docker Compose | `beszel-hub`   | `henrygd/beszel`       |
|                                                                                                 | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent` |

##### Agents

| Host Device                                                                                      | Method                                | Container Name | Image                        |
| :----------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :--------------------------- |
| [:material-debian:&nbsp;Debian Server VM](../02_Hardware/Debian_Server_VM.md)                    | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent`       |
| [:material-raspberry-pi:&nbsp;Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent`       |
| [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                              | :material-docker:&nbsp;Docker Compose | `beszel-agent` | `henrygd/beszel-agent-intel` |

### :material-cog: Configuration

#### :material-key: Generate API Tokens:

:    Run the following command in a terminal on a client machine to generate API tokens.

    ```bash linenums="1"
    curl -X POST "http://pi-server.internal:8090/api/collections/users/auth-with-password" \
      -H "Content-Type: application/json" \
      -d '{"identity":"user@example.com","password":"your-password"}'  # (1)!
    ```

    1. Replace **"user@example.com"** with your user's email address, and **"your-password"** with your user's password.

#### :material-docker: Docker Compose:

##### Hub

```yaml title="Raspberry Pi 4B Server" linenums="1"
--8<-- "beszel-pi-4b.yaml"
```

1. Monitor other disks / partitions by mounting a folder in /extra-filesystems.

##### Agents

```yaml title="Debian Server VM" linenums="1"
--8<-- "beszel-debian-vm.yaml"
```

1. Monitor other disks / partitions by mounting a folder in /extra-filesystems.

```yaml title="Raspberry Pi Zero Server" linenums="1"
--8<-- "beszel-pi-zero.yaml"
```

1. Monitor other disks / partitions by mounting a folder in /extra-filesystems.

```yaml title="ZimaOS NAS" linenums="1"
--8<-- "beszel-zima.yaml"
```