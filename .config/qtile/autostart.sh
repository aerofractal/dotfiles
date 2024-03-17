#!/bin/bash

####################################################
#      _____ _ _         _       _          _            _
#  __ |_   _(_) |___    /_\ _  _| |_ ___ __| |_ __ _ _ _| |_
# / _` || | | | / -_)  / _ \ || |  _/ _ (_-<  _/ _` | '_|  _|
# \__, ||_| |_|_\___| /_/ \_\_,_|\__\___/__/\__\__,_|_|  \__|
#    |_|
# -
# by Noah Ramsey (noah@rdmusic.net)
####################################################

# Sleep for a moment, to allow X to boot and monitors to come online.
sleep 2

# Set monitor layout, and load the XRDB.

xrandr --output DP-0 --pos 0x0 --output DP-4 --pos 1920x0 --primary --output DP-2 --pos 1920x-1440 &
xrdb /home/aerofractal/.Xresources &

####################################################
# SESSION SERVICES
####################################################

dbus-update-activation-environment --all &
gnome-keyring-daemon --start --components=secrets &

####################################################
# WALLPAPER & COMPOSITOR
####################################################

feh --bg-fill /home/aerofractal/Downloads/1310857.jpg /home/aerofractal/Downloads/1209158.jpg /home/aerofractal/Downloads/1329927.jpeg &
picom --config ~/.config/picom/picom.conf &

####################################################
# TRAY, BAR & NOTIFICATION SERVICE
####################################################

trayer --edge top --align right --distance 4 --margin 4 --widthtype percent --width 8 --heighttype pixel --height 32 --SetDockType true --SetPartialStrut true --expand true --padding 14 --monitor primary --tint 0x282a2e --alpha 0 --transparent true --iconspacing 16 &
dunst &
polybar &

###################################################
# APPLICATIONS
###################################################

emacs --daemon &
