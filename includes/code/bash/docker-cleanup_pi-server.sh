#!/bin/bash

TOKEN="gotify-app-token"
URL="https://gotify.rac3r4life.online/message?token=$TOKEN"

# Export the `server-admin` user's Docker config
export DOCKER_CONFIG=/home/admin/.docker

# Capture the command output and the exit code
OUTPUT=$(docker system prune -af 2>&1)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
  # Extract the reclaimed space string
  RECLAIMED_SPACE=$(echo "$OUTPUT" | grep "Total reclaimed space:" | sed 's/Total reclaimed space: //')

  # Fallback just in case the output format changes or is empty
  if [ -z "$RECLAIMED_SPACE" ]; then
    RECLAIMED_SPACE="0B"
  fi

  MESSAGE="Docker Cleanup successfully removed unused images, containers, and volumes."$'\n\n'"Total reclaimed space: $RECLAIMED_SPACE"

  curl -s -X POST "$URL" \
    -F "title=Docker Cleanup" \
    -F "message=$MESSAGE" \
    -F "priority=4" > /dev/null
else
  curl -s -X POST "$URL" \
    -F "title=Docker Cleanup: FAILED" \
    -F "message=Docker Cleanup has FAILED. Check the systemd logs on the server." \
    -F "priority=8" > /dev/null
fi