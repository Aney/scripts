#!/bin/bash
ffmpeg -y -f x11grab -s 1280x800 -i :0.0 -f alsa -i default ~/recordings/out.mkv
