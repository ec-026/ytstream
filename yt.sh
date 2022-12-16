#! /bin/bash

VBR="400k"
FPS="20"
QUAL="medium"

YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"
KEY="vzja-257b-z45a-9ua3-2f19"

VIDEO_SOURCE="/home/runner/ytstream/pixel-jeff-mario.gif"
TEXT="/home/runner/ytstream/input.txt"

ffmpeg \
    -re -f lavfi -i "movie=filename=$VIDEO_SOURCE:loop=0, setpts=N/(FRAME_RATE*TB), pad=ceil(iw/2)*2:ceil(ih/2)*2" \
    -re -f concat -i $TEXT \
    -map 0:v:0 -map 1:a:0 \
    -map_metadata:g 1:g \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale:v 3 -b:a 320000 -bufsize 512k \
    -f flv "$YOUTUBE_URL/$KEY"