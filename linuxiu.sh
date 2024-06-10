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

# Enable the services
echo "Enabling the services..."
cp betterlockscreen@.service /usr/lib/systemd/system/
systemctl --user enable betterlockscreen@$USER
systemctl --user enable bluetooth
systemctl --user enable cups
systemctl --user enable udiskie

# Make the folders for the config files
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
mkdir -p ~/.config/picom
mkdir -p ~/.config/kitty
mkdir -p ~/.config/polybar

# Create the Polybar launch script and make it executable

# Create the Polybar launch script
cat <<EOF > ~/.config/polybar/launch.sh
#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch wbar
echo "---" | tee -a /tmp/wbar1.log
polybar wbar 2>&1 | tee -a /tmp/wbar1.log & disown

echo "Wbar Launched"
EOF

# Make it executable
chmod +x ~/.config/polybar/launch.sh

# Download the config files from github
wget https://github.com/walberh96/willwitcher_OS/tree/master/configs/bspwmrc
wget https://github.com/walberh96/willwitcher_OS/tree/master/configs/config.ini
wget https://github.com/walberh96/willwitcher_OS/tree/master/configs/dunstrc
wget https://github.com/walberh96/willwitcher_OS/tree/master/configs/kitty.conf
wget https://github.com/walberh96/willwitcher_OS/tree/master/configs/sxhkd

# Move the config files to the right path
mv bspwmrc ~/.config/bspwm/
mv config.ini ~/.config/polybar/
mv dunstrc ~/.config/dunst/
mv kitty.conf ~/.config/kitty/
mv sxhkdrc ~/.config/sxhkd/

# Download the fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
unzip Hack.zip
mv Hack /usr/share/fonts/

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip
unzip NerdFontsSymbolsOnly.zip
mv NerdFontsSymbolsOnly /usr/share/fonts/

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip
unzip Meslo.zip
mv Meslo /usr/share/fonts/

read -p "Do you want to install /home on a separate drive? (Y/N): " install_home
if [[ "$install_home" == "Y" ]]; then
    # Prompt user to select the NVMe drive to use as /home
    echo "Available NVMe drives:"
    lsblk -d -o NAME,SIZE,MODEL | grep nvme

    # Get user input for the NVMe drive
    read -p "Enter the NVMe drive to use as /home (e.g., nvme0n1): " selected_nvme

    # Confirm the selected drive
    echo "You have selected $selected_nvme as the new /home drive."
    read -p "Are you sure you want to format and use this drive as /home? (Y/N): " confirm

    if [[ "$confirm" == "Y" ]]; then
        # Format the selected NVMe drive
        echo "Formatting $selected_nvme..."
        sudo mkfs.ext4 /dev/$selected_nvme

        # Mount the new /home temporarily to copy data
        echo "Mounting the new drive temporarily..."
        sudo mount /dev/$selected_nvme /mnt/new_home

        # Copying existing /home to the new /home
        echo "Copying existing /home directory to the new /home directory..."
        sudo rsync -aXS --exclude='/*/.gvfs' /home/. /mnt/new_home/.

        # Unmount the temporary mount
        echo "Unmounting the temporary /home directory..."
        sudo umount /mnt/new_home

        # Update /etc/fstab to mount the new /home permanently
        echo "Updating /etc/fstab to mount the new /home directory permanently..."
        echo "UUID=$(sudo blkid -s UUID -o value /dev/$selected_nvme) /home ext4 defaults 0 2" | sudo tee -a /etc/fstab

        # Remount all to apply changes
        echo "Remounting all partitions to apply changes..."
        sudo mount -a

        echo "New /home directory setup complete."
    else
        echo "Operation cancelled."
    fi
fi

# Make a wallpapers folder and download the wallpapers
mkdir ~/Wallpapers
cd ~/Wallpapers
#Background
wget https://github.com/walberh96/willwitcher_OS/tree/master/wallpapers/background.jpeg
mv ~/Wallpapers/background.jpeg ~/Wallpapers/wallpaper1.jpeg
#LockScreen
wget https://github.com/walberh96/willwitcher_OS/tree/master/wallpapers/lockscreen.png
mv ~/Wallpapers/lockscreen.png ~/Wallpapers/lockscreen.png
#Browser
wget https://github.com/walberh96/willwitcher_OS/tree/master/wallpapers/browser.jpg
mv ~/Wallpapers/browser.jpg ~/Wallpapers/browser_wallpaper.jpg

betterlockscreen -u ~/Wallpapers/lockscreen.png

# Set the rofi theme
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh` lvg-0/.`

# Create the power menu desktop entry
echo "Creating desktop entry for power menu..."
cat > ~/.local/share/applications/powermenu.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Power Menu
Exec=$HOME/.config/rofi/scripts/powermenu_t2.sh
Icon=system-shutdown
Categories=Utility;
EOF
echo "Desktop entry created successfully."

# GRUB INSTALL
# Download GRUB THEME
wget https://github.com/walberh96/willwitcher_OS/tree/master/wrub_theme.zip
unzip wrub_theme.zip
# INSTALL THE THEME
cd wrub_theme
./install.sh
# DELETE FILES 
cd ..
rm -rf wrub_theme
rm -rf wrub_theme.zip
# Additional configurations can be added below
echo "System configuration completed successfully!"

# TODO
# 5. Make an utility for changing the background and for all the things in the desktop
# WILLWITCHER OS MOD
# mejorar el tema de la polybar, agregar modulos y hacer las funcionalidades de notificaciones, bluetooth, output switcher, input switcher, screen mirroring script functionality


