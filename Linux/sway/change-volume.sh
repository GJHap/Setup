#!/bin/bash

pamixer $@

volume=$(pamixer --get-volume)
is_mute=$(pamixer --get-mute)
icon='audio-on'

if [ $is_mute == true ] || [ $volume == 0 ]; then
   icon='audio-off'
fi

bar=$(seq -s "━" $(($volume / 5)) | sed 's/[0-9]//g')

dunstify -a "change-volume" -h string:x-dunst-stack-tag:audio -i $icon -u low "" "<span>$bar</span>"
