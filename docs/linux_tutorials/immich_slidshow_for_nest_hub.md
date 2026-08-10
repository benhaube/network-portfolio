---
icon: symbols/image-play
title: Project Migration
subtitle: Immich Slideshow for Nest Hub
description: A comprehensive guide for setting up an Immich slideshow on your Nest Hub to replace Google Photos.
tags:
  - Backup
  - Container
  - File Share
  - IoT
  - Linux
  - NAS
  - Server
  - Service
hide:
  - toc
---

![Material image icon](../assets/icons/image-play.svg){ width=200 }

# Project Migration

_Immich Slideshow for Nest Hub_

!!! info "Project Info"

    **User:** Ben Haube | **Date:** Feb 5, 2026<br>
    **Infrastructure**

    - [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md) *([Immich](../03_services/immich.md))*
    { .no-bullets }
    - [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) *([Home Assistant](../03_services/home_assistant.md), [Cloudflared](../03_services/cloudflared.md) Tunnel)*
    { .no-bullets }

---

## :symbols-trash-2:&ensp;Cleaning Google Photos

1.  **Safety First _(Mobile)_:**
    -   Uninstall Google Photos App **OR** Turn OFF "Backup & Sync".
    -   Install **Fossify Gallery** _(via F-Droid / Obtainium)_ for local viewing.

        [Fossify Gallery&ensp;:symbols-image:](https://f-droid.org/en/packages/org.fossify.gallery/){ .md-button }

2.  **Deletion _(Desktop)_:**
    -   **Manual:**
        - **Go to:**&nbsp;[Google Photos](https://photos.google.com){ external-link }
        - :symbols-mouse-left:&nbsp;first photo&emsp;:symbols-move-right:&emsp;:symbols-mouse::symbols-arrow-down:&emsp;:symbols-move-right:&emsp;++shift++&nbsp;+&nbsp;:symbols-mouse-left:&nbsp;last photo&emsp;:symbols-move-right:&emsp;++del++
    -   **Console Script _(Advanced)_:**
        - Open Chrome DevTools:&ensp;++f12++&ensp;:symbols-move-right:&ensp;Console.
        - Paste script to auto-select/delete.
3.  **Finalize:**
    - Empty "Trash/Bin" to reclaim storage.

### :symbols-file-code-corner:&ensp;Photo Cleaning Script

``` javascript title="Javascript" linenums="1"
--8<-- "clean-google-photos.js"
```

1. If the script selects them but doesn't delete them, just click the :symbols-trash-2: icon yourself after it does the hard work of selecting everything.

## :symbols-server:&ensp;Server-Side Setup

### :symbols-file-code-corner:&ensp;Docker Compose File

Add these services to your existing Immich stack or a new stack.

``` yaml { .mono-title title="compose.yml" linenums="1" }
--8<-- "immich-frame.yaml"
```

1. The Interface _(Displays the clock / weather / photos)_
2. Link to the auto-album below
3. The Logic _(Auto-adds faces to the specific album)_
4. `SYNC_MODE=1` adds new photos automatically.

### :symbols-images:&ensp;Auto Album Config

Place this in the same folder as your docker-compose file.

``` json { .mono-title title="config.json" linenums="1" }
--8<-- "immich-frame-config.json"
```

## :symbols-globe-arrow:&ensp;Network & Cloudflare

1.  **Tunnel:**
    - Point `frame.rac3r4life.online` to `http://<ZIMAOS_NAS_IP>:8081` using the [Cloudflare](../03_services/cloudflared.md) tunnel.
2.  **WAF Rules _(Critical)_:**
    -   **Go to:**&ensp;Cloudflare Dashboard&ensp;:symbols-move-right:&ensp;Security&ensp;:symbols-move-right:&ensp;WAF&ensp;:symbols-move-right:&ensp;Custom Rules
    -   **Create Rule:**&ensp;If Hostname equals `frame.rac3r4life.online`&ensp;:symbols-move-right:&ensp;**Skip** "Super Bot Fight Mode" and "Managed Challenge"
        - _Why:_ Prevents the Nest Hub from hitting a "Verify you are human" screen.

## :symbols-house-wifi:&ensp;Automation

**Prerequisite:** 
: Install "DashCast" add-on in [Home Assistant](../03_services/home_assistant.md).

**Automation YAML:**

``` yaml { .mono-title title="/home-assistant-container/automations.yaml" linenums="1" }
--8<-- "ha-automations.yaml"
```