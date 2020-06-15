#!/bin/bash
# Bash script to check if a backup volume is mounted & use rsync to back up if it is present...


# Set the date for the archive folder
date=$(date +'%Y%m%d')
# Mount Point for the backup drive
backup_mount="/Volumes/BackUp"
# Which device is it running on? Allows multiple devices
device_name="ali_mini"
# Define Directories to backup
dirs="Downloads Documents Photos Desktop dev"

# Check if backup volume is mounted
if mount | grep "on $backup_mount" > /dev/null; then
    # Backupo each folder independently to allow us to be selective over what gets backed up
    for dir in $dirs 
    do
        rsync -rtb --exclude='venv/' --backup-dir=Archive/$date --delete /Users/ali/$dir $backup_mount/$device_name
        echo "$date rsync backup complete for $dir"
    done
else
    echo  "$date - Backup Volume not mounted"
fi
