#!/bin/bash

VBR="1500k"
FPS="24"
QUAL="superfast"

YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"
KEY="YOUR API KEY HERE"

VIDEO_SOURCE="/home/ubuntu/pixel-jeff-mario.gif"
AUDIO_SOURCE="/home/ubuntu/input.txt"

# Initialize the playlist position to 1
playlist_position=1

while true; do
    echo "Stream ended. Restarting...."
    pkill -f "ffmpeg"
    sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
    # Start ffmpeg streaming with the current playlist position
    ffmpeg \
        -re -f lavfi -i "movie=filename=$VIDEO_SOURCE:loop=0, setpts=N/(FRAME_RATE*TB)" \
        -thread_queue_size 512 \
        -f concat -safe 0 -stream_loop -1 -i "$AUDIO_SOURCE" -ss 0 -t 9999999 \
        -map 0:v:0 -map 1:a:0 \
        -map_metadata:g 1:g \
        -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
        -acodec libmp3lame -ar 44100 -threads 6 -qscale:v 3 -b:a 320000 -bufsize 512k \
        -f flv "$YOUTUBE_URL/$KEY"
done
