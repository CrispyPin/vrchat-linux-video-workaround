# VRC-MPV
Dumb workaround that allows you to play video player content from a vrchat world in mpv instead, since they don't work in proton yet.

The latest version can be found at https://github.com/CrispyPin/vrchat-linux-video-workaround

## Installing
requires `mpv yt-dlp python3`

install with `make install`

run `vrc-mpv` to play videos with mpv when they are requested by vrchat

## Building
requires `mono`  
`make && make install`

## Disclaimer
This software is not in violation of the VRChat terms of service, as it does not touch any game files or impact the running game. It is a replacement for yt-dlp (which VRChat fetches from github), and it's only function is to extract the requested video urls. This information is also available in the VRChat log files but is not as convenient.

