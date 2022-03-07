steamapps_path = ${HOME}/.steam/steam/steamapps
appdata_path = ${steamapps_path}/compatdata/438100/pfx/drive_c/users/steamuser/AppData/LocalLow/VRChat/VRChat
vrc_path = ${steamapps_path}/common/VRChat

build:
	mcs src/main.cs

install: build
	rm -f ${appdata_path}/Tools/yt-dlp.exe
	cp src/main.exe ${appdata_path}/Tools/yt-dlp.exe
	chmod -w ${appdata_path}/Tools/yt-dlp.exe

	cp src/vrc-video-url-handler.sh ${vrc_path}/vrc-video-url-handler.sh
	chmod +x ${vrc_path}/vrc-video-url-handler.sh
