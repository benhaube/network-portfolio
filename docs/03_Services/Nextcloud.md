---
icon: services/nextcloud
title: Nextcloud
subtitle: Private Cloud
description: Self-hosted cloud storage and collaboration platform.
status: deprecated
tags:
  - Deprecated
  - Service
  - Software
  - Docker
  - File Share
hide:
  - toc
---
![Nextcloud Icon](../assets/icons/nextcloud.svg){ width=200 }

# Nextcloud
*Private Cloud*

[GitHub&ensp;:simple-github:](https://github.com/nextcloud){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:material-file-document-multiple:](https://docs.nextcloud.com/){ .md-button .md-button--primary }

---
## :material-information-outline:&ensp;Overview

#### :symbols-description:&ensp;Description 

:    Self-hosted cloud storage and collaboration platform.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `10081`

#### :material-link-variant:&ensp;URL / Access 

+ ~~<http://storage-server.internal:10081>~~
+ ~~<http://storage-server-2.internal:10081>~~

#### :material-key-chain:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Nextcloud (admin)"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Nextcloud (bhaube)"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                             | Method                                | Container Name | Image            |
| :---------------------------------------------------------------------- | :------------------------------------ | :------------- | :--------------- |
| [:material-nas:&nbsp;~~ZimaOS NAS~~](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `nextcloud`    | `nextcloud:32.0` |

### :material-cog:&ensp;Configuration

```yaml title="<code>compose.yml</code>" linenums="1"
--8<-- "nextcloud.yml"
```
