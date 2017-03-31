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
#
#  Have GMusicProxy enabled... this creates MPD playlists in:
#  $HOME/.config/mpd/playlists/ or adds songs to Now Playing.
#
#  To make playlists based on liked songs:
#  Use in conjunction with like-gmusic-song.sh and dislike-gmusic-song.sh
#
#  After using like-gmusic-song.sh to like some songs, a like file will
#  be created at $HOME/dotfiles/songs/like formatted correctly to enable
#  creating playlists by "[l] Likes".
#
#  TODO:  
#    1) Set host as variable to be able to use over network, 192.168.x.y vs localhost
#       *) Integrate host config variable with like and dislike scripts for use over LAN
#       *) check for host instead of locally running process

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
	echo "[l] Local Likes"
	echo "[c] Cloud Likes"
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
		c)
			echo "╔╦╗┌─┐┬─┐┌─┐┌─┐┌─┐"
			echo "║║║├┤ ├┬┘│ ┬├┤  ┌┘"
			echo "╩ ╩└─┘┴└─└─┘└─┘ o "
			echo "Would you like to create a like file from the Cloud?"
			echo "[y] Yes  -or-  [n] No"
			read Merge
			clear
			LikeFile=$HOME/dotfiles/songs/like
			TmpList=$HOME/dotfiles/songs/tmplist
			TmpLike=$HOME/dotfiles/songs/tmplike
			case $Merge in
				y)
					echo "╔═╗┌┬┐┌┬┐┌┐┌┬┬┬"
					echo "╠═╣ │  │ ││││││"
					echo "╩ ╩ ┴  ┴ ┘└┘ooo"
					echo "IMPORTANT: Before Continuing..."
					echo "You MUST create a playlist called Likes"
					echo "on Google Music, case sensitive"
					echo "with your liked/thumbs up songs."
					echo " "
					echo "Press Enter when complete to continue:" 
					read
					clear
					echo "╦ ╦┌─┐┬─┐┬┌─┬┌┐┌┌─┐   "
					echo "║║║│ │├┬┘├┴┐│││││ ┬   "
					echo "╚╩╝└─┘┴└─┴ ┴┴┘└┘└─┘ooo"
					curl -s $(echo "http://localhost:9999/get_all_playlists?format=m3u") > $TmpList
					grep -A 1 '#EXTINF:-1,Likes' $TmpList > $TmpLike
					rm $TmpList
					sed -i '1d' $TmpLike
					sed -i -e 's#.*=\(\)#\1#' $TmpLike
					CloudID=$(cat $TmpLike)
					curl -s $(echo "http://localhost:9999/get_playlist?id=$CloudID") > $TmpList
					sed -i '1d' $TmpList
					sed -i -e 's#.*,\(\)#\1#' $TmpList
					sed -i -e 's#.*=\(\)#\1#' $TmpList
					sed -i '0~2 a\\' $TmpList
					cp $TmpList $HOME/dotfiles/songs/cloudlike
					sed -i '/^\s*$/d' $TmpList
					sed -n -i '1~2!p' $TmpList
					CloudLikeCount=$(cat $TmpList | wc -l)
					tail -n +2 "$LikeFile" | sed '/^\s*$/d' | sed 'n; d' > "$TmpLike"  # Remove first line from likefile, remove spaces, keep odd lines leaving only all song IDs
					NumInLike=$(cat $TmpLike | wc -l)
					rm $TmpLike $TmpList
					clear
					echo "╔╦╗┌─┐┌┐┌┌─┐┬"
					echo " ║║│ ││││├┤ │"
					echo "═╩╝└─┘┘└┘└─┘o"
					echo "Created like file from the cloud containing $CloudLikeCount songs compared to $NumInLike songs in local like file."
					echo "Press Enter to continue to making playlist..."
					read
					clear
					echo "╔╗╔┬ ┬┌┬┐┌┐ ┌─┐┬─┐"
					echo "║║║│ ││││├┴┐├┤ ├┬┘"
					echo "╝╚╝└─┘┴ ┴└─┘└─┘┴└─"
					echo "How many songs to pull per liked songs from cloud list?"
					read Number
					clear
					LikeFile=$HOME/dotfiles/songs/cloudlike
					TmpLike=$HOME/dotfiles/songs/tmplike
					Date=`date +%y-%m-%d-%H-%M-%S`
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
									curl -s $(echo "http://localhost:9999/get_new_station_by_id?id=$songs&type=song&num_tracks=$Number") >> $(echo "$HOME/.config/mpd/playlists/Like-Cloud-List-$Date.m3u" | tr ' ' '-')
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
								cat $(echo "$HOME/.config/mpd/playlists/Like-Cloud-List-$Date.m3u") | grep -v '^http' | cut -d, -f2-
								echo " "
								echo "╔╦╗┌─┐┌┐┌┌─┐┬"
								echo " ║║│ ││││├┤ │"
								echo "═╩╝└─┘┘└┘└─┘o"
								echo "Created new playlist from $NumInLike liked songs with $Number songs per liked song, for a total number of $(grep -c "http" $HOME/.config/mpd/playlists/Like-Cloud-List-$Date.m3u) songs in your new cloud based playlist!"
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
								echo "Added $(($NumInLike * $Number)) songs to Now Playing from your cloud likes!"
								echo " "
								rm $TmpLike
								rm $Countfile
								;;
						esac
					;;
				n)
					echo "╦═╗┌─┐┬  ┬┌─┐┬─┐┌┬┐┬┌┐┌┌─┐┬"
					echo "╠╦╝├┤ └┐┌┘├┤ ├┬┘ │ │││││ ┬│"
					echo "╩╚═└─┘ └┘ └─┘┴└─ ┴ ┴┘└┘└─┘o"
					echo "Ignored cloud playlist..."
					echo "Reverting to Local Likes only."
					echo " "
					echo "Press Enter to continue:"
					read
					clear
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
		esac
else
	clear
	echo "╔═╗╦═╗╦═╗╔═╗╦═╗┬┬┬"
	echo "║╣ ╠╦╝╠╦╝║ ║╠╦╝│││"
	echo "╚═╝╩╚═╩╚═╚═╝╩╚═ooo"
	echo "GMusicProxy is not running! Please start GMusicProxy before using this..."
fi
