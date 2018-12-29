if [ "$1" == "set" ]; then
	
	if [[ ${file: -4} != ".ogg" ]]; then 
		ffmpeg -i "$2" "tempspound.ogg"
	else
		cp "$2" "tempsound.ogg"
	fi
	CURRPATH=`pwd`
	cd /usr/share/sounds/ubuntu/stereo
	if [ "$3" == "--errorsound" ]; then
		if [ -e "bell.ogg" ]; then
			sudo rm "bell.ogg"
		fi
		sudo mv "${CURRPATH}/tempsound.ogg" bell.ogg
	elif [ "$3" == "--startup" ]; then
		if [ -e "system-ready.ogg" ]; then
                        sudo rm "system-ready.ogg"
                fi
                sudo cp "${CURRPATH}/tempsound.ogg" system-ready.ogg
	else
		echo "Invalid option. Available options: --startup, --errorsound"
	fi
fi

if [ "$#" != "3"  ]; then
	echo "No arguments set:"
	echo "Run './myalert.sh set [FULLPATH] --[OPTION]' to set your own sounds."
	echo "Available options: startup, errorsound"
fi
