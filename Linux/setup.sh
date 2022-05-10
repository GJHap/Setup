#!/bin/bash

./user-setup.sh
sudo ./system-setup.sh
chsh -s $(which fish)
