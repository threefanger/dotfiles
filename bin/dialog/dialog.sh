#d! /bin/bash
#-g 110x30+1790+50

. /home/anon/bin/panel_colors

/home/anon/bin/dialog/fan.sh | lemonbar -g 110x60+1790+50 -f "Cantarell:size=12" -f "Material Icons:size=15" -f "FontAwesome:size=15" -F "$COLOR_FOREGROUND" -B "$COLOR_BACKGROUND"
