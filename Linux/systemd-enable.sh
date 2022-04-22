#!/bin/bash

systemctl enable cups.service \
    greetd.service \
    bluetooth.service \
    ufw.service \
    snapd.apparmor.service

systemctl enable --now snapd.socket

ufw enable
