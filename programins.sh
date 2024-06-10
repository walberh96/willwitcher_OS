#!/bin/bash
#   __  __      __  __   
#  / / /  \    /  \ \ \  
# / /  \   \/\/   /  \ \ 
# \ \   \        /   / / 
#  \_\   \__/\  /   /_/  
#             \/         
#
# WILLWITCHER OS
echo "Starting installation and configuration script..."

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo pacman -Syu --noconfirm

# Install essential programs
echo "Installing essential programs..."
sudo pacman -S --noconfirm vim git base-devel curl wget kitty neofetch htop sxiv zsh cups polybar rofi feh bspwm sxhkd xclip xsel chromium nemo nemo-extensions timeshift neovim lsd bat arandr zip unzip fuse deluge xorg-xbacklight

# Install yay
echo "Installing yay package manager..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Install oh-my-zsh
echo "Installing oh-my-zsh and plugins..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Enabling zsh plugins including sudo plugin..."
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo)/' ~/.zshrc
source ~/.zshrc

# Install desktop utilities
echo "Installing desktop utilities..."
sudo pacman -S --noconfirm flameshot dunst ranger xorg-xsetroot xorg-xrandr lxappearance qt5ct
yay -S --noconfirm betterlockscreen dracula-gtk-theme
# Copy ranger config
ranger --copy-config=all

# Install bluetooth, wifi, and other peripheral utilities
echo "Installing bluetooth, wifi, and other peripheral utilities..."
sudo pacman -S --noconfirm udisks2 udiskie bluez bluez-utils blueman

# Install development tools
echo "Installing development tools..."
sudo pacman -S --noconfirm cmake python-pip 
yay -S --noconfirm vscodium-bin

# Install gaming tools
echo "Installing gaming tools..."
sudo pacman -S --noconfirm steam lutris

# Install Social Media Apps
echo "Installing social media apps..."
sudo pacman -S --noconfirm discord signal-desktop

# Install laptop specific software
read -p "Do you want to install the Asus Laptop specific software? (Y/N): " option
if [[ "$option" == "Y" ]]; then
    echo "Installing laptop-specific programs..."
    sudo pacman -S --noconfirm xf86-input-synaptics
    yay -S --noconfirm rog-control-center
fi
