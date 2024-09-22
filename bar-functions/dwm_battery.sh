#!/bin/sh

bid=BAT0

dwm_battery () {
# Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
CHARGE=$(cat /sys/class/power_supply/$bid/capacity)
STATUS=$(cat /sys/class/power_supply/$bid/status)

statusc='charging'
statusd=''
if [ "$IDENTIFIER" = "unicode" ]; then 
  statusc='🔌 charging'
  statusd='🔋  battery'
fi

printf "%s" "$SEP1"
if [ "$STATUS" = "Charging" ]; then
  printf " %s%% %s" "$CHARGE" "$statusc"
else
    printf "%s%% %s" "$CHARGE" "$statusd"
fi
printf "%s\n" "$SEP2"
}

dwm_battery

