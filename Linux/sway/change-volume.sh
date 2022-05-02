#!/bin/bash

pamixer $@

volume=$(pamixer --get-volume)
is_mute=$(pamixer --get-mute)
icon=''
rise='4pt'

if [ $is_mute == true ] || [ $volume == 0 ]; then
   icon='婢'
   rise='6.75pt'
fi

bar=$(seq -s "━" $(($volume / 5)) | sed 's/[0-9]//g')
body="<span size='200%'>$icon</span>    <span rise='$rise' weight='heavy'>$bar</span>"
dunstify "" "$body" -u low -a "change-volume" -h string:x-dunst-stack-tag:audio
