### Restart Drop Down ###
sleep 1
while true; do
	if ps aux | grep '[u]rxvt -name dropterm' 1>&1
		then
			sleep 15
		else
			urxvt -name dropterm -geometry 75x20
	fi
done