---
icon: simple/obsidian
title: Obsidian LiveSync (CouchDB)
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

# Obsidian LiveSync (CouchDB)
[GitHub :material-github:](https://github.com/apache/couchdb){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.couchdb.org/en/stable/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ CouchDB database for synchronizing Obsidian Vaults 

#### :symbols-settings-ethernet: Port(s):
+ `5984`

#### :material-link-variant: URL / Access:  
+ :material-application-cog-outline: Settings Web UI: 
    + <http://storage-server.internal:5984/_utils>
+ :material-database-outline: Database:
    + <http://storage-server.internal:5984/obsidian-vault>

#### :material-key-chain: Credentials:  
+ :material-docker:&nbsp;Docker Compose: `compose.yml`

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :------------------------------------------------------------------ | :------------------------------------ | :------------------ | :-------------- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `obsidian-livesync` | `couchdb:3.5.0` |

### :material-cog: Configuration 

#### :material-server-outline: Server:

```yaml title="compose.yml" linenums="1"
--8<-- "obsidian-livesync.yml"
```

1. Leave the default password in the Docker compose file, and change the password from the CouchDB Web UI. 

```ini title="local.ini" linenums="1"
--8<-- "couchdb-local.ini"
```

#### :material-devices: Clients:

```json title=".obsidian/plugins/obsidian-livesync/data.json" linenums="1"
--8<-- "obsidian-livesync_data.json"
```
