#!/bin/bash

cp dunst ~/.config
cp fish ~/.config
cp ../oh-my-posh/oh-my-posh-config.json ~/.config/fish
cp foot ~/.config
cp greetd/* /etc/greetd
cp ../nvim ~/.config
cp sway ~/.config
cp waybar ~/.config
cp wlogout ~/.config
cp wofi ~/.config

pacman -S cups avahi \
     bluez \
     pavucontrol pipewire pipewire-pulse pamixer \
     wofi waybar sway swayidle swaylock \
     tlp \
     foot \
     thunderbird \
     thunar \
     fzf \
     ripgrep \
     archlinux-wallpaper \
     git \
     base-devel \
     man-db \
     rustup \
     python \
     nodejs npm \
     fish \
     exa \
     flatpak \
     grim slurp \
     gimp \
     dunst \
     libreoffice-still \
     ufw \
     firejail \
     usbguard \
     firefox
    
rustup update stable

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
    wlogout

flatpak install spotify

systemctl enable cups.service \
    greetd.service \
    bluetooth.service \
    ufw.service

ufw enable
