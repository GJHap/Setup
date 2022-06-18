#!/bin/bash

systemctl enable cups.service \
   avahi-daemon.service \
   greetd.service \
   bluetooth.service \
   ufw.service \
   tlp.service

ufw enable
