#!/bin/bash

#files=(~/usr/pictures/wallpapers/desaturated/*.*)
#files=(~/usr/pictures/wallpapers/wide/*)
files=(~/usr/pictures/wallpapers/*)
pic="${files[RANDOM % ${#files[@]}]}"
colors -en 32 ${pic} | sed '9,24p;d' | toXrdb.sh | shuf | xrdb -override
#W=`identify ${pic} | cut -f 3 -d " " | sed s/x.*//` #width
#H=`identify ${pic} | cut -f 3 -d " " | sed s/.*x//` #height

#if [ "$W" -gt "1920" ]; then
#  hsetroot -tile  ${pic}
#else
  hsetroot -tile  ${pic}
#fi


