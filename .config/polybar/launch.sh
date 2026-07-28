#!/bin/sh

DIR="$HOME/.config/polybar/forest/"

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q main -c "$DIR"/config.ini &

if [[ $(xrandr -q | grep "HDMI1 connected" | cut -d ' ' -f1) ]]; then
    polybar -q main-external -c ~/.config/polybar/forest/config.ini &
fi 

