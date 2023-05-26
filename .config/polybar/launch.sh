#!/bin/bash

# Terminate already runnning bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [[ $m == "eDP1" ]]; then
      MONITOR=$m polybar --reload main &
    else
      MONITOR=$m polybar --reload external &
    fi
  done
else
  polybar --reload external &
fi
xdo lower -N Polybar

# Launch bar
#polybar main &
