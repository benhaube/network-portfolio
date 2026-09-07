---
icon: brands/matter
title: Matter Server
subtitle: Based on Matter.js
description: The Open Home Foundation Matter Server serves as the foundation to provide Matter support to Home Assistant but its universal approach makes it suitable to be used in other projects too.
status: new
tags:
  - Active
  - Container
  - IoT
  - New
  - Service
hide:
  - toc
---

![Open Home Foundation Matter logo](../assets/icons/matter-light.svg#only-light){ width=200 }
![Open Home Foundation Matter logo](../assets/icons/matter-dark.svg#only-dark){ width=200 }

# Matter Server

_Based on Matter.js_

[GitHub&ensp;:brands-github:](https://github.com/matter-js/matterjs-server){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://www.home-assistant.io/integrations/matter/){ .md-button .md-button--primary }

---

![Home Assistant Matter controller settings](../assets/screenshots/ha-matter-light.png#only-light){ width=400 align=right .on-glb }
![Home Assistant Matter controller settings](../assets/screenshots/ha-matter-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    The **Open Home Foundation** Matter Server serves as the foundation to provide Matter support to [Home Assistant](home_assistant.md), but its universal approach makes it suitable to be used in other projects too.

#### :symbols-hash:&ensp;Port(s)

:    `5580`

#### :symbols-link-2:&ensp;URL / Access 

:    <http://pi-server.internal:8123/config/matter/dashboard>

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Home Assistant"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name  | Image                                      | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :-------------- | :----------------------------------------- | :------ |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `matter-server` | `ghcr.io/matter-js/matterjs-server:stable` | `5580`  |

### :symbols-settings:&ensp;Configuration

#### :symbols-folder-git-2:&ensp;Data Directories

- Docker Deploy:&ensp;`/opt/stacks/matter-server`
{ .no-bullets }
- Matter Data:&ensp;`/opt/matter-server/data`
{ .no-bullets }

#### :symbols-file-code-corner:&ensp;Docker Compose File

--8<-- "includes/managed_by_dockge.md"

``` yaml { .mono-title title="/opt/stacks/matter-server/compose.yaml" } 
--8<-- "matter-server.yaml"
```

#### :symbols-webhook:&ensp;Connect to Home Assistant

1.  Open the Home Assistant dashboard and navigate to **Settings**&ensp;:symbols-move-right:&ensp;**Devices & Services**.
2.  Click **"Add Integration"** and select **"Matter"**.

    ![Home Assistant add integration dialog](../assets/screenshots/ha-add-integration-light.png#only-light){ width=400 }
    ![Home Assistant add integration dialog](../assets/screenshots/ha-add-integration-dark.png#only-dark){ width=400 }

3.  When prompted for the connection method, uncheck the option to use the supervisor add-on. Enter the WebSocket URL of your host: `ws://<your-host-ip>:5580/ws`.

    ![Home Assistant Matter websocket URL](../assets/screenshots/ha-add-matter-hub-light.png#only-light){ width=400 }
    ![Home Assistant Matter websocket URL](../assets/screenshots/ha-add-matter-hub-dark.png#only-dark){ width=400 }

#### :brands-thread:&ensp;Sync Google Thread Credentials

To utilize the Google TV Streamer and Nest Hubs as Thread border routers, Home Assistant needs their Thread network credentials.

1.  Ensure your phone is on the same Wi-Fi network as the border routers. Open the Home Assistant app on an Android device, navigate to **Settings**&ensp;:symbols-move-right:&ensp;**Devices & Services**, and select the **Thread** integration.
2.  Tap the **gear icon** to configure, then select **"Send Credentials to Home Assistant"**.

    ![Home Assistant Android Thread settings](../assets/screenshots/ha-android-thread-light.png#only-light){ width=400 }
    ![Home Assistant Android Thread settings](../assets/screenshots/ha-android-thread-dark.png#only-dark){ width=400 }

    ![Home Assistant Android Thread import credentials](../assets/screenshots/ha-android-thread-credentials-light.png#only-light){ width=400 }
    ![Home Assistant Android Thread import credentials](../assets/screenshots/ha-android-thread-credentials-dark.png#only-dark){ width=400 }
