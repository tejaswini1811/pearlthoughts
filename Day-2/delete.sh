#!/bin/bash
# Write a bash script to Delete temporary files or logs older than a certain date to free up disc space by removing unnecessary files.
# Directory to search for files to delete
SEARCH_DIR="file.txt"

# Define the threshold date (in days)
DAYS_THRESHOLD=1

# Find and delete files older than the threshold date
find "$SEARCH_DIR" -type f -mtime +$DAYS_THRESHOLD -exec rm {} \;

# Print the number of deleted files
echo "Deleted $(find "$SEARCH_DIR" -type f -mtime +$DAYS_THRESHOLD | wc -l) files."
