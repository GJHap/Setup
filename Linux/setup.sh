#!/bin/bash

./user-setup.sh
sudo ./system-setup.sh
./flatpak-install.sh
chsh -s $(which fish)
