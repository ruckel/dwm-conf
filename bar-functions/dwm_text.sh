#!/bin/sh

txtloc=~/dwm.txt

dwm_text() {
sometext="hejhej"


if [[ -f $txtloc ]]; then
  sometext="$(cat $txtloc)"
fi
printf "$sometext"
}

dwm_text
