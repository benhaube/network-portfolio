#!/bin/bash

# (1)!
TOKEN="YourGotifyToken"
URL="https://gotify.rac3r4life.online/message?token=$TOKEN"

mkdir -p /DATA/backups && tar -czf /DATA/backups/appdata_"$(date +%Y%m%d_%H%M%S)".tar.gz -C /DATA AppData

if [ $? -eq 0 ]; then
  curl -s -X POST "$URL" -F "title=AppData Backup" -F "message=The AppData directory backup has been completed successfully." -F "priority=4" > /dev/null
else
  curl -s -X POST "$URL" -F "title=AppData Backup: FAILED" -F "message=The AppData directory backup has FAILED. Check the logs." -F "priority=8" > /dev/null
fi