#!/bin/bash

./pacman-install.sh
cp greetd/* /etc/greetd
cp -r kanshi /etc/greetd/

./rust-install.sh
./systemd-enable.sh
