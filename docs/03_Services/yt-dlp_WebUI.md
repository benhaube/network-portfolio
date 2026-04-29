---
icon: services/youtube-dl
title: yt-dlp Web-UI
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
[GitHub :material-github:](https://github.com/marcopiovanello/yt-dlp-web-ui){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/marcopiovanello/yt-dlp-web-ui/wiki){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A Web UI and RPC server for `yt-dlp`.

#### :symbols-settings-ethernet: Port(s):
+ `3033`

#### :material-link-variant: URL / Access:  
+ <http://storage-server.internal:3033>
+ <https://yt-dlp.internal>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `yt-dlp-webui` | `marcobaobao/yt-dlp-webui:latest` |

### :material-cog: Configuration 

```yaml title="compose.yml" linenums="1"
services:
  yt-dlp-webui:
    image: marcobaobao/yt-dlp-webui:latest
    labels:
      icon: data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xml%3Aspace%3D%22preserve%22%20viewBox%3D%220%200%20512%20512%22%3E%3Cpath%20d%3D%22M199.6%20383.7c-79-1.5-111-2.9-130.6-5.5-14.4-1.9-21.4-3.8-29.4-7.8-13.2-6.6-21.3-15.9-27.2-30.8C7%20326%204.8%20315.1%202.8%20292.2.5%20266.3.3%20261.7.1%20221.4c-.3-47.4.2-62.9%203.4-94.4%201.6-16.5%204-27.4%208.5-39.1%204.1-10.6%207.8-16.4%2014.6-22.9%208.5-8.1%2017.9-13%2029.6-15.6%2017.6-3.9%2097.2-6.9%20182.8-6.9s165.2%203%20182.8%206.9c12.7%202.8%2022.1%208%2031.2%2017.3%207.1%207.3%2010.8%2013.9%2015.2%2027.3%204.5%2013.8%206.2%2026.1%208.8%2062.3%201.2%2017.2%201.2%2096.4%200%20113.6-1.4%2020.1-3.2%2038-4.3%2044.5-3%2016.5-8.9%2031.9-15.5%2040.7-4.5%206-13.5%2013.2-21%2016.8-7.6%203.7-14.8%205.5-26.5%206.6-36.2%203.8-146.5%206.4-210.1%205.2%22%20style%3D%22fill%3A%23c2352a%22%2F%3E%3Ccircle%20cx%3D%22384%22%20cy%3D%22332.8%22%20r%3D%22128%22%20style%3D%22fill%3A%2303a9f4%22%2F%3E%3Cpath%20d%3D%22M249.5%20252c67.7-38.5%2066.3-37.7%2066.3-38.5%200-.7-118.6-68.9-119.1-68.5-.4.3-.5%20136-.1%20136.4.1.2.6.2.9%200%20.3-.1%2023.7-13.3%2052-29.4m160.1%204v68.3h25.6L384%20392.5l-51.2-68.3h25.6V256zm-85.3%20136.5h119.5v17.1H324.3z%22%20style%3D%22fill%3A%23fff%22%2F%3E%3C%2Fsvg%3E
    ports:
      - 3033:3033
    volumes:
      - /DATA/Downloads/yt-dlp:/downloads  # (1)!
    healthcheck:
      test: curl -f http://localhost:3033 || exit 1
    restart: unless-stopped
```

1. Replace `<your dir>` with a directory on your host system.