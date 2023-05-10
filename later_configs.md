## run this to enable battery notifications
crontab -e
## add this line to create the cronjob
*/5 * * * * /home/$USER/.local/bin/batterynotify.sh

## run this to make brillo work for every user

cd .gitRepos/brillo
make
sudo make install.setgid

## enable your user to use VIRT MANAGER
sudo micro /etc/libvirt/libvirtd.conf

## Set the UNIX domain socket group ownership to libvirt, (around line 85)

unix_sock_group = "libvirt"

Set the UNIX socket permissions for the R/W socket (around line 102)

unix_sock_rw_perms = "0770"

## Add your user account to libvirt group.

sudo usermod -a -G libvirt $(whoami)
newgrp libvirt

## Restart libvirt daemon.

sudo systemctl restart libvirtd

## INSTALL AND CONFIGURE VM FOR GPU passthrough
## WORKING ON THE GUIDE :)