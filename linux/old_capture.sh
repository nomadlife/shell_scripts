#!/bin/bash

if [ $# -eq 0 ]
then
        echo "input file name. exited."
        exit 0
fi

gnome-screenshot -f temp.png
convert -crop 1920x1080+1930+70 temp.png temp.png
convert -resize 75% temp.png temp.png
ffmpeg -hide_banner -loglevel panic -y -i temp.png -q:v 1 ${1}.jpg
rm temp.png
eog -w ${1}.jpg
