#!/bin/sh

# (1)!
TOKEN="YourGotifyToken"
URL="https://gotify.yourdomain.com/message?token=$TOKEN"
TITLE="Router Alert: WAN IP Changed"
MESSAGE="The public WAN IP has been updated to: $1"  # (2)!

curl -s -X POST "$URL" \
  -F "title=$TITLE" \
  -F "message=$MESSAGE" \
  -F "priority=6" > /dev/null
