bg=$(xrdb -query | grep background | awk '{print $NF}')
 rofi -color-normal "$bg, #fff, $bg, #fff, #000"  -separator-style none -color-window "$bg, #fff" -hide-scrollbar "$@"
