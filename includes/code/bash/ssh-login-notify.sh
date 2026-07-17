#!/bin/bash

USER="$PAM_USER"
IP="$PAM_RHOST"
HOST=$(hostname)
DATE=$(date)
RECIPIENT="example@example.com"  # (1)!
SUBJECT="🚨 New SSH session started on $HOST 🚨"

BODY="
A new SSH session was successfully established.

User:          ${USER}
User IP Host:  ${IP}
Date:          ${DATE}
Server:        ${HOST}
"

if [ "${PAM_TYPE}" = "open_session" ]; then
    echo -e "Subject: ${SUBJECT}\n\n${BODY}" | msmtp -a default "${RECIPIENT}"
fi

exit 0