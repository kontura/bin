
ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

lemonbar -d -g 80x20+$((SW - 130))+$((10)) -p 
