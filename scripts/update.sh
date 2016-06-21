#!/bin/bash
while :
do
	checkupdates | wc -l > ~/.updates
	curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=0\&locCode\=80016 | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }' | tr -d ':' |  sed 's/$/   /' > ~/.weather
	sleep 300
done