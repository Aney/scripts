# Pass arguments. ie. 192.168.1.112, rpi3.local, or website.co.uk
SERVER=$1

# Backup Documents
rdiff-backup \
	~/documents \
$SERVER::/home/nathan/BACKUP/documents

# Backup Pictures, ex. screenshots (for now)
rdiff-backup \
	--exclude ~/pictures/screenshots \
	~/pictures \
$SERVER::/home/nathan/BACKUP/pictures

# Backup git repo (in case of forgotten pushed)
rdiff-backup \
	~/git \
$SERVER::/home/nathan/BACKUP/git

