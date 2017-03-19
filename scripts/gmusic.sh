#!/bin/bash
gmusic=$(pgrep GMusicProxy)
if [ $gmusic ]
then
	echo "GMusicProxy is Running :-)"
	echo "Create playlist by [a]rtist, al[b]um, or [s]song?"
	read Search
	case $Search in
		a)
			echo "Enter Artist:"
			read Artist
			curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=artist&artist=$Artist&num_tracks=100" | tr ' ' '%20') > $(echo "$HOME/.config/mpd/playlists/$Artist.m3u" | tr ' ' '-')
			cat $(echo "$HOME/.config/mpd/playlists/$Artist.m3u" | tr ' ' '-') | grep -v '^http' | cut -d, -f2-
			echo " "
			echo "Playlist added!"
			;;
		b)
			echo "Enter Album:"
			read Album
			curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=artist&title=$Album&num_tracks=100" | tr ' ' '%20') > $(echo "$HOME/.config/mpd/playlists/$Album.m3u" | tr ' ' '-')
			cat $(echo "$HOME/.config/mpd/playlists/$Album.m3u" | tr ' ' '-') | grep -v '^http' | cut -d, -f2-
			echo " "
			echo "Playlist added!"
			;;
		s)
			echo "Enter Song:"
			read Song
			curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=artist&title=$Song&num_tracks=100" | tr ' ' '%20') > $(echo "$HOME/.config/mpd/playlists/$Song.m3u" | tr ' ' '-')
			cat $(echo "$HOME/.config/mpd/playlists/$Song.m3u" | tr ' ' '-') | grep -v '^http' | cut -d, -f2-
			echo " "
			echo "Playlist added!"
			;;
	esac
else
	echo "GMusicProxy is not running!"
fi