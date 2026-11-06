#!/bin/bash

BACKUP_DIR="/opt/kuma-backups"

docker stop uptime-kuma

docker run --rm \
  -v kuma-data:/data:ro \
  -v $BACKUP_DIR:/backup \
  alpine tar czf /backup/uptime-kuma-$(date +%Y%m%d).tar.gz -C /data .

docker start uptime-kuma

find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +14 -delete  # (1)!
