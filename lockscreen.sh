#!/bin/bash

while [ 1 ]; do
	
	if [ "$(sudo lsusb -v | grep 04de04afd9d3d3d6)" = "" ]; then
		echo "Phone not pluged"
		echo "Locking screen"
		DISPLAY=:0 gnome-screensaver-command -l
	else
		echo "Phone pluged"
		echo "Unlocking screen"	
		#DISPLAY=:0 gnome-screensaver-command -d
	fi
	sleep 10
done
