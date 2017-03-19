#!/bin/bash
gmusic=$(pgrep GMusicProxy)
if [ $gmusic ]
then
	clear
	echo "GMusicProxy is Running :-)"
	echo "[n]ew playlist  -or-  [a]dd to Now Playing?"
	echo " "	
	read AddorDel
	clear
	echo "Create playlist by Similar:"
	echo ""
	echo "[a] Artist"
	echo "[b] Album"
	echo "[s] Song"
	echo ""
	read Search
	clear
	echo "How many songs to pull?"
	read Number
	clear
	case $Search in
		a)
			echo "Enter Artist:"
			read Artist
				case $AddorDel in
					n)
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=artist&artist=$Artist&num_tracks=$Number" | tr ' ' '%20')  > $(echo "$HOME/.config/mpd/playlists/$Artist.m3u" | tr ' ' '-')
						cat $(echo "$HOME/.config/mpd/playlists/$Artist.m3u" | tr ' ' '-') | grep -v '^http' | cut -d, -f2-
						echo "Created new playlist with $Number songs similar to songs by $Artist!"
						;;
					a)
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=artist&artist=$Artist&num_tracks=$Number" | tr ' ' '%20') | grep -v ^# | while read url; do mpc add "$url"; done
						echo "Added $Number songs similar to $Artist to Now Playing!"
						;;
				esac
			;;
		b)
			echo "Enter Album:"
			read Album
				case $AddorDel in
					n)
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=album&title=$Album&num_tracks=$Number" | tr ' ' '%20') > $(echo "$HOME/.config/mpd/playlists/$Album.m3u" | tr ' ' '-')
						cat $(echo "$HOME/.config/mpd/playlists/$Album.m3u" | tr ' ' '-') | grep -v '^http' | cut -d, -f2-
						echo "Created new playlist with $Number songs similar to songs in $Album!"
						;;
					a)
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=album&title=$Album&num_tracks=$Number" | tr ' ' '%20') | grep -v ^# | while read url; do mpc add "$url"; done
						echo "Added $Number songs similar to songs from $Album to Now Playing!"
						;;
				esac
			;;
		s)
			echo "Enter Song:"
			read Song
				case $AddorDel in
					n)
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=song&title=$Song&num_tracks=$Number" | tr ' ' '%20') > $(echo "$HOME/.config/mpd/playlists/$Song.m3u" | tr ' ' '-')
						cat $(echo "$HOME/.config/mpd/playlists/$Song.m3u" | tr ' ' '-') | grep -v '^http' | cut -d, -f2-
						echo "Created new playlist with $Number songs similar to $Song!"
						;;
					a)
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=song&title=$Song&num_tracks=$Number" | tr ' ' '%20') | grep -v ^# | while read url; do mpc add "$url"; done
						echo "Added $Number songs similar to $Song to Now Playing!"
						;;
				esac
			;;
	esac
else
	echo "GMusicProxy is not running! Please start GMusicProxy before using this..."
fi