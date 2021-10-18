#!/bin/bash

if [ -z "$1" ]
then
    files=(~/Pictures/*/*)
    pic="${files[RANDOM % ${#files[@]}]}"
else
    pic="$1"
fi


#files=(~/usr/pictures/wallpapers/desaturated/*.*)
#files=(~/usr/pictures/wallpapers/wide/*)
#colors -en 32 ${pic} | sed '9,24p;d' | toXrdb.sh | shuf | xrdb -override
#W=`identify ${pic} | cut -f 3 -d " " | sed s/x.*//` #width
#H=`identify ${pic} | cut -f 3 -d " " | sed s/.*x//` #height

#if [ "$W" -gt "1920" ]; then
#  hsetroot -tile  ${pic}
#else
pkill swaybg
swaybg -i ${pic} &
sleep 1s
/home/amatej/usr/src/notesbg/build/swaybg --image /home/amatej/usr/todo --mode left &
#fi


