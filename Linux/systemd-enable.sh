#!/bin/bash

systemctl enable cups.service \
   greetd.service \
   bluetooth.service \
   ufw.service \
   snapd.apparmor.service

systemctl enable snapd.socket
systemctl start snapd.socket

ufw enable
