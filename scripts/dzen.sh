#!/bin/zsh

UPDATE=1

while :; do
    DATE=`date +"%a %b %d %T %Z %Y"`
    sleep $UPDATE
done | dzen2 -fn '-*-liberation mono-medium-r-*-*-11-*-*-*-*-*-*-*' -bg '#2d2d2d' -fg '#000000' -ta r -p -y -1 -x -480 -title-name 'dzen right'