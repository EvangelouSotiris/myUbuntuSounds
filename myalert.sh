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
