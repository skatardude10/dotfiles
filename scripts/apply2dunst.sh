cat ~/.Xresources | grep "define FNT " | cut -c 13- > ~/.config/dunst/dunstvars
cat ~/.Xresources | grep "define SIZ " | cut -c 13- >> ~/.config/dunst/dunstvars
cat ~/.Xresources | grep "define x" | tr -d " " | cut -c 16- | tr -d "#" | sed "s/und//" >> ~/.config/dunst/dunstvars
mapfile -t dunstarray <~/.config/dunst/dunstvars
sed -i 's/.* font = .*/    font = '"${dunstarray[0]}"' '"${dunstarray[1]}"'/' ~/.config/dunst/dunstrc
sed -i 's/.* color = .*/     color = "#'"${dunstarray[5]}"'"/' ~/.config/dunst/dunstrc
sed -i 's/.*background.*/    background = "#'"${dunstarray[2]}"'"/' ~/.config/dunst/dunstrc
sed -i 's/.*foreground.*/    foreground = "#'"${dunstarray[3]}"'"/' ~/.config/dunst/dunstrc
pkill dunst
