#!/bin/bash

# ~~~ Configuration ~~~

SOURCES=(
    "/mnt/overlay"
    "/DATA/.casaos"
    "/DATA/.extensions"
    "/DATA/.icewhale"
)
DEST="/media/Quick-Storage/Backup/ZimaOS"
LOG_FILE="/DATA/.log/system-bkp.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
GOTIFY_URL="https://gotify.rac3r4life.online/message"
GOTIFY_TOKEN="zimaos-app-token"

# Ensure the destination and log directories exist
mkdir -p "$DEST"
mkdir -p "$(dirname "$LOG_FILE")"

# Print status to terminal & log
echo "[$TIMESTAMP] Starting ZimaOS config backup..." | tee -a "$LOG_FILE"

# Initialize exit code variable
EXIT_CODE=0

# ~~~ The Rsync Loop ~~~

{
    for SOURCE in "${SOURCES[@]}"; do
        echo "Syncing $SOURCE..."
        rsync -av --progress --delete "$SOURCE" "$DEST"

        # Capture exit code of the current `rsync` command
        CURRENT_EXIT=$?
        if [ $CURRENT_EXIT -ne 0 ]; then
            EXIT_CODE=$CURRENT_EXIT
            echo "Error: Rsync failed for $SOURCE with code$CURRENT_EXIT"
            break # Stop processing further directories on failure
        fi
    done
} >> "$LOG_FILE" 2>&1

# Update the TIMESTAMP variable
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Report Status based on captured code
if [ $EXIT_CODE -eq 0 ]; then
    MSG="[$TIMESTAMP] Backup completed successfully."
    GOTIFY_TITLE="ZimaOS Config Backup: Success"
    GOTIFY_PRIORITY=4
else
    MSG="[$TIMESTAMP] Backup **FAILED** with exit code $EXIT_CODE."
    GOTIFY_TITLE="ZimaOS Config Backup: FAILED"
    GOTIFY_PRIORITY=8
fi

# Print `$MSG` to terminal & log
echo "$MSG" | tee -a "$LOG_FILE"

# ~~~ Gotify Notification ~~~

# Send push notification
curl -sS -X POST "$GOTIFY_URL" \
    -H "X-Gotify-Key: $GOTIFY_TOKEN" \
    -F "title=$GOTIFY_TITLE" \
    -F "message=$(hostname):$MSG" \
    -F "extras={\"client::display\": {\"contentType\": \"text/markdown\"}}" \
    -F "priority=$GOTIFY_PRIORITY" > /dev/null

# Log that the notification was attempted
echo "[$TIMESTAMP] Gotify notification triggered." | tee -a "$LOG_FILE"
