#!/bin/sh

# (1)! 
/sbin/dhcpc_lease "$@"

# (2)! 
ACTION=$1
MAC=$2
IP=$3
HOSTNAME=$4

# (3)! 
if [ "$ACTION" = "add" ]; then
    TOKEN="YourGotifyToken"
    GOTIFY_URL="https://gotify.rac3r4life.online/message?token=$TOKEN"

    # (4)!
    if [ -z "$HOSTNAME" ]; then
        HOSTNAME="Unknown"
    fi

    # (5)!
    curl -s -X POST "$GOTIFY_URL" \
        -H "Content-Type: application/json" \
        -d "{
            \"title\": \"New Network Device\",
            \"message\": \"**Hostname:** \`$HOSTNAME\`\n**IP:** \`$IP\`\n**MAC:** \`$MAC\`\",
            \"priority\": 5,
            \"extras\": {
                \"client::display\": {
                    \"contentType\": \"text/markdown\"
                }
            }
        }" > /dev/null 2>&1
fi
