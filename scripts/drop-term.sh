### Restart Drop Down ###
sleep 1
while true; do
	if ps aux | grep '[u]rxvt -name dropterm' 1>&1
		then
			sleep 15
		else
			cool-retro-term
	fi
done
