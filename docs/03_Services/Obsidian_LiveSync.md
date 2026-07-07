---
icon: simple/obsidian
title: Obsidian LiveSync
subtitle: Sync with CouchDB
description: Seamless multi-primary syncing database with an intuitive HTTP / JSON API, designed for reliability.
tags:
  - Active
  - Docker
  - File Share
  - Remote Access
hide:
  - toc
---
![Obsidian Logo](../assets/icons/obsidian.svg){ width=200 }&nbsp;![CouchDB Logo](../assets/icons/couchdb.svg){ width=75 }

# Obsidian LiveSync
*Sync with CouchDB*

[GitHub&ensp;:simple-github:](https://github.com/apache/couchdb){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://docs.couchdb.org/en/stable/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Seamless multi-primary syncing database with an intuitive HTTP / JSON API, designed for reliability.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `5984`

#### :symbols-link:&ensp;URL / Access  

+ :symbols-cogs: Settings Web UI: 
    + <http://storage-server.internal:5984/_utils>
    + <http://storage-server-2.internal:5984/_utils>
+ :symbols-database: Database:
    + <http://storage-server.internal:5984/obsidian-vault>
    + <http://storage-server-2.internal:5984/obsidian-vault>

#### :symbols-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com):   
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Obsidian LiveSync"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                        | Method                                | Container Name      | Image           |
| :----------------------------------------------------------------- | :------------------------------------ | :------------------ | :-------------- |
| [:symbols-nas-outline:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :services-docker:&nbsp;Docker Compose | `obsidian-livesync` | `couchdb:3.5.0` |

### :symbols-settings:&ensp;Configuration 

#### :symbols-server:&ensp;Server

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "obsidian-livesync.yml"
```

1. Leave the default password in the Docker compose file, and change the password from the CouchDB Web UI. 

```ini {title="local.ini" linenums="1" .mono-title}
--8<-- "couchdb-local.ini"
```

#### :symbols-devices:&ensp;Clients

```json {title=".obsidian/plugins/obsidian-livesync/data.json" linenums="1" .mono-title}
--8<-- "obsidian-livesync_data.json"
```
