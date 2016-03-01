### Restart Drop Down ###
sleep 30
while true; do
	if ps aux | grep '[u]rxvt -name dropterm' 1>&1
		then
			sleep 30
		else
			urxvt -name dropterm -geometry 150x20
	fi
done