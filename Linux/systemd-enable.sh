#!/bin/bash

systemctl enable cups.service \
   avahi-daemon.service \
   greetd.service \
   bluetooth.service \
   ufw.service

ufw enable
