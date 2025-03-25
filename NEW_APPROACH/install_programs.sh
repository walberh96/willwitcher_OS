#!/bin/bash

# List of programs to install
programs=(
    kitty
    firefox
    gimp
    vlc
    neofetch
    btop
    git
    curl
    wget
    feh
    picom
    flameshot
    ranger
    neovim
    lxappearance
    timeshift
    steam
    lutris
    discord
    intellij-idea-community-edition
    pycharm-community-edition
    udiskie
    rofi
    blueman
    xorg-xsetroot
    arandr
    fzf
    zed
    lsd
    bat
    zsh
    zip
    unzip
)

# Install each program
for program in "${programs[@]}"; do
    sudo pacman -S --noconfirm $program
done

echo "All programs have been installed successfully."