#!/bin/bash

systemctl enable cups.service \
    greetd.service \
    bluetooth.service \
    ufw.service

ufw enable
