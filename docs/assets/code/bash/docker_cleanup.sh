#!/bin/bash

# (1)!
TOKEN="YourGotifyToken"
URL="https://gotify.rac3r4life.online/message?token=$TOKEN"

docker system prune -af --volumes 2>&1

if [ $? -eq 0 ]; then
  curl -s -X POST "$URL" -F "title=Docker Cleanup" -F "message=Docker Cleanup has successfully removed unused images, containers and volumes." -F "priority=4" > /dev/null
else
  curl -s -X POST "$URL" -F "title=Docker Cleanup: FAILED" -F "message=Docker Cleanup has FAILED. Check the logs." -F "priority=8" > /dev/null
fi