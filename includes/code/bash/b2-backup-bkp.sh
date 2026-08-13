#!/bin/bash

# Define B2 variables
SOURCE="/media/Quick-Storage/Backup"
DEST="B2-Crypt:ZimaOS-NAS-Backup/Quick-Storage/Backup"
LOGFILE="/var/log/rclone-b2-backup.log"
# (1)!
GOTIFY_TOKEN="gotify_app_token"
GOTIFY_URL="https://gotify.rac3r4life.online/message?token=$GOTIFY_TOKEN"

# Execute native rclone sync
# (2)!
rclone sync $SOURCE $DEST \
  --fast-list \
  --transfers 16 \
  --b2-hard-delete \
  --retries 5 \
  --low-level-retries 15 \
  --timeout 2m \
  --log-file=$LOGFILE \
  --log-level INFO \
  2>&1

# Send Gotify notification
if [ $? -eq 0 ]; then
  curl -s -X POST "$GOTIFY_URL" -F "title=Network Devices Backup" -F "message=The Backup directory backup has been completed successfully." -F "priority=4" > /dev/null
else
  curl -s -X POST "$GOTIFY_URL" -F "title=Network Devices Backup: FAILED" -F "message=The Backup directory backup has FAILED. Check the logs." -F "priority=8" > /dev/null
fi
