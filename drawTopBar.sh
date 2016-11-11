ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

lemonbar -d -g $((SW/4*3))x24+$(((SW-SW/4*3)/2))+$((10)) -p -B "#1a1a1a" 
