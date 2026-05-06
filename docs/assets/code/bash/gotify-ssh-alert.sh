#!/bin/bash

# (1)!
if [ "$PAM_TYPE" != "open_session" ]; then
    exit 0
fi

# (2)!
TOKEN="YourAppTokenHere"
URL="https://gotify.yourdomain.com/message?token=$TOKEN"
TITLE="SSH Login Alert: ${PAM_USER}@$(hostname)"
MESSAGE="User '${PAM_USER}' successfully logged in via '${PAM_SERVICE}' from IP: '${PAM_RHOST}'."

# (3)!
curl -s -X POST "$URL" \
    -F "title=$TITLE" \
    -F "message=$MESSAGE" \
    -F "priority=7" >/dev/null
