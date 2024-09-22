#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# GNU GPLv3

df_check_location='/home'

dwm_resources () {
	# get all the infos first to avoid high resources usage
	free_output=$(free -h | grep Mem)
	df_output=$(df -h $df_check_location | tail -n 1)

	# Used and total memory
	MEMUSED=$(echo $free_output | awk '{print $3}' | cut -d G -f1)
	MEMTOT=$(echo $free_output | awk '{print $2}' | cut -d G -f1)
  
	# CPU temperature
	CPU=$(top -bn1 | grep Cpu | awk '{print $2}')%
	#CPU=$(sysctl -n hw.sensors.cpu0.temp0 | cut -d. -f1)

	# Used and total storage in /home (rounded to 1024B)
	STOUSED=$(echo $df_output | awk '{print $3}' | cut -d G -f1)
	STOTOT=$(echo $df_output | awk '{print $2}' | cut -d G -f1)
	STOPER=$(echo $df_output | awk '{print $5}')
  STOLEFT=$(($STOTOT - $STOUSED))

  # Volume check
  VOLUME=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $2'}  | cut -d . -f2)
  MUTED=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $3'})
  if [[ $MUTED == ' ' ]];then MUTED=''; fi

  SYMBOL=""
  if [ "$IDENTIFIER" = "unicode" ]; then SYMBOL=💻; fi

	printf "%s" "$SEP1"

  #printf "%s VOL %s%s MEM %s/%s CPU %s STO %s/%s: %s" "$SYMBOL" "$VOLUME" "$MUTED" "$MEMUSED" "$MEMTOT" "$CPU" "$STOUSED" "$STOTOT" "$STOPER"
  printf "%s|" "$CPU"
  printf "%s/16|" "$MEMUSED"
  #printf "%s|" "$MEM"
  #printf "%s/%s|" "$STOUSED" "$STOTOT"
  printf "%sgb|" "$STOLEFT"
  printf "v%s%s" "$VOLUME" "$MUTED"

	printf "%s" "$SEP2"
}

dwm_resources
