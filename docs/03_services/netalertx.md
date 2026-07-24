---
icon: services/netalertx
title: NetAlertX
subtitle: Centralized Network Visibility
description: Centralized network visibility and continuous asset discovery. Monitor devices, detect change, and stay aware across distributed networks.
status: new
tags:
  - Active
  - Service
  - Container
  - Monitor
  - Inventory
  - Network
  - New
  - Tools
hide:
  - toc
---
![NetAlertX logo](../assets/icons/netalertx.svg#only-light){ width=200 }
![NetAlertX logo](../assets/icons/netalertx-dark.svg#only-dark){ width=200 }

# NetAlertX
*Centralized Network Visibility*

[GitHub :brands-github:](https://github.com/netalertx/NetAlertX/){ .md-button .md-button--primary }&emsp;[Documentation :symbols-files:](https://docs.netalertx.com/){ .md-button .md-button--primary }

---
## :symbols-info: Overview

#### :symbols-file-text: Description
:    Centralized network visibility and continuous asset discovery. Monitor devices, detect change, and stay aware across distributed networks.
 
#### :symbols-settings-ethernet: Port(s)

:    `20211`&emsp;`20212`

#### :symbols-link: URL / Access

:    <http://storage-server.internal:20211>

#### :symbols-user-key: Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"NetAlertX"

## :symbols-package-search: Deployment Details

| Host Device                                                          | Method                                    | Container Name  | Image                      |
| :------------------------------------------------------------------- | :---------------------------------------- | :-------------- | :------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS-NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `netalertx-v26` | `jokobsk/netalertx:26.7.1` |

### :symbols-settings: Configuration 

```yaml {title="compose.yaml" linenums="1" .mono-title}
--8<-- "netalertx.yaml"
```