#!/bin/bash

echo "Starting YouTube live-stream"

# FONT="/usr/local/share/fonts/OpenSans-Regular.ttf"
# FONTSIZE="15"
# TEXTCOLOR="white@0.8"
# X="10"
# Y="440"

# raspivid -o - -t 0 -w 640 -h 480 -fps 24 -b 2000000 | ffmpeg -re -f s16le -i /dev/zero -f h264 -i pipe:0 -c:v copy -an -vf "drawtext=fontfile=${FONT}:fontcolor=${TEXTCOLOR}:fontsize=${FONTSIZE}:x=${X}:y=${Y}:text='%{localtime\: %d\/%m\/%y %T}'" -f flv -r 24 rtmp://a.rtmp.youtube.com/live2/$1

# raspivid -o - -t 0 -w 640 -h 480 -fps 24 -b 2000000 -ae 10,0xff,0x808000 -a 12 | ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i pipe:0 -c:v copy -c:a aac -ab 128k -g 40 -strict experimental -f flv -r 24 rtmp://a.rtmp.youtube.com/live2/$1

# raspivid -o - -t 0 -w 640 -h 480 -fps 24 -b 2000000 -ae 10,0xff,0x808000 -a 12 | ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i pipe:0 -c:v copy -c:a aac -ab 128k -g 40 -strict experimental -f fifo -fifo_format flv -map 2:v -map 1:a -drop_pkts_on_overflow 1 -attempt_recovery 1 -recovery_wait_time 1 -recover_any_error 1 -r 24 rtmp://a.rtmp.youtube.com/live2/$1

raspivid -o - -t 0 -w 1280 -h 720 -fps 25 -b 4000000 -g 50 -ae 10,0xff,0x808000 -a 12 | ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i - -vcodec copy -acodec aac -ab 128k -g 50 -strict experimental -f fifo -fifo_format flv -map 2:v -map 1:a -drop_pkts_on_overflow 1 -attempt_recovery 1 -recovery_wait_time 1 -recover_any_error 1 rtmp://a.rtmp.youtube.com/live2/$1

# raspivid -o - -t 0 -w 1280 -h 720 -fps 25 -b 4000000 -g 50 | ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i - -vcodec copy -acodec aac -ab 128k -g 50 -strict experimental -f flv rtmp://a.rtmp.youtube.com/live2/****-****-****-****
