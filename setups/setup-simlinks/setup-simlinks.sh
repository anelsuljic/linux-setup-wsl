#!/bin/bash

printf '\n\n\n\n\n%*s\n' 40 '' | tr ' ' '-'
read -p "Do you want to set up symbolic links? [y/n]: " choice
printf '%*s\n\n\n\n\n\n' 40 '' | tr ' ' '-'

[[ "$choice" != "y" ]] && exit 0

# Prerrequisites
sudo pacman -S --needed xdg-user-dirs
xdg-user-dirs-update

FSTAB_LINE="G: /mnt/g drvfs defaults 0 0"

echo "Creating simbolic link for google drive directory ..."
sudo mkdir -p /mnt/g
sudo mount --onlyonce -t drvfs G: /mnt/g

[[ -d $HOME/Documents/gdrive ]] && rm -rf $HOME/Documents/gdrive
ln -sf /mnt/g/My\ Drive /home/$USER/Documents/gdrive

! grep -qF "$FSTAB_LINE" "/etc/fstab" && \
echo -e "\n# Google Drive" | sudo tee -a "/etc/fstab" &> /dev/null && \
echo -e "$FSTAB_LINE" | sudo tee -a "/etc/fstab" &> /dev/null

# echo "Be sure to add the following line at /etc/fstab: G: /mnt/g drvfs defaults 0 0"

echo -e "\n\n\nCreating simbolic link for downloads directory ..."
[[ -d $HOME/Downloads/ ]] && rm -rf $HOME/Downloads
ln -sf /mnt/c/Users/$USER/Downloads $HOME/Downloads
