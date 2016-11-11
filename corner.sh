#!/bin/bash

POSITION=$1

WID=$2
WW=$(wattr w $WID)
WH=$(wattr h $WID)

ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)


case $POSITION in
  tl)
    wtp 10 10 $WW $WH $WID
    ;;
  tr)
    wtp $((SW - 10 - WW)) 10 $WW $WH $WID
    ;;
  bl)
    wtp 10 $((SH - 10 - WH)) $WW $WH $WID
    ;;
  br)
    wtp $((SW - 10 - WW)) $((SH - 10 - WH)) $WW $WH $WID
    ;;
  *)
    echo "tl, tr, bl, bt + WID"
    exit 1
esac

