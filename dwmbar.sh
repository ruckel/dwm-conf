#!/bin/sh
# Dependencies: xorg-xsetroot

 loop=true

run() {
if [ $loop == 'true' ];then
  echo loop: true
  init
  parallelize 5 & looper 1
else
  echo loop: false
  init
  setBar
fi
}

init() {
# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

#export IDENTIFIER="unicode"

#export SEP1="["
#export SEP2="]"

# Import the modules
. "$DIR/bar-functions/dwm_date.sh"
. "$DIR/bar-functions/dwm_networkmanager.sh"
#. "$DIR/bar-functions/dwm_spotify.sh"
#. "$DIR/bar-functions/dwm_transmission.sh"
. "$DIR/bar-functions/dwm_network_speed.sh"
. "$DIR/bar-functions/dwm_resources.sh"

#. "$DIR/bar-functions/dwm_alarm.sh"
#. "$DIR/bar-functions/dwm_alsa.sh"
#. "$DIR/bar-functions/dwm_backlight.sh"
#. "$DIR/bar-functions/dwm_battery.sh"
#. "$DIR/bar-functions/dwm_ccurse.sh"
#. "$DIR/bar-functions/dwm_cmus.sh"
#. "$DIR/bar-functions/dwm_connman.sh"
#. "$DIR/bar-functions/dwm_countdown.sh"
#. "$DIR/bar-functions/dwm_currency.sh"
#. "$DIR/bar-functions/dwm_keyboard.sh"
#. "$DIR/bar-functions/dwm_loadavg.sh"
#. "$DIR/bar-functions/dwm_mail.sh"
#. "$DIR/bar-functions/dwm_mpc.sh"
#. "$DIR/bar-functions/dwm_pulse.sh"
#. "$DIR/bar-functions/dwm_vpn.sh"
#. "$DIR/bar-functions/dwm_weather.sh"
}


parallelize() {
while true; do
  echo Running parallel processes:
  dwm_networkmanager && echo networkmanager
  dwm_date && echo date
# dwm_spotify && echo spotify
# dwm_transmission && echo transmission
  dwm_network_speed && echo networkspeed
  dwm_resources && echo resources
  echo with sleep time: $sleepi
  sleep $1
done
}



looper() {
while true; do
  setBar
  sleep $1
done
}

setBar() {
upperbar="  "
echo Running processes

#upperbar="$upperbar${__DWM_BAR_NETWORKMANAGER__}" && echo " dwm_networkmanager"
#upperbar="$upperbar | "
#upperbar="$upperbar$(dwm_network_speed)"; dwm_network_speed_record && echo " dwm_network_speed"
#upperbar="$upperbar$(dwm_spotify)" && echo " dwm_spotify"
#upperbar="$upperbar$(dwm_transmission)" && echo " dwm_transmission"
upperbar="$upperbar$(dwm_resources)"
upperbar="$upperbar | $(dwm_date)" && echo " dwm_date"

upperbar="$upperbar "
xsetroot -name "$upperbar"
}
run
