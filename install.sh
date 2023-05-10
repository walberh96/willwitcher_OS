#Install all the packages needed after the base install
#All the repositories downloaded from Github will be in the .gitRepos folder

#CHANGE INTO THE REPOS FOLDER
cd .gitRepos

#INSTALL PACKAGES
sudo pacman -S --needed firefox
kitty
picom
bspwm
polybar
rofi
sxhkd
htop
btop
neofetch
git
nitrogen
arandr
blanket
blueman
nemo
gimp
krita
cups
okular
wine
lutris
steam
ranger
vlc
xorg-xsetroot
xorg-xrandr
lxapppearance
flameshot
kdenlive
signal-desktop
telegram-desktop
micro
virt-manager
sddm
sxiv
zsh
curl
rofi-emoji
dunst
cronie
udisks2
udiskie
bluez
bluez-utils
rofi-calc
networkmanager
wpa-supplicant
libreoffice-still
xclip
xsel
#NVIDIA PACKAGES
nvidia
nvidia-utils 
lib32-nvidia-utils
nvidia-settings
vulkan-icd-loader
lib32-vulkan-icd-loader
nvidia-prime
#AMD PACKAGES
lib32-mesa
vulkan-radeon
lib32-vulkan-radeon 
vulkan-icd-loader 
lib32-vulkan-icd-loader
#LUTRIS LIBRARIES
giflib
lib32-giflib 
libpng 
lib32-libpng 
libldap 
lib32-libldap 
gnutls 
lib32-gnutls
mpg123 
lib32-mpg123 
openal 
lib32-openal 
v4l-utils 
lib32-v4l-utils 
libpulse 
lib32-libpulse 
libgpg-error
lib32-libgpg-error
alsa-plugins 
lib32-alsa-plugins 
alsa-lib 
lib32-alsa-lib 
libjpeg-turbo 
lib32-libjpeg-turbo
sqlite 
lib32-sqlite 
libxcomposite 
lib32-libxcomposite 
libxinerama 
lib32-libgcrypt 
libgcrypt 
lib32-libxinerama
ncurses 
lib32-ncurses 
ocl-icd 
lib32-ocl-icd 
libxslt 
lib32-libxslt 
libva 
lib32-libva 
gtk3
lib32-gtk3 
gst-plugins-base-libs 
lib32-gst-plugins-base-libs 
vulkan-icd-loader 
lib32-vulkan-icd-loader
#VIRTUAL MACHINE 
qemu 
virt-manager 
virt-viewer 
dnsmasq 
vde2 
bridge-utils 
openbsd-netcat
libguestfs
#INSTALL OH-MY-ZSH (ZSH PLUGIN MANAGER)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#INSTALL MICRO TEXT EDITOR PLUGINS
micro -plugin install lsp
micro -plugin install fzf
micro -plugin install jump
micro -plugin install filemanager
micro -plugin install snippets


#CLONE REPOS FOR YAY AUR PACKAGE MANAGER AND BRILLO

git clone https://gitlab.com/cameronnemo/brillo.git
git clone https://aur.archlinux.org/yay.git