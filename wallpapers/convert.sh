#!/bin/bash
convert wallpaper.png -resize 200x200 wpresize.png &&
convert wpresize.png -gravity center -extent 100x100 wpresize.png &&
convert -size 100x100 xc:none -fill wpresize.png -draw "circle 50,50, 50,0" usericon.png &&
mv usericon.png ~/dotfiles/config/lightdm/ &&
rm wpresize.png