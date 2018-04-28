#!/bin/bash

echo "Starting YouTube live-stream"

FONT="/usr/local/share/fonts/OpenSans-Regular.ttf"
FONTSIZE="15"
TEXTCOLOR="white@0.8"
X="10"
Y="440"

raspivid -o - -t 0 -w 640 -h 480 -fps 24 -b 2000000 | ffmpeg -re -f s16le -i /dev/zero -f h264 -i pipe:0 -c:v copy -an -preset superfast -vf "drawtext=fontfile=${FONT}:fontcolor=${TEXTCOLOR}:fontsize=${FONTSIZE}:x=${X}:y=${Y}:text='%{localtime\: %d\/%m\/%y %T}'" -f flv -r 24 rtmp://a.rtmp.youtube.com/live2/$1
