#!/bin/bash

./pacman-install.sh
cp greetd/* /etc/greetd

./rust-install.sh
./systemd-enable.sh
