for file in *.mp3
	do ffmpeg -i "${file}" "${file/%mp3/ogg}"
done
mkdir -p "my_ogg_bells"
for song in *.ogg
	do mv "${song}" "my_ogg_bells/."
done
