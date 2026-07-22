---
icon: services/youtube-dl
title: yt-dlp Web-UI
subtitle: Download Videos from YouTube
description: A Web UI and RPC server for `yt-dlp`.
tags:
  - Active
  - Container
  - Video
  - Download
  - Service
hide:
  - toc
---
![YouTube-DL Icon](../assets/icons/youtube-dl.svg){ width=200 }

# yt-dlp Web-UI
*Download Videos from YouTube*

[Docker Hub&ensp;:services-docker:](https://hub.docker.com/r/marcobaobao/yt-dlp-webui){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://deepwiki.com/qokelate/yt-dlp-webui/2-getting-started){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    High performance extendable Web-UI and RPC server for `yt-dlp` with low impact on resources.

#### :symbols-settings-ethernet:&ensp;Port(s)

:    `3033`

#### :symbols-link:&ensp;URL / Access  

:    <http://storage-server.internal:3033>

:    <http://storage-server-2.internal:3033>

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }: 
    
      + Local Network&ensp;:symbols-move-right:&ensp;"yt-dlp-webui"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                             |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :-------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) | :symbols-container:&nbsp;Docker Container | `yt-dlp-webui` | `marcobaobao/yt-dlp-webui:latest` |

### :symbols-settings:&ensp;Configuration 

#### :symbols-wrench:&ensp;Preparation  

1. Create the configuration directory:

    ```bash linenums="1"
    sudo mkdir -p /DATA/AppData/dockge/stacks/yt-dlp-webui/data
    ```

2. Enter that directory and create the `config.yml` configuration file:

    ```bash linenums="1"
    cd /DATA/AppData/dockge/stacks/yt-dlp-webui/data
    sudo nano config.yml
    ```
  
3. Paste the following code into the file, then save and close: 

    ```yaml {title="config.yml" linenums="1" .mono-title}
    --8<-- "yt-dlp-webui-config.yml"
    ```

    1. Replace with a strong password for your user. 

4. Start the container with the Docker compose file, then run this command to obtain your JWT:

    ```bash linenums="1"
    curl -X POST "http://storage-server.internal:3033/auth/login" \
      -H "Content-Type: application/json" \
      -d '{"username":"your-username","password":"your-password"}'  # (1)!
    ```

    1. Replace **"your-username"** and **"your-password"** with the values you set in your configuration file, `config.yml`.

5. Paste the JWT into the environment variable, `JWT_SECRET`, in your Docker compose file and restart the container.

#### :symbols-file-code-corner:&ensp;Docker Compose File

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "yt-dlp.yml"
```

1. Replace with the directory on your host system where you want the videos to be downloaded.
2. **Optional:** Setting the directory for the configuration file is optional, but recommended. Create the configuration file, `config.yml`, in the directory on the host system.
3. Replace with the JWT you obtained with the command above. 