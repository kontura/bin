#!/bin/sh
#
# z3bra - 2014 (c) wtfpl
# window focus wrapper that sets borders and can focus next/previous window

BW=${BW:-2}                    # border width
ACTIVE=${ACTIVE:-0xffffff} #active border color
INACTIVE=${INACTIVE:-0x0f0f0f}

# get current window id
CUR=$(pfw)
test -z "$CUR" && CUR=$(lsw -r)

usage() {
    echo "usage: $(basename $0) <next|prev|wid>"
    exit 1
}

setborder() {
    ROOT=$(lsw -r)

    # check if window exists
    wattr $2 || return

    mon1=$(xrandr --current | grep " connected" | egrep -o '[0-9]+x[0-9]+\+[0-9]+\+[0-9]+' | sed 's/+/x/g' | tail -1)
    mon2=$(xrandr --current | grep " connected" | egrep -o '[0-9]+x[0-9]+\+[0-9]+\+[0-9]+' | sed 's/+/x/g' | head -1)
    IFS='x' read -a mon1_array <<< "$mon1"
    IFS='x' read -a mon2_array <<< "$mon2"
    mon1_full_dims="${mon1_array[2]} ${mon1_array[3]} ${mon1_array[0]} ${mon1_array[1]}"
    mon2_full_dims="${mon2_array[2]} ${mon2_array[3]} ${mon2_array[0]} ${mon2_array[1]}"
    # do not modify border of fullscreen windows
    test "$(wattr xywh $2)" = "$mon1_full_dims" && return
    test "$(wattr xywh $2)" = "$mon2_full_dims" && return

    test "$(wattr o $2)" && return

    #pid=$(wid_to_pid $2)
    #pts=$(pid_to_pts $pid)
    #inactive_bg=$(get_xrdb_resource "background")
    #active_bg=$(get_xrdb_resource "Window.bg_a")
    case $1 in
        active)   chwb -s $BW -c $ACTIVE $2 
    #              printf "\033]11;$active_bg\007\033]708;$active_bg\007" > /dev/pts/$pts
                  ;;
        inactive) chwb -s 0 -c $INACTIVE $2 
    #              printf "\033]708;$inactive_bg\007\033]11;$inactive_bg\007" > /dev/pts/$pts
                  ;;
    esac
}

case $1 in
    next) wid=$(lsw|grep -v $CUR|sed '1 p;d') ;;
    prev) wid=$(lsw|grep -v $CUR|sed '$ p;d') ;;
    0x*) wattr $1 && wid=$1 ;;
    *) usage ;;
esac


# exit if we can't find another window to focus
test -z "$wid" && echo "$(basename $0): can't find a window to focus" >&2 && exit 1

setborder inactive $CUR # set inactive border on current window
setborder active $wid   # activate the new window
chwso -r $wid           # put it on top of the stack
wtf $wid                # set focus on it

# you might want to remove this for sloppy focus
#wmp -a $(wattr xy $wid) # move the mouse cursor to
#wmp -r $(wattr wh $wid) # .. its bottom right corner
