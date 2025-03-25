#!/bin/bash

echo "Welcome to Willwitcher OS:"
echo "1. Install Programs"
echo "2. Install yay"
echo "3. Install yay apps"
echo "4. Exit"

read -p "Enter your choice [1-4]: " choice

case $choice in
    1)
        chmod +x ./install_programs.sh
        ./install_programs.sh
        ;;
    2)
        chmod +x ./install_yay.sh
        ./install_yay.sh
        ;;
    3)
        chmod +x ./install_yay_apps.sh
        ./install_yay_apps.sh
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid option. Please select a valid option."
        ;;
esac
