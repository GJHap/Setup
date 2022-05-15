#!/bin/bash

./pacman-install.sh
cp -r greetd/* /etc/greetd
cp -r kanshi /etc/greetd/
cp dunst/*.png /usr/share/icons

./rust-install.sh
./systemd-enable.sh
