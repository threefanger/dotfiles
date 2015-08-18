#! /bin/bash

/home/anon/.fehbg &
xsetroot -cursor_name left_ptr &
compton &
exec pulseaudio --start &
panel | bash &
exec synapse -s &
sxhkd -f 100 &
exec dbus-launch bspwm 
exec pulseaudio --kill
exec kill -9 -1
