#!/bin/bash
#Write a bash script that automates the process of creating backups for specified files and directories. Backups should happen on a daily basis.
# Source directories/files to be backed up
SOURCE_DIRS=(
    "floder1"

    # Add more source paths as needed
)

# Destination directory for backups
DEST_DIR="backup"

# Create backup filename using current date
BACKUP_FILENAME="$(date +%Y%m%d)_backup"

# Create backup directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Create backup using tar
tar czf "$DEST_DIR/$BACKUP_FILENAME" "${SOURCE_DIRS[@]}"

# Print backup status
if [ $? -eq 0 ]; then
    echo "Backup created successfully: $DEST_DIR/$BACKUP_FILENAME"
else
    echo "Backup creation failed"
fi
