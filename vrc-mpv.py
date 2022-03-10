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
	for _ in range(100):
		time.sleep(0.01)


while True:
	delay()
	old_url = url
	get_url()
	if url and url != old_url:
		play()
