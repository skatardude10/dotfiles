#!/bin/bash

## my own rsync-based snapshot-style backup procedure
## (cc) marcio rps AT gmail.com

# config vars

SRC="/" #dont forget trailing slash!
SNAP="/mnt/Storage-Backup/System-Backup-Snapshots"
OPTS="-rltgAoi --delay-updates --delete --chmod=a-w"
MINCHANGES=10

# run this process with real low priority

ionice -c 3 -p $$
renice +12  -p $$

notify-send "Starting System Backup from $SRC to $SNAP"

# sync

rsync $OPTS --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/Storage-Backup/*","/mnt/Data/win10.raw","/mnt/Extra/win10-extra-disk.img","/media/*","/lost+found"} $SRC $SNAP/latest >> $SNAP/rsync.log

notify-send "Backup Sync Complete!"

# check if enough has changed and if so
# make a hardlinked copy named as the date

notify-send "Finishing up backup..."

COUNT=$( wc -l $SNAP/rsync.log|cut -d" " -f1 )
if [ $COUNT -gt $MINCHANGES ] ; then
        DATETAG=$(date +%Y-%m-%d)
        if [ ! -e $SNAP/$DATETAG ] ; then
                cp -al $SNAP/latest $SNAP/$DATETAG
                chmod u+w $SNAP/$DATETAG
                mv $SNAP/rsync.log $SNAP/$DATETAG
               chmod u-w $SNAP/$DATETAG
         fi
fi

notify-send "Complete! $COUNT New Items in latest. See $SNAP/rsync.log"
