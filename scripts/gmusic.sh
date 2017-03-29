#!/bin/bash
#  ╔═╗┬┌─┌─┐┌┬┐┌─┐┬─┐┌┬┐┬ ┬┌┬┐┌─┐┌─┐      
#  ╚═╗├┴┐├─┤ │ ├─┤├┬┘ │││ │ ││├┤ └─┐      
#  ╚═╝┴ ┴┴ ┴ ┴ ┴ ┴┴└──┴┘└─┘─┴┘└─┘└─┘      
#  ╔═╗┌─┐┌─┐┌─┐┬  ┌─┐  ╔╦╗┬ ┬┌─┐┬┌─┐      
#  ║ ╦│ ││ ││ ┬│  ├┤   ║║║│ │└─┐││        
#  ╚═╝└─┘└─┘└─┘┴─┘└─┘  ╩ ╩└─┘└─┘┴└─┘      
#  ╔═╗┬  ┌─┐┬ ┬┬  ┬┌─┐┌┬┐  ╔╦╗┌─┐┬┌─┌─┐┬─┐
#  ╠═╝│  ├─┤└┬┘│  │└─┐ │   ║║║├─┤├┴┐├┤ ├┬┘
#  ╩  ┴─┘┴ ┴ ┴ ┴─┘┴└─┘ ┴   ╩ ╩┴ ┴┴ ┴└─┘┴└─
gmusic=$(pgrep GMusicProxy)
if [ $gmusic ]
then
	clear
	echo "   _____ _       _             _       _     ___   ___       "
	echo "  |   __| |_ ___| |_ ___ ___ _| |_ _ _| |___|_  | |   |___   "
	echo "  |__   | '_| .'|  _| .'|  _| . | | | . | -_|_| |_| | |_ -|  "
	echo "  |_____|_,_|__,|_| |__,|_| |___|___|___|___|_____|___|___|  "
	echo "   _____               _        _____     _                  "
	echo "  |   __|_____ _ _ ___|_|___   |  |  |___| |___ ___ ___      "
	echo "  |  |  |     | | |_ -| |  _|  |     | -_| | . | -_|  _|     "
	echo "  |_____|_|_|_|___|___|_|___|  |__|__|___|_|  _|___|_|       "
	echo "   Press Enter to continue:                |_|           "
	read
	clear
	echo "╔═╗┬  ┌─┐┬ ┬┬  ┬┌─┐┌┬┐"
	echo "╠═╝│  ├─┤└┬┘│  │└─┐ │ "
	echo "╩  ┴─┘┴ ┴ ┴ ┴─┘┴└─┘ ┴ "
	echo "[n]ew playlist  -or-  [a]dd to Now Playing?"
	echo " "	
	read AddorDel
	clear
	echo "╔═╗┬  ┌─┐┬ ┬┬  ┬┌─┐┌┬┐"
	echo "╠═╝│  ├─┤└┬┘│  │└─┐ │ "
	echo "╩  ┴─┘┴ ┴ ┴ ┴─┘┴└─┘ ┴ "
	echo "Create playlist by Similar:"
	echo ""
	echo "[a] Artist"
	echo "[b] Album"
	echo "[s] Song"
	echo "[l] Likes"
	echo ""
	read Search
	clear
	case $Search in
		a)
			echo "╔═╗┬─┐┌┬┐┬┌─┐┌┬┐"
			echo "╠═╣├┬┘ │ │└─┐ │ "
			echo "╩ ╩┴└─ ┴ ┴└─┘ ┴ "
			echo "Enter Artist:"
			read Artist
			clear
			echo "╔╗╔┬ ┬┌┬┐┌┐ ┌─┐┬─┐"
			echo "║║║│ ││││├┴┐├┤ ├┬┘"
			echo "╝╚╝└─┘┴ ┴└─┘└─┘┴└─"
			echo "How many songs to pull?"
			read Number
			clear
				case $AddorDel in
					n)
						echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
						echo "║║║│ │├┬┘├┴┐│││││ ┬   "
						echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
						echo "Getting your playlist based off $Artist..."
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=artist&artist=$Artist&num_tracks=$Number" | tr ' ' '%20')  > $(echo "$HOME/.config/mpd/playlists/$Artist.m3u" | tr ' ' '-')
						clear
						cat $(echo "$HOME/.config/mpd/playlists/$Artist.m3u" | tr ' ' '-') | grep -v '^http' | cut -d, -f2-
						echo "╔╦╗┌─┐┌┐┌┌─┐┬"
						echo " ║║│ ││││├┤ │"
						echo "═╩╝└─┘┘└┘└─┘o"
						echo "Created new playlist with $Number songs similar to songs by $Artist!"
						echo " "
						;;
					a)
						echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
						echo "║║║│ │├┬┘├┴┐│││││ ┬   "
						echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
						echo "Adding songs to Now Playing based off $Artist..."
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=artist&artist=$Artist&num_tracks=$Number" | tr ' ' '%20') | grep -v ^# | while read url; do mpc add "$url"; done
						clear
						echo "╔╦╗┌─┐┌┐┌┌─┐┬"
						echo " ║║│ ││││├┤ │"
						echo "═╩╝└─┘┘└┘└─┘o"
						echo "Added $Number songs similar to $Artist to Now Playing!"
						echo " "
						;;
				esac
			;;
		b)
			echo "╔═╗┬  ┌┐ ┬ ┬┌┬┐"
			echo "╠═╣│  ├┴┐│ ││││"
			echo "╩ ╩┴─┘└─┘└─┘┴ ┴"
			echo "Enter Album:"
			read Album
			clear
			echo "╔╗╔┬ ┬┌┬┐┌┐ ┌─┐┬─┐"
			echo "║║║│ ││││├┴┐├┤ ├┬┘"
			echo "╝╚╝└─┘┴ ┴└─┘└─┘┴└─"
			echo "How many songs to pull?"
			read Number
			clear
				case $AddorDel in
					n)
						echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
						echo "║║║│ │├┬┘├┴┐│││││ ┬   "
						echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
						echo "Getting your playlist based off $Album..."
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=album&title=$Album&num_tracks=$Number" | tr ' ' '%20') > $(echo "$HOME/.config/mpd/playlists/$Album.m3u" | tr ' ' '-')
						clear
						cat $(echo "$HOME/.config/mpd/playlists/$Album.m3u" | tr ' ' '-') | grep -v '^http' | cut -d, -f2-
						echo "╔╦╗┌─┐┌┐┌┌─┐┬"
						echo " ║║│ ││││├┤ │"
						echo "═╩╝└─┘┘└┘└─┘o"
						echo "Created new playlist with $Number songs similar to songs in $Album!"
						echo " "
						;;
					a)
						echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
						echo "║║║│ │├┬┘├┴┐│││││ ┬   "
						echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
						echo "Adding songs to Now Playing based off $Album..."
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=album&title=$Album&num_tracks=$Number" | tr ' ' '%20') | grep -v ^# | while read url; do mpc add "$url"; done
						clear
						echo "╔╦╗┌─┐┌┐┌┌─┐┬"
						echo " ║║│ ││││├┤ │"
						echo "═╩╝└─┘┘└┘└─┘o"
						echo "Added $Number songs similar to songs from $Album to Now Playing!"
						echo " "
						;;
				esac
			;;
		s)
			echo "╔═╗┌─┐┌┐┌┌─┐"
			echo "╚═╗│ │││││ ┬"
			echo "╚═╝└─┘┘└┘└─┘"
			echo "Enter Song:"
			read Song
			clear
			echo "╔╗╔┬ ┬┌┬┐┌┐ ┌─┐┬─┐"
			echo "║║║│ ││││├┴┐├┤ ├┬┘"
			echo "╝╚╝└─┘┴ ┴└─┘└─┘┴└─"
			echo "How many songs to pull?"
			read Number
			clear
				case $AddorDel in
					n)
						echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
						echo "║║║│ │├┬┘├┴┐│││││ ┬   "
						echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
						echo "Getting your playlist based off $Song..."
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=song&title=$Song&num_tracks=$Number" | tr ' ' '%20') > $(echo "$HOME/.config/mpd/playlists/$Song.m3u" | tr ' ' '-')
						clear
						cat $(echo "$HOME/.config/mpd/playlists/$Song.m3u" | tr ' ' '-') | grep -v '^http' | cut -d, -f2-
						echo "╔╦╗┌─┐┌┐┌┌─┐┬"
						echo " ║║│ ││││├┤ │"
						echo "═╩╝└─┘┘└┘└─┘o"
						echo "Created new playlist with $Number songs similar to $Song!"
						echo " "
						;;
					a)
						echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
						echo "║║║│ │├┬┘├┴┐│││││ ┬   "
						echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
						echo "Adding songs to Now Playing based off $Song..."
						curl -s $(echo "http://localhost:9999/get_new_station_by_search?type=song&title=$Song&num_tracks=$Number" | tr ' ' '%20') | grep -v ^# | while read url; do mpc add "$url"; done
						clear
						echo "╔╦╗┌─┐┌┐┌┌─┐┬"
						echo " ║║│ ││││├┤ │"
						echo "═╩╝└─┘┘└┘└─┘o"
						echo "Added $Number songs similar to $Song to Now Playing!"
						echo " "
						;;
				esac
			;;
		l)
			echo "╔╗╔┬ ┬┌┬┐┌┐ ┌─┐┬─┐"
			echo "║║║│ ││││├┴┐├┤ ├┬┘"
			echo "╝╚╝└─┘┴ ┴└─┘└─┘┴└─"
			echo "How many songs to pull per liked song?"
			read Number
			clear
			LikeFile=$HOME/dotfiles/songs/like
			TmpLike=$HOME/dotfiles/songs/tmplike
			Date=`date +%y-%m-%d-%H-%M-%S`
			echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
			echo "║║║│ │├┬┘├┴┐│││││ ┬   "
			echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
			echo "Creating Like-Playlist-$Date.m3u "
			sleep 2
			clear
				case $AddorDel in
					n)
						tail -n +2 "$LikeFile" | sed '/^\s*$/d' | sed 'n; d' > "$TmpLike"  # Remove first line from likefile, remove spaces, keep odd lines leaving only all song IDs
						NumInLike=$(cat $TmpLike | wc -l)
						Countfile=$HOME/dotfiles/songs/countfile
						echo 0 > $Countfile
						echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
						echo "║║║│ │├┬┘├┴┐│││││ ┬   "
						echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
						echo "$(cat $Countfile) of $NumInLike complete..."
						while read songs; do
							curl -s $(echo "http://localhost:9999/get_new_station_by_id?id=$songs&type=song&num_tracks=$Number") >> $(echo "$HOME/.config/mpd/playlists/Like-Playlist-$Date.m3u" | tr ' ' '-')
							Count=$[$(cat $Countfile) + 1]
							echo $Count > $Countfile
							clear
							echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
							echo "║║║│ │├┬┘├┴┐│││││ ┬   "
							echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
							echo "$(cat $Countfile) of $NumInLike complete..."
						done <$TmpLike
						clear
						sed -i '/#EXTM3U/d' $HOME/.config/mpd/playlists/Like-Playlist-$Date.m3u
						sed -i '1s/^/#EXTM3U\n/' $HOME/.config/mpd/playlists/Like-Playlist-$Date.m3u
						cat $(echo "$HOME/.config/mpd/playlists/Like-Playlist-$Date.m3u") | grep -v '^http' | cut -d, -f2-
						echo " "
						echo "╔╦╗┌─┐┌┐┌┌─┐┬"
						echo " ║║│ ││││├┤ │"
						echo "═╩╝└─┘┘└┘└─┘o"
						echo "Created new playlist from $NumInLike liked songs with $Number songs per liked song, for a total number of $(grep -c "http" $HOME/.config/mpd/playlists/Like-Playlist-$Date.m3u) songs in your new playlist!"
						echo " "
						rm $TmpLike
						rm $Countfile
						;;
					a)
						tail -n +2 "$LikeFile" | sed '/^\s*$/d' | sed 'n; d' > "$TmpLike"  # Remove first line from likefile, remove spaces, keep odd lines leaving only all song IDs
						NumInLike=$(cat $TmpLike | wc -l)
						Countfile=$HOME/dotfiles/songs/countfile
						echo 0 > $Countfile
						echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
						echo "║║║│ │├┬┘├┴┐│││││ ┬   "
						echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
						echo "$(cat $Countfile) of $NumInLike complete..."
						while read songs; do
							curl -s $(echo "http://localhost:9999/get_new_station_by_id?id=$songs&type=song&num_tracks=$Number") | grep -v ^# | while read url; do mpc add "$url"; done
							Count=$[$(cat $Countfile) + 1]
							echo $Count > $Countfile
							clear
							echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
							echo "║║║│ │├┬┘├┴┐│││││ ┬   "
							echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
							echo "$(cat $Countfile) of $NumInLike complete..."
						done <$TmpLike
						clear
						echo " "
						echo "╔╦╗┌─┐┌┐┌┌─┐┬"
						echo " ║║│ ││││├┤ │"
						echo "═╩╝└─┘┘└┘└─┘o"
						echo "Added $(($NumInLike * $Number)) songs to Now Playing!"
						echo " "
						rm $TmpLike
						rm $Countfile
						;;
				esac
			;;
	esac
else
	clear
	echo "╔═╗╦═╗╦═╗╔═╗╦═╗┬┬┬"
	echo "║╣ ╠╦╝╠╦╝║ ║╠╦╝│││"
	echo "╚═╝╩╚═╩╚═╚═╝╩╚═ooo"
	echo "GMusicProxy is not running! Please start GMusicProxy before using this..."
fi