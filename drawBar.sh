
ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

lemonbar -p -g 200x40+$((SW - 320))+$((40)) -B$(get_xrdb_resource *color1:) -F#ffffff -u100 -f "lucy tewi2" -R#000000 -r1
