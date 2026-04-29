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
+ :material-docker:&nbsp;Docker Compose: `docker-compose.yml`

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `obsidian-livesync` | `couchdb:3.5.0` |

### :material-cog: Configuration 

#### :material-server-outline: Server:

```yaml title="compose.yml" linenums="1"
services:
  app:
    cpu_shares: 90
    container_name: obsidian-livesync
    environment:
      - COUCHDB_PASSWORD=password  # (1)!
      - COUCHDB_USER=bhaube
    image: couchdb:3.5.0
    labels:
      icon: data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xml%3Aspace%3D%22preserve%22%20viewBox%3D%220%200%20512%20512%22%3E%3Cpath%20d%3D%22M198.9%20298.9c13.1-3.9%2034.3-9.8%2058.5-11.4-13-30.8-18.2-64.4-15.3-97.7%203.3-33%2015.1-60.8%2026.5-84.2l6.9-14.3%209-18.4c4.7-10%208.2-18.8%209.8-27.1%201.6-8.2%201.6-15.3-.4-22.2s-6.1-14.3-14.3-22.4c-11.1-3-23-.2-31.6%207.5l-105.6%2095c-5.9%205.3-9.8%2012.4-11%2020.4l-9%2060.4c34%2031.6%2060.2%2070.8%2076.5%20114.4M118.1%20212l-2%206.1-55.9%20124.4c-5.7%2012.8-3.1%2027.8%206.5%2037.9l87.9%2090.3c37.3-51.5%2044.1-119%2017.9-177-13.1-30.2-31.5-57.9-54.4-81.7M175%20481.6l4.7.4c16.5.4%2044.7%202%2067.3%206.1%2018.6%203.5%2055.5%2013.7%2085.6%2022.4%2023%206.9%2046.9-11.6%2050.2-35.5%202.4-17.3%207.1-36.9%2015.5-55.1-9.9-31.4-27.7-59.6-51.8-82-16.7-14.5-37.2-23.8-59.1-26.7-27.7-2.7-55.7.5-82%209.6%2013.5%2055.5%202.3%20114-30.6%20160.7h.2zm238-86.1c19-28.5%2032.6-51%2039.6-63.2%203.4-6%202.9-13.4-1.2-19-17.2-22.2-31.9-46.3-43.6-71.8-11.8-28.3-13.5-72.2-13.7-93.4%200-8.2-2.4-16.1-7.5-22.4L318.3%2039c0%203.9-.8%207.7-1.6%2011.6-2.6%2011-6.4%2021.7-11.4%2031.8l-9.4%2019.6-6.7%2013.5c-12.6%2023.8-20.7%2049.7-24.1%2076.5-2.8%2032.9%203.2%2066%2017.3%2095.8%2029.2%202.2%2057%2013.8%2079.1%2033%2022.6%2020.7%2040.3%2046.2%2051.5%2074.7%22%20style%3D%22fill%3A%23a079ff%22%2F%3E%3C%2Fsvg%3E
    ports:
      - mode: ingress
        target: 5984
        published: "5984"
        protocol: tcp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/big-bear-obsidian-livesync/data/couchdb
        target: /opt/couchdb/data
        bind:
          create_host_path: true
      - type: bind
        source: /DATA/AppData/big-bear-obsidian-livesync/data/local.ini
        target: /opt/couchdb/etc/local.ini
        bind:
          create_host_path: true
```

1. Leave the default password in the Docker compose file, and change the password from the CouchDB Web UI. 

#### :material-devices: Clients:

