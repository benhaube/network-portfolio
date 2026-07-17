#!/bin/bash
# Auth hook to add the ACME challenge via myaddr.tools API

# (1)!
MY_KEY="YOUR_KEY_HERE"

# (2)!
CHALLENGE_VALUE="$CERTBOT_VALIDATION"

curl -s -X POST "https://myaddr.tools/update" \
     -d "key=$MY_KEY" \
     -d "acme_challenge=$CHALLENGE_VALUE"

sleep 10