#!/bin/sh

# Change your username/password, or at least the password
# sudo passwd raspberrypi

# Updates
apt update && apt upgrade -y

# Useful Installs
apt install vim tmux git htop ufw wget curl -y

# Start pre-installed SSH server
systemctl enable --now ssh

# Firewall
systemctl enable --now ufw
ufw enable
ufw default deny incoming
ufw default allow outgoing

# Expose Ports
ufw allow 22 # Default SSH port
ufw allow 80 # Default http port
ufw allow 443 # Default https port

# Docker (Safe bet for multiple services)
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Docker Portainer
docker volume create portainer_data

docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

echo "Go to :9000 for this device, and check if portainer is installed"

# Docker nginx
docker run --name aney.co.uk -v ~/website/:/usr/share/nginx/html:ro -d nginx