```json title=".obsidian/plugins/obsidian-livesync/data.json" linenums="1"
{
  "remoteType": "",
  "useCustomRequestHandler": false,
  "couchDB_URI": "",
  "couchDB_USER": "",
  "couchDB_PASSWORD": "",
  "couchDB_DBNAME": "",
  "liveSync": true,
  "syncOnSave": false,
  "syncOnStart": false,
  "savingDelay": 200,
  "lessInformationInLog": false,
  "gcDelay": 0,
  "versionUpFlash": "",
  "minimumChunkSize": 20,
  "longLineThreshold": 250,
  "showVerboseLog": false,
  "suspendFileWatching": false,
  "trashInsteadDelete": true,
  "periodicReplication": false,
  "periodicReplicationInterval": 60,
  "syncOnFileOpen": false,
  "encrypt": false,
  "passphrase": "",
  "usePathObfuscation": false,
  "doNotDeleteFolder": false,
  "resolveConflictsByNewerFile": false,
  "batchSave": false,
  "batchSaveMinimumDelay": 5,
  "batchSaveMaximumDelay": 60,
  "deviceAndVaultName": "",
  "usePluginSettings": false,
  "showOwnPlugins": false,
  "showStatusOnEditor": false,
  "showStatusOnStatusbar": true,
  "showOnlyIconsOnEditor": true,
  "hideFileWarningNotice": false,
  "networkWarningStyle": "",
  "usePluginSync": true,
  "autoSweepPlugins": true,
  "autoSweepPluginsPeriodic": false,
  "notifyPluginOrSettingUpdated": true,
  "checkIntegrityOnSave": false,
  "batch_size": 25,
  "batches_limit": 25,
  "useHistory": true,
  "disableRequestURI": true,
  "skipOlderFilesOnSync": true,
  "checkConflictOnlyOnOpen": false,
  "showMergeDialogOnlyOnActive": false,
  "syncInternalFiles": true,
  "syncInternalFilesBeforeReplication": true,
  "syncInternalFilesIgnorePatterns": "\\/node_modules\\/, \\/\\.git\\/, \\/obsidian-livesync\\/, ^\\.git\\/,\\/workspace$ ,\\/workspace.json$,\\/workspace-mobile.json$",
  "syncInternalFilesTargetPatterns": "",
  "syncInternalFilesInterval": 60,
  "additionalSuffixOfDatabaseName": "86c7f436930a1e67",
  "ignoreVersionCheck": false,
  "lastReadUpdates": 25,
  "deleteMetadataOfDeletedFiles": false,
  "syncIgnoreRegEx": "",
  "syncOnlyRegEx": "",
  "customChunkSize": 0,
  "readChunksOnline": true,
  "watchInternalFileChanges": true,
  "automaticallyDeleteMetadataOfDeletedFiles": 0,
  "disableMarkdownAutoMerge": false,
  "writeDocumentsIfConflicted": false,
  "useDynamicIterationCount": false,
  "syncAfterMerge": false,
  "configPassphraseStore": "",
  "encryptedPassphrase": "",
  "encryptedCouchDBConnection": "%$HpRTF+7P7iaTT40ibseGsZXwqzCfaynr4G1/yD8FYEt+sjj3Sra2CmWXbYGLbAAG0t4teoqW8XGAfgGEFoJLDHoy+kFj9S6K44h+YFvSb4IWZFGsngRjO/0dFmuMl/IzQFBi7s+cR7n2tONYcOsy8sw6YLVz4Luzw8WgErcDDtEDBru/iC4dn6KD47zxPwHPdXsHt2wyU1777l5t9XDQuzvTamCwyoDH3FP7inja9WYAGx5OjR24euEivGpu6gIhrMWcn9nCDNR8f0O1J1BesQu2twsE/QVAR0Iow5Q/QQ9XD6zwEPA5xPUOgaedgbmfLRofsw12iZ3SPskHOSOdKmCSaqy0iPmyqdY79lgYrSxDjQu+NsfHIkwiYOmHAyzT20FxvMCS8ounNBYwcPKR2p1rEi8Gyfv/aHQwt9Pjus/q9lnkK92tt+FqblgWZxofzwduMoad8mQ/UljDbGyvEYFaLLbdIVEFsTbsoQeGYofLglgvGx/rHXj1mTbMCuqrir2KAb8s1b0g6+v45bBfSpCLJMzY59V7hp7CWdd4EU0KAvfVcrEhTv3WyiAHEuh71wukersI+X/G0BM5D/C/dHUKv24JfEPIz4Cm/8A4WleOLYFwl+SdUG8yn3SxCGd7XB1Oh615atoz8AXPMoE+ka9SaCoHCh83PfSeuxRpegMqLEU+rghvgSHAGvqGXBxCTpEwY0BJcHKSC06hAFBiv+0qvg==",
  "permitEmptyPassphrase": false,
  "useIndexedDBAdapter": false,
  "useTimeouts": false,
  "writeLogToTheFile": false,
  "doNotPaceReplication": false,
  "hashCacheMaxCount": 300,
  "hashCacheMaxAmount": 50,
  "concurrencyOfReadChunksOnline": 40,
  "minimumIntervalOfReadChunksOnline": 50,
  "hashAlg": "xxhash64",
  "suspendParseReplicationResult": false,
  "doNotSuspendOnFetching": false,
  "useIgnoreFiles": false,
  "ignoreFiles": ".gitignore",
  "syncOnEditorSave": false,
  "pluginSyncExtendedSetting": {},
  "syncMaxSizeInMB": 50,
  "settingSyncFile": "",
  "writeCredentialsForSettingSync": false,
  "notifyAllSettingSyncFile": true,
  "isConfigured": true,
  "settingVersion": 10,
  "enableCompression": false,
  "accessKey": "",
  "bucket": "",
  "endpoint": "",
  "region": "",
  "secretKey": "",
  "useEden": false,
  "maxChunksInEden": 10,
  "maxTotalLengthInEden": 1024,
  "maxAgeInEden": 10,
  "disableCheckingConfigMismatch": false,
  "displayLanguage": "def",
  "enableChunkSplitterV2": false,
  "disableWorkerForGeneratingChunks": false,
  "processSmallFilesInUIThread": false,
  "notifyThresholdOfRemoteStorageSize": 2000,
  "usePluginSyncV2": true,
  "usePluginEtc": false,
  "doNotUseFixedRevisionForChunks": true,
  "showLongerLogInsideEditor": false,
  "sendChunksBulk": false,
  "sendChunksBulkMaxSize": 1,
  "useSegmenter": false,
  "useAdvancedMode": true,
  "usePowerUserMode": true,
  "useEdgeCaseMode": false,
  "enableDebugTools": false,
  "suppressNotifyHiddenFilesChange": false,
  "syncMinimumInterval": 2000,
  "P2P_Enabled": false,
  "P2P_AutoAccepting": 0,
  "P2P_AppID": "self-hosted-livesync",
  "P2P_roomID": "",
  "P2P_passphrase": "",
  "P2P_relays": "wss://exp-relay.vrtmrz.net/",
  "P2P_AutoBroadcast": false,
  "P2P_AutoStart": false,
  "P2P_AutoSyncPeers": "",
  "P2P_AutoWatchPeers": "",
  "P2P_SyncOnReplication": "",
  "P2P_RebuildFrom": "",
  "P2P_AutoAcceptingPeers": "",
  "P2P_AutoDenyingPeers": "",
  "P2P_IsHeadless": false,
  "P2P_DevicePeerName": "",
  "P2P_turnServers": "",
  "P2P_turnUsername": "",
  "P2P_turnCredential": "",
  "doctorProcessedVersion": "0.25.27",
  "bucketCustomHeaders": "",
  "couchDB_CustomHeaders": "",
  "useJWT": false,
  "jwtAlgorithm": "",
  "jwtKey": "",
  "jwtKid": "",
  "jwtSub": "",
  "jwtExpDuration": 5,
  "useRequestAPI": false,
  "bucketPrefix": "",
  "chunkSplitterVersion": "v3-rabin-karp",
  "E2EEAlgorithm": "v2",
  "processSizeMismatchedFiles": false,
  "forcePathStyle": true,
  "syncInternalFileOverwritePatterns": "",
  "useOnlyLocalChunk": false,
  "maxMTimeForReflectEvents": 0
}
```
