version = "v1.0.1"

steamapps_path = ${HOME}/.steam/steam/steamapps

appdata_path = ${steamapps_path}/compatdata/438100/pfx/drive_c/users/steamuser/AppData/LocalLow/VRChat/VRChat
vrc_path = ${steamapps_path}/common/VRChat


build:
	mcs src/main.cs -out:yt-dlp.exe


install: yt-dlp.exe
	rm -f ${appdata_path}/Tools/yt-dlp.exe
	cp yt-dlp.exe ${appdata_path}/Tools/
	chmod -w ${appdata_path}/Tools/yt-dlp.exe

	chmod +x src/vrc-video-url-handler.sh
	cp src/vrc-video-url-handler.sh ${vrc_path}/vrc-video-url-handler.sh

	chmod +x src/vrc-mpv.py
	sudo cp src/vrc-mpv.py /usr/local/bin/vrc-mpv


package:
	mkdir -p vrc-mpv-${version}/src
	cp README.md Makefile yt-dlp.exe vrc-mpv-${version}
	cp src/vrc-mpv.py src/vrc-video-url-handler.sh vrc-mpv-${version}/src

	zip -r vrc-mpv-${version}.zip vrc-mpv-${version}/
	rm -rf vrc-mpv-${version}

