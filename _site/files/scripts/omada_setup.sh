#!/bin/bash

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

echo "Updating system packages..."
apt update && apt upgrade -y

# Add export path to the end of root's bashrc
echo "Updating root's PATH in .bashrc..."
echo 'export PATH=/sbin:/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin' >> /root/.bashrc

# Reload bash settings
echo "Reloading bash settings..."
source /root/.bashrc

# Install required packages
echo "Installing required packages..."
apt install -y openjdk-17-jre-headless curl jsvc wget

# Download and install OpenSSL library
echo "Installing OpenSSL library..."
wget http://ftp.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_amd64.deb -O libssl.deb
dpkg -i libssl.deb && rm libssl.deb

# Download and install MongoDB
echo "Installing MongoDB..."
wget https://repo.mongodb.org/apt/debian/dists/buster/mongodb-org/4.4/main/binary-amd64/mongodb-org-server_4.4.29_amd64.deb -O mongodb.deb
dpkg -i mongodb.deb && rm mongodb.deb

# Enable and start MongoDB service
echo "Enabling and starting MongoDB service..."
systemctl enable mongod
systemctl start mongod

# Download and install Omada SDN Controller
echo "Installing Omada SDN Controller..."
wget https://static.tp-link.com/upload/software/2024/202411/20241101/Omada_SDN_Controller_v5.14.32.3_linux_x64.deb -O omada.deb
dpkg -i omada.deb && rm omada.deb

echo "All tasks completed successfully!"

