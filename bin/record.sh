#/bin/sh

ffmpeg -f x11grab -s 1920x1080 -r 25 -i :0.0 -c:v libx264 -preset ultrafast -crf 23 -f mp4 -pix_fmt yuv420p output.mp4
