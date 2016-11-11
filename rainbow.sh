#!/bin/sh
#
# z3bra - 2015 (c) wtfpl
# make the current window "rainbowish"... Awesome idea from xero@nixers.net !

FREQ=${FREQ:-0.1}
COLORS="ffffff f2f2f2 e6e6e6 d9d9d9 cccccc bfbfbf b3b3b3 a6a6a6 999999 8c8c8c 808080 8c8c8c 999999 a6a6a6  b3b3b3 bfbfbf cccccc d9d9d9 e6e6e6 f2f2f2"
CUR=$(pfw)

while :; do
    for c in $COLORS; do
        chwb -c $c -s 4 $(pfw) 
        sleep $FREQ
    done
done
