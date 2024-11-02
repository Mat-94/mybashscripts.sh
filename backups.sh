#!/bin/bash

# Automated Backup Script for /home Directory
# Author: Mathias
# Description: sample outline to create backup
# Date: [Today's Date]

# --- Configuration ---
SOURCE_DIR="/home"                     # Directory to back up
BACKUP_DIR="/var/backups"              # Directory where backups are stored
RETENTION_DAYS=7                       # Number of days to keep backups

# --- Script Variables ---
TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')             # Timestamp format for the backup file
BACKUP_FILE="${BACKUP_DIR}/home_backup_${TIMESTAMP}.tar.gz" # Backup filename

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# --- Step 1: Create a compressed backup of the source directory ---
echo "Starting backup of ${SOURCE_DIR}..."
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

if [ $? -eq 0 ]; then
    echo "Backup created successfully: ${BACKUP_FILE}"
else
    echo "Backup failed!" >&2
    exit 1
fi

# --- Step 2: Remove backups older than the retention period ---
echo "Cleaning up backups older than ${RETENTION_DAYS} days..."
find "$BACKUP_DIR" -type f -name "home_backup_*.tar.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "Old backups cleaned up."

# --- Step 3: Logging the backup process ---
LOG_FILE="/var/log/backup_script.log"
echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup of ${SOURCE_DIR} completed. File: ${BACKUP_FILE}" >> "$LOG_FILE"

echo "Backup process complete."

