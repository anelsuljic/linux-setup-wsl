#!/bin/bash

printf '\n\n\n\n\n%*s\n' 40 '' | tr ' ' '-'
read -p "Do you want to set up symbolic links? [y/n]: " choice
printf '%*s\n\n\n\n\n\n' 40 '' | tr ' ' '-'

[[ "$choice" != "y" ]] && exit 0


echo "Creating simbolic link for google drive directory ..."
sudo mkdir -p /mnt/g
sudo mount -t drvfs G: /mnt/g
ln -s /mnt/g/My\ Drive /home/vfxanel/gdrive
echo "Be sure to add the following line at /etc/fstab: G: /mnt/g drvfs defaults 0 0"