#!/bin/bash

IN="eDP1"
EXT="HDMI1"

if (xrandr | grep "$EXT disconnected"); then
  xrandr --output $EXT --off --output $IN --auto
  synclient TouchpadOff=0
else
  xrandr --output $IN --off --output $EXT --auto
  xrandr --output $EXT --primary
  synclient TouchpadOff=1
fi

