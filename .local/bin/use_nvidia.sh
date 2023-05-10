#!/bin/bash

# Unload VFIO driver if it is currently loaded
sudo modprobe -r vfio-pci

# Load Nvidia driver
sudo modprobe nvidia
