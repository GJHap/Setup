#!/bin/bash

./pacman-install.sh
cp -r greetd /etc/greetd

./rust-install.sh
./systemd-enable.sh
./snap-install.sh
