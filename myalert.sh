if [ "$1" == "set" ]; then
	for file in *.mp3
		do ffmpeg -i "${file}" "${file/%mp3/ogg}"
	done
	
	for file in *.wav
		do ffmpeg -i "${file}" -acodec libvorbis "${file/%wav/ogg}"
	done

	mkdir -p "my_ogg_bells"  # bells in ubuntu are all .ogg sound files.

	for song in *.ogg
		do mv "${song}" "my_ogg_bells/."
	done

	if [ -d /usr/share/sounds/ubuntu/stereo/my_ogg_bells ]; then
		sudo rm -rf /usr/share/sounds/ubuntu/stereo/my_ogg_bells
	fi
	sudo mv my_ogg_bells /usr/share/sounds/ubuntu/stereo
fi

if [ "$1" == "change" ]; then
	cd /usr/share/sounds/ubuntu/stereo/my_ogg_bells
	RANDOMFILE=$(shuf -n 1 -e *)

	cd ..
	if [ -e "bell.ogg" ]; then
		sudo rm "bell.ogg"
	fi
	echo ${RANDOMFILE}
	cd my_ogg_bells
	sudo cp "${RANDOMFILE}" ../bell.ogg
fi
