### Restart Drop Down ###
sleep 1
while true; do
	if ps aux | grep '[u]rxvt -name dropterm2' 1>&1
		then
			sleep 15
		else
			urxvt -name dropterm2 -geometry 115x20 -bg rgb:22/11/33
	fi
done
