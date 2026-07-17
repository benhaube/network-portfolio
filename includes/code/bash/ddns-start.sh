#!/bin/sh

# --- Update myaddr.tools DDNS ---
IP="$1"  # (2)!
KEY="MYADDR_KEY"  # (3)!

curl -s -d "key=$KEY" -d "ip=$IP" https://myaddr.tools/update > /dev/null

DDNS_STATUS=$?

# --- Send Gotify notification ---
# (1)!
TOKEN="YourGotifyToken"
URL="https://gotify.yourdomain.com/message?token=$TOKEN"

TITLE="Router Alert: WAN IP Changed / DDNS Updated"
MESSAGE="The public WAN IP has been updated to: $IP"

curl -s -X POST "$URL" \
  -F "title=$TITLE" \
  -F "message=$MESSAGE" \
  -F "priority=6" > /dev/null

# --- Send success signal to router ---
if [ $DDNS_STATUS -eq 0 ]; then
    /sbin/ddns_custom_updated 1
else
    /sbin/ddns_custom_updated 0
fi