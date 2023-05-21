#!/bin/bash
sudo pacman -S --needed firefox kitty picom bspwm polybar rofi 
sudo pacman -S --needed sxhkd btop neofetch git nitrogen
sudo pacman -S --needed arandr blanket blueman gimp krita
sudo pacman -S --needed cups okular lutris steam ranger
sudo pacman -S --needed xorg-xsetroot xorg-xrandr lxappearance
sudo pacman -S --needed flameshot kdenlive signal-desktop 
sudo pacman -S --needed telegram-desktop micro sxiv zsh
sudo pacman -S --needed curl rofi-emoji dunst cronie udisks2 
sudo pacman -S --needed udiskie bluez bluez-utils rofi-calc
sudo pacman -S --needed wpa_supplicant libreoffice-still
sudo pacman -S --needed xclip xsel gnome-boxes
sudo pacman -S --needed nvidia nvidia-utils lib32-nvidia-utils 
sudo pacman -S --needed nvidia-settings vulkan-icd-loader 
sudo pacman -S --needed lib32-vulkan-icd-loader nvidia-prime
sudo pacman -S --needed lib32-mesa vulkan-radeon 
sudo pacman -S --needed lib32-vulkan-radeon 
sudo pacman -S --needed vulkan-icd-loader 
sudo pacman -S --needed lib32-vulkan-icd-loader
sudo pacman -S --needed giflib lib32-giflib libpng 
sudo pacman -S --needed lib32-libpng libldap lib32-libldap gnutls 
sudo pacman -S --needed lib32-gnutls mpg123 lib32-mpg123 openal 
sudo pacman -S --needed lib32-openal v4l-utils lib32-v4l-utils 
sudo pacman -S --needed libpulse lib32-libpulse libgpg-error
sudo pacman -S --needed lib32-libgpg-error alsa-plugins 
sudo pacman -S --needed lib32-alsa-plugins alsa-lib 
sudo pacman -S --needed lib32-alsa-lib libjpeg-turbo 
sudo pacman -S --needed lib32-libjpeg-turbo sqlite lib32-sqlite 
sudo pacman -S --needed libxcomposite lib32-libxcomposite 
sudo pacman -S --needed libxinerama lib32-libgcrypt libgcrypt 
sudo pacman -S --needed lib32-libxinerama ncurses lib32-ncurses 
sudo pacman -S --needed ocl-icd lib32-ocl-icd 
sudo pacman -S --needed libxslt lib32-libxslt libva lib32-libva 
sudo pacman -S --needed gtk3 lib32-gtk3 gst-plugins-base-libs 
sudo pacman -S --needed lib32-gst-plugins-base-libs 
sudo pacman -S --needed vulkan-icd-loader lib32-vulkan-icd-loader
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
micro -plugin install lsp
micro -plugin install fzf
micro -plugin install jump
micro -plugin install filemanager
micro -plugin install snippets

: << 'COMMENT'
mkdir -p /home/willwitcher/gitRepos/ && git clone --recursive https://gitlab.com/cameronnemo/brillo.git /home/willwitcher/gitRepos/
mkdir -p /home/willwitcher/gitRepos/ && git clone --recursive https://aur.archlinux.org/yay.git /home/willwitcher/gitRepos/
cd /home/willwitcher/gitRepos/yay/
makepkg -si
cd
mkdir -p /home/willwitcher/.config/bspwm
mkdir -p /home/willwitcher/.config/sxhkd
mkdir -p /home/willwitcher/.config/polybar
mkdir -p /home/willwitcher/.config/picom
mkdir -p /home/willwitcher/.config/kitty
mkdir -p /home/willwitcher/.config/ranger

mkdir -p /home/willwitcher/.icons
mkdir -p /home/willwitcher/.themes
mkdir -p ~/.local/share/rofi/themes
mkdir -p /home/willwitcher/.fonts
mkdir -p ~/.local/bin

yay -S betterlockscreen envycontrol noto-color-emoji-fontconfig nb
yay -S web-greeter-theme-shikai
yay -S gradience
yay -S vscodium-bin

ranger --copy-config=all

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo pacman -S --needed obs-studio nemo nemo-extensions

mkdir -p /home/willwitcher/wallpapers
cp -r wallpapers/* ~/wallpapers/
cp -r .fonts/* ~/.fonts/

betterlockscreen -u wallpapers/lockScreen.png

cp -r .local/share/rofi/themes/rounded-common.rasi ~/.local/share/rofi/themes/
cp -r .local/share/rofi/themes/rounded-purple-dark.rasi ~/.local/share/rofi/themes/
cp -r .local/bin/* ~/.local/bin/
cp -r usr/share/applocations/* /usr/share/applications/

systemctl enable bluetooth
systemctl enable wpa_supplicant
systemctl enable cronie

COMMENT
