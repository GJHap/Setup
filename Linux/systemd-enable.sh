#!/bin/bash

systemctl enable cups.service \
   greetd.service \
   bluetooth.service \
   ufw.service \
   snapd.apparmor.service

systemctl enable --now snapd.socket
sleep 1m # wait for the socket to be running so that ./snap-install.sh can run successfully

ufw enable
