---
hide:
  - toc
---
![[google-photos.svg|150]]&nbsp;![[arrow-right-bold.svg|100]]&nbsp;![[immich.svg|150]]

# [[Immich_Slideshow_for_Nest_Hub|Project Migration: Google Photos --> Self-Hosted Ecosystem]]

> [!info]
> **User:** Ben Haube | **Date:** Feb 5, 2026<br>
> **Infrastructure:** [[ZimaBoard_2_NAS|ZimaOS NAS]] *([[Immich]])*, [[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]] *([[Home_Assistant]], [[Cloudflared]] Tunnel)*

---

## :material-broom: Phase 1: Cleaning Google Photos
> [!info] Goal
> Delete cloud data without losing local files.

1.  **Safety First *(Mobile)*:**
    * Uninstall Google Photos App OR Turn OFF "Backup & Sync".
    * Install **Fossify Gallery** *(via F-Droid)* for local viewing.

        [Fossify Gallery :simple-fdroid:](https://f-droid.org/en/packages/org.fossify.gallery/){ .md-button }

2.  **Deletion *(Desktop)*:**
    * **Manual:** Go to photos.google.com, :material-mouse-left-click-outline: first photo, scroll down, ++shift++ + :material-mouse-left-click-outline: last photo, ++del++.
    * **Console Script *(Advanced)*:** Open Chrome DevTools ++f12++ --> Console. Paste script to auto-select/delete. 
3.  **Finalize:** Empty "Trash/Bin" to reclaim storage.

### :material-file-code-outline: Photo Cleaning Script

```javascript title="Javascript" linenums="1"
// Function to delete photos (1)
async function deletePhotos() {
    const deleteSelector = "button[aria-label='Delete']";
    const moveToTrashSelector = "span[text()='Move to trash']"; // May vary based on region/language

    // Select all photos currently loaded in view
    // Note: You might need to manually scroll down to load more if this only grabs the first batch
    const checkboxes = document.querySelectorAll("div[role='checkbox']");
    
    if (checkboxes.length === 0) {
        console.log("No photos found or all selected.");
        return;
    }

    console.log(`Selecting ${checkboxes.length} photos...`);
    checkboxes.forEach(box => box.click());

    // Wait a moment for UI to update
    await new Promise(r => setTimeout(r, 2000));

    // Click the delete button
    const deleteBtn = document.querySelector(deleteSelector);
    if (deleteBtn) {
        deleteBtn.click();
        console.log("Clicked Delete button.");
        
        // Wait for confirmation dialog
        await new Promise(r => setTimeout(r, 2000));
        
        // Confirm deletion (This part is tricky as the selector changes often)
        // You might need to click "Move to trash" manually if this fails
        const confirmBtn = document.evaluate("//span[contains(text(), 'Move to trash')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
        
        if (confirmBtn) {
            confirmBtn.click();
            console.log("Confirmed move to trash.");
        } else {
            console.log("Could not find confirmation button. Please click 'Move to Trash' manually.");
        }
    }
}

deletePhotos();
```

1. If the script selects them but doesn't delete them, just click the :material-trash-can-outline: icon yourself after it does the hard work of selecting everything.

---

## :material-dns: Phase 2: Server-Side Setup *(ZimaOS NAS)*
> [!info] Goal
> Replicate "Live Albums" and generate the Nest Hub interface.

### :material-docker: Docker Compose Snippet
Add these services to your existing Immich stack or a new stack.

```yaml title="docker-compose.yml" linenums="1"
services:
  # 1. The Interface (Displays the clock/weather/photos)
  immich_frame:
    image: ghcr.io/immichframe/immichframe:latest
    container_name: immich_frame
    environment:
      - IMMICH_URL=http://<ZIMABOARD_IP>:2283
      - API_KEY=<YOUR_IMMICH_API_KEY_FOR_FRAME>
      - SLIDESHOW_DURATION=60
      - SHOW_CLOCK=true
      - SHOW_WEATHER=true
      - WEATHER_LOCATION=Owings Mills, MD
      - ALBUM_UIDS=<UUID_OF_NESTHUB_ALBUM>  # Link to the auto-album below
    ports:
      - 8081:8080
    restart: always

  # 2. The Logic (Auto-adds faces to the specific album)
  immich_auto_album:
    image: ghcr.io/alangrainger/immich-person-to-album:latest
    container_name: immich_auto_album
    environment:
      - IMMICH_URL=http://<ZIMABOARD_IP>:2283
      - API_KEY=<YOUR_IMMICH_API_KEY_FOR_SYNC>
      - SYNC_MODE=1  # 1 = Add new photos automatically
    volumes:
      - ./config.json:/app/config.json
    restart: always
```

### :material-file-image: Auto Album Config
Place this in the same folder as your docker-compose file.

```json title="config.json" linenums="1"
{
  "albums": [
    {
      "id": "<UUID_OF_NESTHUB_ALBUM>",
      "people": [
        "<PERSON_UUID_BEN>",
        "<PERSON_UUID_PARTNER>",
        "<PET_UUID_MAX>",
        "<PET_UUID_BANDIT>"
      ]
    }
  ]
}
```

---

## :material-wan: Phase 3: Network & Cloudflare
> [!info] Goal
> Allow Nest Hubs to load the frame securely.

1. **Tunnel:** Point `frame.rac3r4life.online` to `http://<ZIMAOS_NAS_IP>:8081`
2. **WAF Rules *(Critical)*:**
    * Go to Cloudflare Dashboard --> Security --> WAF --> Custom Rules.
    * **Create Rule:** If Hostname equals `frame.rac3r4life.online` --> **Skip** "Super Bot Fight Mode" and "Managed Challenge".
        * _Why:_ Prevents the Nest Hub from hitting a "Verify you are human" screen.

---

## :material-home-automation: Phase 4: Automation *(Home Assistant on Pi 4)*
> [!info] Goal
> Force Nest Hub to show the frame when idle.

**Prerequisite:** Install "DashCast" add-on in [[Home_Assistant|Home Assistant]].

**Automation YAML:**

```yaml linenums="1"
alias: "Living Room Frame Manager"
trigger:
  - platform: state
    entity_id: media_player.living_room_display
    to: "off"
  - platform: state
    entity_id: media_player.living_room_display
    to: "idle"
    for: "00:01:00"
action:
  - service: media_player.play_media
    target:
      entity_id: media_player.living_room_display
    data:
      media_content_id: "[https://frame.rac3r4life.online](https://frame.rac3r4life.online)"
      media_content_type: "url"
      extra:
        metadata:
          title: "Immich Frame" 
```
