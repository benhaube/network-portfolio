---
icon: services/youtube-dl
title: yt-dlp Web-UI
subtitle: Download Videos from YouTube
description: A Web UI and RPC server for `yt-dlp`.
tags:
  - Active
  - Service
  - Software
  - Docker
  - Video
  - Download
hide:
  - toc
---
![YouTube-DL Icon](../assets/icons/youtube-dl-light.svg#only-light){ width=200 }
![YouTube-DL Icon](../assets/icons/youtube-dl.svg#only-dark){ width=200 }

# yt-dlp Web-UI
*Download Videos from YouTube*

[Docker Hub :material-docker:](https://hub.docker.com/r/marcobaobao/yt-dlp-webui){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://deepwiki.com/qokelate/yt-dlp-webui/2-getting-started){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 

:    A Web UI and RPC server for `yt-dlp`.

#### :symbols-settings-ethernet: Port(s):

+ `3033`

#### :material-link-variant: URL / Access:  

+ <http://storage-server.internal:3033>
+ <https://yt-dlp.internal>

#### :material-key-chain: Credentials: 

+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                             |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :-------------------------------- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `yt-dlp-webui` | `marcobaobao/yt-dlp-webui:latest` |

### :material-cog: Configuration 

```yaml title="<code>compose.yml</code>" linenums="1"
--8<-- "yt-dlp.yml"
```

1. Replace `<your dir>` with a directory on your host system.