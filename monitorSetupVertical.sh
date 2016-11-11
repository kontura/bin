#!/bin/bash

IN="eDP-1"
EXT="HDMI-1"

xrandr --output $EXT --auto
xrandr --output $IN --auto --below $EXT

