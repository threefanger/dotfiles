#!/bin/bash
#
. panel_colors

icon_mute=''
icon_full=''
icon_rest=''
icon_phones=''

volume=$(amixer sget Master | sed -n "0,/.*\[\([0-9]\+\)%\].*/s//\1/p")
icon=$icon_rest

if [ $volume -eq 0 ]; then
	icon=$icon_mute
elif [ $volume -gt 25 ]; then
	icon=$icon_full
fi

echo "V%{F$COLOR_ICON}$icon%{F-} $volume%%{F$COLOR_ICON}$phones%{F-}%{A}"
