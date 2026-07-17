#!/bin/sh

# (1)!
TOKEN="YourGotifyToken"
URL="https://gotify.yourdomain.com/message?token=$TOKEN"

# (2)!
/jffs/addons/backupmon/backupmon.sh -now > /dev/null 2>&1

# (3)!
if [ $? -eq 0 ]; then
  curl -s -X POST "$URL" -F "title=Backupmon" -F "message=Router backup completed successfully." -F "priority=4" > /dev/null
else
  curl -s -X POST "$URL" -F "title=Backupmon FAILED" -F "message=Router backup failed! Check logs." -F "priority=8" > /dev/null
fi