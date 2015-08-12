#! /bin/bash

/home/anon/.fehbg &
xsetroot -cursor_name left_ptr &
compton &
panel &
sxhkd -f 100 &
exec bspwm 
exec kill -9 -1
