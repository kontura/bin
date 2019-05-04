#!/bin/sh
#
# z3bra - 2014 (c) wtfpl
# toggle the fullscreen state of a window
# depends on: focus.sh

# this file is used to store the previous geometry of a window
FSFILE=${FSFILE:-/tmp/geometry_$1}

# it's pretty simple, but anyway...
usage() {
    echo "usage: $(basename $0) <wid>"
    exit 1
}

# exit if no argument given
test -z "$1" && usage

mon1=$(xrandr --current | grep " connected" | egrep -o '[0-9]+x[0-9]+\+[0-9]+\+[0-9]+' | sed 's/+/x/g' | tail -1)
mon2=$(xrandr --current | grep " connected" | egrep -o '[0-9]+x[0-9]+\+[0-9]+\+[0-9]+' | sed 's/+/x/g' | head -1)
IFS='x' read -a mon1_array <<< "$mon1"
IFS='x' read -a mon2_array <<< "$mon2"
mon1_full_dims="$((${mon1_array[2]})) $((${mon1_array[3]})) ${mon1_array[0]} ${mon1_array[1]}"
mon2_full_dims="${mon2_array[2]} ${mon2_array[3]} ${mon2_array[0]} ${mon2_array[1]}"

# this will unset the fullscreen state of any fullscreen window if there is one.
# this way, there will only be one window in fullscreen at a time, and no window
# will loose their previous geometry info
#test -f $FSFILE && wtp $(cat $FSFILE)

# if file exist and contain our window id, it means that our window is in
# fullscreen mode
if test -f $FSFILE && grep -q $1 $FSFILE; then
    # if the window we removed was our window, delete the file, so we can
    # fullscreen it again later 
    if test "$(wattr xywh $1)" = "$mon1_full_dims" && test "$mon1_full_dims" != "$mon2_full_dims"; then
      wtp $mon2_full_dims $1
      return
    else
      wtp $(cat $FSFILE)
      rm -f $FSFILE
    fi

else
    # if not, then put the current window in fullscreen mode, after saving its
    # geometry and id to $FSFILE we also remove any border from this window.
    chwb -s 0 $1
    wattr xywhi $1 > $FSFILE
    wtp $mon1_full_dims $1
    #wtp $(wattr xywh `lsw -r`) $1
fi

# now focus the window, and put it in front, no matter which state we're in, and
# put the cursor on its bottom-right corner (for consistency)
focus.sh $1
