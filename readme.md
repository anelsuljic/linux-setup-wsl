# Linux WSL setup repository

This repository contains the instructions to set up arch linux on WSL 2, as well as scripts that automatize the post-setup.


To install arch linux on WSL, it is necessary to execute `wsl --install archlinux`. After that, initialize arch linux and follow the following instructions:


1. Set up your users:
    - Set up root password: `passwd`.
    - Add personal user: `useradd -m -g users -G wheel <username>`.
    - Add a password for your personal user: `passwd <username>`.
    - Install `sudo` package and uncomment the line `%wheel ALL=(ALL:ALL) ALL` from `/etc/sudoers`.
    - Add the following content at `/etc/wsl.conf`: 
        ```bash
        [user]
        default=vfxanel
        ```

2. Set up your locale:
    - Edit the file `/etc/locale.gen` and uncomment the locale you want.
    - Execute `locale-gen`.


3. Clone this repository and execute `bash setup.sh`. Note that you will need to have `yay` package preinstalled.
