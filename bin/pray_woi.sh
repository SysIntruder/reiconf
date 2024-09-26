#! /bin/sh

while true
do

  if ! command -v curl &> /dev/null
  then
    echo "curl not found"
    exit 1
  fi

  if ! command -v jq &> /dev/null
  then
    echo "jq not found"
    exit 1
  fi

  if [ ! -e /tmp/praywoitime ]; then
    # method=20 for Kemenag
    # this will get current pray time and format it into array of time if no tmpfile
    #
    # ["04:08", "11:30", "14:40", "14:34", "18:43"]
    curl -s "http://api.aladhan.com/v1/timingsByCity/$(date '+%d-%m-%Y')?city=Yogyakarta&country=ID&method=20" | jq "[.data.timings.Fajr, .data.timings.Dhuhr, .data.timings.Asr, .data.timings.Maghrib, .data.timings.Isha]" > /tmp/praywoitime
  fi

  mapfile -t times < <(cat /tmp/praywoitime | jq -r '.[]')

  current_time=$(date '+%H:%M')
  # use %-H and %-M to avoid leading 0
  current_minute=$(( $(date -d "$current_time" +%-H) * 60 + $(date -d "$current_time" +%-M) ))

  for time in "${times[@]}"; do
    # use %-H and %-M to avoid leading 0
    time_minute=$(( $(date -d "$time" +%-H) * 60 + $(date -d "$time" +%-M) ))
    diff=$(( time_minute - current_minute ))

    # only check future time
    if [[ $diff -gt 0 ]]; then
      # send notification when 10 minutes into adhan
      if [[ $diff -le 10 ]]; then
        # change this if you don't use libnotify
        notify-send -u critical "Next Prayer Time: $time"
        break
      fi
    fi
  done

  sleep 60

done
