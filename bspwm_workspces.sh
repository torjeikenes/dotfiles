#! /bin/sh

MODE=$1
s1="d"


echo $MODE

if (xrandr | grep "HDMI1 connected" > /dev/null)
then
    if [ "$MODE" = "d" ]
    then
        mons -d &
        xinput --set-prop 9 271 1.0
    else
        bspc monitor HDMI1 -d 1 2 3 4 5 
        bspc monitor eDP1 -d 6 7 8 9 10
        xinput --set-prop 9 271 2.0
        if [ "$MODE" = "r" ]
        then
            mons -e right &
        else
            mons -e left &
        fi
    fi
elif (xrandr | grep "DP2 connected" > /dev/null)
then
    if [ "$MODE" == "d" ]
    then
        echo "hei hei"
        mons -d &
        xinput --set-prop 9 271 1.0
    else
        bspc monitor eDP1 -d 1 2 3 4 5 6 7 8 9 
        bspc monitor DP2 -d 10
        xinput --set-prop 9 271 2.5
        if [ "$MODE" = "r" ]
        then
            mons -e right &
        else
            mons -e left &
        fi
    fi
else
    mons -o &
	bspc monitor eDP1 -d 1 2 3 4 5 6 7 8 9 
    bspc monitor DP1 -d 10
    xinput --set-prop 9 271 1.0
fi

$HOME/.config/polybar/launch.sh &


