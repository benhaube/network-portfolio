#!/bin/bash

# (1)!
TOKEN="YourGotifyToken"
URL="https://gotify.rac3r4life.online/message?token=$TOKEN"

find /tmp -type f -mtime +7 -delete

if [ $? -eq 0 ]; then
  curl -s -X POST "$URL" -F "title=Temp Files Cleanup" -F "message=Temp files greater than 7 days old have been deleted." -F "priority=4" > /dev/null
else
  curl -s -X POST "$URL" -F "title=Temp Files Cleanup: FAILED" -F "message=Temp Files Cleanup has FAILED. Check the logs." -F "priority=8" > /dev/null
fi