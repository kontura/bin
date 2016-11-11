#!/bin/bash

IN="eDP1"
EXT="VGA1"
EXT2="HDMI1"

if (xrandr | grep "$EXT disconnected"); then
  xrandr --output $EXT --off --output $IN --auto
elif (xrandr | grep "$EXT2 disconnected"); then
  xrandr --output $EXT --off --output $IN --auto
else
  xrandr --output $IN --off --output $EXT --auto
fi
