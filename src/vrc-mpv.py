#!/bin/env python3
import os
import time

URL_PATH = "/tmp/VRC_VIDEO_URL"
playing = False
url = ""


def get_url():
	global url, URL_PATH
	url = ""
	if not os.path.exists(URL_PATH):
		return
	with open(URL_PATH, "r") as f:
		s = f.read()
		if s != "":
			url = s


def play():
	print(f"playing {url}")
	os.system(f"mpv {url}")


def delay():
	# delay that can be keyboard interrupted
	for _ in range(10):
		time.sleep(0.05)

def main():
	print(f"Monitoring {URL_PATH} for a video link...")
	print("Ctrl-C to exit")
	
	while True:
		delay()
		old_url = url
		get_url()
		if url and url != old_url:
			play()

main()

