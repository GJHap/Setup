#!/bin/bash

pamixer $@

volume=$(pamixer --get-volume)
volume_bar_character_count=$((volume / 5))
volume_bar=$(printf "%${volume_bar_character_count}s" | sed 's/ /━/g')

remaining_volume=$((100-$volume))
remaining_volume_bar_character_count=$((remaining_volume / 5))
remaining_volume_bar=$(printf "%${remaining_volume_bar_character_count}s" | sed 's/ /━/g')

is_mute=$(pamixer --get-mute)
icon='audio-on'

if [ $is_mute == true ] || [ $volume == 0 ]; then
   icon='audio-off'
fi

dunstify -a "change-volume" -h string:x-dunst-stack-tag:audio -i $icon -u low "" "<span color='#FFFFFF'>$volume_bar</span><span color='gray'>$remaining_volume_bar</span>"
