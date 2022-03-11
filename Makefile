steamapps_path = ${HOME}/.steam/steam/steamapps
appdata_path = ${steamapps_path}/compatdata/438100/pfx/drive_c/users/steamuser/AppData/LocalLow/VRChat/VRChat
vrc_path = ${steamapps_path}/common/VRChat
version = "v1.0.0"


build:
	mcs src/main.cs -out:yt-dlp.exe


install: yt-dlp.exe
	rm -f ${appdata_path}/Tools/yt-dlp.exe
	cp yt-dlp.exe ${appdata_path}/Tools/
	chmod -w ${appdata_path}/Tools/yt-dlp.exe

	cp src/vrc-video-url-handler.sh ${vrc_path}/vrc-video-url-handler.sh
	chmod +x ${vrc_path}/vrc-video-url-handler.sh

	sudo cp src/vrc-mpv.py /usr/local/bin/vrc-mpv
	sudo chmod +x /usr/local/bin/vrc-mpv


package:
	zip vrc-mpv-${version}.zip README.md Makefile src/vrc-mpv.py src/vrc-video-url-handler.sh yt-dlp.exe

