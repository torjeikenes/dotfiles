#! /bin/sh
if (xrandr | grep "HDMI1 connected" > /dev/null)
then
	mons -e right &
	bspc monitor HDMI1 -d 1 2 3 4 5 
	bspc monitor eDP1 -d 6 7 8 9 10
else
    mons -o &
	bspc monitor eDP1 -d 1 2 3 4 5 6 7 8 9 
    bspc monitor DP1 -d 10
fi

$HOME/.config/polybar/launch.sh &


