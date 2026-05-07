#!/bin/sh

# (1)!
TOKEN="YourGotifyToken"
URL="https://gotify.yourdomain.com/message?token=$TOKEN"

EVENT_TYPE="$1"
TIMESTAMP="$2"

# (2)!
TITLE="Connmon Alert: $(uname -n)"
PRIORITY=5
MESSAGE=""

case "$EVENT_TYPE" in
    PingTestFailed)
        PRIORITY=8
        TITLE="WAN Disconnected"
        MESSAGE="Ping test failed to target: $3 at $TIMESTAMP."
        ;;
    PingTestOK)
        PRIORITY=4
        TITLE="WAN Restored"
        MESSAGE="Connection restored at $TIMESTAMP. Ping: $3 | Jitter: $4 | Latency: $5."
        ;;
    PingThreshold)
        PRIORITY=6
        TITLE="High Ping Alert"
        MESSAGE="Ping ($3) exceeded threshold ($4) at $TIMESTAMP."
        ;;
    JitterThreshold)
        PRIORITY=6
        TITLE="High Jitter Alert"
        MESSAGE="Jitter ($3) exceeded threshold ($4) at $TIMESTAMP."
        ;;
    LineQualityThreshold)
        PRIORITY=6
        TITLE="Poor Line Quality"
        MESSAGE="Packet loss/Latency ($3) exceeded threshold ($4) at $TIMESTAMP."
        ;;
    *)
        # (3)!
        MESSAGE="Unknown connmon event: $1 at $2. Data: $3 $4 $5"
        ;;
esac

# (4)!
curl -s -X POST "$URL" \
  -F "title=$TITLE" \
  -F "message=$MESSAGE" \
  -F "priority=$PRIORITY" > /dev/null