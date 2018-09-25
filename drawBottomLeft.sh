ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

lemonbar -f 7x14:size=30 -g 200x24+240+$((SH-100))
