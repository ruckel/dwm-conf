#!/bin/sh

#dateformat='+%a %d-%m-%y %T'
#dateformat="+%d-%m-%y"        #31-12-99
#dateformat="+%a"              #dag
dateformat="+%H:%m"           #12:34
#dateformat="+%T"              #12:34:56

dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "📆 %s"  #"$timenow"
    else
        #printf "%s" "$timenow"
        printf "%s" $(date "$dateformat")

    fi
    printf "%s\n" "$SEP2"
}

dwm_date
