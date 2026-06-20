---
icon: simple/obsidian
title: Obsidian LiveSync
subtitle: Sync with CouchDB
description: Seamless multi-primary syncing database with an intuitive HTTP / JSON API, designed for reliability.
tags:
  - Active
  - Service
  - Software
  - Docker
  - File Share
  - Remote Access
hide:
  - toc
---
![Obsidian Logo](../assets/icons/obsidian.svg){ width=200 }&nbsp;![CouchDB Logo](../assets/icons/couchdb.svg){ width=75 }

# Obsidian LiveSync
*Sync with CouchDB*

[GitHub&ensp;:simple-github:](https://github.com/apache/couchdb){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:material-file-document-multiple:](https://docs.couchdb.org/en/stable/){ .md-button .md-button--primary }

---
## :material-information-outline:&ensp;Overview

#### :symbols-description:&ensp;Description 

:    Seamless multi-primary syncing database with an intuitive HTTP / JSON API, designed for reliability.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `5984`

#### :material-link-variant:&ensp;URL / Access  

+ :material-application-cog-outline: Settings Web UI: 
    + <http://storage-server.internal:5984/_utils>
    + <http://storage-server-2.internal:5984/_utils>
+ :material-database-outline: Database:
    + <http://storage-server.internal:5984/obsidian-vault>
    + <http://storage-server-2.internal:5984/obsidian-vault>

#### :material-key-chain:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com):   
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Obsidian LiveSync"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                         | Method                                | Container Name      | Image           |
| :------------------------------------------------------------------ | :------------------------------------ | :------------------ | :-------------- |
| [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `obsidian-livesync` | `couchdb:3.5.0` |

### :material-cog:&ensp;Configuration 

#### :material-server-outline:&ensp;Server

```yaml title="<code>compose.yml</code>" linenums="1"
--8<-- "obsidian-livesync.yml"
```

1. Leave the default password in the Docker compose file, and change the password from the CouchDB Web UI. 

```ini title="<code>local.ini</code>" linenums="1"
--8<-- "couchdb-local.ini"
```

#### :symbols-devices:&ensp;Clients

```json title="<code>.obsidian/plugins/obsidian-livesync/data.json</code>" linenums="1"
--8<-- "obsidian-livesync_data.json"
```
