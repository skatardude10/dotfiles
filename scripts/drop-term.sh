### Restart Drop Down ###
sleep 1
while true; do
	if ps aux | grep '[u]rxvt -name dropterm' 1>&1
		then
			if ps aux | grep '[u]rxvt -name dropterm2' 1>&1
				then
					sleep 15
				else
					urxvt -name dropterm2 -geometry 175x30 -bg rgb:11/11/33
			fi
		else
			urxvt -name dropterm -geometry 115x20 -bg rgb:11/11/33
	fi
done
