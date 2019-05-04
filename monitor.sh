mon=`xrandr | grep " connected" | awk '{print $1}' | dmenu`

opts="--auto \n --off"
mode=`echo -e $opts | dmenu`

if [ $mode = "--off" ]; then
    xrandr --output $mon $mode
else
    pos=" --left-of \n --right-of \n --above \n --below \n --same-as"
    pos_sel=`echo -e $pos | dmenu`
    pos_target=`xrandr | grep " connected" | awk '{print $1}' | dmenu`

    xrandr --output $mon $mode $pos_sel $pos_target
fi
