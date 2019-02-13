#!/bin/bash

if [ $# -eq 0 ]
then
        echo "Input chapter number."
        exit 0
fi

echo "capture:[f/enter], quit:[q/esc]"

v=1
while :
do
	read -s -r -n1 -p "capture?" key

	case $key in

		f|y|'')
		gnome-screenshot -f temp.png
		convert -crop 1920x1080+1930+70 temp.png temp.png
		convert -resize 75% temp.png temp.png
		ffmpeg -hide_banner -loglevel panic -y -i temp.png -q:v 1 "${1}_$v.jpg"
		rm temp.png
		eog -w "${1}_$v.jpg"	
		echo "  file saved : ${1}_$v.jpg"
		(( v++ ))
		;;

		q|n|$'\e')
		echo ""
		break
		;;

		*)
		echo ""
		echo "capture:[f/enter], quit:[q/esc]"

	esac
done
