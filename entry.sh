#!/bin/bash

echo "Starting live-stream"

vcdbg set awb_mode 0 && raspivid --awb greyworld -o - -t 0 -w 1280 -h 720 -fps 25 -b 2000000 -ae 20,0xff,0x808000 -a 8 -a "%d/%m/%Y %X" | ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i pipe:0 -c:v copy -c:a aac -ab 128k -g 40 -strict experimental -f fifo -fifo_format flv -map 1:v -map 0:a -drop_pkts_on_overflow 1 -attempt_recovery 1 -max_recovery_attempts 30 -recovery_wait_time 5 -recover_any_error 1 rtmps://live-api-s.facebook.com:443/rtmp/$1

# vcdbg set awb_mode 0 && raspivid --awb greyworld -o - -t 0 -w 1280 -h 720 -fps 25 -b 2000000 -ae 20,0xff,0x808000 -a 8 -a "%d/%m/%Y %X" | ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i pipe:0 -c:v copy -c:a aac -ab 128k -g 40 -strict experimental -f fifo -fifo_format flv -map 1:v -map 0:a -drop_pkts_on_overflow 1 -attempt_recovery 1 -max_recovery_attempts 30 -recovery_wait_time 5 -recover_any_error 1 rtmp://live-ams.twitch.tv/app/$1

# vcdbg set awb_mode 0 && raspivid --awb greyworld -o - -t 0 -w 1280 -h 720 -fps 25 -b 2000000 -ae 20,0xff,0x808000 -a 8 -a "%d/%m/%Y %X" | ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i pipe:0 -c:v copy -c:a aac -ab 128k -g 40 -strict experimental -f fifo -fifo_format flv -map 1:v -map 0:a -drop_pkts_on_overflow 1 -attempt_recovery 1 -max_recovery_attempts 30 -recovery_wait_time 5 -recover_any_error 1 rtmp://a.rtmp.youtube.com/live2/$1
