# Unbind EFI Framebuffer                                                    ─╯
#sudo echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Unload NVIDIA kernel modules
sudo modprobe -r nvidia_drm nvidia_modeset nvidia_uvm nvidia


# Detach GPU devices from host
# Use your GPU and HDMI Audio PCI host device
#sudo virsh nodedev-detach pci_0000_01_00_0
#sudo virsh nodedev-detach pci_0000_01_00_1

# Load vfio module
sudo modprobe vfio-pci
