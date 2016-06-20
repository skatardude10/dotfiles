vol=$(amixer -D pulse sget Master | tail -n +7 | cut -f1 -d"]" | sed 's|.*\[\(.*\)|\1|'); 
var="$(echo -e "100%\n90%\n80%\n70%\n60%\n50%\n40%\n30%\n20%\n10%\n0%" | rofi -dmenu -hide-scrollbar -width -13 -mesg "Cur vol: $vol" -p "Set: ")" &&
amixer -D pulse sset Master $var;