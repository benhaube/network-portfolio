#!/bin/bash

# Backup the /home/ directory to the ZimaOS NAS
# GOAL: Pure data backup (No symlinks, no ownership retention)
# Exclusions defined in: /home/bhaube/.bkp-exclude-nas

# --- Configuration ---
SOURCE_DIR="$HOME/"
DEST_DIR="/mnt/storage_server/Quick_Storage/Backup/<client-hostname>/" # (1)!
MOUNT_POINT="/mnt/storage_server/Quick_Storage"
EXCLUDE_FILE="$HOME/.bkp-exclude-nas"
LOG_FILE="$HOME/.var/log/backup_log.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# --- Environment Validation ---
# Ensure log rotation is configured to prevent infinite log growth
LOGROTATE_CONF="/etc/logrotate.d/home-backup"
if [ ! -f "$LOGROTATE_CONF" ]; then
    echo "[$TIMESTAMP] WARNING: Logrotate config not found at $LOGROTATE_CONF." | tee -a "$LOG_FILE"
    echo "[$TIMESTAMP] Logs will grow indefinitely until this is fixed." | tee -a "$LOG_FILE"
fi

# --- Safety Check: Trigger Automount & Verify ---
# Access the mount point to wake up systemd automount
ls "$MOUNT_POINT" > /dev/null 2>&1

# Check if it is actually a mount point
if ! mountpoint -q "$MOUNT_POINT"; then
    echo "[$TIMESTAMP] CRITICAL: NAS is not mounted at $MOUNT_POINT. Backup aborted." | tee -a "$LOG_FILE"
    exit 1
fi

# Ensure the sub-directory exists on the NAS
mkdir -p "$DEST_DIR"

# Print status to terminal & log
echo "[$TIMESTAMP] Starting home directory backup..." | tee -a "$LOG_FILE"

# --- The Rsync Command ---
# -av: Archive mode + increase verbosity
# --progress: Show progress during transfer
# --timeout=60: Sets IO timeout to 60s
# --delete: Remove files on NAS that were deleted from Source
rsync -av --progress --timeout=60 --delete --exclude-from="$EXCLUDE_FILE" "$SOURCE_DIR" "$DEST_DIR" >> "$LOG_FILE" 2>&1

# Capture the exit code immediately
EXIT_CODE=$?

# Update the TIMESTAMP variable
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Report Status based on captured code
if [ $EXIT_CODE -eq 0 ]; then
    MSG="[$TIMESTAMP] Backup completed successfully."
else
    MSG="[$TIMESTAMP] Backup **FAILED** with exit code $EXIT_CODE."
fi

# Print to terminal and append to log
echo "$MSG"
echo "$MSG" >> "$LOG_FILE"