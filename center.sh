#!/bin/sh

WID=$1
WW=$(wattr w $WID)
WH=$(wattr h $WID)

ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

#wtp $(((SW - WW)/2)) $(((SH - WH)/2)) $WW $WH $WID