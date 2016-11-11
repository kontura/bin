#!/bin/bash

#files=(~/usr/pictures/wallpapers/desaturated/*.*)
files=(~/usr/pictures/wallpapers/*.png)
pic="${files[RANDOM % ${#files[@]}]}"
#colors -en 32 ${pic} | sed '9,24p;d' | toXrdb.sh | shuf | xrdb -override
W=`identify ${pic} | cut -f 3 -d " " | sed s/x.*//` #width
H=`identify ${pic} | cut -f 3 -d " " | sed s/.*x//` #height

if [ "$H" -gt "300" ]; then
  hsetroot -center  ${pic}
else
  hsetroot -fill  ${pic}
fi


