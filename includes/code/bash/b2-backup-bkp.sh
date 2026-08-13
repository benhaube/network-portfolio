#!/bin/bash

# Define variables
JOB_NAME="Devices"
SOURCE="/media/Quick-Storage/Backup"
DEST="B2-Crypt:ZimaOS-NAS-Backup/Quick-Storage/Backup"
LOGFILE="/var/log/rclone-b2-${JOB_NAME,,}.log" 
# (1)!
GOTIFY_TOKEN="gotify_app_token"
GOTIFY_URL="https://gotify.rac3r4life.online/message?token=$GOTIFY_TOKEN"

# Execute native rclone sync
# (2)!
rclone sync "$SOURCE" "$DEST" \
  --fast-list \
  --transfers 16 \
  --b2-hard-delete \
  --retries 5 \
  --low-level-retries 15 \
  --timeout 2m \
  --log-file="$LOGFILE" \
  --log-level INFO \
  --stats-one-line

# Capture the exit code immediately
EXIT_CODE=$?

# Extract the final stats line from the log
if grep -q "Transferred:" "$LOGFILE"; then
  # (3)!
  STATS=$(grep "Transferred:" "$LOGFILE" | tail -n 1 | sed 's/.*Transferred: //')
else
  STATS="No transfer data available. Backup may have been empty or failed."
fi

# Send Gotify notification
if [ $EXIT_CODE -eq 0 ]; then
  # (4)!
  SUCCESS_MSG="The $JOB_NAME directory backup has completed successfully."$'\n\n'"Stats: $STATS"
  
  curl -s -X POST "$GOTIFY_URL" \
    -F "title=$JOB_NAME Backup" \
    -F "message=$SUCCESS_MSG" \
    -F "priority=4" > /dev/null
else
  FAIL_MSG="The $JOB_NAME directory backup has FAILED with exit code $EXIT_CODE. Check $LOGFILE."
  
  curl -s -X POST "$GOTIFY_URL" \
    -F "title=$JOB_NAME Backup: FAILED" \
    -F "message=$FAIL_MSG" \
    -F "priority=8" > /dev/null
fi