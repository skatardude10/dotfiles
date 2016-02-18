### Restart Drop Down ###
sleep 2
while true; do
	if ps aux | grep '[u]rxvt -name dropterm' 1>&1
		then
			sleep 15
		else
			urxvt -name dropterm -geometry 150x20
	fi
done