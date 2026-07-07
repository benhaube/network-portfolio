---
icon: services/nextcloud
title: Nextcloud
subtitle: Private Cloud
description: Self-hosted cloud storage and collaboration platform.
status: deprecated
tags:
  - Deprecated
  - Docker
  - File Share
  - Service
hide:
  - toc
---
![Nextcloud Icon](../assets/icons/nextcloud.svg){ width=200 }

# Nextcloud
*Private Cloud*

[GitHub&ensp;:simple-github:](https://github.com/nextcloud){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://docs.nextcloud.com/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Self-hosted cloud storage and collaboration platform.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `10081`

#### :symbols-link:&ensp;URL / Access 

+ ~~<http://storage-server.internal:10081>~~
+ ~~<http://storage-server-2.internal:10081>~~

#### :symbols-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Nextcloud (admin)"
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Nextcloud (bhaube)"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                    | Method                                | Container Name | Image            |
| :----------------------------------------------------------------------------- | :------------------------------------ | :------------- | :--------------- |
| [:symbols-nas-outline:&nbsp;~~ZimaOS NAS~~](../02_Hardware/ZimaBoard_2_NAS.md) | :services-docker:&nbsp;Docker Compose | `nextcloud`    | `nextcloud:32.0` |

### :symbols-settings:&ensp;Configuration

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "nextcloud.yml"
```
