#!/bin/bash

BACKUP=/mnt/hdd-backup
# Backup Documents
rdiff-backup \
	~/documents \
$BACKUP/backup/documents

# Backup Books/PDFs
rdiff-backup \
	~/books \
$BACKUP/backup/books

# Backup Pictures
rdiff-backup \
	~/pictures \
$BACKUP/backup/pictures

# Backup git repo (in case of forgotten pushes)
rdiff-backup \
	~/git \
$BACKUP/backup/git

# Backup misc directory
rdiff-backup \
	~/misc \
$BACKUP/backup/misc

touch $BACKUP/backup/rdiff-backup_time

# Backup ISOs (don't keep historical data)
rsync -azP --delete ~/ISOs $BACKUP/ISOs

# Backup music (don't keep historical data)
rsync -azP --delete ~/music $BACKUP/music

# Backup videos (don't keep historical data)
rsync -azP --delete ~/videos $BACKUP/videos

