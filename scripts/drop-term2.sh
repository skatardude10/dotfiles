### Restart Drop Down ###
sleep 1
while true; do
	if ps aux | grep '[u]rxvt -name dropterm' 1>&1
		then
			sleep 15
		else
			urxvt -name dropterm -geometry 175x30 -bg rgb:22/11/33
	fi
done
