bg=$(xrdb -query | grep background | awk '{print $NF}')
 rofi -show run  -color-normal "$bg, #fff, $bg, #fff, #000"  -lines 3  -separator-style none -color-window "$bg, #fff" -hide-scrollbar
