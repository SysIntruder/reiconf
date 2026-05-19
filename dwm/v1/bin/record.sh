#/bin/sh

# can also killed from dsblocks

if [[ ! -e /tmp/record ]]; then
  ffmpeg -loglevel quiet -f x11grab -s 1920x1080 -r 25 -i :0.0 -c:v libx264 -preset ultrafast -crf 23 -f mp4 -pix_fmt yuv420p $HOME/Videos/screenrecord/$(date +%s).mp4 > /dev/null &
  echo "$!" > /tmp/record
else
  cat /tmp/record | kill $(cat /tmp/record) && rm -rf /tmp/record && pkill -RTMIN+6 dsblocks
fi
