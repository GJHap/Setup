#!/bin/bash

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -S greetd greetd-gtkgreet  \
   brother-mfc-j4335dw \
   nvim-packer-git \
   brillo \
   clipman \
   wlogout  \
   sway-audio-idle-inhibit-git \
   kanshi-git
