#! /bin/bash

# xrandr only works in X11 sessions, not Wayland
[ "$XDG_SESSION_TYPE" = x11 ] || exit 0
xrandr --output DVI-I-1 --auto --right-of HDMI-0
xrandr --output DVI-I-1 --rotate left

