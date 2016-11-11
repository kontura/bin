#!/bin/bash

files=(~/usr/pictures/wallpapers/*.png)
pic="${files[RANDOM % ${#files[@]}]}"
colors -en 32 ${pic} | sed '9,24p;d' | toXrdb.sh | shuf | xrdb -override

