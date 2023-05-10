#!/bin/bash

if virsh -c qemu:///system list --name | grep -q '^win10$'; then
    echo "Virtual machine is running. Shutting down..."
    virsh -c qemu:///system shutdown win10
else
    echo "Virtual machine is not running. Starting..."
    virsh -c qemu:///system start win10
fi

# Wait for the virtual machine to fully start up
sleep 10

# Check if the looking-glass-client process is already running
if pgrep -x "looking-glass-client" >/dev/null; then
    echo "Looking Glass is already running. Exiting..."
else
    echo "Starting Looking Glass..."
    looking-glass-client -m 97 -F
fi
