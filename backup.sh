#!/bin/bash
#setting variables

BACKUP_SRC="/root/group2/"
BACKUP_DST="/backups1"
BACKUP_DATE=$(date +%Y%m%d%H%M%S)
BACKUP_FILENAME="backup.gz.tar"

mkdir -p "$BACKUP_DST/$BACKUP_DATE"
#archive the source directory

tar -cvf "$BACKUP_FILENAME" "$BACKUP_SRC"

#verify the backup was created successful
#
if [ $? = 0 ]; then
        echo "backup successful"
else
        echo "backup failed"
fi
~                   
