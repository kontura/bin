#!/bin/sh

WID=$1
WW=$(wattr w $WID)
WH=$(wattr h $WID)

WW=$(($WW/40*40-1))
WH=$(($WH/40*40-1))

ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SW=1920
SH=$(wattr h $ROOT)

centerX=$(((SW - WW)/80*40+1))
centerY=$(((SH - WH)/80*40+1))

wtp  $centerX $centerY $WW $WH $WID
