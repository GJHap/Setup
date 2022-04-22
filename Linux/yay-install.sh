#!/bin/bash

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -S greetd greetd-gtkgreet  \
    oh-my-posh-git \
    brother-mfc-j4335dw \
    neovide-git nvim-packer-git \
    brillo \
    clipman \
    wlogout \
    snapd

