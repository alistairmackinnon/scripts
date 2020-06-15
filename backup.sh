#!/bin/bash

date=$(date +'%Y%m%d')
backup_mount="/Volumes/BackUp"
device_name="ali_mini"

if mount | grep "on $backup_mount" > /dev/null; then
    for dir in Downloads Documents Photos Desktop dev 
    do
        rsync -rtb --exclude='venv/' --backup-dir=Archive/$date --delete /Users/ali/$dir $backup_mount/$device_name
        echo "$date rsync backup complete for $dir"
    done
else
    echo  "$date - Backup Volume not mounted"
fi
