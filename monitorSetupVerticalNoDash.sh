#!/bin/bash

IN="eDP1"
EXT="HDMI1"

xrandr --output $EXT --auto
xrandr --output $IN --auto --below $EXT

