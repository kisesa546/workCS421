#!/bin/bash

SOURCE_DIR="/home/ubuntu/app"
DATE=$(date +%F)
TARGET_DIR="/home/ubuntu/backups"
BACKUP_FILE="$TARGET_DIR/api_backup_$DATE.tar.gz"
LOG_FILE="/var/log/backup.log"

mkdir -p "$TARGET_DIR"

if tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" . ; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCCESS: Backup created at $BACKUP_FILE" >> "$LOG_FILE"
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: Failed to create backup from $SOURCE_DIR" >> "$LOG_FILE"
  exit 2
fi

find "$TARGET_DIR" -name "api_backup_*.tar.gz" -mtime +7 -exec rm -f {} \;