#!/bin/bash

IN="eDP-1"
EXT="VGA-1"

xrandr --output $EXT --auto
xrandr --output $IN --auto --below $EXT

