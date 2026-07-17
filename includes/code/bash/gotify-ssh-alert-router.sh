#!/bin/sh

# (1)!
if [ -n "$SSH_CONNECTION" ]; then
  CLIENT_IP=$(echo "$SSH_CONNECTION" | awk '{print $1}')  # (2)!
  
  # (3)!
  TOKEN="YourNewAppTokenHere"
  URL="https://gotify.yourdomain.com/message?token=$TOKEN"
  TITLE="Router Login: $(uname -n)"
  MESSAGE="Successful SSH login to router from IP: $CLIENT_IP"
  
  # (4)!
  curl -s -X POST "$URL" \
    -F "title=$TITLE" \
    -F "message=$MESSAGE" \
    -F "priority=7" > /dev/null
fi