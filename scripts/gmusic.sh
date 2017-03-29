#!/bin/bash
#     _____ _         _                _           _     __  ___  _     
#    / ____| |       | |              | |         | |   /_ |/ _ \( )    
#   | (___ | | ____ _| |_ __ _ _ __ __| |_   _  __| | ___| | | | |/ ___ 
#    \___ \| |/ / _` | __/ _` | '__/ _` | | | |/ _` |/ _ \ | | | | / __|
#    ____) |   < (_| | || (_| | | | (_| | |_| | (_| |  __/ | |_| | \__ \
#   |_____/|_|\_\__,_|\__\__,_|_|  \__,_|\__,_|\__,_|\___|_|\___/  |___/
#     _____                   _        __  __           _               
#    / ____|                 | |      |  \/  |         (_)              
#   | |  __  ___   ___   __ _| | ___  | \  / |_   _ ___ _  ___          
#   | | |_ |/ _ \ / _ \ / _` | |/ _ \ | |\/| | | | / __| |/ __|         
#   | |__| | (_) | (_) | (_| | |  __/ | |  | | |_| \__ \ | (__          
#    \_____|\___/ \___/ \__, |_|\___| |_|  |_|\__,_|___/_|\___|         
#                        __/ |                                          
#    _    _      _      |___/____           _       _                   
#   | |  | |    | |        / ____|         (_)     | |                  
#   | |__| | ___| |_ __   | (___   ___ _ __ _ _ __ | |_                 
#   |  __  |/ _ \ | '_ \   \___ \ / __| '__| | '_ \| __|                
#   | |  | |  __/ | |_) |  ____) | (__| |  | | |_) | |_                 
#   |_|  |_|\___|_| .__/  |_____/ \___|_|  |_| .__/ \__|                
#                 | |                        | |                        
#                 |_|                        |_|                        


gmusic=$(pgrep GMusicProxy)
if [ $gmusic ]
then
	clear
	echo "   _____ _       _             _       _     ___   ___       "
	echo "  |   __| |_ ___| |_ ___ ___ _| |_ _ _| |___|_  | |   |___   "
	echo "  |__   | '_| .'|  _| .'|  _| . | | | . | -_|_| |_| | |_ -|  "
	echo "  |_____|_,_|__,|_| |__,|_| |___|___|___|___|_____|___|___|  "
	echo "                                                             "
	echo "                                                             "
	echo "   _____               _        _____     _                  "
	echo "  |   __|_____ _ _ ___|_|___   |  |  |___| |___ ___ ___      "
	echo "  |  |  |     | | |_ -| |  _|  |     | -_| | . | -_|  _|     "
	echo "  |_____|_|_|_|___|___|_|___|  |__|__|___|_|  _|___|_|       "
	echo "   Press Enter to continue:                |_|           "
	read
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
	echo "[l] Likes"
	echo ""
	read Search
	clear
	case $Search in
		a)
			echo "Enter Artist:"
			read Artist
			clear
			echo "How many songs to pull?"
			read Number
			clear
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
			clear
			echo "How many songs to pull?"
			read Number
			clear
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
			clear
			echo "How many songs to pull?"
			read Number
			clear
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
		l)
			echo "How many songs to pull per liked song?"
			read Number
			clear
			LikeFile=$HOME/dotfiles/songs/like
			TmpLike=$HOME/dotfiles/songs/tmplike
			Date=`date +%y-%m-%d-%H-%M-%S`
			echo "Creating Like-Playlist-$Date.m3u "
			sleep 2
			clear
				case $AddorDel in
					n)
						tail -n +2 "$LikeFile" | sed '/^\s*$/d' | sed 'n; d' > "$TmpLike"  # Remove first line from likefile, remove spaces, keep odd lines leaving only all song IDs
						NumInLike=$(cat $TmpLike | wc -l)
						Countfile=$HOME/dotfiles/songs/countfile
						echo 0 > $Countfile
						echo "$(cat $Countfile) of $NumInLike complete..."
						while read songs; do
							curl -s $(echo "http://localhost:9999/get_new_station_by_id?id=$songs&type=song&num_tracks=$Number") >> $(echo "$HOME/.config/mpd/playlists/Like-Playlist-$Date.m3u" | tr ' ' '-')
							Count=$[$(cat $Countfile) + 1]
							echo $Count > $Countfile
							clear
							echo "$(cat $Countfile) of $NumInLike complete..."
						done <$TmpLike
						clear
						sed -i '/#EXTM3U/d' $HOME/.config/mpd/playlists/Like-Playlist-$Date.m3u
						sed -i '1s/^/#EXTM3U\n/' $HOME/.config/mpd/playlists/Like-Playlist-$Date.m3u
						cat $(echo "$HOME/.config/mpd/playlists/Like-Playlist-$Date.m3u") | grep -v '^http' | cut -d, -f2-
						echo " "
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
						echo "$(cat $Countfile) of $NumInLike complete..."
						while read songs; do
							curl -s $(echo "http://localhost:9999/get_new_station_by_id?id=$songs&type=song&num_tracks=$Number") | grep -v ^# | while read url; do mpc add "$url"; done
							Count=$[$(cat $Countfile) + 1]
							echo $Count > $Countfile
							clear
							echo "$(cat $Countfile) of $NumInLike complete..."
						done <$TmpLike
						clear
						echo " "
						echo "Added $(($NumInLike * $Number)) songs to Now Playing!"
						echo " "
						rm $TmpLike
						rm $Countfile
						;;
				esac
			;;
	esac
else
	echo "GMusicProxy is not running! Please start GMusicProxy before using this..."
fi