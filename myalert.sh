#!/bin/bash
#
# SCRIPT: myalert.sh
# AUTHOR: Sotiris Evangelou <swtevag@gmail.com>
# DATE:   30/12/2018
# PLATFORM: Ubuntu (tested on 18.4 version)
#
if [ "$1" == "set" ]; then
	if [[ ${file: -4} != ".ogg" ]]; then 
		if [ -e "tempsound.ogg" ]; then
			rm tempsound.ogg
		fi
		TURNED=`ffmpeg -i "$2" "tempsound.ogg" &> /dev/null`
		if [ "$TURNED" == "" ]; then  # successfull ffmpeg
			echo ""
			echo "$2 is converted to .ogg."
		else
			echo "Conversion to .ogg type failed."
			exit 1
		fi
	else
		if [ -e "tempsound.ogg" ]; then
                        rm tempsound.ogg
                fi
		cp "$2" "tempsound.ogg"
	fi
	CURRPATH=`pwd`
	cd /usr/share/sounds/ubuntu/stereo
	if [ "$3" == "--terminalbell" ]; then
		echo "In order to move the new sound to the system files a sudo-password might be needed."
		if [ -e "bell.ogg" ]; then
			sudo rm "bell.ogg"
		fi
		sudo mv "${CURRPATH}/tempsound.ogg" bell.ogg
	elif [ "$3" == "--startup" ]; then
		echo "In order to move the new sound to the system files a sudo-password might be needed."
		if [ -e "system-ready.ogg" ]; then
                        sudo rm "system-ready.ogg"
                fi
                sudo mv "${CURRPATH}/tempsound.ogg" system-ready.ogg
	else
		echo "Invalid option. Available options: --startup, --terminalbell"
		exit 1
	fi
	echo "Your file is now set, as the new ${3:2 } sound."
	echo "Please reboot your system to apply the new changes."
fi

if [ "$#" != "3"  ]; then
	echo "No arguments set:"
	echo "Run './myalert.sh set [FULLPATH] --[OPTION]' to set your own sounds."
	echo "Available options: startup, terminalbell"
fi
