#!/bin/bash

BACKUP=/mnt/usb-backup
# Backup Documents
rdiff-backup \
	~/documents \
$BACKUP/backup/documents

# Backup Pictures, ex. screenshots
rdiff-backup \
	--exclude ~/pictures/screenshots \
	~/pictures \
$BACKUP/backup/pictures

# Backup git repo (in case of forgotten pushes)
rdiff-backup \
	~/git \
$BACKUP/backup/git

touch $BACKUP/backup/rdiff-backup_time

# Backup ISOs (don't keep historical data)
rsync -azP --delete ~/ISOs $BACKUP/ISOs

# Backup music (don't keep historical data)
rsync -azP --delete ~/music $BACKUP/music

