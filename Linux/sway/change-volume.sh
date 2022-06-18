#!/bin/bash

get_volume_bar_character_count() {
   echo $(python -c "import sys;volume=float(sys.argv[1]);character_count=round(volume/5);print(character_count);" $1)
}

get_volume_bar() {
   character_count=$(get_volume_bar_character_count $1)
   echo $(printf "%${character_count}s" | sed 's/ /━/g')
}

pamixer $@

volume=$(pamixer --get-volume)
volume_bar=$(get_volume_bar $volume)

remaining_volume=$((100-$volume))
remaining_volume_bar=$(get_volume_bar $remaining_volume)

is_mute=$(pamixer --get-mute)
icon='audio-on'

if [ $is_mute == true ] || [ $volume == 0 ]; then
   icon='audio-off'
fi

dunstify -a "change-volume" -h string:x-dunst-stack-tag:audio -i $icon -u low "" "<span color='#FFFFFF'>$volume_bar</span><span color='gray'>$remaining_volume_bar</span>"
