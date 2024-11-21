#!/bin/bash

#Check media plater status
media_staus=$(playerctl -a status 2>/dev/null | grep -v "No players" | grep -E "Playing|Paused")
if [[ -z $media_status ]]; then
	swaylock -f -c 000000
else
	echo "Media is playing. Screen will not lock."
fi
