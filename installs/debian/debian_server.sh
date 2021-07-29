# This install script is for a debian based distro
# It's assumed that it's a minimal install with at least debian_base

# Download and install debian_base?

# Network Monitoring
apt install bmon nload

# For laptops
# Prevent the laptop from shutting down when the lid is down
sudo sh -c 'echo "HandleLidSwitch=ignore" >> /etc/systemd/logind.conf' && sudo shutdown -r now
