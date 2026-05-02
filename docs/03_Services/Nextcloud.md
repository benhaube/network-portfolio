---
icon: services/nextcloud
status: deprecated
tags:
  - Inactive
  - Service
  - Software
  - Docker
  - File Share
hide:
  - toc
---
![Nextcloud Icon](../assets/icons/nextcloud-light.svg#only-light){ width=200 }
![Nextcloud Icon](../assets/icons/nextcloud.svg#only-dark){ width=200 }

# Nextcloud
[GitHub :material-github:](https://github.com/nextcloud/documentation){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.nextcloud.com/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Self-hosted cloud storage and collaboration platform.

#### :symbols-settings-ethernet: Port(s):
+ `10081`

#### :material-link-variant: URL / Access: 
+ ~~[[http://storage-server.internal:10081]]~~

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"storage-server (admin)"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                             | Method                                | Container Name | Image            |
| :---------------------------------------------------------------------- | :------------------------------------ | :------------- | :--------------- |
| :material-nas:&nbsp;~~[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)~~ | :material-docker:&nbsp;Docker Compose | `nextcloud`    | `nextcloud:32.0` |

### :material-cog: Configuration

```yaml title="compose.yml" linenums="1"
--8<-- "nextcloud.yml"
```
