---
icon: symbols/image
title: Project Migration
subtitle: Immich Slideshow for Nest Hub
hide:
  - toc
---
![Material image icon](../assets/icons/image.svg){ width=200 }

# Project Migration
*Immich Slideshow for Nest Hub*

!!! info "Project Info"

    **User:** Ben Haube | **Date:** Feb 5, 2026<br>
    **Infrastructure:** 
    
    + [:symbols-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) *([Immich](../03_Services/Immich.md))* 
    + [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) *([Home Assistant](../03_Services/Home_Assistant.md), [Cloudflared](../03_Services/Cloudflared.md) Tunnel)*

---

## :symbols-delete:&ensp;Cleaning Google Photos

**Goal:**
:   Delete cloud data without losing local files.

1.  **Safety First *(Mobile)*:**
    + Uninstall Google Photos App **OR** Turn OFF "Backup & Sync".
    + Install **Fossify Gallery** *(via F-Droid / Obtainium)* for local viewing.

        [Fossify Gallery&ensp;:symbols-image:](https://f-droid.org/en/packages/org.fossify.gallery/){ .md-button }

2.  **Deletion *(Desktop)*:**
    + **Manual:** 
        + **Go to:**&ensp;[:services-google-photos:&nbsp;Google Photos](https://photos.google.com) 
        + :material-mouse-left-click:&nbsp;first photo&emsp;:symbols-arrow-right-thin:&emsp;:material-mouse-scroll-wheel::symbols-arrow-down-thin:&emsp;:symbols-arrow-right-thin:&emsp;++shift++&nbsp;+&nbsp;:material-mouse-left-click:&nbsp;last photo&emsp;:symbols-arrow-right-thin:&emsp;++del++
    + **Console Script *(Advanced)*:** 
        + Open Chrome DevTools:&ensp;++f12++&ensp;:symbols-arrow-right-thin:&ensp;Console. 
        + Paste script to auto-select/delete. 
3.  **Finalize:** 
    + Empty "Trash/Bin" to reclaim storage.

### :symbols-frame-source:&ensp;Photo Cleaning Script

```javascript title="Javascript" linenums="1"
--8<-- "clean-google-photos.js"
```

1. If the script selects them but doesn't delete them, just click the :symbols-delete: icon yourself after it does the hard work of selecting everything.

## :symbols-server:&ensp;Server-Side Setup 
&emsp;&emsp;&ensp;*ZimaOS NAS*

**Goal:**
:   Replicate "Live Albums" and generate the Nest Hub interface.

### :services-docker:&ensp;Docker Compose Snippet

Add these services to your existing Immich stack or a new stack.

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "immich-frame.yaml"
```

1. The Interface *(Displays the clock / weather / photos)*
2. Link to the auto-album below
3. The Logic *(Auto-adds faces to the specific album)*
4. `SYNC_MODE=1` adds new photos automatically.

### :symbols-image:&ensp;Auto Album Config

Place this in the same folder as your docker-compose file.

```json {title="config.json" linenums="1" .mono-title}
--8<-- "immich-frame-config.json"
```

## :symbols-web:&ensp;Network & Cloudflare

**Goal:**
:   Allow Nest Hubs to load the frame securely.

1. **Tunnel:** 
    + Point `frame.rac3r4life.online` to `http://<ZIMAOS_NAS_IP>:8081` using the [Cloudflare](../03_Services/Cloudflared.md) tunnel.
2. **WAF Rules *(Critical)*:**
    + **Go to:**&ensp;Cloudflare Dashboard&ensp;:symbols-arrow-right-thin:&ensp;Security&ensp;:symbols-arrow-right-thin:&ensp;WAF&ensp;:symbols-arrow-right-thin:&ensp;Custom Rules
    + **Create Rule:**&ensp;If Hostname equals `frame.rac3r4life.online`&ensp;:symbols-arrow-right-thin:&ensp;**Skip** "Super Bot Fight Mode" and "Managed Challenge"
        + _Why:_ Prevents the Nest Hub from hitting a "Verify you are human" screen.

## :symbols-home-automation:&ensp;Automation 
&emsp;&emsp;&ensp;*Home Assistant on Pi 4*

**Goal:**
:   Force Nest Hub to show the frame when idle.

**Prerequisite:** 
:   Install "DashCast" add-on in [Home Assistant](../03_Services/Home_Assistant.md).

**Automation YAML:**

```yaml {title="/home-assistant-container/automations.yaml" linenums="1" .mono-title}
--8<-- "ha-automations.yaml"
```