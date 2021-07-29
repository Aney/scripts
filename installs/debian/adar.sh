#!/bin/bash

# Aney's Debian Auto Ricer
# Downloads the rest of my scripties, and runs what is wanted
# Currently needs to be hosted on a server (done so that I can test)
# i.e. Basic install, Server, Desktop nogui, Desktop gui, 

SERVER="192.168.1.112/debian"
INSTALL_TYPE=""

# If the user isn't root. Don't run.
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

if [ $1 == "server"] || [ $1 == "desktop" ]
then
	$INSTALL_TYPE = $1
else
	$INSTALL_TYPE = "desktop"
fi

# Download the scripts
# TODO: Install scripts from git
#apt install git
#git clone https://github.com/aney/scripts/
# Delete the git repo that was created

mkdir adar_scripts

wget -O adar_scripts/debian_base.sh $SERVER/debian_base.sh
if [ $INSTALL_TYPE == "server" ]
then
	wget -O adar_scripts/debian_server.sh $SERVER/debian_server.sh
else
	wget -O adar_scripts/debian_desktop.sh $SERVER/debian_desktop.sh
	wget -O adar_scripts/debian_gui.sh $SERVER/debian_gui.sh
	wget -O adar_scripts/debian_unfinished.sh $SERVER/debian_unfinished.sh
fi

bash adar_scripts/debian_base.sh
if [ $INSTALL_TYPE == "server" ]
then
	bash adar_scripts/debian_server.sh
else
	bash adar_scripts/debian_desktop.sh
	bash adar_scripts/debian_gui.sh
	bash adar_scripts/debian_unfinished.sh
fi

