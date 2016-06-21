#!/bin/bash
wallpaper=~/dotfiles/wallpapers/wallpaper.png
wpout=~/wallpaper.png
text=$(echo $HOSTNAME)
convert -size 1920x1080 xc:none -gravity south -stroke black -strokewidth 2 -annotate 0 $text -background none -shadow 100x3+0+0 +repage -stroke none -fill white -annotate 0 $text $wallpaper  +swap -gravity south -geometry -20+1 -composite  $wpout
feh --bg-fill $wpout
