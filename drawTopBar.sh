ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

lemonbar -d -g $((SW-4))x36+2+2 -p -B "#1a1a1a" 
