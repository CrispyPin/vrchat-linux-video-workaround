#!/bin/sh
echo "requested "$1 >> vrc-video-url-handler.log
true >> vrc-video-url-handler.log

echo $1 > /tmp/VRC_VIDEO_URL

# if you need the raw url back in vrc (also compile with RETURN_URL)
#./yt-dlp --no-cache-dir --rm-cache-dir -f 'mp4[height<=?1080]/best[height<=?1080]' --get-url $1 > /tmp/VRC_VIDEO_RAW_URL

#cat /tmp/VRC_VIDEO_RAW_URL >> vrc-video-url-handler.log

# processes started from proton have a limited path:
#echo $PATH > path.txt
