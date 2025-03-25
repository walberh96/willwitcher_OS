#!/bin/bash

# Update the system and install necessary dependencies
sudo pacman -S --needed --noconfirm git base-devel

# Clone the yay repository from AUR
cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $(whoami):$(whoami) yay

# Build and install yay
cd yay
makepkg -si --noconfirm

# Clean up
cd ..
rm -rf yay

echo "yay has been installed successfully."