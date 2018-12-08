#!/bin/bash

IN="eDP-1"
EXT="VGA-1"

if (xrandr | grep "$EXT disconnected"); then
  xrandr --output $EXT --off --output $IN --auto
else
  xrandr --output $IN --off --output $EXT --auto
  xrandr --output $EXT --primary
fi

