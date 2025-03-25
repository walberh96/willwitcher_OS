#!/bin/bash

# Update package database and upgrade all packages
yay -Syu

# List of programs to install
programs=(
    nb
    godot-git
    unityhub
    betterlockscreen-git
)

# Install each program
for program in "${programs[@]}"; do
    yay -S --noconfirm "$program"
done

echo "All programs have been installed successfully."