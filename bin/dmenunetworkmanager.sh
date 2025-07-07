#!/bin/sh

RESCAN="Rescan WiFi"
NETMAN="Open Network Manager"
rescan="no"

get_wifi() {
 if [[ "$1" == "yes" ]]; then
   notify-send "Scanning WiFi" -t 10000
 fi

 nmcli -t -f IN-USE,SSID,SIGNAL dev wifi list --rescan "$1" |
   grep -Ev '::' |
   sort -t: -k1,1r -k3,3nr -k2,2 |
   sed -E 's/^\*:? *([^:]+):([0-9]+)/* \1 (\2%)/; s/^ ?:? *([^:]+):([0-9]+)/  \1 (\2%)/'
}

get_vpn() {
 nmcli -t -f ACTIVE,NAME,TYPE connection show |
   grep -E '.*:vpn' |
   sort -t: -k1,1r -k2,2 |
   awk -F: '{prefix=($1=="yes")?"*":" "; print prefix " " $2 ":" $3}'
}

menu() {
  {
    get_wifi "$1"
    printf "\n"
    get_vpn
    printf "\n"
    printf "$RESCAN"
    printf "\n"
    printf "$NETMAN"
  } | dmenu -i -l 25 -p "Networks"
}

handle() {
  if [[ "$1" == "$RESCAN" ]]; then
    rescan="yes"
    return 1
  elif [[ "$1" == "$NETMAN" ]]; then
    nm-connection-editor
  elif [[ "$1" == *":vpn" ]]; then
    vpn="$(echo "$1" | sed -E 's/^\*?\s*//; s/:(vpn)$//')"
    if [[ "$1" == "*"* ]]; then
      nmcli connection down "$vpn" && notify-send "$vpn successfully deactivated" || notify-send "failed to deactivating $vpn"
    else
      nmcli connection up "$vpn" && notify-send "$vpn successfully activated" || notify-send "failed on activating $vpn"
    fi
  elif [[ -n "$1" ]]; then
    ssid="$(echo "$1" | sed -En 's/^\*? *([^()]+[^[:space:]])[[:space:]]*\([0-9]+%\)/\1/p')"
    if [[ "$1" == "*"* ]]; then
      nmcli connection down "$ssid" && notify-send "$ssid successfully deactivated" || notify-send "failed to deactivating $ssid"
    else
      if nmcli device wifi connect "$ssid"; then
        notify-send "$ssid successfully activated"
      else
        pass=$(dmenu -P -p "Password for $ssid")
        nmcli device wifi connect "$ssid" password "$pass" && notify-send "$ssid successfully activated" || notify-send "failed on activating $ssid"
      fi
    fi
  fi
  return 0
}

while true; do
  choice=$(menu "$rescan")
  rescan="no"
  handle "$choice" || continue
  break
done
